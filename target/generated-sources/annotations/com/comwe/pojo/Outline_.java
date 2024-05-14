package com.comwe.pojo;

import com.comwe.pojo.Comment;
import com.comwe.pojo.Feedback;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.Subject;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-05-14T22:15:38")
@StaticMetamodel(Outline.class)
public class Outline_ { 

    public static volatile SingularAttribute<Outline, Lecturer> lecturerId;
    public static volatile SingularAttribute<Outline, String> contentFile;
    public static volatile SetAttribute<Outline, Comment> commentSet;
    public static volatile SetAttribute<Outline, Feedback> feedbackSet;
    public static volatile SingularAttribute<Outline, Date> expiredDate;
    public static volatile SingularAttribute<Outline, Date> startedDate;
    public static volatile SingularAttribute<Outline, Integer> creditHour;
    public static volatile SingularAttribute<Outline, Integer> id;
    public static volatile SingularAttribute<Outline, String> title;
    public static volatile SingularAttribute<Outline, Subject> subjectId;

}