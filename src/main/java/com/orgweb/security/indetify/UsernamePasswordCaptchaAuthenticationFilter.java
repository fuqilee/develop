package com.orgweb.security.indetify;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.octo.captcha.service.image.ImageCaptchaService;

public class UsernamePasswordCaptchaAuthenticationFilter extends
		UsernamePasswordAuthenticationFilter {
	@Resource  
    private ImageCaptchaService imageCaptchaService;  
      
    @Override    
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException{  
            
        String captchaId = request.getSession().getId();  
        String code = request.getParameter("code");  
        try{
        	Boolean isCorrect = imageCaptchaService.validateResponseForID(captchaId, code); 
        	  if (!isCorrect){  
                   //throw new BadCredentialsException(this.messages.getMessage("AbstractUserDetailsAuthenticationProvider.badCaptcha", "Bad captcha"));  
                  throw new BadCredentialsException("验证码不正确");  
              }  
        }catch(Exception e){
        	if(e.getMessage().contains("验证码不正确")){
        		throw new BadCredentialsException("验证码不正确");
        	}else{
        		throw new BadCredentialsException("验证码已过期");
        	}
        }
  
        return super.attemptAuthentication(request, response);    
    }  
}
