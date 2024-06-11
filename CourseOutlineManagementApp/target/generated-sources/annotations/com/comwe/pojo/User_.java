package com.comwe.pojo;

import com.comwe.pojo.Admin;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.Student;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-06-11T16:20:06")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, Date> birthday;
    public static volatile SingularAttribute<User, String> role;
    public static volatile SingularAttribute<User, String> hotline;
    public static volatile SingularAttribute<User, Boolean> sex;
    public static volatile SingularAttribute<User, String> avatar;
    public static volatile SingularAttribute<User, Boolean> isActive;
    public static volatile SetAttribute<User, Admin> adminSet;
    public static volatile SetAttribute<User, Student> studentSet;
    public static volatile SingularAttribute<User, String> password;
    public static volatile SetAttribute<User, Lecturer> lecturerSet;
    public static volatile SingularAttribute<User, String> name;
    public static volatile SingularAttribute<User, Date> createdDatetime;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, String> email;
    public static volatile SingularAttribute<User, String> username;

}