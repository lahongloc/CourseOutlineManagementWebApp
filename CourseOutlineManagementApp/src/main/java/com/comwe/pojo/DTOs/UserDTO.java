/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.pojo.DTOs;

import java.util.Date;
import lombok.Data;
import sun.security.krb5.internal.crypto.crc32;

/**
 *
 * @author kitj3
 */
@Data
public class UserDTO {

    private int id;
    private String username;
    private Boolean sex;
    private Date birthday;
    private String password;
    private String name;
    private String role;
    private String email;
    private String hotline;
    private String avatar;
    private Boolean isActive;
    private Date createdDatetime;

    public UserDTO() {
    }

    public UserDTO(int id, String username, Boolean sex, Date birthday, String password, String name, String role, String email, String hotline, String avatar, boolean isActive, Date createdDatetime) {
        this.id = id;
        this.username = username;
        this.sex = sex;
        this.birthday = birthday;
        this.password = password;
        this.name = name;
        this.role = role;
        this.email = email;
        this.hotline = hotline;
        this.avatar = avatar;
        this.isActive = isActive;
        this.createdDatetime = createdDatetime;
    }
}
