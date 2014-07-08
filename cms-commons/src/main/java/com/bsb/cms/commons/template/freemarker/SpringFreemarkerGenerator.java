/**
 * @(#)SpringFreemarkerGenerator.java 2014-7-7
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
package com.bsb.cms.commons.template.freemarker;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import com.bsb.cms.commons.exceptions.TemplateRuntimeException;
import com.bsb.cms.commons.template.TemplateGenerator;

import freemarker.template.Configuration;
import freemarker.template.TemplateException;

/**
 * 和spring mvc使用一样的环境. (如果不依赖于spring mvc请使用{@link #com.bsb.cms.commons.template.freemarker.FreemarkerGenerator})
 * 
 * @author hongjian.liu
 * @version 1.0.0 2014-7-7
 * @since 1.0
 */
@Service("springFreemarkerGenerator")
public class SpringFreemarkerGenerator implements TemplateGenerator {

	private static final Log log = LogFactory
			.getLog(SpringFreemarkerGenerator.class);
	@Resource(name = "freemarkerNotifyConfiguration")
	private Configuration configuration = null;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.uns.mall.commons.template.TemplateGenerator#createString(java.lang
	 * .String, java.util.Map)
	 */
	@Override
	public String createString(String templatePath, Map<String, Object> dataMap)
			throws TemplateRuntimeException {
		String htmlText;
		try {
			htmlText = FreeMarkerTemplateUtils.processTemplateIntoString(
					configuration.getTemplate(templatePath), dataMap);
		} catch (IOException e) {
			log.error(e.getMessage());
			throw new TemplateRuntimeException(e.getMessage());
		} catch (TemplateException e) {
			log.error(e.getMessage());
			throw new TemplateRuntimeException(e.getMessage());
		}
		return htmlText;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.uns.mall.commons.template.TemplateGenerator#create(java.lang.String,
	 * java.util.Map, java.lang.String)
	 */
	@Override
	public void createFile(String ftlTemplateFile, Map<String, Object> dataMap,
			String filePath) throws TemplateRuntimeException {
		Writer out = null;
		try {
			String htmlText = FreeMarkerTemplateUtils
					.processTemplateIntoString(
							configuration.getTemplate(ftlTemplateFile), dataMap);

			out = new OutputStreamWriter(new FileOutputStream(filePath),
					"UTF-8");
			out.write(htmlText);
		} catch (IOException e) {
			log.error(e.getMessage());
			throw new TemplateRuntimeException(e.getMessage());
		} catch (TemplateException e) {
			log.error(e.getMessage());
			throw new TemplateRuntimeException(e.getMessage());
		} finally {
			if (out != null) {
				try {
					out.flush();
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}

}
