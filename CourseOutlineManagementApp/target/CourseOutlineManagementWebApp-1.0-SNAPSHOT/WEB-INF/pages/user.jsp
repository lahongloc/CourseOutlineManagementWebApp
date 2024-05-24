<%-- 
    Document   : user
    Created on : May 20, 2024, 4:20:59 PM
    Author     : lahon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container mt-3">
    <h2>TÀI KHOẢN GIẢNG VIÊN</h2>
    <p>Xem thông tin và yêu cầu bổ sung thông tin, hoặc phê duyệt tài khoản giảng viên ở đây!</p>
    <table class="table">
        <thead class="table-dark">
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
            <c:forEach items="${users}" var="l">
                <c:if test="${l.role == 'ROLE_LECTURER'}">
                    <tr>
                        <td>${l.id}</td>
                        <td>${l.name}</td>
                        <td>${l.birthday}</td>
                        <td>${l.sex}</td>
                        <td>${l.email}</td>
                        <td>${l.isActive}</td>
                        <td>
                            <a href="<c:url value="/users-manager/${l.id}/" />" class="btn btn-info">Xem thông tin</a>
                            <c:url var="acceptUrl" value="/api/user-approvement/${l.id}/" />
                            <button onclick="userApprove(${l.isActive}, '${acceptUrl}', '${l.name}')" class="btn btn-success">Phê duyệt</button>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</div>

<div class="container mt-5">
    <h2>TÀI KHOẢN SINH VIÊN</h2>
    <p>Xem thông tin tài khoản sinh viên, cấp tài khoản cho sinh viên ở đây!</p>
    <table class="table">
        <thead class="table-success">
            <tr>
                <th>Id</th>
                <th>Họ và tên</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="l">
                <c:if test="${l.role == 'ROLE_STUDENT'}">
                    <tr>
                        <td>${l.id}</td>
                        <td>${l.name}</td>
                        <td>${l.email}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</div>
<script>
    const userApprove = (isActive, url, name) => {
        if (isActive === true) {
            alert("Tài khoản này đã được phê duyệt!")
        } else
        if (confirm(`Phê duyêt cho tài khoản ${name}?`) === true) {
            fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(() => {
                location.reload();
            });

        }

    }
</script>