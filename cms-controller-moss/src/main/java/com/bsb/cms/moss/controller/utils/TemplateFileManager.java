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
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.bsb.cms.moss.controller.tmpt.TmptTemplateController;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-7
 * @since 1.0
 */
@Component
public class TemplateFileManager {
	// log
	private static final Log log = LogFactory.getLog(TemplateFileManager.class);
	
	public void createFreemarkFile(String dirPath, String fileName,
			String fileContent) {
		FileWriterWithEncoding fw = null;
		File dirFile = new File(dirPath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}

		// FileOutputStream out = new FileOutputStream(dirPath + fileName +
		// ".ftl");
		try {
			String filePath = dirPath + fileName + ".ftl";
			fw = new FileWriterWithEncoding(filePath,
					"UTF-8");
			fw.write(fileContent);
			log.info("template created:" + filePath);
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

}
