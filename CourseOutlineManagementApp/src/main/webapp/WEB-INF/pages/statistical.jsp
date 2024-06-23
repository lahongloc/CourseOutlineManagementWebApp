<%-- 
    Document   : statistical
    Created on : Jun 23, 2024, 9:42:39 PM
    Author     : kitj3
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h3 class="text-center mt-1"><b>THỐNG KÊ BÁO CÁO HỆ THỐNG <span style="color: blue">QUẢN LÝ ĐỀ CƯƠNG MÔN HỌC</b></span></h3>

<div class="row">
    <div class="col-md-5 col-12">
        <table class="table table-striped">
            <tr>
                <th>Mã khoa</th>
                <th>Đề cương đã duyệt</th>
                <th>Đề cương đang soạn</th>
            </tr>
            <c:forEach items="${outlineReport}" var="o">
                <tr>
                    <td>${o.facultyName}</td>
                    <td>${o.acceptedCount}</td>
                    <td>${o.holdingCount}</td>

                </c:forEach>
        </table>
    </div>

    <div class="col-md-7 col-12">
        <canvas id="myChart"></canvas>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="js/script.js" />"></script>
<script>
    let labels = [];
    let data = [];
    <c:forEach items="${outlineReport}" var="o">
    labels.push('${o.facultyName}');
    data.push(${o.acceptedCount});
    data.push(${o.holdingCount});
    </c:forEach>

    window.onload = function () {
        let ctx1 = document.getElementById("myChart");
        drawChartRevenue(ctx1, labels, data);
    }

    function drawChartRevenue(ctx, labels, data, title = "Số lượng đề cương đã và đang xét duyệt") {
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                        label: title,
                        data: data,
                        borderWidth: 1,
                        backgroundColor: ['green', 'blue']
                    }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }
</script>
