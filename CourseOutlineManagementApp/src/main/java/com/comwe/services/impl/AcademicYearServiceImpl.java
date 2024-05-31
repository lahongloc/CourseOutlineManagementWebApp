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
 * @author lahon
 */
@Service
public class AcademicYearServiceImpl implements AcademicYearService {
    @Autowired
    private AcademicYearRepository academicYearRepo;

    @Override
    public List<AcademicYear> getAllAcademicYears(Map<String, String> params) {
        return this.academicYearRepo.getAllAcademicYears(params);
    }
    
}
