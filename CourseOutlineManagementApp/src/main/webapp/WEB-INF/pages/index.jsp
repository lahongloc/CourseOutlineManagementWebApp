<%-- 
    Document   : index
    Created on : May 14, 2024, 9:01:07 PM
    Author     : lahon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<h1>Hello ${username}</h1>-->
<table class="table mt-3 mb-3">
    <tr>
        <th>Tên đề cương</th>
        <th>Khoa</th>
    </tr>
    <c:forEach items="${outlines}" var="o">
        <tr>
            <td>${o.subject}</td>
            <!--<td>${o.theory+o.practice}</td>-->
            <td>${o.faculty}</td>
            <td>
                <a href="<c:url value="/outlines/${o.outlineId}/" />" class="btn btn-primary">Xem chi tiết</a>
            </td>
        </tr>
    </c:forEach>

</table>
