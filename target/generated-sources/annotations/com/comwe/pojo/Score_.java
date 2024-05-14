package com.comwe.pojo;

import com.comwe.pojo.StudentSubject;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-05-14T22:15:38")
@StaticMetamodel(Score.class)
public class Score_ { 

    public static volatile SingularAttribute<Score, Float> score;
    public static volatile SingularAttribute<Score, String> name;
    public static volatile SetAttribute<Score, StudentSubject> studentSubjectSet;
    public static volatile SingularAttribute<Score, Integer> id;

}