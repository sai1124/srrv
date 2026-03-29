package com.srr.upvc.dto;

public class OrderDetailsDto {
    private Long id;
    private Long orderId;
    private String desc;
    private Double width;
    private Double heigth;
    private Double price;
    private Integer quantity;
    private Double total;
    private Double totalSft;

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getOrderId() { return orderId; }
    public void setOrderId(Long orderId) { this.orderId = orderId; }

    public String getDesc() { return desc; }
    public void setDesc(String desc) { this.desc = desc; }

    public Double getWidth() { return width; }
    public void setWidth(Double width) { this.width = width; }

    public Double getHeigth() { return heigth; }
    public void setHeigth(Double heigth) { this.heigth = heigth; }

    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }

    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }

    public Double getTotal() { return total; }
    public void setTotal(Double total) { this.total = total; }

    public Double getTotalSft() { return totalSft; }
    public void setTotalSft(Double totalSft) { this.totalSft = totalSft; }
}
