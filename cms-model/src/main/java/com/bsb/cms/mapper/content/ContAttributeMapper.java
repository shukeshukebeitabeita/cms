package com.bsb.cms.mapper.content;

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
//    int insert(ContAttribute record);
//
//    int insertSelective(ContAttribute record);
//
//    List<ContAttribute> selectByExample(ContAttributeExample example);
//
//    
//
//    int updateByExampleSelective(@Param("record") ContAttribute record, @Param("example") ContAttributeExample example);
//
//    int updateByExample(@Param("record") ContAttribute record, @Param("example") ContAttributeExample example);
//
//    int updateByPrimaryKeySelective(ContAttribute record);
//
//    int updateByPrimaryKey(ContAttribute record);
	
	ContAttribute selectByPrimaryKey(Long id);
}