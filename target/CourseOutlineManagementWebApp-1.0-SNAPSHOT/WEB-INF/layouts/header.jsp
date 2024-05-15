<%-- 
    Document   : header
    Created on : May 14, 2024, 10:01:35 PM
    Author     : lahon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h1>FOOTER NÈ!</h1>
<div class="container">
    <c:choose>
        <c:when test="${pageContext.request.userPrincipal.name != null}">
            <a href="<c:url value="/logout" />" class="btn btn-danger">Đăng xuất</a>
        </c:when>
        <c:when test="${pageContext.request.userPrincipal.name == null}">
            <a href="<c:url value="/login" />" class="btn btn-info">Đăng nhập</a>
        </c:when>
    </c:choose>
</div>
