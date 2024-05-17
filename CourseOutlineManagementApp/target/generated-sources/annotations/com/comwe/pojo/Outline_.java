package com.comwe.pojo;

import com.comwe.pojo.Admin;
import com.comwe.pojo.Comment;
import com.comwe.pojo.Feedback;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.OutlineAcademicYear;
import com.comwe.pojo.OutlineScore;
import com.comwe.pojo.OutlineSubject;
import com.comwe.pojo.Subject;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-05-16T20:47:47")
@StaticMetamodel(Outline.class)
public class Outline_ { 

    public static volatile SetAttribute<Outline, OutlineSubject> outlineSubjectSet;
    public static volatile SetAttribute<Outline, OutlineScore> outlineScoreSet;
    public static volatile SetAttribute<Outline, Feedback> feedbackSet;
    public static volatile SingularAttribute<Outline, Admin> approverId;
    public static volatile SingularAttribute<Outline, Date> expiredDatetime;
    public static volatile SetAttribute<Outline, OutlineAcademicYear> outlineAcademicYearSet;
    public static volatile SingularAttribute<Outline, String> description;
    public static volatile SingularAttribute<Outline, Integer> pracCreditHour;
    public static volatile SingularAttribute<Outline, Subject> subjectId;
    public static volatile SingularAttribute<Outline, Lecturer> lecturerId;
    public static volatile SetAttribute<Outline, Comment> commentSet;
    public static volatile SingularAttribute<Outline, Date> startedDatetime;
    public static volatile SingularAttribute<Outline, Integer> theoCreditHour;
    public static volatile SingularAttribute<Outline, Integer> id;
    public static volatile SingularAttribute<Outline, Boolean> status;

}