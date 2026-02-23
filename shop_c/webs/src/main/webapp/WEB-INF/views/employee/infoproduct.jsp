<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        .form-container,
        .result {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #f9f9f9;
        }

        h1,
        h2 {
            color: #007BFF;
        }

        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }

        input,
        textarea,
        select,
        button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        button {
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <div style="margin-top: 20px;">
        <button onclick="window.location.href='/shop_c/home.htm'"
            style="padding: 10px 20px; font-size: 16px; cursor: pointer;">
            Trang chủ
        </button>
    </div>
    <div class="form-container">
        <h1>Thêm sản phẩm</h1>
        <form action="emaddproduct.htm" method="POST">
            <label for="name">Tên sản phẩm:</label>
            <input type="text" id="name" name="name" placeholder="Nhập tên sản phẩm" required>

            <label for="image">Hình ảnh:</label>
            <input type="file" id="image" name="image" accept="image/*" required>

            <label for="description">Mô tả sản phẩm:</label>
            <textarea id="description" name="description" placeholder="Nhập mô tả sản phẩm" required></textarea>

            <label for="typesID">Loại sản phẩm:</label>
            <select id="typesID" name="typesID" required>
                <option value="" disabled selected>Chọn loại sản phẩm</option>
                <c:if test="${not empty types}">
                    <c:forEach var="type" items="${types}">
                        <option value="${type.id}">${type.name}</option>
                    </c:forEach>
                </c:if>
            </select>

            <label for="originsID">Xuất xứ:</label>
            <select id="originsID" name="originsID" required>
                <option value="" disabled selected>Chọn xuất xứ</option>
                <c:if test="${not empty origins}">
                    <c:forEach var="origin" items="${origins}">
                        <option value="${origin.id}">${origin.name}</option>
                    </c:forEach>
                </c:if>
            </select>

            <label for="brandsID">Thương hiệu:</label>
            <select id="brandsID" name="brandsID" required>
                <option value="" disabled selected>Chọn thương hiệu</option>
                <c:if test="${not empty brands}">
                    <c:forEach var="brand" items="${brands}">
                        <option value="${brand.id}">${brand.name}</option>
                    </c:forEach>
                </c:if>
            </select>

            <label for="materialsID">Chất liệu:</label>
            <select id="materialsID" name="materialsID" required>
                <option value="" disabled selected>Chọn chất liệu</option>
                <c:if test="${not empty materials}">
                    <c:forEach var="material" items="${materials}">
                        <option value="${material.id}">${material.name}</option>
                    </c:forEach>
                </c:if>
            </select>

            <button type="submit">Thêm sản phẩm</button>
        </form>
    </div>




</body>

</html>