package com.bsb.cms.mapper.content;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bsb.cms.model.po.content.ContType;

@Repository
public interface ContTypeMapper {
//    int countByExample(ContTypeExample example);
//
//    int deleteByExample(ContTypeExample example);
//
//    int deleteByPrimaryKey(Long id);
//
//    int insert(ContType record);
//
//    int insertSelective(ContType record);
//
//    List<ContType> selectByExample(ContTypeExample example);
//
//    ContType selectByPrimaryKey(Long id);
//
//    int updateByExampleSelective(@Param("record") ContType record, @Param("example") ContTypeExample example);
//
//    int updateByExample(@Param("record") ContType record, @Param("example") ContTypeExample example);
//
//    int updateByPrimaryKeySelective(ContType record);
//
//    int updateByPrimaryKey(ContType record);
	
	/**
	 * 查询用户有权看到的栏目。显示在左侧
	 * @param sysUserId
	 * @return
	 */
	List<ContType> findByUser(Long sysUserId);
	
	/**
	 * find type by id
	 * @param id
	 * @return
	 */
	ContType selectByPrimaryKey(Long id);
	
	ContType selectByEnglishName(String fileName);
}