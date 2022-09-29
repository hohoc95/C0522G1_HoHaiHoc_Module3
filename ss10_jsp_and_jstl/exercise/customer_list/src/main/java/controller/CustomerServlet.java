package controller;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Customer> customerList = new ArrayList<>();

        customerList.add(new Customer("Đặng Thị Thủy Tiên", "20/03/2000", "Quảng Nam", "https://andy.codegym.vn/storage/images/avatars/38cba5c3296a2935a26f2dc896be48e2.jpeg"));
        customerList.add(new Customer("Đặng Thị Thủy Tiên", "20/03/2000", "Quảng Nam", "https://andy.codegym.vn/storage/images/avatars/38cba5c3296a2935a26f2dc896be48e2.jpeg"));
        customerList.add(new Customer("Đặng Thị Thủy Tiên", "20/03/2000", "Quảng Nam", "https://andy.codegym.vn/storage/images/avatars/38cba5c3296a2935a26f2dc896be48e2.jpeg"));
        customerList.add(new Customer("Đặng Thị Thủy Tiên", "20/03/2000", "Quảng Nam", "https://andy.codegym.vn/storage/images/avatars/38cba5c3296a2935a26f2dc896be48e2.jpeg"));

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("customer", customerList);
        requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
