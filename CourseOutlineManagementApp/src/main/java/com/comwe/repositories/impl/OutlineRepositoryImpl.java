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
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author lahon
 */
@Repository
@Transactional
@PropertySource("classpath:configs.properties")
public class OutlineRepositoryImpl implements OutlineRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private Environment env;

    @Override
    public List<Object> getOutlines(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery<Object> q = c.createQuery(Object.class);
        Root r = q.from(Outline.class);
        q.select(r);
        String kw = params.get("kw");
        String page = params.get("page");
        List<Predicate> predicates = new ArrayList<>();

        if (kw != null && !kw.isEmpty()) {
            predicates.add(c.like(r.get("description"), String.format("%%%s%%", kw)));
        }

        q.where(predicates.toArray(Predicate[]::new));

        Query qr = s.createQuery(q);
        List<Object> outlinesInfo = new ArrayList<>();

        if (page != null && !page.isEmpty()) {
            int pageSize = Integer.parseInt(this.env.getProperty("pageSize"));

            qr.setMaxResults(pageSize);
            qr.setFirstResult((Integer.parseInt(page) - 1) * pageSize);
        }

        List<Outline> outlines = qr.getResultList();
        outlines.forEach(o -> {
            HashMap<Object, Object> temp = new HashMap<>();
            temp.put("outlineId", o.getId());
            temp.put("lecturer", o.getLecturerId().getUserId().getName());
            temp.put("subject", o.getSubjectId().getName());
            temp.put("faculty", o.getLecturerId().getFacultyId().getName());
            temp.put("startedDate", o.getStartedDatetime());
            temp.put("expiredDate", o.getExpiredDatetime());
            temp.put("description", o.getDescription());
            temp.put("theory", o.getTheoCreditHour());
            temp.put("practice", o.getPracCreditHour());

            outlinesInfo.add(temp);
        });

        return outlinesInfo;
    }

    @Override
    public List<Object> getOutlineById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Outline o = s.get(Outline.class, id);

        List<Object> outline = new ArrayList<>();

        try {
            HashMap<Object, Object> temp = new HashMap<>();
            temp.put("outlineId", o.getId());
            temp.put("lecturer", o.getLecturerId().getUserId().getName());
            temp.put("subject", o.getSubjectId().getName());
            temp.put("faculty", o.getLecturerId().getFacultyId().getName());
            temp.put("startedDate", o.getStartedDatetime());
            temp.put("expiredDate", o.getExpiredDatetime());
            temp.put("description", o.getDescription());
            temp.put("theory", o.getTheoCreditHour());
            temp.put("practice", o.getPracCreditHour());

            outline.add(temp);
        } catch (Exception ex) {
            return null;
        }

        return outline;
    }
}
