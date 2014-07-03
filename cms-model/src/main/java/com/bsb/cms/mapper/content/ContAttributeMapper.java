package com.bsb.cms.mapper.content;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bsb.cms.model.po.content.ContAttribute;

@Repository
public interface ContAttributeMapper {
//    int countByExample(ContAttributeExample example);
//
//    int deleteByExample(ContAttributeExample example);
//
//    int deleteByPrimaryKey(Long id);
//
//    int insertSelective(ContAttribute record);
//
//    List<ContAttribute> selectByExample(ContAttributeExample example);
//    
//    int updateByExampleSelective(@Param("record") ContAttribute record, @Param("example") ContAttributeExample example);
//
//    int updateByExample(@Param("record") ContAttribute record, @Param("example") ContAttributeExample example);
//
//    int updateByPrimaryKeySelective(ContAttribute record);
//
	
	ContAttribute selectByPrimaryKey(Long id);
	
	/**
	 * moss-列表页面搜索
	 * @param conditions
	 * @return
	 */
	List<ContAttribute> findListPage(ContAttribute conditions);
	
	int updateByPrimaryKey(ContAttribute record);
	
	int insert(ContAttribute record);
}