<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="uz.pdp.uzummarketgit.DB.DB" %>
<%@ page import="uz.pdp.uzummarketgit.entity.Order" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/23/2024
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Buyurtmalar ro'yxati</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .order-list {
            list-style: none;
            padding: 0;
            margin: 20px 0;
        }

        .order-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: #f9f9f9;
        }

        .order-item:hover {
            background: #eef2ff;
        }

        .order-info {
            font-size: 16px;
            color: #555;
        }

        .status {
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: bold;
            font-size: 14px;
        }

        .status.COMPLETED {
            background-color: #28a745;
            color: white;
        }

        .status.PENDING {
            background-color: #ffc107;
            color: black;
        }

        .status.CANCELED {
            background-color: #dc3545;
            color: white;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .order-number {
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Buyurtmalar ro'yxati</h1>
    <ul class="order-list">
        <%
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
            int orderNumber = 1;
            for (Order order : DB.ORDERS) {
                String formattedDate = order.getLocalDateTime().format(formatter);
        %>
        <li class="order-item">
            <div class="order-info">
                <span class="order-number"><%= orderNumber++ %>. </span>
                <span>Vaqt: <%= formattedDate %></span> |
                <span class="status <%= order.getStatus() %>"><%= order.getStatus() %></span>
            </div>
            <form action="/orderItemShow.jsp" method="post">
                <input type="hidden" name="orderId" value="<%= order.getId() %>">
                <button type="submit">Mahsulotlar</button>
            </form>
        </li>
        <%
            }
        %>
    </ul>
</div>
</body>
</html>
