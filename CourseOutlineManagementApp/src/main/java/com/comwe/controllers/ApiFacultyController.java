/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.controllers;

import com.comwe.pojo.Faculty;
import com.comwe.services.FacultyService;
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
 * @author kitj3
 */
@RestController
@CrossOrigin
@RequestMapping("/api")
public class ApiFacultyController {
    @Autowired
    private FacultyService facultyService;
    
    @GetMapping("/getFaculties/")
    public ResponseEntity<List<Faculty>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.facultyService.getFaculties(params), HttpStatus.OK);
    }
    
    @GetMapping(path = "/getFaculties/{facultyId}/", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Faculty> retrieve(@PathVariable(value = "facultyId") int id) {
        return new ResponseEntity<>(this.facultyService.getFacultyById(id), HttpStatus.OK);
    }

}
