package com.estudando.curso.services;

import com.estudando.curso.entities.Order;
import com.estudando.curso.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service
public class OrderServices {

    @Autowired
    private OrderRepository OrderRepository;

    public List<Order> findAll() {
        return OrderRepository.findAll();
    }

    public Order findById(Long id) {
        Optional <Order> obj =  OrderRepository.findById(id);
        return obj.get();
    }
}
