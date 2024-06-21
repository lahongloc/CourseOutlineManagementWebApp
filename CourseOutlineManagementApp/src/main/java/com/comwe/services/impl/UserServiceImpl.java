/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.cloudinary.Cloudinary;
import com.comwe.pojo.User;
import com.comwe.repositories.UserRepository;
import com.comwe.services.UserService;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
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
        return this.userRepo.addUser(params, avatar);
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

    @Override
    public User updateUser(Map<String, String> params, MultipartFile avatar) {
        return this.userRepo.updateUser(params, avatar);
    }

    @Override
    public User getCurrentLoginUser() {
        return this.userRepo.getCurrentLoginUser();
    }

}
