import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "caculator_servlet", value = "/caculator_servlet")
public class caculator_servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String product_description = request.getParameter("product_description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount_percent = Double.parseDouble(request.getParameter("discount_percent"));

        double discount_amount = price * discount_percent * 0.01;
        double discount_price =  price - discount_amount;

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("product_description", product_description);
        request.setAttribute("price", price);
        request.setAttribute("discount_amount", discount_amount);
        request.setAttribute("discount_price", discount_price);
        requestDispatcher.forward(request,response);
    }
}