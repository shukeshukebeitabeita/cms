package com.bsb.cms.controller.upload;

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
	@Value("${common.host}")
	private String hostDomain;
	
	/**
	 * keyword --> img.alt
	 * @param html
	 * @return 1:主图； 2：替换远程图片后的html
	 */
	public String[] transfer(String html, String keyword){
		String localImg;
		String defaultPath = null;
		String[] returns = new String[2];
		Document doc = ParseHTML.parseHtmlFromString(html);
		Elements pngs = doc.select("img[src]");
		if(keyword == null){
			keyword = "";
		}
		if(pngs != null){
	      for (Element element : pngs) {
	        String imgUrl = element.attr("src");
	        //if (imgUrl.trim().startsWith("/")) {
	        if (!imgUrl.trim().startsWith(hostDomain)) {
	        	localImg = ImageUtil.returnImg(imgUrl, imgPath);
	        	if(localImg!=null){
	        		element.attr("src", staticWeb + "/upload/" + localImg);
	        		if(StringUtils.isBlank(element.attr("alt"))){
	        			element.attr("alt", keyword);
	        		}
	        		
	        		if(defaultPath==null) {
	        			defaultPath = "/upload/" + localImg+ ImageUtil.getDefaultImg(imgPath, localImg);//压缩一张默认图片
	        		}
	        	}
	        	
	        }
	      }
	    }
	      returns[1] = doc.children().outerHtml();
	     
	      returns[0] = defaultPath;
	      
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
