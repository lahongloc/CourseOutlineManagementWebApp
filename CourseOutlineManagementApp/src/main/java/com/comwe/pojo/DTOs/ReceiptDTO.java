package com.comwe.pojo.DTOs;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

@Data
public class ReceiptDTO implements Serializable {

    private Integer id;
    private Date createdDate;
    private Boolean isPaid;
    private BigDecimal totalPrice;
    private Integer outlineId;
    private Integer studentId;

    // Default constructor
    public ReceiptDTO() {
    }

    // Constructor with parameters
    public ReceiptDTO(Integer id, Date createdDate, Boolean isPaid, BigDecimal totalPrice, Integer outlineId, Integer studentId) {
        this.id = id;
        this.createdDate = createdDate;
        this.isPaid = isPaid;
        this.totalPrice = totalPrice;
        this.outlineId = outlineId;
        this.studentId = studentId;
    }
}
