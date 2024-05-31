<%-- 
    Document   : SubjectDeatils
    Created on : Jun 1, 2024, 12:00:55 AM
    Author     : lahon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
    <h2 class="mt-4">Assign Subject to Lecturer</h2>
    <form action="<c:url value="/outline-management/${param.subjectId}/" />" method="POST">
        <div class="mb-3">
            <label class="form-label">Select Lecturer:</label>
            <select name="lecturerId" class="form-select">
                <option value="">Select a Lecturer</option>
                <c:forEach items="${lecturers}" var="lecturer">
                    <option value="${lecturer.id}">${lecturer.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Select Academic Year:</label>
            <select name="academicYearId" class="form-select">
                <option value="">Select an Academic Year</option>
                <c:forEach items="${academicYears}" var="academicYear">
                    <option value="${academicYear.id}">${academicYear.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary">Assign</button>
        </div>
    </form>
</div>