/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.comwe.pojo.DTOs.OutlineDTO;
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
    public List<OutlineDTO> getOutlines(Map<String, String> params) {
        return this.outlineRepo.getOutlines(params);
    }    

    @Override
    public void addOutline(int lecturerId, int subjectId, int academicYearId1, int academicYearId2) {
        this.outlineRepo.addOutline(lecturerId, subjectId, academicYearId1, academicYearId2);
    }

    @Override
    public boolean checkOutlineExist(int subjectId, int academicYearId1, int academicYearId2) {
        return this.outlineRepo.checkOutlineExist(subjectId, academicYearId1, academicYearId2);
    }

    public List<Object> getOutlineById(int id) {
        return this.outlineRepo.getOutlineById(id);
    }

    @Override
    public boolean updateOutline(Map<String, String> params) {
        return this.outlineRepo.updateOutline(params);
    }
}
