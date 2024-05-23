<%-- 
    Document   : user
    Created on : May 20, 2024, 4:20:59 PM
    Author     : lahon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<table class="table">
    <tr>
        <th>Tên</th>
        <th>Username</th>
    </tr>
    <c:forEach items="${users}" var="u">
        <tr>
            <td>${u.name}</td>
            <td>${u.username}</td>
            <td>
                <c:url var="url" value="/api/user-approvement/${u.id}" />
                <button onclick="userApprove('${url}')" class="btn btn-info">Duyệt</button>
            </td>
        </tr>
    </c:forEach>
</table>
<script>
    console.log("hello")
    const userApprove = (url) => {
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
    }
</script>