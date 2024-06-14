/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.comwe.services.FileStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.io.File;
import org.springframework.context.annotation.PropertySource;

/**
 *
 * @author kitj3
 */
@Service
@PropertySource("classpath:application.properties")
public class FileStorageServiceImpl implements FileStorageService {    
//    public AmazonS3 amazonS3() {
//        BasicAWSCredentials awsCreds = new BasicAWSCredentials(
//                this.env.getProperty("aws.accessKey"),
//                this.env.getProperty("aws.secretKey")
//        );
//        return AmazonS3ClientBuilder.standard()
//                .withRegion(this.env.getProperty("aws.s3.region"))
//                .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
//                .build();
//    }
    
    @Autowired
    private AmazonS3 amazonS3;

    @Autowired
    private Environment env;

    @Override
    public String uploadFile(File file) {
//        amazonS3 = amazonS3();
        String bucketName = env.getProperty("aws.s3.bucket");
        String fileName = file.getPath();

        System.out.println("amazone s3: " + amazonS3);
        
        amazonS3.putObject(new PutObjectRequest(bucketName, fileName, file));
        
        System.out.println("Amazone done: " + amazonS3.getUrl(bucketName, fileName).toString());
        
        return amazonS3.getUrl(bucketName, fileName).toString();
    }
}
