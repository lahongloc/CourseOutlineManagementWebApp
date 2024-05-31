package com.comwe.pojo;

import com.comwe.pojo.Major;
import com.comwe.pojo.Student;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-05-30T16:37:48")
@StaticMetamodel(Grade.class)
public class Grade_ { 

    public static volatile SetAttribute<Grade, Student> studentSet;
    public static volatile SingularAttribute<Grade, Major> majorId;
    public static volatile SingularAttribute<Grade, String> name;
    public static volatile SingularAttribute<Grade, Integer> id;

}