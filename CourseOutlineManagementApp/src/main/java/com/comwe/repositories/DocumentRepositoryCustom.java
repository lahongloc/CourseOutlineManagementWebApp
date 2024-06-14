/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories;

import com.comwe.pojo.Document;

/**
 *
 * @author kitj3
 */
public interface DocumentRepositoryCustom {
    public Document saveDocument(String name, String url, int outlineId);
    public Document getDocumentByName(String name);
}
