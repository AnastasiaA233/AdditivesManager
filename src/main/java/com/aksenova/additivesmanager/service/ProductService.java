package com.aksenova.additivesmanager.service;

import com.aksenova.additivesmanager.entity.Product;
import com.aksenova.additivesmanager.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ProductService {

    private final ProductRepository productRepository;

    @Transactional
    public Product createProduct(Product product) {
        return productRepository.save(product);
    }

    @Transactional
    public Product updateProduct(Integer id, Product updatedProduct) {
        Product existingProduct = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found with id: " + id));

        existingProduct.setProductName(updatedProduct.getProductName());
        existingProduct.setProductType(updatedProduct.getProductType());
        existingProduct.setTnVedCode(updatedProduct.getTnVedCode());
        existingProduct.setENumber(updatedProduct.getENumber());
        existingProduct.setReleaseForm(updatedProduct.getReleaseForm());
//        existingProduct.setManufacturer(updatedProduct.getManufacturer());
        existingProduct.setSgrNumber(updatedProduct.getSgrNumber());
        existingProduct.setSgrRegistrationDate(updatedProduct.getSgrRegistrationDate());
        existingProduct.setShelfLifeMonths(updatedProduct.getShelfLifeMonths());
        existingProduct.setStorageConditions(updatedProduct.getStorageConditions());
        existingProduct.setStatus(updatedProduct.getStatus());

        return productRepository.save(existingProduct);
    }

    @Transactional
    public void deleteProduct(Integer id) {
        productRepository.deleteById(id);
    }

    public Optional<Product> getProductById(Integer id) {
        return productRepository.findById(id);
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }
}