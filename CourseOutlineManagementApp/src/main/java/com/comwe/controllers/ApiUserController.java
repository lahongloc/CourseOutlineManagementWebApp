/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.controllers;

import com.comwe.components.JwtService;
import com.comwe.pojo.User;
import com.comwe.services.LecturerService;
import com.comwe.services.LecturerServiceQuery;
import com.comwe.services.StudentService;
import com.comwe.services.UserService;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author lahon
 */
@RestController
@RequestMapping("/api")
public class ApiUserController {

    @Autowired
    private UserService userService;

    @Autowired
    private LecturerService lecturerService;

    @Autowired
    private JwtService jwtService;

    @PostMapping(path = "/lecturer-register/", consumes = {
        MediaType.APPLICATION_JSON_VALUE,
        MediaType.MULTIPART_FORM_DATA_VALUE
    })
    @CrossOrigin                                                                  
    @ResponseStatus(HttpStatus.CREATED)
    public void addLecturer(@RequestParam Map<String, String> params, @RequestPart MultipartFile[] files) {
        this.lecturerService.addLecturer(params, files[0]);
    }

    @PostMapping(path = "/lecturer-update/", consumes = {
        MediaType.APPLICATION_JSON_VALUE,
        MediaType.MULTIPART_FORM_DATA_VALUE
    })
    @CrossOrigin
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateLecturer(@RequestParam Map<String, String> params, @RequestPart MultipartFile[] files) {
        this.lecturerService.updateLecturer(params, files[0]);
    } 

    @CrossOrigin
    @PostMapping("/login/")
    public ResponseEntity<String> login(@RequestBody User user) {
        if (this.userService.authUser(user.getUsername(), user.getPassword()) == true) {
            String token = this.jwtService.generateTokenLogin(user.getUsername());
            return new ResponseEntity<>(token, HttpStatus.OK);
        } 
        return new ResponseEntity<>("error", HttpStatus.BAD_REQUEST);
    }

    @CrossOrigin
    @PostMapping(path = "/users/",
            consumes = {MediaType.MULTIPART_FORM_DATA_VALUE},
            produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<User> addUser(@RequestParam Map<String, String> params, @RequestPart MultipartFile avatar) {
        User user = this.userService.addUser(params, avatar);
        return new ResponseEntity<>(user, HttpStatus.CREATED);
    }

    @CrossOrigin
    @GetMapping(path = "/current-user/", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> details(Principal user) {
        System.out.println("lay usser heienjen " + user.getName());
        User u = this.userService.getUserByUsername(user.getName());
        System.out.println("lay usser tccccccc " + u);
        return new ResponseEntity<>(u, HttpStatus.OK);
    }

    @PostMapping("/user-approvement/{userId}")
    @ResponseStatus(HttpStatus.OK)
    public void userApprove(@PathVariable int userId) {
        this.userService.userApprove(userId);
    }
    
    @CrossOrigin
    @GetMapping("/getNonAdminUsers/")
    public ResponseEntity<List<User>> lisUserNonAdmin(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.userService.getNonAdminUsers(params), HttpStatus.OK);
    }
}
