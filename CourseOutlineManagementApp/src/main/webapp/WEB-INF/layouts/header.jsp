<%-- 
    Document   : header
    Created on : May 14, 2024, 10:01:35 PM
    Author     : lahon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<nav style="padding: 1rem; box-shadow: rgba(50, 50, 105, 0.15) 0px 2px 5px 0px, rgba(0, 0, 0, 0.05) 0px 1px 1px 0px;" class="navbar navbar-expand-sm bg-white navbar-light fixed-top">
    <div class="container-fluid">
        <ul class="navbar-nav" style="margin-left: auto; margin-right: auto">
            <li class="nav-item">
                <a class="nav-link"  href="<c:url value="/users-manager/" />"<>Quản lý giảng viên sinh viên</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/outline-management/" />">Quản lý đề cương</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Báo cáo thống kê</a>
            </li>
            <li class="nav-item">
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                        <a href="<c:url value="/logout" />" class="btn btn-danger">Đăng xuấtt</a>
                    </c:when>
                    <c:when test="${pageContext.request.userPrincipal.name == null}">
                        <a href="<c:url value="/login" />" class="btn btn-info">Đăng nhập</a>
                    </c:when>
                </c:choose>
            </li>
        </ul>
    </div>
</nav>




