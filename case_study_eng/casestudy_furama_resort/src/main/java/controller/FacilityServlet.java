package controller;

import model.Facility;
import model.FacilityType;
import service.IFacilityService;
import service.IFacilityTypeService;
import service.impl.FacilityService;
import service.impl.FacilityTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

//@WebServlet(name = "FacilityServlet", value = "/facility")
@WebServlet(name = "FacilityServlet", urlPatterns = {"", "/facility"})
public class FacilityServlet extends HttpServlet {
    private IFacilityTypeService iFacilityTypeService = new FacilityTypeService();
    private IFacilityService iFacilityService = new FacilityService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action"); //null
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "abc":
                break;
//            case "createForm":
//                showCreateForm(request,response);
//                break;
            default:
                findAll(request, response);
        }
    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/list.jsp");

        List<Facility> facilityList = iFacilityService.findAll();
        List<FacilityType> facilityTypeList = iFacilityTypeService.findAll();

        request.setAttribute("facilityList", facilityList);
        request.setAttribute("facilityTypeList", facilityTypeList);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

//        try {
//            request.getRequestDispatcher("view/facility/list.jsp").forward(request,response);
//        } catch (ServletException | IOException e) {
//            e.printStackTrace();
//        }
    }


    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/facility/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String acion = request.getParameter("action");
        if (acion == null) {
            acion = "";
        }
        switch (acion) {
            case "create":
                create(request, response);
                break;
            default:
                findAll(request, response);
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String facilityName = request.getParameter("facilityName");
        int area = Integer.parseInt(request.getParameter("facilityArea"));
        double facilityCost = Double.parseDouble(request.getParameter("facilityCost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String standardRoom = request.getParameter("standardRoom");
        String description = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int number_of_floors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facility_free = request.getParameter("facilityFree");
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));

        Facility facility = new Facility();
        facility.setFacilityName(facilityName);
        facility.setArea(area);
        facility.setFacilityCost(facilityCost);
        facility.setMaxPeople(maxPeople);
        facility.setStandardRoom(standardRoom);
        facility.setDescriptionOtherConvenience(description);
        facility.setPoolArea(poolArea);
        facility.setNumberOfFloors(number_of_floors);
        facility.setFacilityFree(facility_free);
        facility.setRentTypeId(rentTypeId);
        facility.setFacilityTypeId(facilityTypeId);
        iFacilityService.create(facility);
    }


}
