package com.srr.upvc.service;

import com.srr.upvc.entity.OrderDetails;
import com.srr.upvc.dto.OrderDetailsDto;
import java.util.List;

public interface OrderDetailsService {
    List<OrderDetails> fetchByOrderId(Long orderId);
    OrderDetails saveOrderDetails(OrderDetails orderDetails);
    List<OrderDetailsDto> saveOrderDetailsList(List<OrderDetailsDto> dtoList);
    OrderDetails convertDtoToEntity(OrderDetailsDto dto);

    /**
     * Fetches OrderDetails by orderId and converts them to DTOs.
     */
    List<OrderDetailsDto> fetchOrderDetailsDtoByOrderId(Long orderId);
}
