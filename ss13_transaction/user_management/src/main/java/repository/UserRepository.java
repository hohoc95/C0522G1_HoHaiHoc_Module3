package repository;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository{
    private static final String SELECT = "select * from users;";
    private static final String SELECT_SP = "call show_list()";

    private static final String SAVE = "insert into users(name)\n" +
            "values (?)";
    private static final String DELETE = "delete from users where id = ?";
    private static final String FIND = "select * from users where id = ?";

    @Override
    public List<User> list() {
//        List<User> list = new ArrayList<>();
//        Connection connection = BaseRepository.getConnectDB();
//        try {
//            User user;
//            PreparedStatement preparedStatement = connection.prepareStatement(SELECT);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                user = new User();
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                String email = resultSet.getString("email");
//                String country = resultSet.getString("country");
//                user.setId(id);
//                user.setName(name);
//                user.setEmail(email);
//                user.setCountry(country);
//                list.add(user);
//            }
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        return list;
        List<User> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            User user;
            CallableStatement callableStatement = connection.prepareCall(SELECT);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                user = new User();
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user.setId(id);
                user.setName(name);
                user.setEmail(email);
                user.setCountry(country);
                list.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public void save(User user) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SAVE);
            preparedStatement.setString(1, user.getName());
            preparedStatement.executeUpdate();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
    }

    @Override
    public User findById(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id1 = resultSet.getInt("id");
                String name = resultSet.getString("name");
                user = new User(id1,name);
            }
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public void edit(int id, User user)
    {
        list().add(id, user);
    }
}
