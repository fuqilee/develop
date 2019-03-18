package com.orgweb.action;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.octo.captcha.service.image.ImageCaptchaService;
/**
 * @author qlee
 * @version 1.0.0
 */
@Controller
@RequestMapping("/image")
public class ImageAction extends BaseAction {
	private static final Logger log = Logger.getLogger(ImageAction.class);
	@Autowired
	private ImageCaptchaService imageCaptchaService;

	/**
	 * 根据文件信息ID查询文件信息
	 * @throws IOException
	 */
	@RequestMapping(value = "/captcha")
	public void getCode(HttpServletRequest request, HttpServletResponse response) {
	        try {
	            ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
	            String captchaId = request.getSession().getId();

	            BufferedImage challenge = (BufferedImage) imageCaptchaService.getChallengeForID(captchaId,request.getLocale());

	            ImageIO.write(challenge, "jpeg", jpegOutputStream);
	            byte[] captchaChallengeAsJpeg = jpegOutputStream.toByteArray();

	            response.setHeader("Cache-Control", "no-store");
	            response.setHeader("Pragma", "no-cache");
	            response.setDateHeader("Expires", 0);
	            response.setContentType("image/jpeg");
	            ServletOutputStream responseOutputStream = response.getOutputStream();
	            responseOutputStream.write(captchaChallengeAsJpeg);
	            responseOutputStream.flush();
	            responseOutputStream.close();
	        } catch (Exception e) {
	            log.error("generate captcha image error: {}", e);
	        }
	}

}
