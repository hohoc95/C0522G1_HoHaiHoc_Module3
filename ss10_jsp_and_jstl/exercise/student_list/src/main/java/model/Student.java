package model;

public class Student {
    private String name;
    private String date;
    private String address;
    private String picture;

    public Student() {
    }

    public Student(String name, String birthday, String address, String image) {
        this.name = name;
        this.date = birthday;
        this.address = address;
        this.picture = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return date;
    }

    public void setBirthday(String birthday) {
        this.date = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return picture;
    }

    public void setImage(String image) {
        this.picture = image;
    }
}