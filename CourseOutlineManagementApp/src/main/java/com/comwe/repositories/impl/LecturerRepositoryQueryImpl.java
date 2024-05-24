/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.Lecturer;
import com.comwe.repositories.LecturerRepositoryQuery;
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
public class LecturerRepositoryQueryImpl implements LecturerRepositoryQuery {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Object> getLecturers(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery<Object> q = c.createQuery(Object.class);
        Root r = q.from(Lecturer.class);
        q.select(r);

        List<Predicate> predicates = new ArrayList<>();

        String userId = params.get("userId");
        if (userId != null && !userId.isEmpty()) {
            predicates.add(c.equal(r.get("userId"), Integer.parseInt(userId)));
        }
        q.where(predicates.toArray(Predicate[]::new));

        Query qr = s.createQuery(q);

        List<Object> lecturersInfo = new ArrayList<>();

        List<Lecturer> lecturers = qr.getResultList();
        lecturers.forEach(l -> {
            HashMap<Object, Object> temp = new HashMap<>();
            temp.put("id", l.getId());
            temp.put("userId", l.getUserId().getId());
            temp.put("facultyId", l.getFacultyId().getId());
            
            lecturersInfo.add(temp);
        });
        
        
        
        return lecturersInfo;
    }

}
