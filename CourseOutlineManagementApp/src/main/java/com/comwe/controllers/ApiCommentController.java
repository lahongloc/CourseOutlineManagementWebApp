/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.controllers;

import com.comwe.pojo.DTOs.CommentDTO;
import com.comwe.services.CommentService;
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
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author kitj3
 */
@RestController
@CrossOrigin
@RequestMapping("/api")
public class ApiCommentController {

    @Autowired
    private CommentService commentService;

    @GetMapping("/getComments/{outlineId}")
    public ResponseEntity<List<CommentDTO>> listComment(@RequestParam Map<String, String> params,
            @PathVariable(value = "outlineId") String outlineId) {
        return new ResponseEntity<>(this.commentService.getComments(params, outlineId), HttpStatus.OK);
    }

    @PostMapping(path = "/addComment/", produces
            = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.CREATED)
    public void addComment(@RequestBody Map<String, String> params) {
        this.commentService.addComment(params);
    }
}
