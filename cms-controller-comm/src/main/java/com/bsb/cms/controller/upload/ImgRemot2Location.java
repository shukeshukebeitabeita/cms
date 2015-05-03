package com.bsb.cms.controller.upload;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.bsb.cms.commons.utils.ParseHTML;

@Component
public class ImgRemot2Location {
	@Value("${media.upload.basePath}")
	private String imgPath;
	
	@Value("${common.static}")
	private String staticWeb;
	/**
	 * keyword --> img.alt
	 * @param html
	 * @return 1:主图； 2：替换远程图片后的html
	 */
	public String[] transfer(String html, String keyword){
		String localImg;
		String[] returns = new String[2];
		Document doc = ParseHTML.parseHtmlFromString(html);
		Elements pngs = doc.select("img[src]");
		
	      for (Element element : pngs) {
	        String imgUrl = element.attr("src");
	        //if (imgUrl.trim().startsWith("/")) {
	        if (!imgUrl.trim().startsWith("http://www.alijiagou.com")) {
	        	localImg = ImageUtil.returnImg(imgUrl, imgPath);
	        	if(localImg!=null){
	        		element.attr("src", staticWeb + "/upload/" + localImg);
	        		if(StringUtils.isBlank(element.attr("alt"))){
	        			element.attr("alt", keyword);
	        		}
	        	}
	        	
	        }
	      }
	      
	      returns[1] = doc.children().outerHtml();
	     
	      returns[0] = "";
	      
		return returns;
	}
	
	
	

//	public  Map<String, String> getImgsSrc(String html){
//		String localImg;
//		Map<String, String> imgSrcs = new HashMap<String, String>();
//		Document doc = ParseHTML.parseHtmlFromString(html);
//		Elements pngs = doc.select("img[src]");
//		
//	      for (Element element : pngs) {
//	        String imgUrl = element.attr("src");
//	        //if (imgUrl.trim().startsWith("/")) {
//	        if (!imgUrl.trim().startsWith("http://www.alijiagou.com")) {
//	          //element.attr("src", imgUrl);
//	        	localImg = ImageUtil.returnImg(imgUrl, imgPath);
//	        	if(localImg!=null){
//	        		imgSrcs.put(imgUrl, localImg);
//	        	}
//	        	
//	        }
//	      }
//	      //newsBody = doc.toString();
//	      return imgSrcs;
//	}

}
