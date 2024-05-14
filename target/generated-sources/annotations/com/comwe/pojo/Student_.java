package com.comwe.pojo;

import com.comwe.pojo.Class;
import com.comwe.pojo.Comment;
import com.comwe.pojo.Faculty;
import com.comwe.pojo.Feedback;
import com.comwe.pojo.StudentSubject;
import com.comwe.pojo.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-05-14T22:15:38")
@StaticMetamodel(Student.class)
public class Student_ { 

    public static volatile SingularAttribute<Student, Faculty> facultyId;
    public static volatile SingularAttribute<Student, Class> classId;
    public static volatile SetAttribute<Student, Comment> commentSet;
    public static volatile SetAttribute<Student, Feedback> feedbackSet;
    public static volatile SetAttribute<Student, StudentSubject> studentSubjectSet;
    public static volatile SingularAttribute<Student, Integer> id;
    public static volatile SingularAttribute<Student, User> user;

}