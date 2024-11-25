package uz.pdp.uzummarketgit.servlet;

import uz.pdp.uzummarketgit.DB.DB;
import uz.pdp.uzummarketgit.entity.Order;
import uz.pdp.uzummarketgit.entity.OrderItem;
import uz.pdp.uzummarketgit.entity.Product;
import uz.pdp.uzummarketgit.entity.Status;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static uz.pdp.uzummarketgit.DB.DB.basket;

@WebServlet("/basketClear")
public class OrderItemBasket extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Order order = new Order(
                LocalDateTime.now(),
                Status.NEW
        );
        for (Product product : basket) {
            OrderItem orderItem = new OrderItem();

            orderItem.setOrderId(order.getId());
            orderItem.setProductId(product.getId());
            orderItem.setAmount(product.getAmount());
            DB.ORDER_ITEMS.add(orderItem);
        }
        DB.ORDERS.add(order);
        basket.clear();
        resp.sendRedirect("/userMainPage.jsp");
    }
}
