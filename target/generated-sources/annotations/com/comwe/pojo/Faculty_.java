package com.comwe.pojo;

import com.comwe.pojo.Class;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.Student;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-05-14T22:15:38")
@StaticMetamodel(Faculty.class)
public class Faculty_ { 

    public static volatile SetAttribute<Faculty, Student> studentSet;
    public static volatile SetAttribute<Faculty, Lecturer> lecturerSet;
    public static volatile SingularAttribute<Faculty, String> name;
    public static volatile SingularAttribute<Faculty, Integer> id;
    public static volatile SetAttribute<Faculty, Class> classSet;

}