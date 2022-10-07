package controller;

import model.Customer;
import model.CustomerType;
import service.impl.CustomerService;
import service.ICustomerService;
import service.impl.CustomerTypeService;
import service.ICustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;


@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerTypeService customerTypeService = new CustomerTypeService();
    private ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "ABC":
                break;
//            case "create":
//                showCreateFrom(request, response);
//                break;
//            case "edit":
//                showEditForm(request, response);
//                break;
//            case "delete":
//                deleteCustomer(request,response);
//                break;
//            case "find":
//                searchCustomer(request,response);
//                break;
            default:
                findAll(request, response);
        }
    }

//    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
//        String name = request.getParameter("nameSearch");
//        String address = request.getParameter("addressSearch");
//        String phone = request.getParameter("phoneSearch");
//        List<Customer> customerList = customerService.find(name, address,phone);
//        List<CustomerType> customerTypeList = customerTypeService.findAll();
//        request.setAttribute("customerList",customerList);
//        request.setAttribute("customerTypeList",customerTypeList);
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
//        try {
//            requestDispatcher.forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<CustomerType> customerTypeList = customerTypeService.findAll();
        Customer customer = customerService.findById(id);
        RequestDispatcher dispatcher;

        if (customer == null) {
            dispatcher = request.getRequestDispatcher("view/error_404.jsp");
        } else {
            request.setAttribute("customer", customer);
            dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
            request.setAttribute("customerTypeList", customerTypeList);
        }

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateFrom(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    public void findAll(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");

        List<Customer> customerList = customerService.findAll();
        List<CustomerType> customerTypeList = customerTypeService.findAll();

        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
//            case "create":
//                Create(request, response);
//                break;
            case "edit":
                updateCustomer(request, response);
                break;
            default:
                findAll(request, response);
        }

    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int idDelete = Integer.parseInt(request.getParameter("customerId"));
        customerService.delete(idDelete);
        findAll(request, response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String customerName = request.getParameter("customerName");
        String customerDateOfBirth = request.getParameter("customerDateOfBirth");
        int customerGender = Integer.parseInt(request.getParameter("customerGender"));
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhoneNumber = request.getParameter("customerPhoneNumber");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");

        Customer customer = new Customer(customerId, customerTypeId, customerName, customerDateOfBirth, customerGender, customerIdCard, customerPhoneNumber, customerEmail, customerAddress);

        boolean check = customerService.edit(customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        String mess = "Update Customer successfully.";

        if (!check) {
            mess = "Update Customer failed.";
        }
        request.setAttribute("mess", mess);
        request.setAttribute("check", check);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


//    private void Create(HttpServletRequest request, HttpServletResponse response) {
//        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
//        String customerName = request.getParameter("customerName");
//        String customerDateOfBirth = request.getParameter("customerDateOfBirth");
//        int customerGender = Integer.parseInt(request.getParameter("customerGender"));
//        String customerIdCard = request.getParameter("customerIdCard");
//        String customerPhoneNumber = request.getParameter("customerPhoneNumber");
//        String customerEmail = request.getParameter("customerEmail");
//        String customerAddress = request.getParameter("customerAddress");
//
//        Customer customer = new Customer(customerTypeId, customerName, customerDateOfBirth, customerGender,
//                customerIdCard, customerPhoneNumber, customerEmail, customerAddress);
//        boolean check = customerService.create(customer);
//        String mess = "Add new Customer successfully.";
//
//        if (!check) {
//            mess = "Add new Customer failed.";
//        }
//
//        request.setAttribute("mess", mess);
//        request.setAttribute("check", check);
//
//        showCreateFrom(request, response);
//    }
}