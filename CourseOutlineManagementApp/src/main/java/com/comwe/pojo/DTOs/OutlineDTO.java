/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.pojo.DTOs;

import java.util.List;
import lombok.Data;

/**
 *
 * @author kitj3
 */
@Data
public class OutlineDTO {
    private int outlineId;
    private String description;
    private int theory;
    private int practice;
    private String lecturer;
    private String subject;
    private String faculty;
    private Float price;
    private List<Object> preSubjects;
//    private String url;

    // Constructor
    public OutlineDTO(int outlineId, String description, Integer theory, Integer practice, String lecturer, String subject, String faculty, Float price, List<Object> preSubjects) {
        this.outlineId = outlineId;
        this.description = description;
        this.theory = theory;
        this.practice = practice;
        this.lecturer = lecturer;
        this.subject = subject;
        this.faculty = faculty;
        this.price = price;
        this.preSubjects = preSubjects;
//        this.url = url;
    }
    
    public OutlineDTO() {
    }
    
}
