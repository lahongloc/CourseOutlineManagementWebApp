/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.comwe.pojo.Document;
import com.comwe.repositories.DocumentRepositoryCustom;
import com.comwe.services.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kitj3
 */
@Service
public class DocumentServiceImpl implements DocumentService {

    @Autowired
    private DocumentRepositoryCustom documentRepositoryCustom; 
    
    @Override
    public Document saveDocument(String name, String url, int outlineId) {
        return this.documentRepositoryCustom.saveDocument(name, url, outlineId);
    }

}
