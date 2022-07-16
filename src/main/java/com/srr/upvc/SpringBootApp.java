package com.srr.upvc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.srr.upvc.repository") 
public class SpringBootApp extends SpringBootServletInitializer{

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(SpringBootApp.class);
    }
  

	public static void main(String[] args) {
		//TimeZone.setDefault(TimeZone.getTimeZone("GMT+05:30"));
		SpringApplication.run(SpringBootApp.class, args);
	}

}


