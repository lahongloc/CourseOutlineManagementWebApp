package com.comwe.pojo;

import com.comwe.pojo.Outline;
import com.comwe.pojo.Score;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-06-12T17:23:01")
@StaticMetamodel(OutlineScore.class)
public class OutlineScore_ { 

    public static volatile SingularAttribute<OutlineScore, Score> scoreId;
    public static volatile SingularAttribute<OutlineScore, Outline> outlineId;
    public static volatile SingularAttribute<OutlineScore, Integer> id;
    public static volatile SingularAttribute<OutlineScore, Float> percent;

}