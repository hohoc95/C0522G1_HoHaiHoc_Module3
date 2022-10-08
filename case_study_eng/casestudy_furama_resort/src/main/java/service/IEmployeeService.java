package service;

import model.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();

    boolean create(Employee employee);

    boolean edit(Employee employee);

    boolean delete(int idDelete);
}