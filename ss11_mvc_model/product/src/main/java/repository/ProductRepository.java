package repository;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository{

    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1,"Coca-Cola", 15000.0, "Nước ngọt có gas","CocaCola"));
        products.put(2, new Product(2,"Bánh gạo Ichi", 25000.0, "Bánh gạo Nhật vị Shouyu mật ong Ichi gói 180g","Ichi"));
        products.put(3, new Product(3,"Pepsi", 15000.0, "Nước ngọt có gas","Pepsi"));
        products.put(4, new Product(4,"Kẹo dynamite", 35000.0, "Kẹo hương bạc hà nhân socola","Dynamite "));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void add(Product product) {

    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);

    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public Product findByName(String name) {
        return null;
    }

}
