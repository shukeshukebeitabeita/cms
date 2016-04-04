package com.bsb.cms.moss.task.spider.jsoup;

import java.util.List;

import org.jsoup.nodes.Document;
import org.springframework.stereotype.Component;

import com.bsb.cms.commons.utils.ParseHTML;
import com.bsb.cms.model.po.spider.SpiderConfig;
import com.bsb.cms.moss.task.spider.SpiderListService;
import com.bsb.cms.moss.task.spider.vo.SpiderListModule;
@Component
public class SpiderListJsoupServiceImpl implements SpiderListService{

	@Override
	public List<SpiderListModule> getList(SpiderConfig spiderConfig) {
		
		try {
			Document doc = ParseHTML.parseDocumentFromUrl(spiderConfig.getListUrl());
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
