/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories;

import com.comwe.pojo.DTOs.OutlineReportDTO;
import java.util.List;

/**
 *
 * @author kitj3
 */
public interface OutlineReportRepository {
    public List<OutlineReportDTO> getOutlineCompletionStatistics(String year, String period);
}
