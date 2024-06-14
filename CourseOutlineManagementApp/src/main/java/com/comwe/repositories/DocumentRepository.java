/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories;

import com.comwe.pojo.Document;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author kitj3
 */
public interface DocumentRepository extends JpaRepository<Document, Integer> {
    
}
