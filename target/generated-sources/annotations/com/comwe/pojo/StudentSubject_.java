package com.comwe.pojo;

import com.comwe.pojo.Score;
import com.comwe.pojo.Student;
import com.comwe.pojo.Subject;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-05-14T22:15:38")
@StaticMetamodel(StudentSubject.class)
public class StudentSubject_ { 

    public static volatile SingularAttribute<StudentSubject, Score> scoreId;
    public static volatile SingularAttribute<StudentSubject, Student> studentId;
    public static volatile SingularAttribute<StudentSubject, Integer> id;
    public static volatile SingularAttribute<StudentSubject, Subject> subjectId;

}