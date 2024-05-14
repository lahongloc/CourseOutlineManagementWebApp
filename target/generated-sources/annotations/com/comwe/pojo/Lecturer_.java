package com.comwe.pojo;

import com.comwe.pojo.Faculty;
import com.comwe.pojo.Outline;
import com.comwe.pojo.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-05-14T22:15:38")
@StaticMetamodel(Lecturer.class)
public class Lecturer_ { 

    public static volatile SingularAttribute<Lecturer, Faculty> facultyId;
    public static volatile SetAttribute<Lecturer, Outline> outlineSet;
    public static volatile SingularAttribute<Lecturer, Integer> id;
    public static volatile SingularAttribute<Lecturer, User> user;

}