package model;

public class Customer {
    private int id;
    private int customer_type_id;
    private String name;
    private String date_of_birth;
    private boolean gender;
    private String id_card;
    private String phone_number;
    private String email;
    private String address;

    public Customer() {
    }

    public Customer(int id, int customer_type_id, String name, String date_of_birth,
                    boolean gender, String id_card, String phone_number, String email, String address) {
        this.id = id;
        this.customer_type_id = customer_type_id;
        this.name = name;
        this.date_of_birth = date_of_birth;
        this.gender = gender;
        this.id_card = id_card;
        this.phone_number = phone_number;
        this.email = email;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomer_type_id() {
        return customer_type_id;
    }

    public void setCustomer_type_id(int customer_type_id) {
        this.customer_type_id = customer_type_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(String date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getId_card() {
        return id_card;
    }

    public void setId_card(String id_card) {
        this.id_card = id_card;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
