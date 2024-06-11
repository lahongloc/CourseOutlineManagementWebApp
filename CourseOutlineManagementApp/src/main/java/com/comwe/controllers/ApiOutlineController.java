/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.controllers;

import com.comwe.pojo.DTOs.OutlineDTO;
import com.comwe.pojo.Major;
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
import org.springframework.web.bind.annotation.PathVariable;
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
    public ResponseEntity<List<OutlineDTO>> list(@RequestParam Map<String, String> params) {
        List<OutlineDTO> outlines = this.outlineService.getOutlines(params);
        return new ResponseEntity<>(outlines, HttpStatus.OK);
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


        return new ResponseEntity<>("abc", HttpStatus.OK);
    }
    
    @GetMapping(path = "/getOutlines/{outlineId}/", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Object> retrieve(@PathVariable(value = "outlineId") int id) {
        return new ResponseEntity<>(this.outlineService.getOutlineById(id), HttpStatus.OK);
    }
}
