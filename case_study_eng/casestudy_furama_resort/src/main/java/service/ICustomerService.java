package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {

    List<Customer> findAll();

    boolean create(Customer customer);

    boolean edit(Customer customer);

    boolean delete(int customerId);

    Customer findById(int id);
}
