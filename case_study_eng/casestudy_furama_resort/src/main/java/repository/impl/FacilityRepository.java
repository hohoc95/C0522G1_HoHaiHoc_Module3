package repository.impl;

import model.Facility;
import repository.BaseRepository;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {

    private static final String SELECT = "select * from facility;";
    private static final String CREATE = "insert into facility(facility_name, facility_area, facility_cost, max_people, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free, rent_type_id, facility_type_id)\n" +
            "values (?,?,?,?,?,?,?,?,?,?,?)";
    private static final String DELETE = "delete from employee where facility_id = ?";
    private static final String FIND = "select * from employee where facility_id = ?";

    @Override
    public List<Facility> findAll() {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(SELECT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int facilityId = resultSet.getInt("facility_id");
                String facilityName = resultSet.getString("facility_name");
                int area = resultSet.getInt("facility_area");
                double facilityCost = resultSet.getDouble("facility_cost");
                int maxPeople = resultSet.getInt("max_people");
                int rentTypeId = resultSet.getInt("rent_type_id");
                int facilityTypeId = resultSet.getInt("facility_type_id");
                String standardRoom = resultSet.getString("standard_room");
                String description = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int number_of_floors = resultSet.getInt("number_of_floors");
                String facility_free = resultSet.getString("facility_free");

                Facility facility = new Facility(facilityId, facilityName, area, facilityCost, maxPeople,
                        rentTypeId, facilityTypeId, standardRoom, description, poolArea, number_of_floors, facility_free);
                facilityList.add(facility);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public boolean create(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE);
            preparedStatement.setString(1, facility.getFacilityName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getFacilityCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7, facility.getPoolArea());
            preparedStatement.setInt(8, facility.getNumberOfFloors());
            preparedStatement.setString(9, facility.getFacilityFree());
            preparedStatement.setInt(10, facility.getRentTypeId());
            preparedStatement.setInt(11, facility.getFacilityTypeId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean edit(Facility facility) {
        return false;
    }

    @Override
    public boolean delete(int facilityId) {
        return false;
    }
}
