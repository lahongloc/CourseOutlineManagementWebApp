<%-- 
    Document   : generatePDF.jsp
    Created on : Jun 13, 2024, 6:45:35 PM
    Author     : kitj3
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1>tesst pdf to s3 amazone</h1>

<form method="post" action="<c:url value="/api/upload-pdf/" />">

    <div class="form-floating mb-3 mt-3">
        <input type="text" class="form-control" id="outlineId" placeholder="outline ID ..." name="outlineId">
        <label for="outlineId">Mã đề cương:</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <input type="text" class="form-control" id="subjectName" placeholder="Subject Name ..." name="subjectName">
        <label for="subjectName">Tên môn học:</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <input type="text" class="form-control" id="facultyName" placeholder="Faculty Name ..." name="facultyName">
        <label for="facultyName">Tên khoa:</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <input type="text" class="form-control" id="instructorName" placeholder="Instructor Name ..." name="instructorName">
        <label for="instructorName">Tên giảng viên soạn:</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <input type="date" class="form-control" id="startDate" placeholder="Start Date ..." name="startDate">
        <label for="startDate">Ngày bắt đầu soạn:</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <input type="date" class="form-control" id="endDate" placeholder="End Date ..." name="endDate">
        <label for="endDate">Ngày hoàn thành:</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <input type="text" class="form-control" id="practicalCredits" placeholder="Practical Credits ..." name="practicalCredits">
        <label for="practicalCredits">Tín chỉ thực hành:</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <input type="text" class="form-control" id="theoreticalCredits" placeholder="Theoretical Credits ..." name="theoreticalCredits">
        <label for="theoreticalCredits">Tín chỉ lý thuyết:</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <input type="text" class="form-control" id="description" placeholder="Description ..." name="description">
        <label for="description">Mô tả:</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <input type="text" class="form-control" id="status" placeholder="Status ..." name="status">
        <label for="status">Trạng thái:</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <input type="text" class="form-control" id="courseYear" placeholder="Course Year ..." name="courseYear">
        <label for="courseYear">Khóa (năm):</label>
    </div>

    <button class="btn-primary btn" type="submit">Generate and Upload PDF</button>
</form>