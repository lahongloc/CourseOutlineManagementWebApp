/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.controllers;

import com.comwe.pojo.User;
import com.comwe.services.OutlineService;
import com.comwe.services.UserService;
import java.util.List;
import java.util.Map;
import javax.websocket.server.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author lahon
 */
@Controller
@PropertySource("classpath:configs.properties")
public class HomeController {

    @Autowired
    private OutlineService outlineService;
    @Autowired
    private UserService userService;
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private Environment env;

    private static final AuthenticationTrustResolver authenticationTrustResolver = new AuthenticationTrustResolverImpl();

    @RequestMapping("/")
    public String index(@RequestParam Map<String, String> params, Model model) {
        model.addAttribute("outlines", this.outlineService.getOutlines(params));
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Object username = null;

        if (authentication != null && authentication.isAuthenticated() && !authenticationTrustResolver.isAnonymous(authentication)) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                username = ((UserDetails) principal).getUsername();
            }

            model.addAttribute("username", username);
        }

        return "index";
    }

    @GetMapping("/users-manager/")
    public String lecturerManagement(@RequestParam Map<String, String> params, Model model) {
        params.put("role", "ROLE_LECTURER");
        int totalPageLecturer = (int) Math.ceil((double) this.userService.getNonAdminUsers(params).size() / Integer.parseInt(this.env.getProperty("pageSizeUser")));
        params.put("page", params.get("pageLecturer"));
        model.addAttribute("pageSizeLecturer", totalPageLecturer);
        model.addAttribute("lecturers", this.userService.getNonAdminUsers(params));
        
        
        
        params.replace("role", "ROLE_STUDENT");
        params.replace("page", null);
        int totalPageStudent = (int) Math.ceil((double) this.userService.getNonAdminUsers(params).size() / Integer.parseInt(this.env.getProperty("pageSizeUser")));
        params.replace("page", params.get("pageStudent"));
        model.addAttribute("pageSizeStudent", totalPageStudent);
        model.addAttribute("students", this.userService.getNonAdminUsers(params));
        return "user";
    }

    public void sendMail(String to, String subject, String content) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom("locla2405@gmail.com");
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);

        this.mailSender.send(mailMessage);
    }

    @PostMapping("/users-manager/{userId}/")
    public String sendEmailForUser(@PathVariable(value = "userId") int userId,
            @RequestParam Map<String, String> params) {        
        String to = params.get("to");
        String subject = params.get("subject");
        String content = params.get("content");
        
        if((to != null && subject != null && content != null) 
                && (!to.isEmpty() && !subject.isEmpty() && !content.isEmpty())) {
            sendMail(to, subject, content);
            return "redirect:/users-manager/";
        }
        
        return "redirect:/users-manager/{userId}/";
    }

    @GetMapping("/users-manager/{userId}/")
    public String userDetails(@PathVariable(value = "userId") int userId, 
            Model model, Map<String, String> params) {
        model.addAttribute("user", this.userService.getUserById(userId));
        return "userDetails";
    }
}
