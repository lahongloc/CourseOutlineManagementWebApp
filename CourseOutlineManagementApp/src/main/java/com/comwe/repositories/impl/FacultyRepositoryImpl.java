/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.Faculty;
import com.comwe.repositories.FacultyRepository;
import java.util.List;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author kitj3
 */
@Repository
@Transactional
public class FacultyRepositoryImpl implements FacultyRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Faculty> getFaculties(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createNamedQuery("Faculty.findAll");
        
        return q.getResultList();
    }

    @Override
    public Faculty getFacultyById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Faculty f = s.get(Faculty.class, id);
        return f;
    }
    
}
