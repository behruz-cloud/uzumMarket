<%@ page import="uz.pdp.uzummarketgit.entity.Product" %>
<%@ page import="uz.pdp.uzummarketgit.DB.DB" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.uzummarketgit.entity.Category" %>
<%@ page import="static uz.pdp.uzummarketgit.DB.DB.basket" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Main Page</title>
    <style>
        body {
            background-color: #f7f7f7;
        }

        .head {
            margin-top: 20px;
            background: whitesmoke;
            height: 80px;
            position: relative;
        }

        .action-buttons {
            position: absolute;
            top: 10px;
            right: 10px;
            display: flex;
            gap: 10px;
        }

        .box {
            margin-top: 20px;
            padding: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            background: #ffffff;
        }

        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .product-details {
            padding: 15px;
        }

        .product-actions {
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
        }

        .button-add, .button-remove {
            font-size: 14px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        .button-add {
            background-color: #28a745;
            color: white;
        }

        .button-remove {
            background-color: #ff4d4d;
            color: white;
        }

        .savatcha_button {
            background-color: green;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .savatcha_button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<%
    Integer categoryId;
    String categoryIdStr = request.getParameter("categoryId");
    String productIdStr = request.getParameter("productId");
    String removeProductIdStr = request.getParameter("removeProductId");
    int size = basket.size();

    if (productIdStr != null) {
        Integer productId = Integer.valueOf(productIdStr);
        Product selectProduct = DB.PRODUCTS.stream().filter(product -> product.getId().equals(productId)).findFirst().get();
        if (!basket.contains(selectProduct)) {
            basket.add(selectProduct);
        }
    }

    if (removeProductIdStr != null) {
        Integer removeProductId = Integer.valueOf(removeProductIdStr);
        basket.removeIf(product -> product.getId().equals(removeProductId));
    }
    if (categoryIdStr != null) {
        categoryId = Integer.valueOf(categoryIdStr);
    } else {
        categoryId = 0;
    }

    List<Product> products = DB.PRODUCTS.stream().filter(item -> item.getCategoryId().equals(categoryId)).toList();
%>
<div class="row">
    <div class="col">
        <div class="head">
            <h1 class="text-center">MARKET</h1>
            <div class="action-buttons">
                <form action="/addProduct.jsp">
                    <button type="submit" class="btn btn-primary">Mahsulot Qo'shish</button>
                </form>
                <form action="/loginPage.jsp">
                    <button type="submit" class="btn btn-primary">LOGIN</button>
                </form>
                <form action="/basket.jsp">
                    <button type="submit" class="savatcha_button">Savatcha (<%= size %>)</button>
                </form>
                <form action="/orderItem.jsp">
                    <button type="submit" class="savatcha_button">BUYURTMALARIM</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-3">
        <div class="box">
            <form action="/main.jsp" method="post">
                <%
                    for (Category category : DB.CATEGORIES) {
                %>
                <button class="btn btn-secondary w-100 mb-2" type="submit" name="categoryId"
                        value="<%= category.getId() %>">
                    <%= category.getName() %>
                </button>
                <%
                    }
                %>
            </form>
            <form action="/addCategory.jsp" method="post">
                <button class="btn btn-success w-100 mt-3" type="submit">
                    Kategoriya Qo'shish
                </button>
            </form>
        </div>
    </div>
    <div class="col-9">
        <div class="box">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <% for (Product product : products) { %>
                <div class="col">
                    <div class="product-card">
                        <img src="/file/<%= product.getId() %>" alt="<%= product.getName() %>">
                        <div class="product-details">
                            <h5 class="product-name"><%= product.getName() %></h5>
                            <p class="product-price">Narxi: <b><%= product.getPrice() %> so'm</b></p>
                            <div class="product-actions">
                                <% if (basket.contains(product)) { %>
                                <form action="/main.jsp" method="post">
                                    <input type="hidden" name="categoryId" value="<%= categoryId %>">
                                    <button type="submit" name="removeProductId" value="<%= product.getId() %>"
                                            class="button-remove">Savatchadan o'chirish</button>
                                </form>
                                <% } else { %>
                                <form action="/main.jsp" method="post">
                                    <input type="hidden" name="categoryId" value="<%= categoryId %>">
                                    <button type="submit" name="productId" value="<%= product.getId() %>"
                                            class="button-add">Savatchaga qo'shish</button>
                                </form>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
