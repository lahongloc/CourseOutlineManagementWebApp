/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories;

import java.util.Map;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author lahon
 */
public interface LecturerRepository {
    boolean addLecturer(Map<String, String> params, MultipartFile avatar);
}
