package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {

    List<Customer> findAll();

    boolean create(Customer customer);

    boolean edit(Customer customer);

    boolean delete(int idDelete);
}
