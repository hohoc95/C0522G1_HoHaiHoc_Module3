package servlet;

import model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = {"/student"})
public class StudentServlet extends HttpServlet {
    private static List<Student> studentList = new ArrayList<>();
    static {
        studentList.add(new Student("1","29-09-2022","Quảng Nam","https://www.google.com.vn/url?sa=i&url=https%3A%2F%2Fgamek.vn%2Fspy-x-family-la-bo-anime-noi-tieng-va-duoc-xem-nhieu-nhat-o-nhat-ban-hien-nay-20220527172233476.chn&psig=AOvVaw0Z5c4xLlK6AwMcy5tnOpXc&ust=1664527852638000&source=images&cd=vfe&ved=0CAkQjRxqFwoTCJi42M3PufoCFQAAAAAdAAAAABAD"));
        studentList.add(new Student("2","29-09-2022","Quảng Nam","2@gmail.com"));
        studentList.add(new Student("3","29-09-2022","Quảng Nam","3@gmail.com"));
        studentList.add(new Student("4","29-09-2022","Quảng Nam","4@gmail.com"));

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/student/list.jsp");
        request.setAttribute("studentList",studentList);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
