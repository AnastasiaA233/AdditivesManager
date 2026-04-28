package com.aksenova.additivesmanager.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "product_statuses")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductStatus {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "status_name", nullable = false, unique = true, length = 50)
    private String statusName;

    @Column(columnDefinition = "TEXT")
    private String description;

}