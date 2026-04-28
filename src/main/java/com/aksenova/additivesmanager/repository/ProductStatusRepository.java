package com.aksenova.additivesmanager.repository;

import com.aksenova.additivesmanager.entity.ProductStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductStatusRepository extends JpaRepository<ProductStatus, Integer> {
}