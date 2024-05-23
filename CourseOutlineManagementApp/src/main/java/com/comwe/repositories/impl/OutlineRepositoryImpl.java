/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.Admin;
import com.comwe.pojo.Faculty;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.Major;
import com.comwe.pojo.Outline;
import com.comwe.pojo.Subject;
import com.comwe.pojo.User;
import com.comwe.repositories.OutlineRepository;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author lahon
 */
@Repository
@Transactional
public class OutlineRepositoryImpl implements OutlineRepository {
    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Object> getOutlines(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
//        CriteriaBuilder c = s.getCriteriaBuilder();
//        CriteriaQuery<Object> q = c.createQuery(Object.class);
//        Root rootOutline = q.from(Outline.class);
//        Root rootLecturer = q.from(Lecturer.class);
//        Root rootUser = q.from(User.class);
//        Root rootSubject = q.from(Subject.class);
//        Root rootFaculty = q.from(Faculty.class);
//        
//        q.multiselect(rootOutline.get("id"), rootOutline.get("startedDatetime"), rootOutline.get("expiredDatetime"), 
//                rootOutline.get("description"), rootOutline.get("theoCreditHour"), rootOutline.get("pracCreditHour"), 
//                rootUser.get("name"), 
//                rootSubject.get("name"), 
//                rootFaculty.get("name"));
//        
//        String title = params.get("name");
//        List<Predicate> predicates = new ArrayList<>();
//        
//        predicates.add(c.equal(rootOutline.get("lecturerId"), rootLecturer.get("id")));
//        predicates.add(c.equal(rootLecturer.get("id"), rootUser.get("id")));
//        predicates.add(c.equal(rootOutline.get("subjectId"), rootSubject.get("id")));
//        predicates.add(c.equal(rootLecturer.get("facultyId"), rootFaculty.get("id")));
//        
//        if(title != null && !title.isEmpty()) {
//            predicates.add(c.like(rootOutline.get("title"), String.format("%%%s%%", title)));
//        }
//        
//        q.where(predicates.toArray(Predicate[]::new));
//        q.orderBy(c.asc(rootOutline.get("id")));
//        
//        Query qr = s.createQuery(q);
//        
//        return qr.getResultList();
        
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery<Object> q = c.createQuery(Object.class);
        Root r = q.from(Outline.class);
        q.select(r);
        String kw = params.get("kw");
        List<Predicate> predicates = new ArrayList<>();
        
        if(kw != null && !kw.isEmpty()) {
            predicates.add(c.like(r.get("description"), String.format("%%%s%%", kw)));
        }
        
        q.where(predicates.toArray(Predicate[]::new));
        
        Query qr = s.createQuery(q);
        List<Object> outlinesInfo = new ArrayList<>();
        
        List<Outline> outlines = qr.getResultList();
        outlines.forEach(o -> {
            HashMap<Object, Object> temp = new HashMap<>();
            temp.put("lecturer", o.getLecturerId().getUserId().getName());
            temp.put("subject", o.getDescription());
            temp.put("faculty", o.getLecturerId().getFacultyId());
            temp.put("startedDate", o.getStartedDatetime());
            temp.put("expiredDate", o.getExpiredDatetime());
            
            outlinesInfo.add(temp);
        });

        return outlinesInfo;
    }
    
}
