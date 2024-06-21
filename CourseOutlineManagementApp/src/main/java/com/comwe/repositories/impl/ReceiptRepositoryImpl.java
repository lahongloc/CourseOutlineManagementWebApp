/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories.impl;

import com.comwe.pojo.Outline;
import com.comwe.pojo.Receipt;
import com.comwe.pojo.User;
import com.comwe.repositories.ReceiptRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author lahon
 */
@Repository
@Transactional
public class ReceiptRepositoryImpl implements ReceiptRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public Receipt getReceiptById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Receipt.class, id);
    }


    @Override
    public Receipt getReceiptByTransactionId(String transactionId) {
        Session s = this.factory.getObject().getCurrentSession();
        Query qr = s.createNamedQuery("SELECT r FROM Receipt r WHERE r.transactionId = :transactionId");
        qr.setParameter("transactionId", transactionId);

        return (Receipt) qr.getSingleResult();
    }

    @Override
    public boolean addReceipt(Receipt r, Outline outline, User user) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            r.setOutlineId(outline);
            r.setUserId(user);
            s.save(r);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

}
