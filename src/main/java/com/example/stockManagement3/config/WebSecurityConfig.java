package com.example.stockManagement3.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	// @Qualifier("userDetailsService")
	private UserDetailsService userDetailsService;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	};

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/stock/showFormForUpdate").hasAnyRole("ADMIN")
		.antMatchers("/stock/showFormForAdd").hasAnyRole("ADMIN").antMatchers("/stock//saveStock")
		.hasAnyRole("ADMIN").antMatchers("/stock/delete").hasAnyRole("ADMIN").antMatchers("/stock/search")
		.permitAll().antMatchers("/stock/sellItemForm").hasAnyRole("ADMIN").antMatchers("/stock/addToCart")
		.hasAnyRole("ADMIN").antMatchers("/stock/checkOut").hasAnyRole("ADMIN").antMatchers("/").permitAll()
		.antMatchers("/stock/list").permitAll().and().authorizeRequests().antMatchers("/login**").permitAll()
		.and().formLogin().loginPage("/login").loginProcessingUrl("/loginAction").permitAll().and().logout()
		.logoutSuccessUrl("/").permitAll().and().csrf().disable();
	}
}
