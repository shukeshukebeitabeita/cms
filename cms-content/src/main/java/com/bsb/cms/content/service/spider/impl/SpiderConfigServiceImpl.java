package com.bsb.cms.content.service.spider.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bsb.cms.commons.exceptions.NotFoundDaoException;
import com.bsb.cms.content.service.spider.SpiderConfigService;
import com.bsb.cms.mapper.SpiderConfigMapper;
import com.bsb.cms.model.po.spider.SpiderConfig;

@Service("spiderConfigService")
public class SpiderConfigServiceImpl implements SpiderConfigService {
	@Resource(name="spiderConfigMapper")
	private SpiderConfigMapper spiderConfigMapper;
	
	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContAttributeService#findById(java.lang.Long)
	 */
	@Override
	public SpiderConfig findById(Long id) {
		return spiderConfigMapper.selectByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContAttributeService#findListPage(com.bsb.cms.model.po.content.ContAttribute)
	 */
	@Override
	public List<SpiderConfig> findListPage(SpiderConfig conditions) {
		return spiderConfigMapper.findListPage(conditions);
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContAttributeService#create(com.bsb.cms.model.po.content.ContAttribute)
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public Long create(SpiderConfig record) {
		spiderConfigMapper.insert(record);
		return record.getId();
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContAttributeService#updateById(com.bsb.cms.model.po.content.ContAttribute)
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void updateById(SpiderConfig record) {
		int count = spiderConfigMapper.updateByPrimaryKey(record);
		if(count <= 0) throw new NotFoundDaoException("成功条数为0");
	}

	@Override
	public List<SpiderConfig> findAllList(SpiderConfig conditions) {
		return spiderConfigMapper.findAllList(conditions);
	}
}
