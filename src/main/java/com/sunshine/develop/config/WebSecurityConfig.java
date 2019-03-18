package com.sunshine.develop.config;

import com.octo.captcha.service.multitype.GenericManageableCaptchaService;
import com.orgweb.security.*;
import com.orgweb.security.addtion.CustomLogoutSuccessHandler;
import com.orgweb.security.indetify.ImageGenericCaptchaEngine;
import com.orgweb.security.indetify.MyPasswordEncode;
import com.orgweb.security.indetify.UsernamePasswordCaptchaAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.ExceptionMappingAuthenticationFailureHandler;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.stereotype.Service;
import org.springframework.web.filter.CharacterEncodingFilter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Configuration
@EnableWebSecurity
//@EnableGlobalMethodSecurity(prePostEnabled = true) //开启security注解
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    AjaxAuthenticationFailureHandler ajaxFailureHandler;
    @Autowired
    CustomLogoutSuccessHandler logoutSuccessHandler;
    @Autowired
    MyPasswordEncode myPasswordEncode;

    @Autowired
    AjaxAuthenticationSuccessHandler ajaxSuccessHandler;

    @Autowired
    DefaultUserDetailsService myUserDetailService;
    @Autowired
    MyAccessDecisionManager myAccessDecisionManager;
    @Autowired
    MyInvocationSecurityMetadaSource securityMetadaSource;
    @Autowired
    ImageGenericCaptchaEngine imageEngine;

    @Autowired
    MyAccessDeniedHandler myAccessDeniedHandler;

    @Override
    public void configure(WebSecurity web) throws Exception {
        //解决静态资源被拦截的问题
        web.ignoring().antMatchers("/**/*.js");
        web.ignoring().antMatchers("/**/*.css");
        web.ignoring().antMatchers("/common/**");
        web.ignoring().antMatchers("/login/**");
        web.ignoring().antMatchers("/user/**");
        web.ignoring().antMatchers("/login.html");
        web.ignoring().antMatchers("/loginapi.html");
        web.ignoring().antMatchers("/ajax/login");
        //解决服务注册url被拦截的问题
        web.ignoring().antMatchers("/**/*.json");
        web.ignoring().antMatchers("/image/captcha");
        web.ignoring().antMatchers("/bootInfo/toIndex");
        web.ignoring().antMatchers("/head/toLogin");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()  //定义哪些url需要保护，哪些url不需要保护
                //.antMatchers("/common/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .logout()
                .logoutUrl("/logout")
                .permitAll()
                .and()
                .formLogin()
                .loginPage("/head/toLogin")  //定义当需要用户登录时候，转到的登录页面
                ;
        http.csrf().disable();
        http.cors();
        //解决中文乱码问题
        CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.addFilterBefore(filter, CsrfFilter.class);
        http.headers()
                .frameOptions()
                .disable()
                .and()
                .sessionManagement().maximumSessions(1800);
        //用重写的Filter替换掉原有的UsernamePasswordAuthenticationFilter
        http.exceptionHandling().accessDeniedHandler(myAccessDeniedHandler);
        http.requestCache().disable();

        http.addFilterBefore(ajaxLoginFilter(),FilterSecurityInterceptor.class);
        http.addFilterAfter(myFilter(),FilterSecurityInterceptor.class);
    }


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(myUserDetailService)
                .passwordEncoder(myPasswordEncode);
    }
    /**
     * 增加ajax异步请求
     * @return
     */
    @Bean
    public UsernamePasswordCaptchaAuthenticationFilter ajaxLoginFilter(){
        UsernamePasswordCaptchaAuthenticationFilter loginAjax=new UsernamePasswordCaptchaAuthenticationFilter();
        loginAjax.setAuthenticationManager(authenticationManagerBean());
        loginAjax.setAuthenticationFailureHandler(ajaxFailureHandler);
        loginAjax.setAuthenticationSuccessHandler(ajaxSuccessHandler);
        loginAjax.setFilterProcessesUrl("/ajax/login");
        loginAjax.setPasswordParameter("password");
        loginAjax.setUsernameParameter("username");
        //loginAjax.setServletContext();
        return loginAjax;
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean(){
        List<AuthenticationProvider> ls=new ArrayList();
        DaoAuthenticationProvider da=new DaoAuthenticationProvider();
        da.setPasswordEncoder(myPasswordEncode);
        da.setUserDetailsService(myUserDetailService);
        ls.add(da);
        ProviderManager mp=new ProviderManager(ls);
        return  mp;
    }

    /*@Override
    public AuthenticationManager authenticationManagerBean() {
        AuthenticationManager authenticationManager = null;
        try {
            authenticationManager = super.authenticationManagerBean();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return authenticationManager;
    }*/

    @Bean
    public MyFilterSecurotyInterceptor myFilter(){
        MyFilterSecurotyInterceptor myFilter=new MyFilterSecurotyInterceptor();
        myFilter.setAuthenticationManager(authenticationManagerBean());
        myFilter.setAccessDecisionManager(myAccessDecisionManager);
        myFilter.setSecurityMetadataSource(securityMetadaSource);
        return myFilter;
    }
   /* @Bean
    public ExceptionMappingAuthenticationFailureHandler exceptionMappingAuthenticationFailureHandler(){
        ExceptionMappingAuthenticationFailureHandler exceptionMappingAuthenticationFailureHandler= new ExceptionMappingAuthenticationFailureHandler();
        Map m=new HashMap();
        m.put("org.springframework.security.authentication.DisabledException","/login.jsp?role=false");
        m.put("org.springframework.security.authentication.BadCredentialsException","/login.jsp?error=false");
        m.put("org.springframework.security.authentication.LockedException","/login.jsp?locked=false");
        exceptionMappingAuthenticationFailureHandler.setExceptionMappings(m);
        return  exceptionMappingAuthenticationFailureHandler;
    }*/


}