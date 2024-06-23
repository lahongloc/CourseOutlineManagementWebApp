/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.pojo.DTOs;

import com.comwe.pojo.User;
import java.util.Date;
import lombok.Data;

/**
 *
 * @author kitj3
 */
@Data
public class CommentDTO {
    private Integer id;
    private String content;
    private Short positive;
    private String modelResponse;
    private User user;
    private Date createdDate;

    public CommentDTO(Integer id, String content, Short positive, String modelResponse, User user, Date createdDate) {
        this.id = id;
        this.content = content;
        this.positive = positive;
        this.modelResponse = modelResponse;
        this.user = user;
        this.createdDate = createdDate;
    }
    
    public CommentDTO() {
    }
}
