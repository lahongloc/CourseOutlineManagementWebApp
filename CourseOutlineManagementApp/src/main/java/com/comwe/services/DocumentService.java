/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services;

import com.comwe.pojo.Document;

/**
 *
 * @author kitj3
 */
public interface DocumentService {
    public Document saveDocument(String name, String url, int outlineId);
}
