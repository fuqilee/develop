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
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class AuConfig {
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

}
