package com.comwe.pojo;

import com.comwe.pojo.Outline;
import com.comwe.pojo.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-06-11T16:20:06")
@StaticMetamodel(Admin.class)
public class Admin_ { 

    public static volatile SetAttribute<Admin, Outline> outlineSet;
    public static volatile SingularAttribute<Admin, Integer> id;
    public static volatile SingularAttribute<Admin, User> userId;

}