package com.srr.upvc.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.srr.upvc.entity.Customer;

//public interface CustomerRepo extends JpaRepository<Customer, Long>{
public interface CustomerRepo {
	List<Customer> findByNameContainingOrAddressContainingOrContactNumberContaining(String name,String address,String contactNumber);
	Optional<Customer> findByContactNumber(String contactNumber);
}
