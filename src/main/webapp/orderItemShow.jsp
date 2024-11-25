<%@ page import="uz.pdp.uzummarketgit.DB.DB" %>
<%@ page import="uz.pdp.uzummarketgit.entity.Order" %>
<%@ page import="uz.pdp.uzummarketgit.entity.OrderItem" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.uzummarketgit.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Buyurtma tafsilotlari</title>
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

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        li:last-child {
            border-bottom: none;
        }

        .order-info {
            margin: 20px 0;
            font-size: 16px;
            color: #555;
        }

        .order-info p {
            margin: 5px 0;
        }

        .total {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
            color: #444;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .back-button {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Buyurtma tafsilotlari</h1>
    <ul>
        <%
//            int userId=0;
//            Cookie[] cookies = request.getCookies();
//            for (Cookie cookie : cookies) {
//                if (cookie.getName().equals("userId")) {
//                    userId= Integer.valueOf(cookie.getValue());
//                }
//            }
            Integer orderId = Integer.valueOf(request.getParameter("orderId"));
            Order order = DB.ORDERS.stream().
                    filter(item -> item.getId().equals(orderId)).findFirst().
                    get();
            List<OrderItem> orderItems = DB.ORDER_ITEMS.stream().filter(item -> item.getOrderId().equals(orderId)).toList();
            int totalPrice = 0;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");

            for (OrderItem orderItem : orderItems) {
                Product product = DB.PRODUCTS.stream().filter(item -> item.getId().equals(orderItem.getProductId())).findFirst().get();
                totalPrice += product.getPrice() * orderItem.getAmount();
        %>
        <li>
            <span><%= product.getName() %> (<%= orderItem.getAmount() %> ta)</span>
            <span><%= product.getPrice() * orderItem.getAmount() %> so'm</span>
        </li>
        <%
            }
        %>
    </ul>
    <div class="order-info">
        <p>Vaqt: <%= order.getLocalDateTime().format(formatter) %></p>
        <p>Holat: <%= order.getStatus() %></p>
    </div>
    <div class="total">
        Jami: <%= totalPrice %> so'm
    </div>
    <div class="back-button">
        <form action="/userMainPage.jsp" method="post">
            <button type="submit">Bosh menyu</button>
        </form>
    </div>
</div>
</body>
</html>
