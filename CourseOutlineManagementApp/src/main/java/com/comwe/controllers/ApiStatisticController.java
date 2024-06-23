/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.controllers;

import com.comwe.services.StatisticService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author lahon
 */
@RestController
@RequestMapping("/api")
public class ApiStatisticController {
    @Autowired
    private StatisticService statisticService;
    
    @GetMapping("/outlines-statistic/")
    public ResponseEntity<List<Object[]>> outlineStatistic(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.statisticService.outlineSaleStatistic(params), HttpStatus.OK);
    }
    
}
