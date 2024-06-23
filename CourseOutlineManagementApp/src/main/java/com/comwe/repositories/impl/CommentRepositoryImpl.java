/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.controllers.ApiUserController;
import com.comwe.pojo.Comment;
import com.comwe.pojo.DTOs.CommentDTO;
import com.comwe.pojo.Outline;
import com.comwe.pojo.Student;
import com.comwe.pojo.User;
import com.comwe.repositories.CommentRepository;
import com.comwe.services.StudentService;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.Tuple;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author kitj3
 */
@Repository
@Transactional
public class CommentRepositoryImpl implements CommentRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private StudentService studentService;

    @Override
    public List<CommentDTO> getComments(Map<String, String> params, String outlineId) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder cb = s.getCriteriaBuilder();
        CriteriaQuery<Tuple> q = cb.createQuery(Tuple.class);

        Root<Comment> rootComment = q.from(Comment.class);
        Join<Comment, Student> rootStudent = rootComment.join("studentId");
        Join<Comment, Outline> rootOutline = rootComment.join("outlineId");

        q.multiselect(
                rootComment.get("id").alias("id"),
                rootComment.get("content").alias("content"),
                rootComment.get("positive").alias("positive"),
                rootComment.get("modelResponse").alias("modelResponse"),
                rootStudent.get("userId").alias("user"),
                rootComment.get("createdDate").alias("createdDate")
        );

        q.where(cb.equal(rootOutline.get("id"), Integer.parseInt(outlineId)));
        q.orderBy(cb.desc(rootComment.get("id")));

        Query<Tuple> qr = s.createQuery(q);
        List<Tuple> results = qr.getResultList();

        List<CommentDTO> commentsInfo = new ArrayList<>();
        for (Tuple tuple : results) {
            User userTemp = null;
            if (tuple.get("user") != null) {
                userTemp = (User) tuple.get("user");
            }

            CommentDTO commentDTO = new CommentDTO(
                    (Integer) tuple.get("id"),
                    (String) tuple.get("content"),
                    (Short) tuple.get("positive"),
                    (String) tuple.get("modelResponse"),
                    (User) userTemp,
                    (Date) tuple.get("createdDate")
            );

            commentsInfo.add(commentDTO);
        }

        return commentsInfo;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addComment(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();

        try {
            String content = params.get("content");
            String positive = params.get("positive");
            String modelResponse = params.get("modelResponse");
            String userId = params.get("userId");
            String outlineId = params.get("outlineId");
            String createdDate = params.get("createdDate");

            Comment comment = new Comment();

            if (createdDate != null && !createdDate.isEmpty()) {
                DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
                Date createdDateFormat;
                try {
                    createdDateFormat = df.parse(createdDate);
                    comment.setCreatedDate(createdDateFormat);

                } catch (ParseException ex) {
                    Logger.getLogger(ApiUserController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            Student student = this.studentService.getStudentByUserId(Integer.parseInt(userId));
            Outline outline = s.get(Outline.class, Integer.parseInt(outlineId));

            comment.setContent(content);
            comment.setPositive(Short.parseShort(positive));
            comment.setModelResponse(modelResponse);
            comment.setStudentId(student);
            comment.setOutlineId(outline);

            s.save(comment);

            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }

}
