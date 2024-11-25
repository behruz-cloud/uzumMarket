package uz.pdp.uzummarketgit.servlet;

import uz.pdp.uzummarketgit.DB.DB;
import uz.pdp.uzummarketgit.entity.Role;
import uz.pdp.uzummarketgit.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    public static User currentUser = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        Optional<User> userOptional = DB.USERS.stream().filter(user -> user.getPassword().equals(password) && user.getPhone().equals(phone)).findFirst();
        if (userOptional.isPresent()) {
            if (userOptional.get().getRole().equals(Role.ADMIN)) {
                resp.addCookie(new Cookie("adminjon", "admin123"));
                resp.sendRedirect("/main.jsp");
            } else { 
                resp.addCookie(new Cookie("userId",String.valueOf(userOptional.get().getId())));
                resp.sendRedirect("/userMainPage.jsp");
            }
        } else {
            resp.sendRedirect("/loginPage.jsp");
        }
    }
}
