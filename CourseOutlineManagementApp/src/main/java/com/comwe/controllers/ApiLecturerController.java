/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.controllers;

import com.comwe.pojo.Lecturer;
import com.comwe.services.LecturerServiceQuery;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
public class ApiLecturerController {
    @Autowired
    private LecturerServiceQuery lecturerServiceQuery;
    
    @GetMapping(path = "/getLecturers/", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<List<Object>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.lecturerServiceQuery.getLecturers(params), HttpStatus.OK);
    }
    
    @GetMapping(path = "/getLecturers/{lecturerId}/", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Lecturer> retrieve(@PathVariable(value = "lecturerId") int id) {
        return new ResponseEntity<>(this.lecturerServiceQuery.getLecturerByUserId(id), HttpStatus.OK);
    }
}