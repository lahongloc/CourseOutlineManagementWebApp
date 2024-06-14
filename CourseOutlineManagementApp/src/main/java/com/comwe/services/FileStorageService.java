/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services;

import com.amazonaws.services.s3.AmazonS3;
import java.io.File;
/**
 *
 * @author kitj3
 */
public interface FileStorageService {
    public String uploadFile(File file);
}
