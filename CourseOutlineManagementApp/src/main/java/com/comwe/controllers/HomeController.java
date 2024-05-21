/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.controllers;

import com.comwe.pojo.User;
import com.comwe.services.OutlineService;
import com.comwe.services.UserService;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author lahon
 */
@Controller
public class HomeController {
    @Autowired
    private OutlineService outlineService;
    @Autowired
    private UserService userService;
    
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
        model.addAttribute("users", this.userService.getNonAdminUsers(params));
        return "user";
    }
}
