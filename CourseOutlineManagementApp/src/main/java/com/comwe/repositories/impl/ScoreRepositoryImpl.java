/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.Score;
import com.comwe.repositories.ScoreRepository;
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
public class ScoreRepositoryImpl implements ScoreRepository {
    
    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public void addScore(Map<String, Object> params) {
//        Object 
    }

    @Override
    public List<Score> getScores() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createNamedQuery("Score.findAll");
        return q.getResultList();
    }
    
}
