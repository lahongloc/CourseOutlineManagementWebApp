<%-- 
    Document   : index
    Created on : May 14, 2024, 9:01:07 PM
    Author     : lahon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<c:choose>
    <c:when test="${param.pageOutline != null}">
        <c:set var="currentPageOutline" value="${param.pageOutline}"/>
    </c:when>
    <c:otherwise>
        <c:set var="currentPageOutline" value="1"/>
    </c:otherwise>
</c:choose>

<c:if test="${pageContext.request.userPrincipal.name != null}">
    <form>
        <div class="row">
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <div class="form-floating mb-3 mt-3">
                        <input type="text" value="${param.theoCreditHour}" class="form-control" id="theoCreditHour" placeholder="Tính chỉ lý thuyết" name="theoCreditHour">
                        <label for="theoCreditHour">Tín chỉ lý thuyết</label>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <input type="text" value="${param.pracCreditHour}" class="form-control" id="pracCreditHour" placeholder="Tính chỉ thực hành" name="pracCreditHour">
                        <label for="pracCreditHour">Tín chỉ thực hành</label>
                    </div>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <select class="form-select" id="lecturerId" path="lecturerId" name="lecturerId">
                        <option value=""><u>-- Chọn giảng viên biên soạn --</u></option>
                            <c:forEach items="${lecturers}" var="l">
                            <option value="${l.id}">${l.nameLecturer}</option>
                        </c:forEach>
                    </select>
                    <label for="lecturerId" class="form-label">Giảng viên biên soạn:</label>
                </div>
            </div>
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <input type="text" value="${param.kw}" class="form-control" id="kw" placeholder="Tên đề cương" name="kw">
                    <label for="kw">Tên đề cương</label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <select class="form-select" id="facultyId" path="facultyId" name="facultyId">
                        <option value=""><u>-- Chọn khoa --</u></option>
                            <c:forEach items="${faculties}" var="f">
                            <option value="${f.id}">${f.name}</option>
                        </c:forEach>
                    </select>
                    <label for="facultyId" class="form-label">Khoa quản lý:</label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <button class="btn btn-success p-3"><b>Lọc đề cương</b></button>
                </div>
            </div>
        </div>
    </form>
    <ul class="pagination" id="outlines-section">
        <c:url value="/" var="um" />
        <c:forEach begin="1" end="${pageSizeOutline}" var="i">
            <li class="page-item ${i == currentPageOutline ? 'active' : ''}">
                <a class="page-link" href="${um}?pageOutline=${i}">${i}</a>
            </li>
        </c:forEach>
    </ul>
    <table class="table mt-3 mb-3">
        <thead>
            <tr>
                <th>Mã đề cương</th>
                <th>Tên đề cương</th>
                <th>Giảng viên biên soạn</th>
                <th>Tín chỉ LT</th>
                <th>Tín chỉ TH</th>
                <th>Giá download</th>
                <th>Khoa</th>
                <th></th>
            </tr>
        </thead>
        <tbody id="outlineTableBody">
            <c:forEach items="${outlines}" var="o">
                <tr>
                    <td>${o.outlineId}</td>
                    <td>${o.subject}</td>
                    <td>${o.lecturer}</td>
                    <td>${o.theory}</td>
                    <td>${o.practice}</td>
                    <td>${String.format("%,.0f", o.price)} VNĐ</td>
                    <td>${o.faculty}</td>
                    <td>
                        <c:url value="/api/outlines/${o.outlineId}" var="urlOutline" />
                        <a href="<c:url value="/outlines/${o.outlineId}/" />" class="btn btn-primary">Xem chi tiết</a>
                        <button onclick="deleteOutline('${urlOutline}',${o.outlineId})" class="btn btn-danger">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<script src="<c:url value="/js/script.js" />"></script>
