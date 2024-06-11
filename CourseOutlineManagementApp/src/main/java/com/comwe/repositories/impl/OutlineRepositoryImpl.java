/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.AcademicYear;
import com.comwe.pojo.Admin;
import com.comwe.pojo.DTOs.OutlineDTO;
import com.comwe.pojo.Faculty;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.Major;
import com.comwe.pojo.Outline;
import com.comwe.pojo.OutlineAcademicYear;
import com.comwe.pojo.OutlineSubject;
import com.comwe.pojo.Subject;
import com.comwe.pojo.User;
import com.comwe.repositories.OutlineRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.persistence.Query;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
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

//    @Override
//    public List<Object> getOutlines(Map<String, String> params) {
//        Session s = this.factory.getObject().getCurrentSession();
//        CriteriaBuilder c = s.getCriteriaBuilder();
//        CriteriaQuery<Object> q = c.createQuery(Object.class);
//        Root r = q.from(Outline.class);
//        q.select(r);
//        String kw = params.get("kw");
//        String page = params.get("page");
//        String lecturerId = params.get("lecturerId");
//        String status = params.get("status");
//        String outlineId = params.get("outlineId");
//
//        List<Predicate> predicates = new ArrayList<>();
//
//        if (kw != null && !kw.isEmpty()) {
//            predicates.add(c.like(r.get("description"), String.format("%%%s%%", kw)));
//        }
//
//        if (lecturerId != null && !lecturerId.isEmpty()) {
//            predicates.add(c.equal(r.get("lecturerId").get("userId"), Integer.parseInt(lecturerId)));
//        }
//
//        if (status != null && !status.isEmpty()) {
//            predicates.add(c.like(r.get("status"), status));
//        }
//
//        if (outlineId != null && !outlineId.isEmpty()) {
//            predicates.add(c.equal(r.get("id"), Integer.parseInt(outlineId)));
//        }
//
//        q.where(predicates.toArray(Predicate[]::new));
//
//        Query qr = s.createQuery(q);
//        List<Object> outlinesInfo = new ArrayList<>();
//
//        if (page != null && !page.isEmpty()) {
//            int pageSize = Integer.parseInt(this.env.getProperty("pageSize"));
//
//            qr.setMaxResults(pageSize);
//            qr.setFirstResult((Integer.parseInt(page) - 1) * pageSize);
//        }
//
////        CriteriaQuery<Object> qS = c.createQuery(Object.class);
////        Root rS = qS.from(OutlineSubject.class);
////        qS.select(rS.get("subjectId"));
////        List<Predicate> pres = new ArrayList<>();
//
//        List<Outline> outlines = qr.getResultList();
//        outlines.forEach(o -> {
//            HashMap<Object, Object> temp = new HashMap<>();
//            temp.put("outlineId", o.getId());
//            temp.put("lecturer", o.getLecturerId().getUserId().getName());
//            temp.put("subject", o.getSubjectId().getName());
//            temp.put("faculty", o.getLecturerId().getFacultyId().getName());
//            temp.put("startedDate", o.getStartedDatetime());
//            temp.put("expiredDate", o.getExpiredDatetime());
//            temp.put("description", o.getDescription());
//            temp.put("theory", o.getTheoCreditHour());
//            temp.put("practice", o.getPracCreditHour());
//
////            pres.add(c.equal(rS.get("outlineId"), o.getId()));
////            qS.where(pres.toArray(Predicate[]::new));
////            Query qrS = s.createQuery(qS);
////            List<OutlineSubject> outlineSubjects = qrS.getResultList();
////            temp.put("preSubjects", outlineSubjects);
//
//            outlinesInfo.add(temp);
//        });
//
//        return outlinesInfo;
//    }
    public List<OutlineDTO> getOutlines(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery<Tuple> q = c.createQuery(Tuple.class);

        Root<Outline> rootOutline = q.from(Outline.class);
        Join<Outline, Lecturer> rootLecturer = rootOutline.join("lecturerId");
        Join<Lecturer, User> rootUser = rootLecturer.join("userId");
        Join<Outline, Subject> rootSubject = rootOutline.join("subjectId");
        Join<Lecturer, Faculty> rootFaculty = rootLecturer.join("facultyId");
        
        String kw = params.get("kw");
        String page = params.get("page");
        String lecturerId = params.get("lecturerId");
        String status = params.get("status");
        String outlineId = params.get("outlineId");
        String title = params.get("name");

        List<Predicate> predicates = new ArrayList<>();
        
        if (title != null && !title.isEmpty()) {
            predicates.add(c.like(rootOutline.get("description"), "%" + title + "%"));
        }

        if (kw != null && !kw.isEmpty()) {
            predicates.add(c.like(rootOutline.get("description"), String.format("%%%s%%", kw)));
        }

        if (lecturerId != null && !lecturerId.isEmpty()) {
            predicates.add(c.equal(rootOutline.get("lecturerId").get("userId"), Integer.parseInt(lecturerId)));
        }

        if (status != null && !status.isEmpty()) {
            predicates.add(c.like(rootOutline.get("status"), status));
        }

        if (outlineId != null && !outlineId.isEmpty()) {
            predicates.add(c.equal(rootOutline.get("id"), Integer.parseInt(outlineId)));
        }

        q.where(predicates.toArray(Predicate[]::new));

        q.multiselect(
                rootOutline.get("id").alias("outlineId"),
                rootOutline.get("startedDatetime").alias("startedDate"),
                rootOutline.get("expiredDatetime").alias("expiredDate"),
                rootOutline.get("description").alias("description"),
                rootOutline.get("theoCreditHour").alias("theory"),
                rootOutline.get("pracCreditHour").alias("practice"),
                rootUser.get("name").alias("lecturer"),
                rootSubject.get("name").alias("subject"),
                rootFaculty.get("name").alias("faculty")
        );

        q.where(predicates.toArray(new Predicate[0]));
        q.orderBy(c.asc(rootOutline.get("id")));

        TypedQuery<Tuple> qr = s.createQuery(q);
        
        if (page != null && !page.isEmpty()) {
            int pageSize = Integer.parseInt(this.env.getProperty("pageSize"));

            qr.setMaxResults(pageSize);
            qr.setFirstResult((Integer.parseInt(page) - 1) * pageSize);
        }
        
        List<Tuple> resultList = qr.getResultList();

        List<OutlineDTO> outlinesInfo = new ArrayList<>();
        for (Tuple tuple : resultList) {
            OutlineDTO temp = new OutlineDTO(
                    (Integer) tuple.get("outlineId"),
                    (Date) tuple.get("startedDate"),
                    (Date) tuple.get("expiredDate"),
                    (String) tuple.get("description"),
                    (Integer) tuple.get("theory"),
                    (Integer) tuple.get("practice"),
                    (String) tuple.get("lecturer"),
                    (String) tuple.get("subject"),
                    (String) tuple.get("faculty")
            );
            outlinesInfo.add(temp);
        }

        return outlinesInfo;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void addOutline(int lecturerId, int subjectId, int academicYearId1, int academicYearId2) {
        Session s = this.factory.getObject().getCurrentSession();

        User user = s.get(User.class, lecturerId);
        Lecturer lecturer = user.getLecturerSet().stream().findFirst().get();

        Subject subject = s.get(Subject.class, subjectId);

        Outline outline = new Outline();
        outline.setSubjectId(subject);
        outline.setLecturerId(lecturer);
        outline.setStatus("HOLDING");
        s.save(outline);

        AcademicYear academicYear1 = s.get(AcademicYear.class, academicYearId1);
        OutlineAcademicYear oc1 = new OutlineAcademicYear();
        oc1.setAcademicYearId(academicYear1);
        oc1.setOutlineId(outline);
        s.save(oc1);

        if (academicYearId2 > 0) {
            AcademicYear academicYear2 = s.get(AcademicYear.class, academicYearId2);
            OutlineAcademicYear oc2 = new OutlineAcademicYear();
            oc2.setAcademicYearId(academicYear2);
            oc2.setOutlineId(outline);
            s.save(oc2);
        }

    }

    @Override
    public boolean checkOutlineExist(int subjectId, int academicYearId1, int academicYearId2) {
        Session s = this.factory.getObject().getCurrentSession();
        Subject subject = s.get(Subject.class, subjectId);
        int outlineNumber = subject.getOutlineSet().size();
        if (outlineNumber > 0) {
            AcademicYear acy1 = s.get(AcademicYear.class, academicYearId1);
            int acy1OutlineNumber = acy1.getOutlineAcademicYearSet().size();
            if (acy1OutlineNumber > 0) {
                return false;
            } else {
                if (academicYearId2 > 0) {
                    AcademicYear acy2 = s.get(AcademicYear.class, academicYearId2);
                    int acy2OutlineNumber = acy2.getOutlineAcademicYearSet().size();
                    return acy2OutlineNumber <= 0;
                }
                return true;
            }
        } else {
            return true;
        }
    }

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
