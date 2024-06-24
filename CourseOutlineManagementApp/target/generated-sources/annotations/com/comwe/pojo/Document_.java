package com.comwe.pojo;

import com.comwe.pojo.Outline;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-06-24T13:47:32")
@StaticMetamodel(Document.class)
public class Document_ { 

    public static volatile SingularAttribute<Document, Outline> outline;
    public static volatile SetAttribute<Document, Outline> outlineSet;
    public static volatile SingularAttribute<Document, Date> uploadDate;
    public static volatile SingularAttribute<Document, String> name;
    public static volatile SingularAttribute<Document, Integer> id;
    public static volatile SingularAttribute<Document, String> url;

}