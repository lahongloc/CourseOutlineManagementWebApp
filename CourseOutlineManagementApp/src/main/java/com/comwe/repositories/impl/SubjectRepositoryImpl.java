/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.DTOs.OutlineDTO;
import com.comwe.pojo.DTOs.SubjectDTO;
import com.comwe.pojo.Faculty;
import com.comwe.pojo.FacultySubject;
import com.comwe.pojo.Outline;
import com.comwe.pojo.Subject;
import com.comwe.repositories.SubjectRepository;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.Tuple;
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
public class SubjectRepositoryImpl implements SubjectRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<SubjectDTO> getSubjects(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery<Tuple> q = c.createQuery(Tuple.class);
        Root<Subject> rS = q.from(Subject.class);
        Root<FacultySubject> rFS = q.from(FacultySubject.class);
        Root<Faculty> rF = q.from(Faculty.class);

        q.multiselect(rS.get("id").alias("id"), 
                rS.get("name").alias("name"), 
                rFS.get("facultyId").alias("facultyId"));

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(c.equal(rS.get("id"), rFS.get("subjectId")));
        predicates.add(c.equal(rFS.get("facultyId"), rF.get("id")));

        String facultyId = params.get("facultyId");
        if (facultyId != null && !facultyId.isEmpty()) {
            predicates.add(c.equal(rFS.get("facultyId"), Integer.parseInt(facultyId)));
        }
        q.where(predicates.toArray(new Predicate[0]));
        q.groupBy(rS.get("id"), rS.get("name"), rFS.get("facultyId"), rF.get("name"));

        Query<Tuple> qr = s.createQuery(q);
        List<Tuple> results = qr.getResultList();

        List<SubjectDTO> subjectsInfo = new ArrayList<>();
        for (Tuple tuple : results) {
            SubjectDTO subjectDTO = new SubjectDTO(
                    (Integer) tuple.get("id"), 
                    (String) tuple.get("name"), 
                    (Faculty) tuple.get("facultyId"), 
                    s.get(Outline.class, (Integer) tuple.get("id"))
            );
            
            subjectsInfo.add(subjectDTO);
        }

        return subjectsInfo;
    }
}

//        Session s = this.factory.getObject().getCurrentSession();
//        CriteriaBuilder c = s.getCriteriaBuilder();
//        CriteriaQuery q = c.createQuery(Object[].class);
//        Root rS = q.from(Subject.class);
//        Root rFS = q.from(FacultySubject.class);
//        q.multiselect(rS.get("id"), rS.get("name"), rFS.get("facultyId"));
//        List<Predicate> predicates = new ArrayList<>();
//        predicates.add(c.equal(rS.get("id"), rFS.get("subjectId")));
//        
//        
//        
//        String facultyId = params.get("facultyId");
//        if(facultyId != null && !facultyId.isEmpty()) {
//            predicates.add(c.equal(rFS.get("facultyId"), Integer.parseInt(facultyId)));
//        } 
//        q.where(predicates.toArray(Predicate[]::new));
//        q.groupBy(rS.get("id"), rS.get("name"), rFS.get("facultyId"));
//        
//        
//        Query qr = s.createQuery(q);
//        
//        List<Object[]> subjects = qr.getResultList();
//        List<Object> subjectsInfo = new ArrayList<>();
//        subjects.forEach(sj -> {
//            Map<String, Object> temp = new HashMap<>();
//            temp.put("id",  sj[0]);
//            temp.put("name",  sj[1]);
//            temp.put("facultyId", sj[2]);
//            
//            Outline outlines = s.get(Outline.class, (int)sj[0]);
//            temp.put("outline", outlines);
//            
//            subjectsInfo.add(temp);
//        });
//        
//        
//        return subjectsInfo;
//    }
