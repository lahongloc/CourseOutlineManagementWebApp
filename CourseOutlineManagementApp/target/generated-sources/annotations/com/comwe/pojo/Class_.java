package com.comwe.pojo;

import com.comwe.pojo.Major;
import com.comwe.pojo.Student;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-05-17T20:29:12")
@StaticMetamodel(Class.class)
public class Class_ { 

    public static volatile SetAttribute<Class, Student> studentSet;
    public static volatile SingularAttribute<Class, Major> majorId;
    public static volatile SingularAttribute<Class, String> name;
    public static volatile SingularAttribute<Class, Integer> id;

}