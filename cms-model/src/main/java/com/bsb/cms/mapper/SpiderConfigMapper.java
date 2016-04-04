package com.bsb.cms.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bsb.cms.model.po.spider.SpiderConfig;

@Repository
public interface SpiderConfigMapper {

	SpiderConfig selectByPrimaryKey(Long id);
	
	/**
	 * moss-列表页面搜索
	 * @param conditions
	 * @return
	 */
	List<SpiderConfig> findListPage(SpiderConfig conditions);
	
	int updateByPrimaryKey(SpiderConfig record);
	
	int insert(SpiderConfig record);
}
