package repository;

import model.Facility;

import java.util.List;

public interface IFacilityRepository {

    List<Facility> findAll();

    boolean create(Facility facility);

    boolean edit(Facility facility);

    boolean delete(int facilityId);
}
