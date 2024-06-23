/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.AcademicYear;
import com.comwe.pojo.Outline;
import com.comwe.pojo.Receipt;
import com.comwe.pojo.Student;
import com.comwe.pojo.Subject;
import com.comwe.pojo.User;
import com.comwe.repositories.StatisticRepository;
import java.time.LocalDate;
import java.util.ArrayList;
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
public class StatisticRepositoryImpl implements StatisticRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Object[]> outlineSaleStatistic(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = c.createQuery(Object[].class);

        // id, tên đề cương, số lương bán, doanh thu - Outline, Receipt
        Root rO = q.from(Outline.class);
        Root rR = q.from(Receipt.class);
        Root rS = q.from(Subject.class);

        String period = params.getOrDefault("peroid", "MONTH");
//        q.multiselect(rO.get("id"), rS.get("name"), c.count(rR.get("id")), c.sum(rR.get("totalPrice")));
        q.multiselect(c.function(period, Integer.class, rR.get("createdDate")), rO.get("id"), rS.get("name"), c.count(rR.get("id")), c.sum(rR.get("totalPrice")));

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(c.equal(rO.get("id"), rR.get("outlineId").get("id")));
        predicates.add(c.equal(rS.get("id"), rO.get("subjectId").get("id")));

        
        String year = params.getOrDefault("year", String.valueOf(LocalDate.now().getYear()));
        if (year != null && !year.isEmpty()) {
            predicates.add(c.equal(c.function("YEAR", Integer.class, rR.get("createdDate")), year));
        }

        q.where(predicates.toArray(Predicate[]::new));
        q.groupBy(c.function(period, Integer.class, rR.get("createdDate")), rO.get("id"), rS.get("name"));

        Query qr = s.createQuery(q);
        return qr.getResultList();
    }

    @Override
    public List<Object[]> downloadStatistic(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = c.createQuery(Object[].class);
        Root rO = q.from(Outline.class);
        Root rS = q.from(Subject.class);
        Root rR = q.from(Receipt.class);
        Root rU = q.from(User.class);
        Root rSt = q.from(Student.class);
        Root rA = q.from(AcademicYear.class);
        
        // q.multiselect(rSt.get())
        // id, tên đề cương, khoa, lượt tải - outline, major, faculty, receipt
        
        return null;
    }

}
