package com.srr.upvc.entity;

import javax.persistence.*;

@Entity
@Table(name = "order_details")
public class OrderDetails {
    @Id
    @GeneratedValue(generator = "order_details_seq", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "order_details_seq", sequenceName = "order_details_seq", allocationSize = 1)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", referencedColumnName = "order_id")
    private CustomerOrder customerOrder;

    @Column(name = "description")
    private String description;

    @Column(name = "width")
    private Double width;

    @Column(name = "heigth")
    private Double heigth;

    @Column(name = "price")
    private Double price;

    @Column(name = "quantity")
    private Integer quantity;


    @Column(name = "total")
    private Double total;

    @Column(name = "total_sft")
    private Double totalSft;

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public CustomerOrder getCustomerOrder() { return customerOrder; }
    public void setCustomerOrder(CustomerOrder customerOrder) { this.customerOrder = customerOrder; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

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
