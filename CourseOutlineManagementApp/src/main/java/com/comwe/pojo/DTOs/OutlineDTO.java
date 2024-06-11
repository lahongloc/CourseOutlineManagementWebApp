/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.pojo.DTOs;

import java.util.Date;
import lombok.Data;

/**
 *
 * @author kitj3
 */
@Data
public class OutlineDTO {
    private int outlineId;
    private Date startedDate;
    private Date expiredDate;
    private String description;
    private Integer theory;
    private Integer practice;
    private String lecturer;
    private String subject;
    private String faculty;

    // Constructor
    public OutlineDTO(int outlineId, Date startedDate, Date expiredDate, String description, Integer theory, Integer practice, String lecturer, String subject, String faculty) {
        this.outlineId = outlineId;
        this.startedDate = startedDate;
        this.expiredDate = expiredDate;
        this.description = description;
        this.theory = theory;
        this.practice = practice;
        this.lecturer = lecturer;
        this.subject = subject;
        this.faculty = faculty;
    }
    
    public OutlineDTO() {
    }
    
}
