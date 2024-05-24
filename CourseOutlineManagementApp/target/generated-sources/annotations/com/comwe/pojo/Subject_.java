package com.comwe.pojo;

import com.comwe.pojo.Outline;
import com.comwe.pojo.OutlineSubject;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-05-24T22:51:46")
@StaticMetamodel(Subject.class)
public class Subject_ { 

    public static volatile SetAttribute<Subject, Outline> outlineSet;
    public static volatile SetAttribute<Subject, OutlineSubject> outlineSubjectSet;
    public static volatile SingularAttribute<Subject, String> name;
    public static volatile SingularAttribute<Subject, Integer> id;

}