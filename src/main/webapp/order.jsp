<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="static uz.pdp.uzummarketgit.DB.DB.basket" %>
<%@ page import="uz.pdp.uzummarketgit.entity.Product" %>
<%@ page import="uz.pdp.uzummarketgit.DB.DB" %>
<%@ page import="uz.pdp.uzummarketgit.entity.User" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.uzummarketgit.servlet.LoginServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Basket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-image: url(https://avatars.mds.yandex.net/i?id=af3337ae94a5038b5b1c2b43f788001fc0d57c44-12144750-images-thumbs&n=13);
            background-size: cover;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 50%;
            text-align: center;
        }

        h1, h2 {
            color: #333;
        }

        .product-list {
            margin-top: 20px;
            text-align: left;
        }

        .product-item {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .total-price {
            font-size: 1.5rem;
            margin-top: 20px;
            font-weight: bold;
        }

        .btn {
            padding: 10px 15px;
            font-size: 1.2rem;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">

    <h1>Buyurtmangiz</h1>
    <div class="product-list">
        <%
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userId")) {
                    Optional<User> first = DB.USERS.stream().filter(item -> item.getId().equals(Integer.parseInt(cookie.getValue()))).findFirst();
                    if (first.isPresent()) {

                    }else {
//                        response.sendRedirect("/loginPage.jsp");
//                        return;
                    }
                }
            }
            int totalPrice = basket.stream()
                    .mapToInt(product -> product.getAmount() * product.getPrice())
                    .sum();
            for (Product product : basket) {
        %>
        <div class="product-item">
            <h4>
                <%= product.getName() %> - <%= product.getPrice() %> so'mdan <%= product.getAmount() %> ta =
                <%= product.getAmount() * product.getPrice() %> so'm
            </h4>
        </div>
        <% } %>
    </div>

    <div class="total-price">
        Umumiy summa: <%= totalPrice %> so'm
        <br>
        Buyurtma berilgan vaqt: <%= LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm")) %>
        <br>
        Holati: NEW
    </div>

    <form action="/basketClear">
        <button type="submit" class="btn">BOSH MENYU</button>
    </form>

</div>
</body>
</html>
