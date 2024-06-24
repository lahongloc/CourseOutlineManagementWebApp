/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.DTOs.OutlineReportDTO;
import com.comwe.pojo.Faculty;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.Outline;
import com.comwe.pojo.Subject;
import com.comwe.pojo.User;
import com.comwe.repositories.OutlineReportRepository;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;
import org.hibernate.Session;
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
public class OutlineReportRepositoryImpl implements OutlineReportRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<OutlineReportDTO> getOutlineCompletionStatistics(String year, String period) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery<Tuple> q = c.createQuery(Tuple.class);

        Root<Outline> rootOutline = q.from(Outline.class);
        Join<Outline, Lecturer> rootLecturer = rootOutline.join("lecturerId");
//        Join<Lecturer, User> rootUser = rootLecturer.join("userId");
//        Join<Outline, Subject> rootSubject = rootOutline.join("subjectId");
        Join<Lecturer, Faculty> rootFaculty = rootLecturer.join("facultyId");

//        Expression<Long> acceptedCount = c.count(
//                c.selectCase()
//                        .when(c.equal(rootOutline.get("status"), "ACCEPTED"), 1L)
//        );
//        Expression<Long> holdingCount = c.count(
//                c.selectCase()
//                        .when(c.equal(rootOutline.get("status"), "HOLDING"), 1L)
//        );
        q.multiselect(
                //                c.function(period, Integer.class, rootOutline.get("createdDate")),
                rootFaculty.get("name").alias("facultyName"),
                c.count(
                        c.selectCase()
                                .when(c.equal(rootOutline.get("status"), "ACCEPTED"), 1L)
                ).alias("acceptedCount"),
                c.count(
                        c.selectCase()
                                .when(c.equal(rootOutline.get("status"), "HOLDING"), 1L)
                ).alias("holdingCount")
        );

        List<Predicate> predicates = new ArrayList<>();
        Predicate predicateAccepted = c.equal(rootOutline.get("status"), "ACCEPTED");
        Predicate predicateHolding = c.equal(rootOutline.get("status"), "HOLDING");
        predicates.add(c.or(predicateAccepted, predicateHolding));
        
        if (period != null && !period.isEmpty()) {
            predicates.add(c.like(rootFaculty.get("name"), String.format("%%%s%%", period)));
        }
        
        q.where(predicates.toArray(Predicate[]::new));
        q.groupBy(rootFaculty.get("name"));
            
        TypedQuery<Tuple> qr = s.createQuery(q);
        List<Tuple> resultList = qr.getResultList();

        List<OutlineReportDTO> outlineReports = new ArrayList<>();
        for (Tuple tuple : resultList) {
            
            OutlineReportDTO temp = new OutlineReportDTO(
                    (String) tuple.get("facultyName"),
                    Integer.parseInt(tuple.get("acceptedCount").toString()),
                    Integer.parseInt(tuple.get("holdingCount").toString())
            );
            outlineReports.add(temp);
        }

        return outlineReports;
    }

}
