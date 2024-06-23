<%-- 
    Document   : Subject
    Created on : Jun 23, 2024, 1:05:42 AM
    Author     : lahon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<div class="container mt-5">
    <h2>Thêm Môn Học</h2>
    <form id="addSubjectForm">
           <div class="mb-3">
            <label for="subjectName" class="form-label">Tên Môn Học</label>
            <input type="text" class="form-control" id="subjectName" name="subjectName" required>
        </div>
        <div class="mb-3">
            <label for="faculties" class="form-label">Khoa</label>
            <select multiple class="form-select" id="faculties" name="faculties" required>
                <c:forEach var="faculty" items="${faculties}">
                    <option value="${faculty.id}">${faculty.name}</option>
                </c:forEach>
            </select>
            <div class="form-text">Giữ Ctrl (Windows) hoặc Command (Mac) để chọn nhiều khoa.</div>
        </div>
        <button type="submit" class="btn btn-primary">Thêm Môn Học</button>
    </form>
</div>



