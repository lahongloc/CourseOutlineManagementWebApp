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
    <form>
        <div class="row">
            <div class="col-md-3 col-12">
                <div class="form-floating mb-3 mt-3">
                    <input type="text" value="${param.nameOfLecturer}" class="form-control" id="nameOfLecturer" placeholder="Tên giảng viên" name="nameOfLecturer">
                    <label for="nameOfLecturer">Tên giảng viên</label>
                </div>
            </div>
            <div class="col-md-4 col-12">
                <div class="form-floating mb-3 mt-3">
                    <input type="text" value="${param.emailOfLecturer}" class="form-control" id="emailOfLecturer" placeholder="Địa chỉ email giảng viên" name="emailOfLecturer">
                    <label for="emailOfLecturer">Địa chỉ email giảng viên</label>
                </div>
            </div>
            <div class="col-md-3 col-12">
                <div class="form-floating mb-3 mt-3">
                    <select class="form-select" id="isActiveLecturer" path="isActiveLecturer" name="isActiveLecturer">
                        <option value=""><u>-- Chọn trạng thái tài khoản --</u></option>
                        <option value="1"><u>Ðã phê duyệt</u></option>
                        <option value="0"><u>Chưa được phê duyệt</u></option>
                    </select>
                    <label for="isActiveLecturer" class="form-label">Trạng thái kích hoạt giảng viên:</label>
                </div>
            </div>
            <div class="col-md-2 col-12">
                <div class="form-floating mb-3 mt-3">
                    <button class="btn btn-success p-3"><b>Lọc giảng viên</b></button>
                </div>  
            </div>
        </div>
    </form>
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
    <form>
        <div class="row">
            <div class="col-md-3 col-12">
                <div class="form-floating mb-3 mt-3">
                    <input type="text" value="${param.nameOfStudent}" class="form-control" id="nameOfStudent" placeholder="Tên sinh viên" name="nameOfStudent">
                    <label for="nameOfStudent">Tên sinh viên</label>
                </div>
            </div>
            <div class="col-md-4 col-12">
                <div class="form-floating mb-3 mt-3">
                    <input type="text" value="${param.emailOfStudent}" class="form-control" id="emailOfStudent" placeholder="Địa chỉ email sinh viên" name="emailOfStudent">
                    <label for="emailOfStudent">Địa chỉ email sinh viên</label>
                </div>
            </div>
            <div class="col-md-3 col-12">
                <div class="form-floating mb-3 mt-3">
                    <select class="form-select" id="isActiveStudent" path="isActiveStudent" name="isActiveStudent">
                        <option value=""><u>-- Chọn trạng thái tài khoản --</u></option>
                        <option value="1"><u>Ðã phê duyệt</u></option>
                        <option value="0"><u>Chưa được phê duyệt</u></option>
                    </select>
                    <label for="isActiveStudent" class="form-label">Trạng thái kích hoạt sinh viên:</label>
                </div>
            </div>
            <div class="col-md-2 col-12">
                <div class="form-floating mb-3 mt-3">
                    <button class="btn btn-success p-3"><b>Lọc sinh viên</b></button>
                </div>
            </div>
        </div>
    </form>
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
