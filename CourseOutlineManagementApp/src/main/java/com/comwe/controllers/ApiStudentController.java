/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.controllers;

import com.comwe.services.StudentService;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author kitj3
 */
@RestController
@RequestMapping("/api")
public class ApiStudentController {

    @Autowired
    private StudentService studentService;

    @CrossOrigin
    @GetMapping("/getStudents/")
    public ResponseEntity<List<Object>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.studentService.getStudents(params), HttpStatus.OK);
    }

    @CrossOrigin
    @GetMapping(path = "/getStudents/{studentId}/", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<List<Object>> retrieve(@PathVariable(value = "studentId") int id) {
        return new ResponseEntity<>(this.studentService.getStudentById(id), HttpStatus.OK);
    }

    @PostMapping(path = "/student-register/", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    @CrossOrigin
    @ResponseStatus(HttpStatus.CREATED)
    public void addStudent(@RequestParam Map<String, String> params) {
        System.out.println(params);
        this.studentService.addStudent(params);
    }
    
    @PostMapping(path = "/student-active/", consumes = {
        MediaType.APPLICATION_JSON_VALUE,
        MediaType.MULTIPART_FORM_DATA_VALUE
    })
    @CrossOrigin
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateStudent(@RequestParam Map<String, String> params, @RequestPart MultipartFile[] files) {
        this.studentService.updateStudent(params, files[0]);
    }
}
