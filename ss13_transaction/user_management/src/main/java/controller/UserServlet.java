package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    private IUserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acion =request.getParameter("action"); //null
        if(acion == null){
            acion = "";
        }
        switch (acion){
            case "create":
                create(request,response);
                break;
            case "edit":
                edit(request,response);
                break;
            default:
                showList(request,response);
        }
    }



    private void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        User user = new User();
        user.setName(name);
        userService.save(user);
        try{
            response.sendRedirect("/user?msg=Thêm%20Mới%20Thành%20Công");
        }
        catch (IOException e){
            e.printStackTrace();
        }
    }
    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action"); //null
        if(action == null){
            action = "";
        }
        switch (action){
            case "showformcreate":
                showFormCreate(request,response);
                break;
            case "delete":
                showDeleteForm(request,response);
                break;
            case "deleteUser":
                submitDelete(request,response);
                break;
            default:
                showList(request,response);
        }
    }

    private void submitDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.delete(id);
        try{
            response.sendRedirect("/user?msg=Xoa Thanh Cong");
        }
        catch (IOException e){
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/delete.jsp");
        User user = userService.findById(id);
        request.setAttribute("user", user);
        try {
            requestDispatcher.forward(request,response);
        }
        catch (ServletException e){
            e.printStackTrace();
        }
        catch (IOException e){
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create.jsp");
        try{
            requestDispatcher.forward(request,response);
        }
        catch (ServletException e){
            e.printStackTrace();
        }
        catch (IOException e){
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        String msg = request.getParameter("msg");
        request.setAttribute("msg", msg);
        List<User> list = userService.list();
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/home.jsp");
        try {
            requestDispatcher.forward(request,response);
        }
        catch (ServletException e){
            e.printStackTrace();
        }
        catch (IOException e){
            e.printStackTrace();
        }
    }

}
