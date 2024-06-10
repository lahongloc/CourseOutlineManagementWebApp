/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.comwe.pojo.AcademicYear;
import com.comwe.repositories.AcademicYearRepository;
import com.comwe.services.AcademicYearService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kitj3
 */
@Service
public class AcademicYearServiceImpl implements AcademicYearService {

    @Autowired
    private AcademicYearRepository academicYearRepository;
    
    @Override
    public List<AcademicYear> getAcademicYears(Map<String, String> params) {
        return this.academicYearRepository.getAcademicYears(params);
    }

    @Override
    public AcademicYear getAcademicYearById(int id) {
        return this.academicYearRepository.getAcademicYearById(id);
    }
    
}
