package com.bsb.cms.mapper.content;

import java.util.List;

import com.bsb.cms.model.po.content.ContContent;
import com.bsb.cms.model.vo.content.ContentSearchVO;

public interface ContContentMapper {
//    int countByExample(ContContentExample example);
//
//    int deleteByExample(ContContentExample example);
//
//    int deleteByPrimaryKey(Long id);
//
//    List<ContContent> selectByExample(ContContentExample example);
//
//    ContContent selectByPrimaryKey(Long id);
//
//    int updateByExampleSelective(@Param("record") ContContent record, @Param("example") ContContentExample example);
//
//    int updateByExample(@Param("record") ContContent record, @Param("example") ContContentExample example);
//
//    int updateByPrimaryKeySelective(ContContent record);
//
//    int updateByPrimaryKey(ContContent record);
	/**
	 * moss-列表页面搜索
	 * @param conditions
	 * @return
	 */
	List<ContContent> findListPage(ContentSearchVO conditions);
	/**
	 * create
	 * @param content
	 * @return
	 */
	Long insert(ContContent record);
	
	int insertSelective(ContContent record);
}