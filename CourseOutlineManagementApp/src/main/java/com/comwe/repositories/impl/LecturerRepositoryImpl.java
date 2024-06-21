/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.Faculty;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.User;
import com.comwe.repositories.LecturerRepository;
import com.comwe.services.FacultyService;
import com.comwe.services.UserService;
import java.util.Map;
import javax.persistence.NoResultException;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author lahon
 */
@Repository
public class LecturerRepositoryImpl implements LecturerRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private UserService userService;

    @Autowired
    private FacultyService facultyService;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addLecturer(Map<String, String> params, MultipartFile avatar) {
        Session s = this.factory.getObject().getCurrentSession();

        try {
            User user = this.userService.addUser(params, avatar);
            String facultyId = params.get("facultyId");
            if (facultyId != null && !facultyId.isEmpty()) {
                Faculty f = this.facultyService.getFacultyById(Integer.parseInt(facultyId));

                Lecturer lecturer = new Lecturer();
                lecturer.setUserId(user);
                lecturer.setFacultyId(f);
                s.save(lecturer);
            }

            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean updateLecturer(Map<String, String> params, MultipartFile avatar) {
        System.out.print("startttt");
        Session s = this.factory.getObject().getCurrentSession();
        try {
            User user = this.userService.updateUser(params, avatar);
            String facultyId = params.get("facultyId");
            if (facultyId != null && !facultyId.isEmpty()) {
                System.out.print("truy van khoa");
                Faculty f = this.facultyService.getFacultyById(Integer.parseInt(facultyId));

                Lecturer lecturer;
                try {
                    // update an existed lecturer
                    System.out.print("Truy van lecturer");
                    Query q = s.createQuery("SELECT l FROM Lecturer l WHERE l.userId.id = :userId");
                    q.setParameter("userId", user.getId());
                    lecturer = (Lecturer) q.getSingleResult();
                    
                    lecturer.setFacultyId(f);
                    s.update(lecturer);
                } catch (NoResultException e) {
                    // add a new lecturer from user
                    lecturer = null;
                }
                
                if(lecturer == null) {
                    System.out.print("chua co lecturer san!");
                    Lecturer l = new Lecturer();
                    l.setUserId(user);
                    l.setFacultyId(f);
                    s.save(l);
                } else {
                    System.out.print("da co lecturer san!");
                }
            }

            return true;
        } catch (HibernateException ex) {
            System.out.print("co loiii");
            return false;
        }
    }

}
