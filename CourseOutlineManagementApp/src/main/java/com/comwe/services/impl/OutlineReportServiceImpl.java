/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.comwe.pojo.DTOs.OutlineReportDTO;
import com.comwe.repositories.OutlineReportRepository;
import com.comwe.services.OutlineReportService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kitj3
 */
@Service
public class OutlineReportServiceImpl implements OutlineReportService {

    @Autowired
    private OutlineReportRepository outlineReportRepository;
    
    @Override
    public List<OutlineReportDTO> getOutlineCompletionStatistics() {
        return this.outlineReportRepository.getOutlineCompletionStatistics();
    }
    
}
