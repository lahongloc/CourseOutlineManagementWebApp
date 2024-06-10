<%-- 
    Document   : user
    Created on : May 20, 2024, 4:20:59 PM
    Author     : lahon
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:choose>
    <c:when test="${param.pageLecturer != null}">
        <c:set var="currentPageLecturer" value="${param.pageLecturer}"/>
    </c:when>
</c:choose>
<c:choose>
    <c:when test="${param.pageStudent != null}">
        <c:set var="currentPageStudent" value="${param.pageStudent}"/>
    </c:when>
</c:choose>

<div class="container mt-3">
    <h2>TÀI KHOẢN GIẢNG VIÊN</h2>
    <p id="lecturers-section">Xem thông tin và yêu cầu bổ sung thông tin, hoặc phê duyệt tài khoản giảng viên ở đây!</p>
    <ul class="pagination">
        <c:url value="/users-manager/" var="um" />
        <c:forEach begin="1" end="${pageSizeLecturer}" var="i">
            <li class="page-item ${i == currentPageLecturer ? 'active' : ''}">
                <a class="page-link" href="${um}?pageLecturer=${i}&pageStudent=${currentPageStudent}">${i}</a>
            </li>
        </c:forEach>
    </ul>
    <table class="table">
        <thead class="table-dark">
            <tr>
                <th>Id</th>
                <th>Họ và tên</th>
                <th>Ngày sinh</th>
                <th>Giới tính</th>
                <th>Email</th>
                <th>Chức vụ</th>
                <th>Trạng thái phê duyệt</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${lecturers}" var="l">
                <tr>
                    <td>${l.id}</td>
                    <td>${l.name}</td>
                    <td>${l.birthday}</td>
                    <td>
                        <c:choose>
                            <c:when test="${l.sex == false}">
                                Nữ
                            </c:when>
                            <c:otherwise>
                                Nam
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${l.email}</td>

                    <td>
                        <c:if test="${l.role == 'ROLE_LECTURER'}">
                            Giảng viên
                        </c:if>
                    </td>

                    <td>
                        <c:choose>
                            <c:when test="${l.isActive}">
                                Ðã phê duyệt
                            </c:when>
                            <c:otherwise>
                                <b>Chưa được phê duyệt</b>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="<c:url value="/users-manager/${l.id}/" />" class="btn btn-info">Xem thông tin</a>
                        <c:url var="acceptUrl" value="/api/user-approvement/${l.id}/" />
                        <c:if test="${l.isActive == false}">
                            <button onclick="userApprove(${l.isActive}, '${acceptUrl}', '${l.name}')" class="btn btn-success">Phê duyệt</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<div class="container mt-5">
    <h2>TÀI KHOẢN SINH VIÊN</h2>
    <p id="students-section">Xem thông tin tài khoản sinh viên, cấp tài khoản cho sinh viên ở đây!</p>
    <ul class="pagination">
        <c:forEach begin="1" end="${pageSizeStudent}" var="i">
            <li class="page-item ${i == currentPageStudent ? 'active' : ''}">
                <a class="page-link" href="${um}?pageLecturer=${currentPageLecturer}&pageStudent=${i}">${i}</a>
            </li>
        </c:forEach>
    </ul>
    <table class="table">
        <thead class="table-success">
            <tr>
                <th>Id</th>
                <th>Họ và tên</th>
                <th>Ngày sinh</th>
                <th>Giới tính</th>
                <th>Email</th>
                <th>Trạng thái phê duyệt</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${students}" var="s">
                <tr>
                    <td>${s.id}</td>
                    <td>${s.name}</td>
                    <td>${s.birthday}</td>
                    <td>
                        <c:choose>
                            <c:when test="${s.sex  == true}">
                                Nam
                            </c:when>
                            <c:otherwise>
                                Nữ
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${s.email}</td>
                    <td>
                        <c:choose>
                            <c:when test="${s.isActive}">
                                Ðã phê duyệt
                            </c:when>
                            <c:otherwise>
                                <b>Chưa phê duyệt</b>
                            </c:otherwise>
                        </c:choose>
                        - <c:choose>
                            <c:when test="${s.avatar != null}">Có Avatar</c:when>
                            <c:otherwise>Bổ sung Avatar</c:otherwise>
                        </c:choose></td>
                    <td>
                        <a href="<c:url value="/users-manager/${s.id}/" />" class="btn btn-info">Xem thông tin</a>
                        <c:url var="acceptUrlStudent" value="/api/user-approvement/${s.id}/" />
                        <c:if test="${s.avatar == null && s.isActive == false}">
                            <button onclick="userApprove(${s.isActive}, '${acceptUrlStudent}', '${s.name}')" class="btn btn-success">Phê duyệt</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<script src="<c:url value="/js/script.js" />"></script>
