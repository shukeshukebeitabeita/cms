package com.bsb.cms.mapper.content;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bsb.cms.model.po.content.ContContentBody;
import com.bsb.cms.model.po.content.ContContentBodyKey;

public interface ContContentBodyMapper {
//    int countByExample(ContContentBodyExample example);
//
//    int deleteByExample(ContContentBodyExample example);
//
//    int deleteByPrimaryKey(ContContentBodyKey key);
//
//    int insert(ContContentBody record);
//
//    int insertSelective(ContContentBody record);
//
//    List<ContContentBody> selectByExampleWithBLOBs(ContContentBodyExample example);
//
//    List<ContContentBody> selectByExample(ContContentBodyExample example);
//
//    ContContentBody selectByPrimaryKey(ContContentBodyKey key);
//
//    int updateByExampleSelective(@Param("record") ContContentBody record, @Param("example") ContContentBodyExample example);
//
//    int updateByExampleWithBLOBs(@Param("record") ContContentBody record, @Param("example") ContContentBodyExample example);
//
//    int updateByExample(@Param("record") ContContentBody record, @Param("example") ContContentBodyExample example);
//
//    int updateByPrimaryKeySelective(ContContentBody record);
//
//    int updateByPrimaryKeyWithBLOBs(ContContentBody record);
//
//    int updateByPrimaryKey(ContContentBody record);
	
	int insert(ContContentBody record);
}