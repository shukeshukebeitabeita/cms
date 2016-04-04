package com.bsb.cms.content.service.spider;

import java.util.List;

import com.bsb.cms.model.po.spider.SpiderConfig;

public interface SpiderConfigService {
	
	SpiderConfig findById(Long id);

	/**
	 * 列表页面搜索
	 * @param conditions
	 * @return
	 */
	List<SpiderConfig> findListPage(SpiderConfig conditions);
	
	Long create(SpiderConfig record);
	
	void updateById(SpiderConfig record);
}
