package com.srr.upvc.repository;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Repository;
import com.srr.upvc.entity.Customer;

@Repository
public interface CustomerRepo {
	List<Customer> findByNameContainingOrAddressContainingOrContactNumberContaining(String name,String address,String contactNumber);
	Optional<Customer> findByContactNumber(String contactNumber);
}
