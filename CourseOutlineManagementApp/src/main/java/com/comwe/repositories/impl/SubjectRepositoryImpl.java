/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.Subject;
import com.comwe.repositories.SubjectRepository;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
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
public class SubjectRepositoryImpl implements SubjectRepository {
    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Subject> getSubjects(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery q = c.createQuery(Subject.class);
        Root r = q.from(Subject.class);
        q.select(r);
        
        List<Predicate> predicates = new ArrayList<>();
        String lecturerId = params.get("lecturerId");
        if(lecturerId != null && !lecturerId.isEmpty()) {
            predicates.add(c.equal(r.get("lecturerId"), Integer.parseInt(lecturerId)));
        }
        q.where(predicates.toArray(Predicate[]::new));
        
        
        Query qr = s.createQuery(q);
        
//        List<Object> subjectsInfo = new ArrayList<>();
//        
//        List<Subject> subjects = qr.getResultList();
//        
//        subjects.forEach(subject -> {
//            HashMap<Object, Object> temp = new HashMap<>();
//            temp.put("name", subject.getName());
//            temp.put("")
//        });
//        
        
        
        
        return qr.getResultList();
    }
    
}
