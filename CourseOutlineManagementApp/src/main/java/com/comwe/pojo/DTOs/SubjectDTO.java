package com.comwe.pojo.DTOs;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import com.comwe.pojo.Faculty;
import com.comwe.pojo.Outline;
import lombok.Data;

/**
 *
 * @author kitj3
 */
@Data
public class SubjectDTO {
    private Integer id;
    private String name;
    private Faculty facultyId;
    private Outline outline;   

    public SubjectDTO(Integer id, String name, Faculty facultyId, Outline outline) {
        this.id = id;
        this.name = name;
        this.facultyId = facultyId;
        this.outline = outline;
    }
}
