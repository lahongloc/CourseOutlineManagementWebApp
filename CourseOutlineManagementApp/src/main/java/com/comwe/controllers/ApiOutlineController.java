/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.controllers;

import com.comwe.services.OutlineService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author lahon
 */
@RestController
@CrossOrigin
@RequestMapping("/api")
public class ApiOutlineController {

    @Autowired
    private OutlineService outlineService;

    @GetMapping("/getOutlines/")
    public ResponseEntity<List<Object>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.outlineService.getOutlines(params), HttpStatus.OK);
    }

    @PostMapping(path = "/add-outline/", consumes = {
        MediaType.APPLICATION_JSON_VALUE,
        MediaType.MULTIPART_FORM_DATA_VALUE
    })
    public ResponseEntity<Object> addOutline(@RequestParam Map<Object, Object> params) {
        System.out.println("PARAM DO LAAAAA: " + params.keySet());
        
        params.keySet().forEach(k -> {
            System.out.println(k.toString() + " is: " + params.get(k));
        });

//        System.out.println("Start: " + params.get("start"));
//        System.out.println("End: " + params.get("end"));
//        System.out.println("Previous subjects: " + params.get("preSubs"));
//        System.out.println("Theory credits: " + params.get("theory"));
//        System.out.println("Practice credits: " + params.get("prac"));
//        System.out.println("Name 1: " + params.get("name0"));
//        System.out.println("Name 1: " + params.get("name1"));
//        System.out.println("Name 1: " + params.get("name2"));
//        System.out.println("Name 1: " + params.get("name0"));
//        System.out.println("Name 1: " + params.get("name0"));
//        System.out.println("Name 1: " + params.get("name0"));
//        System.out.println("Name 1: " + params.get("name0"));
//        System.out.println("Name 1: " + params.get("name0"));

//        Object scores = params.get("outlineScores");
//        Class<?> objClass = scores.getClass();
//        
//        System.out.println("Class la: " + objClass.getName());
        return new ResponseEntity<>("abc", HttpStatus.OK);
    }
}
