//
//package com.orgweb.config;
//
//import com.orgweb.security.DefaultUserDetailsService;
//import com.orgweb.security.MyAccessDecisionManager;
//import com.orgweb.security.MyAccessDeniedHandler;
//import com.orgweb.security.MyInvocationSecurityMetadaSource;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.BadCredentialsException;
//import org.springframework.security.authentication.DisabledException;
//import org.springframework.security.config.annotation.ObjectPostProcessor;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
//import org.springframework.security.web.authentication.AuthenticationFailureHandler;
//import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
//import org.springframework.stereotype.Component;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//
//@Configuration
//@EnableWebSecurity
//public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
//    @Override
//    public void configure(WebSecurity web) throws Exception {
//        //解决静态资源被拦截的问题
//        web.ignoring().antMatchers("/**/*.js");
//        web.ignoring().antMatchers("/**/*.css");
//        web.ignoring().antMatchers("/common/**");
//        web.ignoring().antMatchers("/login/**");
//        web.ignoring().antMatchers("/login.html");
//        web.ignoring().antMatchers("/loginapi.html");
//        web.ignoring().antMatchers("/ajax/login");
//        //解决服务注册url被拦截的问题
//        web.ignoring().antMatchers("/**/*.json");
//        web.ignoring().antMatchers("/image/captcha");
//    }
//
//}
