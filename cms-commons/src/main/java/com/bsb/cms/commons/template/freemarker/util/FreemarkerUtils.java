/**
 * @(#)FreemarkerUtils.java 2014-7-7
 *
 * Copyright (c) 2014-2015 BuShangBan (China) Int'l Co., Ltd
 * yongtai Road. pu dong District.Shanghai China
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of BuShangBan (China)
 *  Int'l Co., Ltd ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with BuShangBan (China).
 */
package com.bsb.cms.commons.template.freemarker.util;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;

import freemarker.core.Environment;
import freemarker.ext.beans.BeansWrapper;
import freemarker.template.Configuration;
import freemarker.template.ObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModelException;

/**
 * Freemarker模板工具类.
 * @author hongjian.liu
 * @version 1.0.0 2014-6-13
 * @since 1.0
 */
public class FreemarkerUtils {
	/**
	 * 是否是开发模式
	 */
	public static final boolean IS_DEV_MODE = false;
	
    /**
     * 测试用
     * @param message
     */
	public static void myOut(String message) {
		if (IS_DEV_MODE) {
			System.out.println(message); 
		}
	}
	
	/**
	 * 设置模板配置。如设置一些自定义的方法， 异常到共享环境中。
	 * @param cfg
	 * @throws TemplateModelException 
	 */
	public static void setTemplateEnv(Configuration cfg) {
		cfg.setClassicCompatible(true);//设置兼容性 ，空值处理（默认情况下变量为null则替换为空字符串，如果需要自定义，写上$(empty!"emptyValue of fbysss"}即可)）
		
		//cfg.setTemplateExceptionHandler(new com.iss.pms.core.freemarker.method.DefaultTemplateException());
		setGolbalVariable(cfg); //设置模板共享变量。
	}
	
	
    //私有方法
    /**
     * 设置模板共享变量。global 
     */
    private static void setGolbalVariable(Configuration cfg) {
    	try {
    		BeansWrapper wrapper = BeansWrapper.getDefaultInstance();
    		TemplateHashModel staticClass = wrapper.getStaticModels();
    		TemplateHashModel apacheStringUtils = (TemplateHashModel) staticClass.get("com.bsb.cms.commons.utils.StringUtils");
    		cfg.setSharedVariable("StringUtils", apacheStringUtils);//设置共享变量
    		
    		
    	} catch (TemplateModelException e) {
			e.printStackTrace();
		}
    }
    
	/**
	 * 设置环境中的，初始值，防止模板中调用出错。
	 * @param map
	 */
    public static void getMap(Map<String, Object> map) {
		//map.put("contextPath", "");//web_base
    }

	
	/**
	 * 来自spring (org.springframework.ui.freemarker.FreeMarkerTemplateUtils)
	 * Process the specified FreeMarker template with the given model and write
	 * the result to the given Writer.
	 * <p>When using this method to prepare a text for a mail to be sent with Spring's
	 * mail support, consider wrapping IO/TemplateException in MailPreparationException.
	 * @param model the model object, typically a Map that contains model names
	 * as keys and model objects as values
	 * @return the result as String
	 * @throws IOException if the template wasn't found or couldn't be read
	 * @throws freemarker.template.TemplateException if rendering failed
	 * @see org.springframework.mail.MailPreparationException
	 */
	public static String processTemplateIntoString(Template template, Object model)
			throws IOException, TemplateException {
		StringWriter result = new StringWriter();
		template.process(model, result);
		return result.toString();
	}
	
	/**
	 * 设置非全局变量。请求级别变量
	 * @param env
	 * @param name
	 * @param value
	 * @throws Exception
	 */
	public static void setVariable(Environment env, String name, Object value) throws Exception {
        env.setVariable(name, ObjectWrapper.DEFAULT_WRAPPER.wrap(value));
        // env.setLocalVariable("codes", codes);
    }
}
