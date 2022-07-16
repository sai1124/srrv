package com.srr.upvc.security;

import java.util.TimeZone;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class CustomWebSecurityConfigurerAdapter extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsService userDetailsService;

	@PostConstruct
	void started() {
	    TimeZone.setDefault(TimeZone.getTimeZone("GMT+05:30"));
	}
	@Override
	public void configure(WebSecurity web) throws Exception {
		String[] permitted = new String[] { "/resources/**","/css/**", "/js/**", "**/image/**","/images/**","/customer/**/**","t/**/**","/bootstrap/**","/webapp/**/**","/fonts/**" };
		web.ignoring().antMatchers(permitted);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		String[] permitted = new String[] { "/css/**", "/js/**", "**/image/**","/images/**","/customer/**/**","t/**/**","/bootstrap/**","/webapp/**/**","/fonts/**" };
		  http
          .authorizeRequests()
          .antMatchers(permitted)
          .permitAll();
//			
//			 http.authorizeRequests().anyRequest().authenticated().and().formLogin()
//			  .permitAll() .loginProcessingUrl("/login") .defaultSuccessUrl("/home",true);
			 
		  http.authorizeRequests().anyRequest().authenticated().and().formLogin().loginPage("/login").permitAll().loginProcessingUrl("/login").loginProcessingUrl("/login").defaultSuccessUrl("/home",true);
	}
	

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(encodePWD());
	}

	 
	@Bean
	public BCryptPasswordEncoder encodePWD() {
		return new BCryptPasswordEncoder();
	}
	
 
}
