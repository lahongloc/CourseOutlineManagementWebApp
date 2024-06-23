package com.comwe.pojo;

import com.comwe.pojo.Outline;
import com.comwe.pojo.Student;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-06-23T14:55:13")
@StaticMetamodel(StudentOutlineDownload.class)
public class StudentOutlineDownload_ { 

    public static volatile SingularAttribute<StudentOutlineDownload, Student> studentId;
    public static volatile SingularAttribute<StudentOutlineDownload, Outline> outlineId;
    public static volatile SingularAttribute<StudentOutlineDownload, Date> downloadedDate;
    public static volatile SingularAttribute<StudentOutlineDownload, Integer> id;

}