/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.comwe.controllers.ApiUserController;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.User;
import com.comwe.repositories.UserRepository;
import com.comwe.services.impl.UserServiceImpl;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author lahon
 */
@Repository
@Transactional
@PropertySource("classpath:configs.properties")
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private Environment env;

    @Autowired
    private BCryptPasswordEncoder passEncoder;

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public User getUserByUsername(String username) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT u FROM User u WHERE u.username = :username");
        q.setParameter("username", username);

        try {
            return (User) q.getSingleResult();
        } catch (NoResultException e) {
            return null; // Return null if no user is found
        }
    }

    @Override
    public User addUser(User user) {
        Session s = this.factory.getObject().getCurrentSession();
        s.save(user);
        return user;
    }

    @Override
    public boolean authUser(String username, String password) {
        User u = this.getUserByUsername(username);
        if (u == null) {
            return false;
        }
        return this.passEncoder.matches(password, u.getPassword()) && u.getIsActive();
    }

    @Override
    public List<User> getNonAdminUsers(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery q = c.createQuery(User.class);
        Root r = q.from(User.class);
        q.select(r);

        String page = params.get("page");

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(c.notEqual(r.get("role"), "ROLE_ADMIN"));

        String role = params.get("role");
        if (role != null && !role.isEmpty()) {
            predicates.add(c.equal(r.get("role"), role));
        }
        q.where(predicates.toArray(Predicate[]::new));

        Query qr = s.createQuery(q);

        if (page != null && !page.isEmpty()) {
            int pageSize = Integer.parseInt(this.env.getProperty("pageSizeUser"));

            qr.setMaxResults(pageSize);
            qr.setFirstResult((Integer.parseInt(page) - 1) * pageSize);
        }

        List<User> listUsers = qr.getResultList();

        return listUsers;
    }

    @Override
    public void userApprove(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        User user = s.get(User.class, id);
        if (user.getRole().equals("ROLE_LECTURER")) {
            Lecturer l = new Lecturer();
            l.setId(id);
            s.save(l);
        }
        user.setIsActive(Boolean.TRUE);
        s.update(user);
    }

    @Override
    public User getUserById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        User u = s.get(User.class, id);
        return u;
    }

    @Override
    public User addUser(Map<String, String> params, MultipartFile avatar) {
        Session s = this.factory.getObject().getCurrentSession();

        User user = new User();

        user.setUsername(params.get("username"));
        user.setName(params.get("name"));

        String birthday = params.get("birthday");
        if (birthday != null && !birthday.isEmpty()) {
            DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
            Date birthdayDate;
            try {
                birthdayDate = df.parse(birthday);
                user.setBirthday(birthdayDate);

            } catch (ParseException ex) {
                Logger.getLogger(ApiUserController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        user.setSex(Boolean.valueOf(params.get("sex")));
        user.setEmail(params.get("email"));
        String hotline = params.get("hotline");
        if (hotline != null && !hotline.isEmpty()) {
            user.setHotline(params.get("hotline"));
        }

        if (!avatar.isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(avatar.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                user.setAvatar(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        String password = params.get("password");

        user.setPassword(this.passEncoder.encode(password));
        user.setRole(params.get("role"));
        user.setIsActive(Boolean.FALSE);

        LocalDate today = LocalDate.now();
        Instant instant = today.atStartOfDay().atZone(java.time.ZoneId.systemDefault()).toInstant();
        Date created_date = Date.from(instant);
        user.setCreatedDatetime(created_date);

        s.save(user);

        return user;
    }

    @Override
    public User updateUser(Map<String, String> params, MultipartFile avatar) {
        Session s = this.factory.getObject().getCurrentSession();

        try {
            User user = this.getUserByUsername(params.get("username"));

            // update name
            String name = params.get("name");
            if (name != null && !name.isEmpty()) {
                user.setName(name);
            }

            // update birthday
            String birthday = params.get("birthday");
            if (birthday != null && !birthday.isEmpty()) {
                DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
                Date birthdayDate;
                try {
                    birthdayDate = df.parse(birthday);
                    user.setBirthday(birthdayDate);

                } catch (ParseException ex) {
                    Logger.getLogger(ApiUserController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            // update sex
            String sex = params.get("sex");
            if (sex != null && !sex.isEmpty()) {
                user.setSex(Boolean.valueOf(sex));
            }

            // update email
            String email = params.get("email");
            if (email != null && !email.isEmpty()) {
                user.setEmail(email);
            }

            // update hotline
            String hotline = params.get("hotline");
            if (hotline != null && !hotline.isEmpty()) {
                user.setHotline(hotline);
            }

            // update avatar
            System.out.println("chuan bi luu avatar");
            if (!avatar.isEmpty()) {
                
                try {
                    System.out.println("dang luu avatar");
                    Map res = this.cloudinary.uploader().upload(avatar.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                    user.setAvatar(res.get("secure_url").toString());
                } catch (IOException ex) {
                    Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            s.save(user);
            return user;
        } catch (HibernateException ex) {
            return null;
        }
    }

}
