package com.estudando.curso.queryFIlters;

import com.estudando.curso.entities.Product;
import lombok.Data;
import org.springframework.data.jpa.domain.Specification;

import static com.estudando.curso.specifications.ProductSpec.*;

@Data
public class ProductQueryFilter {
    private String name;
    private String categoryName;
    private Double minPrice;
    private Double maxPrice;

    public Specification<Product> toSpecification() {
        Specification<Product> spec = Specification.where(null);

        if (name != null && !name.isEmpty()) {
            spec = spec.and(nameContains(name));
        }

        if (categoryName != null && !categoryName.isEmpty()) {
            spec = spec.and(categoryNameContains(categoryName));
        }

        if (minPrice != null) {
            spec = spec.and(priceGreaterThanOrEqualTo(minPrice));
        }

        if (maxPrice != null) {
            spec = spec.and(priceLessThanOrEqualTo(maxPrice));
        }

        return spec;
    }
}
