<%-- 
    Document   : outlineDetail
    Created on : Jun 17, 2024, 10:06:45 PM
    Author     : lahon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    .wrap-card {
        background-color: #f5f5f5;
        font-family: 'Roboto', sans-serif;
    }
    .card {
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        margin: 20px 0;
    }
    .card-header {
        background-color: #6200ea;
        color: white;
        border-radius: 12px;
        padding: 1rem 1.5rem;
    }
    .card-body {
        padding: 1.5rem;
    }
    .list-group-item {
        border: none;
        padding-left: 0;
    }
    h1, h2, h4 {
        font-weight: 500;
    }
    .pdf-icon {
        color: #fff;
        font-size: 1.5rem;
        text-decoration: none;
        position: absolute;
        top: 15px;
        right: 15px;
    }
    .pdf-icon:hover {
        color: #9575cd;
    }
</style>
<div class="wrap-card">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <h2 class="card-title mb-0 text-center">CHI TIẾT ĐỀ CƯƠNG</h2>
                    </div>

                    <div class="card-body">
                        <c:if test="${outline.status == 'ACCEPTED'}">
                            <a href="${outline.document}" class="pdf-icon" target="_blank">
                                <i class="fas fa-file-pdf"></i>
                            </a>
                        </c:if>

                        <h4 class="card-subtitle mb-3">Đề cương: ${outline.description}</h4>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <strong>Mã đề cương:</strong> ${outline.outlineId}
                            </li>
                            <li class="list-group-item">
                                <strong>Ngày bắt đầu:</strong> <fmt:formatDate value="${outline.startedDate}" pattern="dd/MM/yyyy"/>
                            </li>
                            <li class="list-group-item">
                                <strong>Ngày kết thúc:</strong> <fmt:formatDate value="${outline.expiredDate}" pattern="dd/MM/yyyy"/>
                            </li>
                            <li class="list-group-item">
                                <strong>Lý thuyết:</strong> ${outline.theory} giờ
                            </li>
                            <li class="list-group-item">
                                <strong>Thực hành:</strong> ${outline.practice} giờ
                            </li>
                            <li class="list-group-item">
                                <strong>Giảng viên:</strong> ${outline.lecturer}
                            </li>
                            <li class="list-group-item">
                                <strong>Môn học:</strong> ${outline.subject}
                            </li>
                            <li class="list-group-item">
                                <strong>Khoa:</strong> ${outline.faculty}
                            </li>
                        </ul>
                    </div>
                    <div class="card-footer text-center">
                        <c:if test="${outline.status != 'ACCEPTED'}">
                            <button onclick="acceptOutline('<c:url value="/api/accept-outline/${outline.outlineId}/" />', '${outline.subject}')" class="btn btn-primary me-2">Phê duyệt</button>
                        </c:if>

                        <a href="#" class="btn btn-danger">Xóa</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const acceptOutline = (url, name) => {
        console.log("URL: " + url);
        console.log("Name: " + name);

        if (confirm("Phê duyệt đề cương cho môn " + name + "?")) {
            fetch(url, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
                    .then(response => {
                        if (response.ok) {
                            console.log("success");
                            location.reload();
                        } else {
                            console.error("Fetch failed with status: " + response.status);
                            console.log("error");
                        }
                    })
                    .catch(error => {
                        console.error("Fetch encountered an error: ", error);
                        console.log("error");
                    });
        }
    };
</script>
