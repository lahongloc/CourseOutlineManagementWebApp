/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.comwe.pojo.Outline;
import com.comwe.pojo.Receipt;
import com.comwe.pojo.User;
import com.comwe.repositories.ReceiptRepository;
import com.comwe.services.ReceiptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lahon
 */
@Service
public class ReceiptServiceImpl implements ReceiptService {
    @Autowired
    private ReceiptRepository receiptRepo;
    
    @Override
    public Receipt getReceiptById(int id) {
        return this.receiptRepo.getReceiptById(id);
    }

    @Override
    public Receipt getReceiptByTransactionId(String transactionId) {
        return this.receiptRepo.getReceiptByTransactionId(transactionId);
    }

    @Override
    public boolean addReceipt(Receipt r, Outline outline, User user) {
        return this.receiptRepo.addReceipt(r, outline, user);
    }
}
