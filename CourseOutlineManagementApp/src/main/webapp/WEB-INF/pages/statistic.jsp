<%-- 
    Document   : statistic
    Created on : Jun 23, 2024, 11:36:52 PM
    Author     : lahon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<h1 class="text-center text-info mt-1">THỐNG KÊ BÁO CÁO</h1>

<div class="row">
    <div class="col-md-5 col-12">
        <table class="table">
            <tr>
                <th>Id</th>
                <th>Tên đề cương</th>
                <th>Lượt bán</th>
                <th>Doanh thu</th>
            </tr>
            <c:forEach items="${outlineStats}" var="o">
                <tr>
                    <td>${o[1]}</td>
                    <td>${o[2]}</td>
                    <td>${o[3]}</td>
                    <td><fmt:formatNumber value="${o[4]}" type="currency" currencySymbol="₫"/></td>
                </tr>
                <c:set var="totalAmount" value="${totalAmount + o[4]}" />
            </c:forEach>
            <tr>
                <td colspan="3" style="text-align: right;"><strong>Tổng:</strong></td>
                <td><strong><fmt:formatNumber value="${totalAmount}" type="currency" currencySymbol="₫"/></strong></td>
            </tr>
        </table>
    </div>
    <div class="col-md-7 col-12" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border-radius: 7px;">
        <canvas id="myChart1"></canvas>
    </div>
</div>

<div class="row">
    <div class="col-md-5 col-12">
        <div>
            <div class="alert alert-info">
                <h4>Năm: ${param.year}</h4>
                <h4>Khoảng thời gian: ${param.period}</h4>
            </div>
            <form>
                <div class="form-floating mb-3 mt-3">
                    <input type="number" class="form-control" id="year" placeholder="Năm" name="year">
                    <label for="year">Năm</label>
                </div>

                <div class="form-floating  mb-3 mt-3">
                    <select class="form-select" id="period" name="period">
                        <option value="MONTH">Tháng</option>
                        <option value="QUARTER">Qúy</option>
                    </select>
                    <label for="sel1" class="form-label">Khoảng thời gian:</label>
                </div>
                <div class="form-floating  mb-3 mt-3">
                    <button class="btn btn-info">Lọc</button>
                </div>
            </form>
        </div>
    </div>

    <hr/>

    <h3 class="text-center mt-3 mb-4"><b>THỐNG KÊ BÁO CÁO <span style="color: blue">QUẢN LÝ TRẠNG THÁI ĐỀ CƯƠNG</b></span></h3>
    <div class="row">
        <div class="col-md-5 col-12">
            <table class="table table-striped">
                <tr>
                    <th>Khoa quản lý</th>
                    <th>Đề cương đã duyệt</th>
                    <th>Đề cương đang soạn</th>
                </tr>
                <c:forEach items="${outlineReport}" var="o">
                    <tr>
                        <td>${o.facultyName}</td>
                        <td>${o.acceptedCount}</td>
                        <td>${o.holdingCount}</td>
                    </tr>
                    <c:set var="totalAcceptedCount" value="${totalAcceptedCount + o.acceptedCount}" />
                    <c:set var="totaloldingCount" value="${totaloldingCount + o.holdingCount}" />
                </c:forEach>
                <tr>
                    <td style="color: red;"><strong><b>Tổng số lượng:</b></strong></td>
                    <td><strong><fmt:formatNumber value="${totalAcceptedCount}"/> [ACCEPTED]</strong></td>
                    <td><strong><fmt:formatNumber value="${totaloldingCount}"/> [HOLDING]</strong></td>
                </tr>
            </table>

            <form>
                <div class="form-floating mb-3 mt-3">
                    <input type="number" class="form-control" id="yearActive" placeholder="Năm" name="yearActive">
                    <label for="yearActive">Năm</label>
                </div>

                <div class="form-floating  mb-3 mt-3">
                    <select class="form-select" id="peroidActive" name="peroidActive">
                        <option value="MONTH">Tháng</option>
                        <option value="QUARTER">Qúy</option>
                    </select>
                    <label for="sel1" class="form-label">Khoảng thời gian:</label>
                </div>
                <div class="form-floating  mb-3 mt-3">
                    <button class="btn btn-info">Lọc</button>
                </div>
            </form>

        </div>

        <div class="col-md-7 col-12">
            <canvas id="myChart2"></canvas>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        let labels = [];
        let data = [];
        <c:forEach items="${outlineStats}" var="s">
        labels.push('${s[1]}');
        data.push(${s[3]});
        </c:forEach>


        function drawChart(ctx, labels, data) {
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                            label: '# Doanh thu',
                            data: data,
                            borderWidth: 1,
                            backgroundColor: ['red', 'green', 'blue', 'gold', 'brown']
                        }],
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

//        window.onload = function () {
//            let ctx1 = document.getElementById("myChart1");
//            //        let ctx2 = document.getElementById("myChart2");
//
//            drawChart(ctx1, labels, data);
//            //        drawChart(ctx2, label2, data2);
//        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        let labels2 = [];
        let data2 = [];
        <c:forEach items="${outlineReport}" var="o">
        labels2.push('${o.facultyName}');
        data2.push(${o.acceptedCount});
        data2.push(${o.holdingCount});
        </c:forEach>

        window.onload = function () {
            let ctx1 = document.getElementById("myChart1");
            drawChart(ctx1, labels, data);
            let ctx2 = document.getElementById("myChart2");
            drawChartRevenue2(ctx2, labels2, data2);
            
        }

        function drawChartRevenue2(ctx, labels, data, title = "Số lượng đề cương đã và đang xét duyệt") {
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
