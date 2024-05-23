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
                <a class="nav-link active" href="<c:url value="/users-manager/" />"<>Quản lý giảng viên sinh viên</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Quản lý đề cương</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Báo cáo thống kê</a>
            </li>
            <li class="nav-item">
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                        <a href="<c:url value="/logout" />" class="btn btn-danger">Đăng xuất</a>
                    </c:when>
                    <c:when test="${pageContext.request.userPrincipal.name == null}">
                        <a href="<c:url value="/login" />" class="btn btn-info">Đăng nhập</a>
                    </c:when>
                </c:choose>
            </li>
        </ul>
    </div>
</nav>


<div style="overflow: hidden;height: max-content;" class="mt-5 mb-5 bg-white text-dark text-center">
    <div class="d-flex flex-column justify-content-around align-items-center">
        <div class="pt-5" style="padding-left: 2rem;">
            <h1 style="font-weight: 700;">QUẢN LÝ <span style="color: rgb(55, 125, 255); box-shadow: rgb(250 232 193) 0px 25px 20px -20px;">ĐỀ CƯƠNG</span><br></h1>
            <p style="color: rgb(103, 119, 136)">Chào mừng bạn đến với trang quản trị - quản lý đề cương môn học!</p>
        </div>

        <div class="d-flex justify-content-between align-items-center p-5" >
            <div class="card pt-5" style="width:fit-content; border: none;">
                <img style="padding-bottom: 1px" height="25px"  src="https://minimals.cc/assets/icons/home/ic_make_brand.svg" alt="Card image">
                <div class="p-5">
                    <h5 class="card-title">QUẢN LÝ</h5>
                    <p class="card-text">Dễ quản lý, hiệu quả</p>
                </div>
            </div>
            <div class="card pt-5" style="margin: 0 5.5rem 0; width:fit-content; border: none; border-radius: 16px;box-shadow: rgba(0, 0, 0, 0.25) 0px 25px 50px -12px;">
                <img style="padding-bottom: 1px" height="25px"  src="https://minimals.cc/assets/icons/home/ic_design.svg" alt="Card image">
                <div class="p-5">
                    <h5 class="card-title">TỐI ƯU</h5>
                    <p class="card-text">Thao tác thuận tiện</p>
                </div>
            </div>
            <div class="card pt-5" style="width:fit-content; border: none;">
                <img style="padding-bottom: 1px" height="25px"  src="https://minimals.cc/assets/icons/home/ic_development.svg" alt="Card image">
                <div class="p-5">
                    <h5 class="card-title">THEO DÕI</h5>
                    <p class="card-text">Dễ dàng theo dõi</p>
                </div>
            </div>
        </div>

    </div>


</div>
