package controller;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Customer> customerList = new ArrayList<>();

        customerList.add(new Customer("Đặng Thị Thủy Tiên", "20/03/2000", "Quảng Nam", "https://scontent.fsgn2-1.fna.fbcdn.net/v/t1.6435-9/155512900_562775151346347_5654354541835105790_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=EsmixynJoj4AX_nX6-h&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-UB36mMB_FfeB9kKciP5jivAyUdf-pbs-e73cjm4q-6g&oe=635D0A72"));
        customerList.add(new Customer("Đặng Thị Thủy Tiên", "20/03/2000", "Quảng Nam", "https://scontent.fsgn2-1.fna.fbcdn.net/v/t1.6435-9/155512900_562775151346347_5654354541835105790_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=EsmixynJoj4AX_nX6-h&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-UB36mMB_FfeB9kKciP5jivAyUdf-pbs-e73cjm4q-6g&oe=635D0A72"));
        customerList.add(new Customer("Đặng Thị Thủy Tiên", "20/03/2000", "Quảng Nam", "https://andy.codegym.vn/storage/images/avatars/38cba5c3296a2935a26f2dc896be48e2.jpeg"));
        customerList.add(new Customer("Đặng Thị Thủy Tiên", "20/03/2000", "Quảng Nam", "https://andy.codegym.vn/storage/images/avatars/38cba5c3296a2935a26f2dc896be48e2.jpeg"));

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("customerList", customerList);
        requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
