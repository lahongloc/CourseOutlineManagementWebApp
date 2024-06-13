package com.comwe.pojo;

import com.comwe.pojo.FacultySubject;
import com.comwe.pojo.Lecturer;
import com.comwe.pojo.Major;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-06-12T17:23:01")
@StaticMetamodel(Faculty.class)
public class Faculty_ { 

    public static volatile SetAttribute<Faculty, FacultySubject> facultySubjectSet;
    public static volatile SetAttribute<Faculty, Lecturer> lecturerSet;
    public static volatile SetAttribute<Faculty, Major> majorSet;
    public static volatile SingularAttribute<Faculty, String> name;
    public static volatile SingularAttribute<Faculty, Integer> id;

}