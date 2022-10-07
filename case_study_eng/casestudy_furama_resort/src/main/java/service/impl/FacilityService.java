package service.impl;

import model.Facility;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private IFacilityRepository iFacilityRepository = new FacilityRepository();
    @Override
    public List<Facility> findAll() {
        return iFacilityRepository.findAll();
    }

    @Override
    public boolean create(Facility facility) {
        return iFacilityRepository.create(facility);
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
