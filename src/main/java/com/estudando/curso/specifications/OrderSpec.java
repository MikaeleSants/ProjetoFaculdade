package com.estudando.curso.specifications;

import com.estudando.curso.entities.Order;
import com.estudando.curso.entities.enums.OrderStatus;
import org.springframework.data.jpa.domain.Specification;

public class OrderSpec {

    // Metodo que mapeia o nome do status para o valor da enum OrderStatus
    public static Specification<Order> orderStatusEquals(String status) {
        return (root, query, builder) -> {
            if (status == null || status.isEmpty()) {
                return null;
            }

            // Convertendo o nome do status para a enum OrderStatus
            OrderStatus orderStatus = OrderStatus.valueOf(status.toUpperCase());

            // Retorna a condição de filtro para o status
            return builder.equal(root.get("orderStatus"), orderStatus.getCode());
        };
    }

}
