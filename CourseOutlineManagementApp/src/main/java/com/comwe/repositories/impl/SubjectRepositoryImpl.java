/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.FacultySubject;
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
    public List<Object> getSubjects(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery q = c.createQuery(Object[].class);
        Root rS = q.from(Subject.class);
        Root rFS = q.from(FacultySubject.class);
        q.multiselect(rS.get("id"), rS.get("name"), rFS.get("facultyId"));
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(c.equal(rS.get("id"), rFS.get("subjectId")));
        
        
        
        String facultyId = params.get("facultyId");
        if(facultyId != null && !facultyId.isEmpty()) {
            predicates.add(c.equal(rFS.get("facultyId"), Integer.parseInt(facultyId)));
        } 
        q.where(predicates.toArray(Predicate[]::new));
        q.groupBy(rS.get("id"), rS.get("name"), rFS.get("facultyId"));
        
        
        Query qr = s.createQuery(q);
        
        List<Object[]> subjects = qr.getResultList();
        List<Object> subjectsInfo = new ArrayList<>();
        subjects.forEach(sj -> {
            Map<String, Object> temp = new HashMap<>();
            temp.put("id",  sj[0]);
            temp.put("name",  sj[1]);
            temp.put("facultyId", sj[2]);
            
            subjectsInfo.add(temp);
        });
        
        
        return subjectsInfo;
    }
    
}
