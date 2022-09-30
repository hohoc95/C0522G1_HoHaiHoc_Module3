package service;

import model.Product;

import java.util.List;

public class ProductService implements IProductService{
    private IProductService iProductService = new ProductService();
    @Override
    public List<Product> findAll() {
        return iProductService.findAll();
    }

    @Override
    public void save(Product product) {
        iProductService.save(product);
    }

    @Override
    public Product findById(int id) {
        return null;
    }

    @Override
    public void update(int id, Product product) {

    }

    @Override
    public void remove(int id) {

    }
}
