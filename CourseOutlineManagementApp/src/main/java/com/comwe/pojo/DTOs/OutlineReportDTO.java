/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.pojo.DTOs;

import lombok.Data;

/**
 *
 * @author kitj3
 */
@Data
public class OutlineReportDTO {

    private String facultyName;
    private int acceptedCount;
    private int holdingCount;

    public OutlineReportDTO() {
    }

    public OutlineReportDTO(String facultyName, int acceptedCount, int holdingCount) {
        this.facultyName = facultyName;
        this.acceptedCount = acceptedCount;
        this.holdingCount = holdingCount;
    }
}
