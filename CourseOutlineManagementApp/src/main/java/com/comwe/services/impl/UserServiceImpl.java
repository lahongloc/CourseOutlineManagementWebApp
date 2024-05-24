/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.comwe.controllers.ApiUserController;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.User;
import com.comwe.repositories.LecturerRepository;
import com.comwe.repositories.UserRepository;
import com.comwe.repositories.impl.UserRepositoryImpl;
import com.comwe.services.UserService;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author lahon
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private BCryptPasswordEncoder encoder;
    

    @Override
    public User getUserByUsername(String username) {
        return this.userRepo.getUserByUsername(username);
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User u = this.userRepo.getUserByUsername(username);
        if (u == null || !u.getRole().equals("ROLE_ADMIN")) {
            throw new UsernameNotFoundException("User not existed!");
        }

        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(u.getRole()));

        return new org.springframework.security.core.userdetails.User(u.getUsername(), u.getPassword(), authorities);
    }

    @Override
    public boolean authUser(String username, String password) {
        return this.userRepo.authUser(username, password);
    }

    @Override
    public User addUser(Map<String, String> params, MultipartFile avatar) {
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
        
        if(!avatar.isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(avatar.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                user.setAvatar(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        user.setIsActive(Boolean.FALSE);
        return this.userRepo.addUser(user);
    }

    @Override
    public List<User> getNonAdminUsers(Map<String, String> params) {
        return this.userRepo.getNonAdminUsers(params);
    }

    @Override
    public void userApprove(int id) {
        this.userRepo.userApprove(id);
    }

    @Override
    public User getUserById(int id) {
        return this.userRepo.getUserById(id);
    }

}
