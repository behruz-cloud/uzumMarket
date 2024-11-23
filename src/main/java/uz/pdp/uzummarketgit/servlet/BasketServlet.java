package uz.pdp.uzummarketgit.servlet;

import uz.pdp.uzummarketgit.entity.Order;
import uz.pdp.uzummarketgit.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.uzummarketgit.DB.DB.basket;


@WebServlet("/basketSerlvet")
public class BasketServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("productId"));
        String action = req.getParameter("action");

        for (Product product : basket) {
            if (product.getId() == productId) {
                if ("add".equals(action)) {
                    product.setAmount(product.getAmount() + 1);
                } else if ("remove".equals(action) && product.getAmount() > 0) {
                    product.setAmount(product.getAmount() - 1);
                }
                break;
            }
        }

        resp.sendRedirect("/basket.jsp");
    }
}

