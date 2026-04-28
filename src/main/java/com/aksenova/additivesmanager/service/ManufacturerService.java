package com.aksenova.additivesmanager.service;

import com.aksenova.additivesmanager.entity.Manufacturer;
import com.aksenova.additivesmanager.repository.ManufacturerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ManufacturerService {

    private final ManufacturerRepository manufacturerRepository;

    @Transactional
    public Manufacturer createManufacturer(Manufacturer manufacturer) {
        return manufacturerRepository.save(manufacturer);
    }

    @Transactional
    public Manufacturer updateManufacturer(Integer id, Manufacturer updatedManufacturer) {
        Manufacturer existingManufacturer = manufacturerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Manufacturer not found with id: " + id));

        existingManufacturer.setName(updatedManufacturer.getName());
        existingManufacturer.setCountry(updatedManufacturer.getCountry());
        existingManufacturer.setLegalAddress(updatedManufacturer.getLegalAddress());
        existingManufacturer.setInn(updatedManufacturer.getInn());
        existingManufacturer.setOgrn(updatedManufacturer.getOgrn());
        existingManufacturer.setContactPhone(updatedManufacturer.getContactPhone());
        existingManufacturer.setContactEmail(updatedManufacturer.getContactEmail());
        existingManufacturer.setWebsite(updatedManufacturer.getWebsite());

        return manufacturerRepository.save(existingManufacturer);
    }

    @Transactional
    public void deleteManufacturer(Integer id) {
        manufacturerRepository.deleteById(id);
    }

    public Optional<Manufacturer> getManufacturerById(Integer id) {
        return manufacturerRepository.findById(id);
    }

    public List<Manufacturer> getAllManufacturers() {
        return manufacturerRepository.findAll();
    }
}
