/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.controllers;

import com.comwe.pojo.DTOs.SubjectDTO;
import com.comwe.services.SubjectService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author lahon
 */
@RestController
@CrossOrigin
@RequestMapping("/api")
public class ApiSubjectController {
    @Autowired
    private SubjectService subjectService;
    
    @GetMapping("/getSubjects/")
    public ResponseEntity<List<SubjectDTO>> list(@RequestParam Map<String, String> params) {
        params.keySet().forEach(k -> System.out.println("key laaaaaaaaaaaaaaaaa " + params.get(k)));
        return new ResponseEntity<>(this.subjectService.getSubjects(params), HttpStatus.OK);
    }
}