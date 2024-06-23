/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories;

import com.comwe.pojo.DTOs.OutlineDTO;
import com.comwe.pojo.Outline;
import java.util.List;
import java.util.Map;

/**
 *
 * @author lahon
 */
public interface OutlineRepository {
    List<OutlineDTO> getOutlines(Map<String, String> params);
    void addOutline(int lecturerId, int subjectId, int academicYearId1, int academicYearId2);
    boolean checkOutlineExist(int subjectId, int academicYearId1, int academicYearId2);
    List<Object> getOutlineById(int id);
    boolean updateOutline(Map<String, String> params);
    boolean accept(int id);
    Outline getAnOutlineById(int id);
    String getDocumentUrl(int outlineId);
    List<Object> getDownoadedOutlineDocument(int userId);
    List<Object> getPrerequisiteSubjects(int outlineId);
}
