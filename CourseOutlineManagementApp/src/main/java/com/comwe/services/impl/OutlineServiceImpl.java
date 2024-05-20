/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.comwe.repositories.OutlineRepository;
import com.comwe.services.OutlineService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lahon
 */
@Service
public class OutlineServiceImpl implements OutlineService {
    @Autowired
    private OutlineRepository outlineRepo;

    @Override
    public List<Object> getOutlines(Map<String, String> params) {
        return this.outlineRepo.getOutlines(params);
    }
    
    
    
}
