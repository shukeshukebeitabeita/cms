package com.bsb.cms.moss.task.spider;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bsb.cms.content.service.spider.SpiderConfigService;
import com.bsb.cms.model.po.spider.SpiderConfig;
import com.bsb.cms.moss.task.spider.vo.SpiderListModule;

@Component
public class SpiderTimer {
	@Resource(name = "spiderConfigService")
	private SpiderConfigService spiderConfigService;
	@Autowired
	private SpiderListService spiderListService;

	public void run() {
		List<SpiderConfig> configs = spiderConfigService
				.findAllList(new SpiderConfig());
		
		if(CollectionUtils.isEmpty(configs)){
			return;
		}
		List<SpiderListModule> listModule;
		for (SpiderConfig spiderConfig : configs){
			listModule = spiderListService.getList(spiderConfig);//列表页采集
			//内容页采集
			
			//内容入库与发布
			
			
		}
	}
}
