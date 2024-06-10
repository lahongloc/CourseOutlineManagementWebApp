/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.comwe.pojo.Major;
import com.comwe.repositories.MajorRepository;
import com.comwe.services.MajorService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kitj3
 */
@Service
public class MajorServiceImpl implements MajorService{

    @Autowired
    private MajorRepository majorRepository; 
    
    @Override
    public List<Major> getMajors(Map<String, String> params) {
        return this.majorRepository.getMajors(params);
    }

    @Override
    public Major getMajorById(int id) {
        return this.majorRepository.getMajorById(id);
    }
    
}
