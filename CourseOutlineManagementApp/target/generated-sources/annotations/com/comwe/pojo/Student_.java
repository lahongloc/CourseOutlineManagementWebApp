package com.comwe.pojo;

import com.comwe.pojo.AcademicYear;
import com.comwe.pojo.Comment;
import com.comwe.pojo.Feedback;
import com.comwe.pojo.Grade;
import com.comwe.pojo.Major;
import com.comwe.pojo.StudentOutlineDownload;
import com.comwe.pojo.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-06-14T22:26:42")
@StaticMetamodel(Student.class)
public class Student_ { 

    public static volatile SingularAttribute<Student, Grade> gradeId;
    public static volatile SingularAttribute<Student, Major> majorId;
    public static volatile SetAttribute<Student, Comment> commentSet;
    public static volatile SingularAttribute<Student, String> studentCode;
    public static volatile SetAttribute<Student, Feedback> feedbackSet;
    public static volatile SingularAttribute<Student, AcademicYear> academicYearId;
    public static volatile SetAttribute<Student, StudentOutlineDownload> studentOutlineDownloadSet;
    public static volatile SingularAttribute<Student, Integer> id;
    public static volatile SingularAttribute<Student, User> userId;

}