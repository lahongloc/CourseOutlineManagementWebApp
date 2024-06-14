/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services;

import java.io.ByteArrayInputStream;
import java.util.Map;

/**
 *
 * @author kitj3
 */
public interface PdfService {
    public ByteArrayInputStream createPdf(Map<String, String> params);
}
