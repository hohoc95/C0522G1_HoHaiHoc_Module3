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
        studentList.add(new Student(1,"Do","","29-09-2022",8,"1","C0522G1","1@gmail.com"));
        studentList.add(new Student(2,"You","Nữ","29-09-2022",10,"2","C0522G1","2@gmail.com"));
        studentList.add(new Student(3,"Love","","29-09-2022",7,"3","C0522G1","3@gmail.com"));
        studentList.add(new Student(4,"Me","Nam","29-09-2022",9,"4","C0522G1","4@gmail.com"));

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
