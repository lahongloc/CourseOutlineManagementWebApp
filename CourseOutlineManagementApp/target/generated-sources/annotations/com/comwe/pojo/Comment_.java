package com.comwe.pojo;

import com.comwe.pojo.Outline;
import com.comwe.pojo.Student;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-06-24T13:47:32")
@StaticMetamodel(Comment.class)
public class Comment_ { 

    public static volatile SingularAttribute<Comment, Student> studentId;
    public static volatile SingularAttribute<Comment, Outline> outlineId;
    public static volatile SingularAttribute<Comment, Date> createdDate;
    public static volatile SingularAttribute<Comment, String> modelResponse;
    public static volatile SingularAttribute<Comment, Short> positive;
    public static volatile SingularAttribute<Comment, Integer> id;
    public static volatile SingularAttribute<Comment, String> content;

}