package com.estudando.curso.queryFIlters;

import com.estudando.curso.entities.Order;
import lombok.Data;
import org.springframework.data.jpa.domain.Specification;

import static com.estudando.curso.specifications.OrderSpec.orderStatusEquals;

@Data
public class OrderQueryFilter {

    private String orderStatus;


    public Specification<Order> toSpecification() {
        Specification<Order> spec = Specification.where(null);

        // Filtro de status
        if (orderStatus != null && !orderStatus.isEmpty()) {
            spec = spec.and(orderStatusEquals(orderStatus));
        }

        return spec;
    }
}
