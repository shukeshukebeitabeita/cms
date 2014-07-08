/**
 * @(#)TemplateFileManager.java 2014-7-7
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
package com.bsb.cms.moss.controller.utils;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.output.FileWriterWithEncoding;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-7
 * @since 1.0
 */
@Component
public class TemplateFileManager {
	@Value("${cms.template.root.dir}")
	public String defaultDir;

	public void createFreemarkFile(String dirPath, String fileName,
			String fileContent) {
		FileWriterWithEncoding fw = null;
		if (StringUtils.isBlank(dirPath)) {
			dirPath = defaultDir;
		}
		File dirFile = new File(dirPath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}

		// FileOutputStream out = new FileOutputStream(dirPath + fileName +
		// ".ftl");
		try {
			fw = new FileWriterWithEncoding(dirPath + fileName + ".ftl",
					"UTF-8");
			fw.write(fileContent);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fw != null)
				try {
					fw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}

	}

	/**
	 * @return the defaultDir
	 */
	public String getDefaultDir() {
		return defaultDir;
	}

}
