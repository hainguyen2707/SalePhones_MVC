<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Manager</title>
        <style type="text/css">
            body {
                font-family: Arial, sans-serif;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            caption {
                font-size: 1.2em;
                font-weight: bold;
                margin-bottom: 10px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #f5f5f5;
            }
            .back-link {
                display: block;
                margin-top: 20px; /* Thêm margin để tạo khoảng cách giữa dòng "Back to home" và bảng */
                text-decoration: none;
                color: #007bff; /* Màu chữ của liên kết */
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <table border="1">
            <caption>List of Products</caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
            <c:forEach var="product" items="${productList}">
                <tr>
                    <td>${product.getId()}</td>
                    <td>${product.getName()}</td>
                    <td>${product.getPrice()}</td>
                    <td>${product.getQuantity()}</td>
                </tr>
            </c:forEach>
        </table>
        <a href="home" class="back-link">Back to home</a>
    </body>
</html>
