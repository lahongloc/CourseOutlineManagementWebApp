/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services;

import com.comwe.pojo.Outline;
import java.io.ByteArrayInputStream;

/**
 *
 * @author kitj3
 */
public interface PdfService {
    public ByteArrayInputStream createPdf(Outline outline);
}
