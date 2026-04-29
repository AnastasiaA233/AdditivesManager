package com.aksenova.additivesmanager.service;

import com.aksenova.additivesmanager.entity.ProductStatus;
import com.aksenova.additivesmanager.repository.ProductStatusRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ProductStatusService {

    private final ProductStatusRepository productStatusRepository;

    @Transactional
    public ProductStatus createProductStatus(ProductStatus productStatus) {
        return productStatusRepository.save(productStatus);
    }

    @Transactional
    public ProductStatus updateProductStatus(Integer id, ProductStatus updatedStatus) {
        ProductStatus existingStatus = productStatusRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product status not found with id: " + id));

        existingStatus.setStatusName(updatedStatus.getStatusName());
        existingStatus.setDescription(updatedStatus.getDescription());

        return productStatusRepository.save(existingStatus);
    }

    @Transactional
    public void deleteProductStatus(Integer id) {
        productStatusRepository.deleteById(id);
    }

    public Optional<ProductStatus> getProductStatusById(Integer id) {
        return productStatusRepository.findById(id);
    }

    public List<ProductStatus> getAllProductStatuses() {
        return productStatusRepository.findAll();
    }

}