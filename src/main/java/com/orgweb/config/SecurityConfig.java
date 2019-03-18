/*
package com.orgweb.config;
import com.octo.captcha.service.multitype.GenericManageableCaptchaService;
import com.orgweb.security.*;
import com.orgweb.security.addtion.CustomLogoutSuccessHandler;
import com.orgweb.security.addtion.CustomSavedRequestAwareAuthenticationSuccessHandler;
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
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.ExceptionMappingAuthenticationFailureHandler;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/","/common/**").permitAll() //指定那些URL不要被保护
                .anyRequest()
                .authenticated()
                .and()
                .formLogin()
                .loginPage("/login.html") //登录的时候你要跳转到哪
                .loginProcessingUrl("/login")
                .successHandler(authenticationSuccess())
                .failureHandler(exceptionMappingAuthenticationFailureHandler())
                .failureUrl("/login?error") //失败页面
                .permitAll() //登录任意访问
                .and()
                .rememberMe() //rememberMe
                .and() //注销行为任意访问
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessHandler(logoutSuccessHandler())
                .invalidateHttpSession(true)
                .permitAll()
                .and()
                .addFilterBefore(ajaxLoginFilter(),FilterSecurityInterceptor.class)
                .addFilterAfter(myFilter(),FilterSecurityInterceptor.class)
                .csrf() //关闭csrf 不然不支持post
                .disable();

        http.exceptionHandling().accessDeniedPage("/common/error/403.html");
        http.sessionManagement()
                .invalidSessionUrl("/login?expired=true")
                .maximumSessions(1)
                .maxSessionsPreventsLogin(false)
                .expiredUrl("/login?expired=true");
        http.headers().frameOptions().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(myUserDetailService()).passwordEncoder(myPasswordEncode());
    }



    @Bean
    public MyPasswordEncode myPasswordEncode(){
        MyPasswordEncode mp=new MyPasswordEncode("md5");
        return mp;
    }

    */
/**
     * 增加ajax异步请求
     * @return
     *//*

    @Bean
    public UsernamePasswordCaptchaAuthenticationFilter ajaxLoginFilter(){
        UsernamePasswordCaptchaAuthenticationFilter loginAjax=new UsernamePasswordCaptchaAuthenticationFilter();
        loginAjax.setAuthenticationManager(authenticationManager());
        loginAjax.setAuthenticationFailureHandler(ajaxFailureHandler());
        loginAjax.setAuthenticationSuccessHandler(ajaxSuccessHandler());
        loginAjax.setFilterProcessesUrl("/api/login");
        loginAjax.setPasswordParameter("password");
        loginAjax.setUsernameParameter("username");
        return loginAjax;
    }

    */
/**
     * 登陆失败
     * @return
     *//*

    @Bean
    public AjaxAuthenticationFailureHandler ajaxFailureHandler(){
        AjaxAuthenticationFailureHandler fail=new AjaxAuthenticationFailureHandler();
        return fail;
    }

    */
/*注销成功*//*

    @Bean
    public CustomLogoutSuccessHandler logoutSuccessHandler(){
        CustomLogoutSuccessHandler clsh=new CustomLogoutSuccessHandler();
        clsh.setDefaultTargetUrl("/login.html");
        return clsh;
    }
    */
/*登陆成功跳转 *//*

    @Bean
    public CustomSavedRequestAwareAuthenticationSuccessHandler authenticationSuccess(){
        CustomSavedRequestAwareAuthenticationSuccessHandler clsh=new CustomSavedRequestAwareAuthenticationSuccessHandler();
        clsh.setDefaultTargetUrl("/index");
        return clsh;
    }
    @Bean
    public ProviderManager authenticationManager(){
        List<AuthenticationProvider> ls=new ArrayList();
        DaoAuthenticationProvider da=new DaoAuthenticationProvider();
        da.setPasswordEncoder(myPasswordEncode());
        ls.add(da);
        ProviderManager mp=new ProviderManager(ls);
        return mp;
    }
    @Bean
    public MyFilterSecurotyInterceptor myFilter(){
        MyFilterSecurotyInterceptor myFilter=new MyFilterSecurotyInterceptor();
        myFilter.setAuthenticationManager(authenticationManager());
        myFilter.setAccessDecisionManager(myAccessDecisionManagerBean());
        myFilter.setSecurityMetadataSource(securityMetadaSource());
        return myFilter;
    }

    */
/**
     * 登录成功
     * @return
     *//*

    @Bean
    public AjaxAuthenticationSuccessHandler ajaxSuccessHandler(){
        return new AjaxAuthenticationSuccessHandler();
    }
    @Bean
    public DefaultUserDetailsService myUserDetailService(){

        return new DefaultUserDetailsService();
    }
    @Bean
    public MyAccessDecisionManager myAccessDecisionManagerBean(){

        return new MyAccessDecisionManager();
    }
    @Bean
    public MyInvocationSecurityMetadaSource securityMetadaSource(){

        return new MyInvocationSecurityMetadaSource();
    }
    */
/*图片验证码*//*

    @Bean
    public ImageGenericCaptchaEngine imageEngine(){

        return new ImageGenericCaptchaEngine();
    }

    @Bean
    public GenericManageableCaptchaService imageCaptchaService(){
        return new GenericManageableCaptchaService(imageEngine(),
                180,// 超时时间 秒
                20000,20000);//最大并发数
    }
    @Bean
    public ExceptionMappingAuthenticationFailureHandler exceptionMappingAuthenticationFailureHandler(){
        ExceptionMappingAuthenticationFailureHandler exceptionMappingAuthenticationFailureHandler= new ExceptionMappingAuthenticationFailureHandler();
        Map m=new HashMap();
        m.put("org.springframework.security.authentication.DisabledException","/login.jsp?role=false");
        m.put("org.springframework.security.authentication.BadCredentialsException","/login.jsp?error=false");
        m.put("org.springframework.security.authentication.LockedException","/login.jsp?locked=false");
        exceptionMappingAuthenticationFailureHandler.setExceptionMappings(m);
        return  exceptionMappingAuthenticationFailureHandler;
    }
}
*/
