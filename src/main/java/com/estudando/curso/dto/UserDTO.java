package com.estudando.curso.dto;

import com.estudando.curso.entities.User;
import java.util.List;
import java.util.stream.Collectors;

public class UserDTO {
    private Long id;
    private String name;
    private String email;
    private String phone;
    private List<Long> orders; // Apenas IDs dos pedidos

    public UserDTO(User user) {
        this.id = user.getId();
        this.name = user.getName();
        this.email = user.getEmail();
        this.phone = user.getPhone();
        this.orders = user.getOrders().stream().map(order -> order.getId()).collect(Collectors.toList());
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public List<Long> getOrders() {
        return orders;
    }
}

