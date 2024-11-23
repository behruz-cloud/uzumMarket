<%@ page import="static uz.pdp.uzummarketgit.DB.DB.basket" %>
<%@ page import="uz.pdp.uzummarketgit.entity.Product" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/23/2024
  Time: 9:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>BASKET</title>
    <style>
        body {
            background-image: url(https://avatars.mds.yandex.net/i?id=af3337ae94a5038b5b1c2b43f788001fc0d57c44-12144750-images-thumbs&n=13);
            background-size: cover;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 60%;
        }

        h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .product-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .product-info {
            display: flex;
            flex-direction: column;
        }

        .product-info span {
            font-size: 1rem;
            color: #555;
        }

        .quantity-buttons {
            display: flex;
            gap: 10px;
        }


        .btn {
            padding: 10px 15px;
            background-color: green;
            border-radius: 5px;
        }

        .order-btn {
            width: 100%;
            padding: 15px;
            background-color: green;
            color: white;
            border: none;
            font-size: 1.5rem;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

    </style>

</head>
<body>
<div class="container">
    <h2>Mahsulotlaringiz : </h2>
    <% for (Product product : basket) { %>
    <form action="/basketSerlvet" method="post">
        <div class="product-item">
            <div class="product-info">
                <h3><%= product.getName() %> - <%= product.getPrice() * product.getAmount() %> so'm</h3>
                <span>Miqdori: <%= product.getAmount() %></span>
            </div>
            <div class="quantity-buttons">
                <button type="submit" name="action" value="add" class="btn">+</button>
                <button type="submit" name="action" value="remove"  class="btn">-</button>
            </div>
            <input type="hidden" name="productId" value="<%= product.getId() %>">
        </div>
    </form>
    <% } %>

    <form action="/order.jsp" method="post">
        <button type="submit" name="order" value="order" class="order-btn">BUYURTMA BERISH</button>
    </form>
</div>
</body>
</html>
