/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.Document;
import com.comwe.pojo.Outline;
import com.comwe.repositories.DocumentRepositoryCustom;
import java.time.Instant;
import java.time.LocalDate;
import java.util.Date;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author kitj3
 */
@Repository
@Transactional
public class DocumentRepositoryImpl implements DocumentRepositoryCustom {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Document saveDocument(String name, String url, int outlineId) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            Document document = new Document();
            document.setName(name); // Tên môn học (ví dụ)
            document.setUrl(url); // URL của tệp đã upload

            Outline outline = s.get(Outline.class, outlineId);
            System.out.println("Outline: " + outline);

            LocalDate today = LocalDate.now();
            Instant instant = today.atStartOfDay().atZone(java.time.ZoneId.systemDefault()).toInstant();
            Date created_date = Date.from(instant);

            document.setUploadDate(created_date);
            s.save(document);

            Document documentSaved = this.getDocumentByName(name);
            System.out.println("DocumentSavedREPOSITORY: " + documentSaved);
            
            outline.setDocumentId(documentSaved);
            s.update(outline);

            return documentSaved;
        } catch (Exception ex) {
            System.out.println(ex);
            s.getTransaction().rollback();
        }

        return null;
    }

    @Override
    public Document getDocumentByName(String name) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT d FROM Document d WHERE d.name = :name");
        q.setParameter("name", name);
        
        return (Document) q.getSingleResult();
    }

}
