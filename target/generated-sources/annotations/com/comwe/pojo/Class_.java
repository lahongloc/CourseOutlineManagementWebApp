package com.comwe.pojo;

import com.comwe.pojo.Faculty;
import com.comwe.pojo.Student;
import com.comwe.pojo.SubjectClass;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-05-14T22:15:38")
@StaticMetamodel(Class.class)
public class Class_ { 

    public static volatile SetAttribute<Class, Student> studentSet;
    public static volatile SingularAttribute<Class, Faculty> facultyId;
    public static volatile SingularAttribute<Class, String> name;
    public static volatile SingularAttribute<Class, Integer> id;
    public static volatile SetAttribute<Class, SubjectClass> subjectClassSet;

}