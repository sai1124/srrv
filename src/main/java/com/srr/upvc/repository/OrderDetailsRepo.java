package com.srr.upvc.repository;

import com.srr.upvc.entity.OrderDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailsRepo extends JpaRepository<OrderDetails, Long> {
    List<OrderDetails> findByCustomerOrderOrderId(Long orderId);
}
