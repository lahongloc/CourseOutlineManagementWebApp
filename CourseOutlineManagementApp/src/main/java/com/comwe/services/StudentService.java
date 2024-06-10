/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services;

import com.comwe.pojo.Student;
import java.util.List;
import java.util.Map;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author kitj3
 */
public interface StudentService {
    List<Object> getStudents (Map<String, String> params);
    List<Object> getStudentById(int id);
    Student getStudentByUserId(int id);
    boolean addStudent(Map<String, String> params);
    boolean updateStudent(Map<String, String> params, MultipartFile avatar);
}
