/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.Grade;
import java.util.List;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.comwe.repositories.GradeRepository;

/**
 *
 * @author kitj3
 */
@Repository
@Transactional
public class GradeRepositoryImpl implements GradeRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Grade> getGrades(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createNamedQuery("Grade.findAll");
        
        return q.getResultList();
    }

    @Override
    public Grade getGradeById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Grade c = s.get(Grade.class, id);
        return c;
    }
    
}
