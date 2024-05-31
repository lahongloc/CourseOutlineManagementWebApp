<%-- 
    Document   : outlineManage
    Created on : May 31, 2024, 3:48:38 PM
    Author     : lahon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="container mt-4">
    <h1>Gán đề cương môn học cho giảng viên!</h1>

    <!-- Faculty Filter -->
    <form>
        <div class="mb-3">
            <label for="faculty-select" class="form-label">Khoa</label>
            <select name="facultyId" id="faculty-select" class="form-select">
                <option value="">All</option>
                <c:forEach items="${faculties}" var="faculty">
                    <option value="${faculty.id}">${faculty.name}</option>
                </c:forEach>
            </select>
            <button class="btn btn-primary mt-2" type="submit">Lọc</button>
        </div>
    </form>

    <!-- Subject Table -->
    <table class="table">
        <thead>
            <tr>
                <th>Mã môn học</th>
                <th>Tên môn học</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${subjects}" var="subject">
                <tr class="faculty-row" data-faculty-id="${subject.facultyId}">
                    <td>${subject.id}</td>
                    <td>${subject.name}</td>
                    <td>
                        <form>
                            <input name="subjectId" value="${subject.id}" style="display: none" />
                            <button type="submit" class="btn btn-primary" >
                                Gán giảng viên
                            </button> 
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
