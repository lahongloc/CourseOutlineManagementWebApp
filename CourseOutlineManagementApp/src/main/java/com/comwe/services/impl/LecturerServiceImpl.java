/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.comwe.pojo.Lecturer;
import com.comwe.repositories.LecturerRepository;
import com.comwe.services.LecturerService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author lahon
 */
@Service
public class LecturerServiceImpl implements LecturerService {
    @Autowired
    private LecturerRepository lecturerRepo;

    @Override
    public boolean addLecturer(Map<String, String> params, MultipartFile avatar) {
        return this.lecturerRepo.addLecturer(params, avatar);
    }

    @Override
    public boolean updateLecturer(Map<String, String> params, MultipartFile avatar) {
        return this.lecturerRepo.updateLecturer(params, avatar);
    }
    
}
 