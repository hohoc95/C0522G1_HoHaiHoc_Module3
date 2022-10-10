<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 10/5/2022
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Home</title>
    <style>
        .header {
            /*background-image: url("https://wallpaperaccess.com/full/556423.gif");*/
            background-image: url("https://wallpaperaccess.com/full/38119.jpg");
        }
        a {
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .footer {
            bottom: 0;
            /*background-image: url("https://wallpaperaccess.com/full/644233.jpg");*/
            background-image: url("https://wallpaperaccess.com/full/38119.jpg");
        }
        .left {
            overflow: hidden;
            height: 520px;
        }
        .body {
            /*background-image: url("https://wallpaperaccess.com/full/1206292.jpg");*/
            background-image: url("https://wallpaperaccess.com/full/358800.jpg");
        }
    </style>
</head>
<body>
<div class="container-fluid bg-gray-500 d-flex header" style="height: 100px">
    <img class="h-100 p-4" src="https://www.furama.com/images/LOGOFurama_4C_Normal.png" alt="">
    <img class="ms-5 ps-5" src="https://furamavietnam.com/wp-content/uploads/2019/02/Ariyana-Tourism-Complex-02-2.png"
         alt="">


</div>

<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid mx-5">
        <a class="navbar-brand font-weight-bold" href="/">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown ms-3">
                    <a class="nav-link dropdown-toggle text-dark" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Employee</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/employee">Employee list</a></li>
                        <li><a class="dropdown-item" href="/employee?action=create">Add new Employee</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown ms-3">
                    <a class="nav-link dropdown-toggle text-dark" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Customer</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/customer">Customer list</a></li>
                        <li><a class="dropdown-item" href="/customer?action=create">Add new Customer</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown ms-3">
                    <a class="nav-link dropdown-toggle text-dark" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Service</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/facility">Facility list</a></li>
                        <li><a class="dropdown-item" href="/facility?action=create">Add new Facility</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown ms-3">
                    <a class="nav-link dropdown-toggle text-dark" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Contract</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/contract">Contract list</a></li>
                        <li><a class="dropdown-item" href="/contract?action=create">Add new Contract</a></li>
                    </ul>
                </li>
            </ul>

            <form class="d-flex my-2" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">
                    <i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid body" style="height: 520px">
    <div class="row mx-3">
        <div class="col-4 left">
            <p style="text-align: center;font-size: xx-large">
                KHU NGHỈ DƯỠNG ĐẲNG CẤP THẾ GIỚI FURAMA ĐÀ NẴNG, TỰ HÀO LÀ KHU NGHỈ DƯỠNG ẨM THỰC TẠI VIỆT NAM
            </p>

            <p class="para">
                Hướng ra bãi biển Đà Nẵng trải dài cát trắng, Furama Resort Đà Nẵng là cửa ngõ đến với 3 di sản văn hoá thế giới: Hội An (20 phút), Mỹ Sơn (90 phút) và Huế (2 tiếng. 196 phòng hạng sang cùng với 70 căn biệt thự từ hai đến bốn phòng ngủ có hồ bơi riêng đều được trang trí trang nhã, theo phong cách thiết kế truyền thống của Việt Nam và kiến trúc thuộc địa của Pháp, biến Furama thành khu nghỉ dưỡng danh giá nhất tại Việt Nam – vinh dự được đón tiếp nhiều người nổi tiếng, giới hoàng gia, chính khách, ngôi sao điện ảnh và các nhà lãnh đạo kinh doanh quốc tế.
            </p>
        </div>

        <div class="col-8">
            <img class="img-fluid mt-4 ms-2 border border-4 border-light" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/62371531.jpg?k=fb1828d64f739b526944dcb487699e4625ad8799986e0e4ef5c2c930dcf39b6c&o=&hp=1" alt="">
        </div>
    </div>
</div>

<div class="container-fluid text-center footer" style="height: 50px">
    <p class="text-light pt-2">&copy;FURAMA - officially operated in 1997.</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</body>
</html>