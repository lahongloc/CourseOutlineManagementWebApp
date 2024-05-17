/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.controllers;

import com.comwe.components.JwtService;
import com.comwe.pojo.User;
import com.comwe.services.UserService;
import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
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
    private JwtService jwtService;

    @PostMapping(path = "/addUser/", consumes = {
        MediaType.APPLICATION_JSON_VALUE,
        MediaType.MULTIPART_FORM_DATA_VALUE
    })
    @CrossOrigin
    @ResponseStatus(HttpStatus.CREATED)
    public void addUser(@RequestParam Map<String, String> params, @RequestPart MultipartFile[] files) {
        User user = new User();
        user.setUsername(params.get("username"));
        user.setSex(Boolean.TRUE);

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

        user.setPassword(params.get("password"));
        user.setName(params.get("name"));
        user.setRole("ADMIN");
        user.setEmail(params.get("email"));
        user.setHotline(params.get("hotline"));
        user.setFile(files[0]);
        user.setIsActive(Boolean.TRUE);
        this.userService.addUser(user);
    }
    
    @PostMapping("/login/")
    @CrossOrigin
    public ResponseEntity<String> login(@RequestBody User user) {
        if(this.userService.authUser(user.getUsername(), user.getPassword()) == true) {
            String token = this.jwtService.generateTokenLogin(user.getUsername());
            
            return new ResponseEntity<>(token, HttpStatus.OK);
        }
        return new ResponseEntity<>("error", HttpStatus.BAD_REQUEST);
    }
    
    @PostMapping("/test/")
    @CrossOrigin(origins = {"127.0.0.1:5500"})
    public ResponseEntity<String> test(Principal pricipal) {
        return new ResponseEntity<>("SUCCESSFUL", HttpStatus.OK);
    }
    
    @GetMapping(path = "/current-user/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<User> details(Principal user) {
        User u = this.userService.getUserByUsername(user.getName());
        return new ResponseEntity<>(u, HttpStatus.OK);
    }
}
