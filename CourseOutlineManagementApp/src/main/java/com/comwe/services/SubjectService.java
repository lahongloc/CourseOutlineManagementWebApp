/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services;

import com.comwe.pojo.DTOs.SubjectDTO;
import java.util.List;
import java.util.Map;

/**
 *
 * @author lahon
 */
public interface SubjectService {
    List<SubjectDTO> getSubjects(Map<String, String> params);
    boolean addSubject(String name, String[] faculties);
}
