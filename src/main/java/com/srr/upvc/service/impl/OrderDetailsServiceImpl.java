package com.srr.upvc.service.impl;

import com.srr.upvc.entity.OrderDetails;
import com.srr.upvc.entity.CustomerOrder;
import com.srr.upvc.repository.OrderDetailsRepo;
import com.srr.upvc.repository.CustomerOrderRepo;
import com.srr.upvc.service.OrderDetailsService;
import com.srr.upvc.dto.OrderDetailsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderDetailsServiceImpl implements OrderDetailsService {
        @Override
        public List<OrderDetailsDto> fetchOrderDetailsDtoByOrderId(Long orderId) {
            List<OrderDetails> details = fetchByOrderId(orderId);
            List<OrderDetailsDto> dtoList = new ArrayList<>();
            if (details != null) {
                for (OrderDetails entity : details) {
                    OrderDetailsDto dto = new OrderDetailsDto();
                    dto.setId(entity.getId());
                    dto.setOrderId(entity.getCustomerOrder() != null ? entity.getCustomerOrder().getOrderId() : null);
                    dto.setDesc(entity.getDescription());
                    dto.setWidth(entity.getWidth());
                    dto.setHeigth(entity.getHeigth());
                    dto.setPrice(entity.getPrice());
                    dto.setQuantity(entity.getQuantity());
                    dto.setTotal(entity.getTotal());
                    dto.setTotalSft(entity.getTotalSft());
                    dtoList.add(dto);
                }
            }
            return dtoList;
        }
    @Autowired
    private OrderDetailsRepo orderDetailsRepo;

    @Autowired
    private CustomerOrderRepo customerOrderRepo;

    @Override
    public List<OrderDetails> fetchByOrderId(Long orderId) {
        return orderDetailsRepo.findByCustomerOrderOrderId(orderId);
    }

    @Override
    public OrderDetails saveOrderDetails(OrderDetails orderDetails) {
        return orderDetailsRepo.save(orderDetails);
    }

    @Override
    public List<OrderDetailsDto> saveOrderDetailsList(List<OrderDetailsDto> dtoList) {
        List<OrderDetails> savedList = new ArrayList<>();
        System.out.println("Received OrderDetailsDto count: " + (dtoList != null ? dtoList.size() : 0));
        Long orderId = null;
        if (dtoList != null && !dtoList.isEmpty()) {
            orderId = dtoList.get(0).getOrderId();
        }
        // Save or update records
        if (dtoList != null) {
            for (OrderDetailsDto dto : dtoList) {
                OrderDetails entity = null;
                if (dto.getId() != null) {
                    // Try to update existing record
                    entity = orderDetailsRepo.findById(dto.getId()).orElse(null);
                    if (entity != null) {
                        updateEntityFromDto(entity, dto);
                    } else {
                        // If not found, treat as new
                        entity = convertDtoToEntity(dto);
                    }
                } else {
                    // New record
                    System.out.println("Creating new OrderDetails for orderId: " + dto.getOrderId());
                    entity = convertDtoToEntity(dto);
                    System.out.println("Converted entity: " + (entity != null ? "id=" + entity : "null"));
                }
                if (entity != null) {
                    System.out.println("Saving entity: " + (entity != null ? "description=" + entity.getDescription() : "null"));
                    savedList.add(orderDetailsRepo.save(entity));
                }
            }
        }
        // Delete records not in input list
        if (orderId != null) {
            List<OrderDetails> existing = orderDetailsRepo.findByCustomerOrderOrderId(orderId);
            List<Long> inputIds = new ArrayList<>();
            if (savedList != null) {
                for (OrderDetails dto : savedList) {
                    if (dto.getId() != null) inputIds.add(dto.getId());
                }
            }
            for (OrderDetails od : existing) {
                if (od.getId() != null && !inputIds.contains(od.getId())) {
                    orderDetailsRepo.deleteById(od.getId());
                }
            }
        }
        System.out.println("Saved OrderDetails count: " + savedList.size());
        // Convert saved entities to DTOs
        List<OrderDetailsDto> result = new ArrayList<>();
        for (OrderDetails entity : savedList) {
            OrderDetailsDto dto = new OrderDetailsDto();
            dto.setId(entity.getId());
            dto.setOrderId(entity.getCustomerOrder() != null ? entity.getCustomerOrder().getOrderId() : null);
            dto.setDesc(entity.getDescription());
            dto.setWidth(entity.getWidth());
            dto.setHeigth(entity.getHeigth());
            dto.setPrice(entity.getPrice());
            dto.setQuantity(entity.getQuantity());
            dto.setTotal(entity.getTotal());
            dto.setTotalSft(entity.getTotalSft());
            result.add(dto);
        }
        return result;
    }

    /**
     * Updates an existing OrderDetails entity from a DTO (except id and order reference).
     */
    private void updateEntityFromDto(OrderDetails entity, OrderDetailsDto dto) {
        // Only update fields that are allowed to change
        entity.setDescription(dto.getDesc());
        entity.setWidth(dto.getWidth());
        entity.setHeigth(dto.getHeigth());
        entity.setPrice(dto.getPrice());
        entity.setQuantity(dto.getQuantity());
        entity.setTotal(dto.getTotal());
        entity.setTotalSft(dto.getTotalSft());
        // Optionally update order reference if needed
        if (dto.getOrderId() != null && (entity.getCustomerOrder() == null || !dto.getOrderId().equals(entity.getCustomerOrder().getOrderId()))) {
            CustomerOrder order = customerOrderRepo.findById(dto.getOrderId()).orElse(null);
            if (order != null) {
                entity.setCustomerOrder(order);
            }
        }
    }

    @Override
    public OrderDetails convertDtoToEntity(OrderDetailsDto dto) {
        if (dto == null || dto.getOrderId() == null) return null;
        CustomerOrder order = customerOrderRepo.findById(dto.getOrderId()).orElse(null);
        if (order == null) return null;
        OrderDetails entity = new OrderDetails();
        if (dto.getId() != null) {
            entity.setId(dto.getId());
        }
        entity.setCustomerOrder(order);
        entity.setDescription(dto.getDesc());
        entity.setWidth(dto.getWidth());
        entity.setHeigth(dto.getHeigth());
        entity.setPrice(dto.getPrice());
        entity.setQuantity(dto.getQuantity());
        entity.setTotal(dto.getTotal());
        entity.setTotalSft(dto.getTotalSft());
        return entity;
    }
}
