package com.comwe.pojo;

import com.comwe.pojo.Outline;
import com.comwe.pojo.Student;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-06-14T22:26:41")
@StaticMetamodel(Feedback.class)
public class Feedback_ { 

    public static volatile SingularAttribute<Feedback, Student> studentId;
    public static volatile SingularAttribute<Feedback, Outline> outlineId;
    public static volatile SingularAttribute<Feedback, Integer> id;
    public static volatile SingularAttribute<Feedback, String> content;

}