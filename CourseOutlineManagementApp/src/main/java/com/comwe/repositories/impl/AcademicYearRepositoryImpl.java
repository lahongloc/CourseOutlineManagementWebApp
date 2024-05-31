/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.AcademicYear;
import com.comwe.repositories.AcademicYearRepository;
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
 * @author lahon
 */
@Repository
@Transactional
public class AcademicYearRepositoryImpl implements AcademicYearRepository {
    
    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<AcademicYear> getAllAcademicYears(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        Query qr = s.createNamedQuery("AcademicYear.findAll");
        
        return qr.getResultList();
    }
    
}
