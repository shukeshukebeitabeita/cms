/**
 * @(#)SpringContextUtil.java 2014-7-10
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
package com.bsb.cms.commons.web;

import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 *  获得spring bean
 * @author hongjian.liu
 * @version 1.0.0 2014-7-10
 * @since 1.0
 */
@Component
public class SpringContextUtil  implements ApplicationContextAware{
	private static Logger LOG = Logger.getLogger(SpringContextUtil.class);
    private static SpringContextUtil inStance = new SpringContextUtil();
    private static ApplicationContext ctx;
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		
		inStance.ctx = applicationContext;
		if(LOG.isDebugEnabled()){
			String[] beans = applicationContext.getBeanDefinitionNames();
			for(String beanName:beans){
				LOG.debug("系统初始化beanName--->" +beanName);
			}
		}
		
		
	}
	
	public static ApplicationContext getApplicationContextInstance(){
		return inStance.ctx ;
	}
   
}
