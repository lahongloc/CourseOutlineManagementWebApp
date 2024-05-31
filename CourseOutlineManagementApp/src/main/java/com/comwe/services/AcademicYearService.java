/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services;

import com.comwe.pojo.AcademicYear;
import java.util.List;
import java.util.Map;

/**
 *
 * @author kitj3
 */
public interface AcademicYearService {
    List<AcademicYear> getAcademicYears(Map<String, String> params);
    AcademicYear getAcademicYearById(int id);
}
