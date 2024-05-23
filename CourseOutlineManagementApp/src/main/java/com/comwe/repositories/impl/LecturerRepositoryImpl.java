/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.comwe.controllers.ApiUserController;
import com.comwe.pojo.Faculty;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.User;
import com.comwe.repositories.LecturerRepository;
import com.comwe.services.FacultyService;
import com.comwe.services.UserService;
import com.comwe.services.impl.UserServiceImpl;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
    
    @Autowired
    private Cloudinary cloudinary;
    
    @Autowired
    private BCryptPasswordEncoder encoder;
    
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addLecturer(Map<String, String> params, MultipartFile avatar) {
        Session s = this.factory.getObject().getCurrentSession();
        
        try {
            User user = new User();
            user.setUsername(params.get("username"));
            user.setSex(Boolean.valueOf(params.get("sex")));
            
            DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
            Date birthday;
            try {
                birthday = df.parse(params.get("birthday"));
                user.setBirthday(birthday);
                
                LocalDate today = LocalDate.now();
                Instant instant = today.atStartOfDay().atZone(java.time.ZoneId.systemDefault()).toInstant();
                Date created_date = Date.from(instant);
                user.setCreatedDatetime(created_date);
            } catch (ParseException ex) {
                Logger.getLogger(ApiUserController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            user.setPassword(this.encoder.encode(params.get("password")));
            user.setName(params.get("name"));
            user.setRole(params.get("role"));
            user.setEmail(params.get("email"));
            user.setHotline(params.get("hotline"));
            
            if (!avatar.isEmpty()) {
                try {
                    Map res = this.cloudinary.uploader().upload(avatar.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                    user.setAvatar(res.get("secure_url").toString());
                } catch (IOException ex) {
                    Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            user.setIsActive(Boolean.FALSE);
            s.save(user);
            
            String facultyId = params.get("facultyId");
//            if (facultyId != null && !facultyId.isEmpty()) {
            Faculty f = this.facultyService.getFacultyById(Integer.parseInt(facultyId));
//
            Lecturer lecturer = new Lecturer();
            lecturer.setUserId(user);
            lecturer.setFacultyId(f);
            
            s.save(lecturer);
//            }

            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }
    
}
