<%-- 
    Document   : userDetails
    Created on : May 24, 2024, 3:13:26 PM
    Author     : lahon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
    .gradient-custom {
        /* fallback for old browsers */
        background: #f6d365;

        /* Chrome 10-25, Safari 5.1-6 */
        background: -webkit-linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));

        /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1))
    }

    .bg-custom-40 {
        /* Màu nền tùy chỉnh cho phần 40% */
        background-color: #ffffff;
    }

    .card-custom-40 {
        /* Định dạng thẻ card trong phần 40% */
        width: 100%;
        border-radius: 0.5rem;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
    }

</style>

<div class="row d-flex justify-content-center align-items-center container-fluid">
    <!-- Phần 60% -->
    <div class="col-lg-8 mb-4 mb-lg-0">
        <div class="card mb-3" style="border-radius: .5rem;">
            <div class="row g-0">
                <div class="col-md-4 gradient-custom text-center text-white"
                     style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                    <!-- Hiển thị avatar và thông tin người dùng -->
                    <c:choose>
                        <c:when test="${not empty user.avatar}">
                            <img src="${user.avatar}"
                                 alt="Avatar" class="img-fluid my-5 rounded-circle" style="bject-fit: cover; width: 150px; height: 150px; border: 6px solid red; border-radius: 50%;" /> 
                        </c:when>
                        <c:otherwise>
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                                 alt="Avatar" class="img-fluid my-5 rounded-circle" style="width: 100px; height: 100px;" />
                        </c:otherwise>
                    </c:choose>
                    <h4>${user.name}</h4>
                    <p><i>@${user.username}</i></p>
                    <h6>Trạng thái: 
                        <c:choose>
                            <c:when test="${user.isActive == true}">
                                Active
                            </c:when>
                            <c:otherwise>
                                InActive
                            </c:otherwise>
                        </c:choose>
                    </h6>
                </div>
                <div class="col-md-8">
                    <div class="card-body p-4">
                        <!-- Hiển thị thông tin tài khoản -->
                        <h6>Thông tin tài khoản</h6>
                        <hr class="mt-0 mb-4">
                        <div class="row pt-1">
                            <div class="col-6 mb-3">
                                <h6>Email</h6>
                                <p class="text-muted">${user.email}</p>
                            </div>
                            <div class="col-6 mb-3">
                                <h6>Hotline</h6>
                                <p class="text-muted">${user.hotline}</p>
                            </div>
                        </div>
                        <div class="row pt-1">
                            <div class="col-6 mb-3">
                                <h6>Chức vụ</h6>
                                <p class="text-muted">
                                    <c:choose>
                                        <c:when test="${user.role eq 'ROLE_ADMIN'}">
                                            Quản trị viên
                                        </c:when>
                                        <c:when test="${user.role eq 'ROLE_LECTURER'}">
                                            Giảng Viên
                                        </c:when>
                                        <c:otherwise>
                                            Sinh Viên
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </div>
                            <div class="col-6 mb-3">
                                <h6>Giới tính</h6>
                                <p class="text-muted">
                                    <c:choose>
                                        <c:when test="${user.sex eq '1'}">
                                            Nữ
                                        </c:when>
                                        <c:otherwise>
                                            Nam
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </div>
                        </div>
                        <hr class="mt-0 mb-4">
                        <div class="row pt-1">
                            <div class="col-6 mb-3">
                                <h6>Ngày sinh</h6>
                                <p class="text-muted">${user.birthday}</p>
                            </div>
                            <div class="col-6 mb-3">
                                <h6>Ngày tham gia</h6>
                                <p class="text-muted">${user.createdDatetime}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Phần 40% -->
    <div class="col-lg-4 mb-4 mb-lg-0">
        <div class="card mb-3" style="border-radius: .5rem; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);">
            <div class="card-body p-4 bg-light">
                <h5 class="text-center mb-4">Gửi Email</h5>
                <!-- Form gửi email -->
                <c:url value="/users-manager/${user.id}/" var="c" />
                <form action="${c}" method="post">
                    <div class="mb-3">
                        <label for="inputEmail" class="form-label">Địa chỉ Email:</label>
                        <input type="email" name="to" class="form-control" id="inputEmail" placeholder="Nhập địa chỉ email" />
                    </div>
                    <div class="mb-3">
                        <label for="inputSubject" class="form-label">Chủ đề:</label>
                        <input type="text" name="subject" class="form-control" id="inputSubject" placeholder="Nhập chủ đề" />
                    </div>
                    <div class="mb-3">
                        <label for="inputContent" class="form-label">Nội dung:</label>
                        <textarea name="content" class="form-control" id="inputContent" rows="4" placeholder="Nhập nội dung"></textarea>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Gửi</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>