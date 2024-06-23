<%-- 
    Document   : SubjectDeatils
    Created on : Jun 1, 2024, 12:00:55 AM
    Author     : lahon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
    <h1 class="text-center text-info mt-1">GÁN ĐỀ CƯƠNG CHO GIẢNG VIÊN</h1>


    <form action="<c:url value="/outline-management/${param.subjectId}/" />" method="POST">
        <div class="mb-3">
            <label class="form-label">Chọn giảng viên:</label>
            <select name="lecturerId" class="form-select">
                <option value="">Chọn giảng viên</option>
                <c:forEach items="${lecturers}" var="lecturer">
                    <option value="${lecturer.id}">${lecturer.name}</option>
                </c:forEach>
                    
            </select>

            <div class="mb-3">
                <label for="academicYear1" class="form-label">Khóa thứ nhất</label>
                <select id="academicYear1" name="academicYearId1" class="form-select">
                    <option value="">Chọn niên khóa</option>
                    <c:forEach var="year" items="${academicYears}">
                        <option value="${year.id}" data-start="${year.start}" data-end="${year.finish}">
                            ${year.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label for="academicYear2" class="form-label">Khóa thứ hai (**Tùy chọn, phải liên tiếp đến Năm học 1)</label>
                <select id="academicYear2" name="academicYearId2" class="form-select">
                    <option value="">Chọn niên khóa</option>
                    <c:forEach var="year" items="${academicYears}">
                        <option value="${year.id}" data-start="${year.start}" data-end="${year.finish}">
                            ${year.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <input name="subjectId" value="${param.subjectId}" style="display: none" />
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Gán</button>
            </div>
    </form>
</div>
<script>
    document.getElementById('academicYear1').addEventListener('change', function () {
        const academicYear1 = document.getElementById('academicYear1');
        const academicYear2Select = document.getElementById('academicYear2');

        if (academicYear1.value === "") {
            academicYear2Select.value = '';
        }



        const year1Option = academicYear1.options[academicYear1.selectedIndex];
        const startYear1 = new Date(year1Option.getAttribute('data-start')).getFullYear();

        for (let i = 0; i < academicYear2Select.options.length; i++) {
            const option = academicYear2Select.options[i];
            const startYear2 = new Date(option.getAttribute('data-start')).getFullYear();

            if (startYear2 !== startYear1 + 1 && option.value !== "") {
                option.disabled = true;
            } else {
                option.disabled = false;
            }
        }
    });


    document.getElementById('academicYear2').addEventListener('change', function () {
        const academicYear1 = document.getElementById('academicYear1');
        const academicYear2Select = document.getElementById('academicYear2');

        if (academicYear2Select.value === "") {
            academicYear1.value = '';
        }


        const year2Option = academicYear2Select.options[academicYear2.selectedIndex];
        const startYear2 = new Date(year2Option.getAttribute('data-start')).getFullYear();

        for (let i = 0; i < academicYear1.options.length; i++) {
            const option = academicYear1.options[i];
            const startYear1 = new Date(option.getAttribute('data-start')).getFullYear();

            if (startYear1 !== startYear2 - 1 && option.value !== "") {
                option.disabled = true;
            } else {
                option.disabled = false;
            }
        }



    });

</script>