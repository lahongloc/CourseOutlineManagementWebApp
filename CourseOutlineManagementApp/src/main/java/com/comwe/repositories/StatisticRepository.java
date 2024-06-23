/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories;

import java.util.List;
import java.util.Map;

/**
 *
 * @author lahon
 */
public interface StatisticRepository {
    List<Object[]> outlineSaleStatistic(Map<String, String> params);
    List<Object[]> downloadStatistic(Map<String, String> params);
}
