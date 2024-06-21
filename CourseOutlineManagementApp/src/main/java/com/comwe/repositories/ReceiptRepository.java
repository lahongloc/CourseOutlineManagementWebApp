/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.repositories;

import com.comwe.pojo.Outline;
import com.comwe.pojo.Receipt;
import com.comwe.pojo.User;

/**
 *
 * @author lahon
 */
public interface ReceiptRepository {
    Receipt getReceiptById(int id);
    Receipt getReceiptByTransactionId(String transactionId);
    boolean addReceipt(Receipt r, Outline outline, User user);
}
