/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.comwe.pojo.Student;
import com.comwe.repositories.StudentRepositorty;
import com.comwe.services.StudentService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author kitj3
 */
@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepositorty studentRepositorty;
    
    @Override
    public List<Object> getStudents(Map<String, String> params) {
        return this.studentRepositorty.getStudents(params);
    }

    @Override
    public List<Object> getStudentById(int id) {
        return this.studentRepositorty.getStudentById(id);
    }

    @Override
    public boolean addStudent(Map<String, String> params) {
        return this.studentRepositorty.addStudent(params);
    }

    @Override
    public boolean updateStudent(Map<String, String> params, MultipartFile avatar) {
        return this.studentRepositorty.updateStudent(params, avatar);
    }

    @Override
    public Student getStudentByUserId(int id) {
        return this.studentRepositorty.getStudentByUserId(id);
    }
    
}
