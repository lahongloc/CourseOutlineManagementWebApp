/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.comwe.pojo.Grade;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.comwe.repositories.GradeRepository;
import com.comwe.services.GradeService;

/**
 *
 * @author kitj3
 */
@Service
public class GradeServiceImpl implements GradeService {

    @Autowired
    private GradeRepository gradeRepository;

    @Override
    public List<Grade> getGrades(Map<String, String> params) {
        return this.gradeRepository.getGrades(params);
    }

    @Override
    public Grade getGradeById(int id) {
        return this.gradeRepository.getGradeById(id);
    }

}