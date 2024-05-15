package com.comwe.pojo;

import com.comwe.pojo.OutlineAcademicYear;
import com.comwe.pojo.Semester;
import com.comwe.pojo.Student;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-05-15T18:53:06")
@StaticMetamodel(AcademicYear.class)
public class AcademicYear_ { 

    public static volatile SetAttribute<AcademicYear, Student> studentSet;
    public static volatile SingularAttribute<AcademicYear, String> name;
    public static volatile SingularAttribute<AcademicYear, Date> start;
    public static volatile SetAttribute<AcademicYear, OutlineAcademicYear> outlineAcademicYearSet;
    public static volatile SetAttribute<AcademicYear, Semester> semesterSet;
    public static volatile SingularAttribute<AcademicYear, Date> finish;
    public static volatile SingularAttribute<AcademicYear, Integer> id;

}