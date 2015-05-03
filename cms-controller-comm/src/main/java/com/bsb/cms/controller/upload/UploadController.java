
package com.bsb.cms.controller.upload;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * 上传图片
 * @author hongjian.liu
 * @version 1.0.0 2014-9-4
 * @since 1.0
 */
@Controller
public class UploadController {
	private static Logger LOG = Logger.getLogger(UploadController.class);
	//@Value("${ad.upload.basePath}")
	private String uploadPath;
//	@Value("${common.staticRoot}")
//	private String staticRoot;

	/**
	 * 图片上传
	 * @param file
	 * @param request
	 * @param response
	 */
	@RequestMapping("/upload.htm")
	public void upload(@RequestParam("file") MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) {
		BufferedOutputStream bos;
		StrToResponse res = new StrToResponse();
		try {
			String dynamicName = getNewName(file.getOriginalFilename());
			String newFileDirectory = uploadPath;

			// String servletPath =
			// request.getSession().getServletContext().getRealPath("upload");
			if (!(newFileDirectory.endsWith("/") || newFileDirectory
					.endsWith("\\"))) {
				newFileDirectory = newFileDirectory.concat(File.separator);
			}
			String dynamicPath = getNewDynamicPath();
			newFileDirectory = newFileDirectory + dynamicPath;
			LOG.info("newFileDirectory===" + newFileDirectory);
//			String title = file.getOriginalFilename().substring(0,
//					file.getOriginalFilename().lastIndexOf("."));
			File destFile = new File(newFileDirectory);
			if (!destFile.exists())
				destFile.mkdirs();
			bos = new BufferedOutputStream(new FileOutputStream(new File(
					newFileDirectory, dynamicName)));
			FileCopyUtils.copy(file.getInputStream(), bos);
			// res.setResponseStatus(HttpServletResponse.SC_OK);
//			JsonBack.print(response, "FILEID:" + staticRoot + "/upload/"
//					+ dynamicPath + "/" + dynamicName);
			
			String orgFileFullPath = newFileDirectory + "/" + dynamicName;
			String postfix = dynamicName.substring(dynamicName.lastIndexOf("."), dynamicName.length());
			
			// 565x315
            String fileFullPath120 = newFileDirectory + "/" + dynamicName + "_565x315" + postfix;//"_120x120q20"
            long image120Size = ImageUtil.createThumbnail(new FileInputStream(orgFileFullPath), fileFullPath120, 565, 316);// 压缩图片
            if (image120Size > 20)
                ImageUtil.compressImage(566, 316, 0.5f, fileFullPath120);

            // 155x107
            String fileFullPath360 = newFileDirectory + "/" + dynamicName + "_155x107" + postfix;//"_155x107q30"
            long image360Size = ImageUtil.createThumbnail(new FileInputStream(orgFileFullPath), fileFullPath360, 155,
                    107);// 压缩图片
            if (image360Size > 30)
                ImageUtil.compressImage(156, 108, 0.5f, fileFullPath360);
            
            
        	// 264x182
            String fileFullPath264 = newFileDirectory + "/" + dynamicName + "_264x182" + postfix;
            long image264Size = ImageUtil.createThumbnail(new FileInputStream(orgFileFullPath), fileFullPath264, 264, 182);// 压缩图片
            if (image264Size > 30)
                ImageUtil.compressImage(566, 316, 0.5f, fileFullPath264);

            
			Long id = System.currentTimeMillis();
			JsonBack.print(response, "FILEID:" + "/upload/"	+ dynamicPath + "/" + dynamicName +"|"+id);			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			LOG.error(e.toString());
			res.setErrorCode(0);
			res.setMessage("上传出现问题，请稍后再试");
			JsonBack.print(response, res);
		} catch (IOException e) {
			e.printStackTrace();
			LOG.error(e.toString());
			res.setErrorCode(0);
			res.setMessage("上传出现问题，请稍后再试");
			JsonBack.print(response, res);
		}
		JsonBack.print(response, res);
	}

	/**
	 * 動態獲得文件的路徑
	 * 
	 * @param fileName
	 * @return
	 */
	private String getNewName(String fileName) {
		String newPath = String.valueOf(System.currentTimeMillis())
				+ fileName.substring(fileName.lastIndexOf("."));
		LOG.info("newPath === " + newPath);
		return newPath;
	}

	private String getNewDynamicPath() {
		DateFormat df = new SimpleDateFormat("yyyy-MM");
		return df.format(new Date());
	}
public static void main(String[] args) {
	String file = "sff/dfdf.jpg";
	String s = file.substring(file.lastIndexOf("."), file.length()-1);
	System.out.println(s);
}
}
