package com.estudando.curso.services;

import com.estudando.curso.entities.Product;
import com.estudando.curso.repositories.ProductRepository;
import com.estudando.curso.services.exceptions.DatabaseException;
import com.estudando.curso.services.exceptions.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class ProductServices {

    @Autowired
    private ProductRepository productRepository;

    public List<Product> findAll(Specification<Product> spec) {
        return productRepository.findAll(spec);
    }

    public Product findById(Long id) {
        Optional <Product> obj =  productRepository.findById(id);
        return obj.get();
    }
    public Product insert(Product obj) {
        return productRepository.save(obj);
    }
    public void delete(Long id) {
        try {
            productRepository.deleteById(id); } catch (EmptyResultDataAccessException e)
        {throw new ResourceNotFoundException(id);} catch (DataIntegrityViolationException e)
        {throw new DatabaseException(e.getMessage());}
    }

    public Product update(Long id, Product obj) {
        try {
            Product entity = productRepository.findById(id)
                    .orElseThrow(() -> new ResourceNotFoundException(id));
            updateData(entity, obj);
            return productRepository.save(entity);
        } catch (ResourceNotFoundException e) {
            throw e;
        }
    }

    private void updateData(Product entity, Product obj) {
        entity.setName(obj.getName());
        entity.setDescription(obj.getDescription());
        entity.setPrice(obj.getPrice());
    }
}

