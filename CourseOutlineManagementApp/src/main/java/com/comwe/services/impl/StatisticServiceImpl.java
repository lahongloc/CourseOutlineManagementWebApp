/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.comwe.repositories.StatisticRepository;
import com.comwe.services.StatisticService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lahon
 */
@Service
public class StatisticServiceImpl implements StatisticService {

    @Autowired
    private StatisticRepository statisticRepo;
    
    @Override
    public List<Object[]> outlineSaleStatistic(Map<String, String> params) {
        return this.statisticRepo.outlineSaleStatistic(params);
    }
    
}
