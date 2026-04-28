package com.aksenova.additivesmanager.service;

import com.aksenova.additivesmanager.entity.ProductType;
import com.aksenova.additivesmanager.repository.ProductTypeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ProductTypeService {

    private final ProductTypeRepository productTypeRepository;

    @Transactional
    public ProductType createProductType(ProductType productType) {
        return productTypeRepository.save(productType);
    }

    @Transactional
    public ProductType updateProductType(Integer id, ProductType updatedType) {
        ProductType existingType = productTypeRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product type not found with id: " + id));

        existingType.setTypeName(updatedType.getTypeName());
        existingType.setDescription(updatedType.getDescription());

        return productTypeRepository.save(existingType);
    }

    @Transactional
    public void deleteProductType(Integer id) {
        productTypeRepository.deleteById(id);
    }

    public Optional<ProductType> getProductTypeById(Integer id) {
        return productTypeRepository.findById(id);
    }

    public List<ProductType> getAllProductTypes() {
        return productTypeRepository.findAll();
    }

}