/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.User;
import com.comwe.repositories.UserRepository;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author lahon
 */
@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private BCryptPasswordEncoder passEncoder;

    @Override
    public User getUserByUsername(String username) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT u FROM User u WHERE u.username = :username");
        q.setParameter("username", username);
        return (User) q.getSingleResult();
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

        return this.passEncoder.matches(password, u.getPassword()) && u.getIsActive();
    }

    @Override
    public List<User> getNonAdminUsers(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder c = s.getCriteriaBuilder();
        CriteriaQuery q = c.createQuery(User.class);
        Root r = q.from(User.class);
        q.select(r);
        
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(c.notEqual(r.get("role"), "ROLE_ADMIN"));
        
        String role = params.get("role");
        if(role != null && !role.isEmpty()) {
            predicates.add(c.equal(r.get("role"), role));
        }
        q.where(predicates.toArray(Predicate[]::new));
        
        return s.createQuery(q).getResultList();
    }

    @Override
    public void userApprove(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        User user = s.getReference(User.class, id);
        if(user.getRole().equals("ROLE_LECTURER")) {
            Lecturer l = new Lecturer();
            l.setId(id);
            s.save(l);
        }
        user.setIsActive(Boolean.TRUE);
    }

}
