package com.comwe.pojo;

import com.comwe.pojo.OutlineScore;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-06-10T19:26:01")
@StaticMetamodel(Score.class)
public class Score_ { 

    public static volatile SingularAttribute<Score, String> assessment;
    public static volatile SetAttribute<Score, OutlineScore> outlineScoreSet;
    public static volatile SingularAttribute<Score, String> name;
    public static volatile SingularAttribute<Score, Integer> id;

}