package com.bsb.cms.moss.task.spider;

import java.util.List;

import com.bsb.cms.model.po.spider.SpiderConfig;
import com.bsb.cms.moss.task.spider.vo.SpiderListModule;

public interface SpiderListService {

	List<SpiderListModule> getList(SpiderConfig spiderConfig);
}
