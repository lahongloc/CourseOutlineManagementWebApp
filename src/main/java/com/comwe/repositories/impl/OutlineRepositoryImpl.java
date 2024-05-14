/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.Outline;
import com.comwe.repositories.OutlineRepository;
import java.util.ArrayList;
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
    public List<Outline> getOutlines(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery q = c.createQuery(Outline.class);
        Root r = q.from(Outline.class);
        q.select(r);
        
        String title = params.get("name");
        List<Predicate> predicates = new ArrayList<>();
        
        if(title != null && !title.isEmpty()) {
            predicates.add(c.like(r.get("title"), String.format("%%%s%%", title)));
        }
        q.where(predicates.toArray(Predicate[]::new));
        
        Query qr = s.createQuery(q);
        
        return qr.getResultList();
    }
    
}
