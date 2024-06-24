package com.comwe.pojo;

import com.comwe.pojo.Outline;
import com.comwe.pojo.User;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-06-24T13:47:32")
@StaticMetamodel(Receipt.class)
public class Receipt_ { 

    public static volatile SingularAttribute<Receipt, Boolean> isPaid;
    public static volatile SingularAttribute<Receipt, Outline> outlineId;
    public static volatile SingularAttribute<Receipt, Date> createdDate;
    public static volatile SingularAttribute<Receipt, BigDecimal> totalPrice;
    public static volatile SingularAttribute<Receipt, Integer> id;
    public static volatile SingularAttribute<Receipt, User> userId;
    public static volatile SingularAttribute<Receipt, String> transactionId;

}