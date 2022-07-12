package com.srr.upvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.srr.upvc.repository.CompanyProfileRepo;

@Controller
@RequestMapping(path = "")
public class GetController {

	 
 
	@Autowired
	public CompanyProfileRepo companyProfileRepo;
	
	@Autowired
	public ObjectMapper objectMapper;
	
	@RequestMapping(path = { "", "/home" })
	public String homePage(ModelMap model) {
		model.addAttribute("userId", getUserName());
		return "Home";
	}

	@RequestMapping("/login")
	public String login2(ModelMap model) {
		model.addAttribute("userId", getUserName());
		return "login";
	}

	@RequestMapping("/searchorder")
	public String SearchOrder(ModelMap model) {
		model.addAttribute("userId", getUserName());
		return "SearchOrder";
	}

	public String getUserName() {
		return SecurityContextHolder.getContext().getAuthentication().getName();
	}

	 
	@RequestMapping(path = {"/editorder"})
	public String handleOrder(ModelMap model,@Param("orderId") String orderId) {
		model.addAttribute("userName", getUserName());
		model.addAttribute("type", "Edit"); 
		model.addAttribute("orderId",orderId);
		return "EditOrder";
	}

	@RequestMapping(path = {"/GenerateInvoice"})
	public String generateInvoice(ModelMap model,@Param("invoiceId") Long invoiceId, @Param("orderId") String orderId) throws JsonProcessingException {
		model.addAttribute("userName", getUserName());
		model.addAttribute("type", "Edit"); 
		model.addAttribute("invoiceId", invoiceId);
		model.addAttribute("orderId", orderId);
		model.addAttribute("order_company", objectMapper.writeValueAsString(companyProfileRepo.findAll()));
		/*
		 * try { model.addAttribute("glassTypes",
		 * objectMapper.writeValueAsString(glassTypeRepo.findAll()));
		 * 
		 * model.addAttribute("order_items",
		 * objectMapper.writeValueAsString(itemRepo.findRecordsByOrderId((orderId))));
		 * 
		 * model.addAttribute("order_company",
		 * objectMapper.writeValueAsString(companyProfileRepo.findAll())); } catch
		 * (JsonProcessingException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
		return "GenerateInvoice";
	}
	
	@RequestMapping(path = {"/Invoice"})
	public String getInvoice(ModelMap model,@Param("orderId") Long orderId) {
		model.addAttribute("userName", getUserName());
		model.addAttribute("type", "Edit"); 
		model.addAttribute("orderId",orderId);
	 
		return "Invoice";
	} 

	@RequestMapping(path = {"/createProfile"})
	public String createProfile(ModelMap model) {
		model.addAttribute("userName", getUserName());		 
		return "createProfile";
	}
	
	  
	@RequestMapping(path = {"/createParent"})
	public String createParent(ModelMap model,@Param("serviceType") String serviceType ) throws JsonProcessingException {
		model.addAttribute("userName", getUserName());		 
		model.addAttribute("serviceType",serviceType);   
		 
		
		return "createParent";
	}
	
	
	 

	 @RequestMapping(value="/logout", method=RequestMethod.GET)  
	    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {  
	        Authentication auth = SecurityContextHolder.getContext().getAuthentication();  
	        if (auth != null){      
	           new SecurityContextLogoutHandler().logout(request, response, auth);  
	        }  
	         return "redirect:/";  
	     }
	
	 @RequestMapping(path = {"/customeraddorder"})
		public String handleCusomterOrder(ModelMap model) {
			model.addAttribute("userName", getUserName());
			model.addAttribute("type", "Create"); 
			return "CustomerOrder";
		}
}
