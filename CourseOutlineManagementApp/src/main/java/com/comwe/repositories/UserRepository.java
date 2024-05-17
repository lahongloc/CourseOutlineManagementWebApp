/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories;

import com.comwe.pojo.User;

/**
 *
 * @author lahon
 */
public interface UserRepository {
    User getUserByUsername(String username);
    boolean authUser(String username, String password);
    void addUser(User user);
}
