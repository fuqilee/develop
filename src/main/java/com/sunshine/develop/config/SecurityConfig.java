package com.sunshine.develop.config;

import com.octo.captcha.service.multitype.GenericManageableCaptchaService;
import com.orgweb.security.*;
import com.orgweb.security.addtion.CustomLogoutSuccessHandler;
import com.orgweb.security.indetify.ImageGenericCaptchaEngine;
import com.orgweb.security.indetify.MyPasswordEncode;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SecurityConfig {
    /**
     * 登陆失败
     * @return
     */
    @Bean(name="ajaxFailureHandler")
    public AjaxAuthenticationFailureHandler ajaxFailureHandler(){
        AjaxAuthenticationFailureHandler fail=new AjaxAuthenticationFailureHandler();
        return fail;
    }

    /*注销成功*/
    @Bean(name="logoutSuccessHandler")
    public CustomLogoutSuccessHandler logoutSuccessHandler(){
        CustomLogoutSuccessHandler clsh=new CustomLogoutSuccessHandler();
        clsh.setDefaultTargetUrl("/login.html");
        return clsh;
    }
    @Bean(name="myPasswordEncode")
    public MyPasswordEncode myPasswordEncode(){
        MyPasswordEncode mp=new MyPasswordEncode("md5");
        return mp;
    }

    /**
     * 登录成功
     * @return
     */
    @Bean(name="ajaxSuccessHandler")
    public AjaxAuthenticationSuccessHandler ajaxSuccessHandler(){
        return new AjaxAuthenticationSuccessHandler();
    }

    @Bean(name="myUserDetailService")
    public DefaultUserDetailsService myUserDetailService(){
        return new DefaultUserDetailsService();
    }
    @Bean(name="myAccessDecisionManager")
    public MyAccessDecisionManager myAccessDecisionManager(){
        return new MyAccessDecisionManager();
    }

    @Bean(name="securityMetadaSource")
    public MyInvocationSecurityMetadaSource securityMetadaSource(){
        return new MyInvocationSecurityMetadaSource();
    }
    /*图片验证码*/
    @Bean(name="imageEngine")
    public ImageGenericCaptchaEngine imageEngine(){
        return new ImageGenericCaptchaEngine();
    }
    @Bean
    public GenericManageableCaptchaService imageCaptchaService(){
        return new GenericManageableCaptchaService(imageEngine(),
                180,// 超时时间 秒
                20000,20000);//最大并发数
    }
    @Bean(name="myAccessDeniedHandler")
    public MyAccessDeniedHandler myAccessDeniedHandler(){
        return new MyAccessDeniedHandler();//最大并发数
    }
}
