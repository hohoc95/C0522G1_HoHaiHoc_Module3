package model;

import jdk.nashorn.internal.runtime.regexp.joni.ast.StringNode;

public class Contract {
    private int contract_id;
    private String start_date;
    private String end_date;
    private double deposit;
    private int employee_id;
    private int customer_id;
    private int facility_id;

    public Contract() {
    }

    public Contract(int contract_id, String start_date, String end_date,
                    double deposit, int employee_id, int customer_id, int facility_id) {
        this.contract_id = contract_id;
        this.start_date = start_date;
        this.end_date = end_date;
        this.deposit = deposit;
        this.employee_id = employee_id;
        this.customer_id = customer_id;
        this.facility_id = facility_id;
    }

    public int getContract_id() {
        return contract_id;
    }

    public void setContract_id(int contract_id) {
        this.contract_id = contract_id;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getFacility_id() {
        return facility_id;
    }

    public void setFacility_id(int facility_id) {
        this.facility_id = facility_id;
    }
}
