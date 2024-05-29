/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories;

import com.comwe.pojo.Subject;
import java.util.List;
import java.util.Map;

/**
 *
 * @author lahon
 */
public interface SubjectRepository {
    List<Subject> getSubjects(Map<String, String> params);
}
