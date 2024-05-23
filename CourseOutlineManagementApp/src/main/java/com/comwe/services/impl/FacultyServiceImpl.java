/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.comwe.pojo.Faculty;
import com.comwe.repositories.FacultyRepository;
import com.comwe.services.FacultyService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kitj3
 */
@Service
public class FacultyServiceImpl implements FacultyService {
    @Autowired
    private FacultyRepository facultyRepository;

    @Override
    public List<Faculty> getFaculties(Map<String, String> params) {
        return this.facultyRepository.getFaculties(params);
    }

    @Override
    public Faculty getFacultyById(int id) {
        return this.facultyRepository.getFacultyById(id);
    }
    
    
}
