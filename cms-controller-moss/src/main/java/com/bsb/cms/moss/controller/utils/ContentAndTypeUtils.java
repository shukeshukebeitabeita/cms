package com.bsb.cms.moss.controller.utils;

import com.bsb.cms.content.service.content.ContTypeCacheService;
import com.bsb.cms.model.dto.content.ContTypeDTO;
import com.bsb.cms.model.po.content.ContContent;

public class ContentAndTypeUtils {

	public static void setAllParentId(
			ContTypeCacheService contTypeCacheService, ContContent content) {
		ContTypeDTO type1;
		ContTypeDTO type2;
		ContTypeDTO type = contTypeCacheService.getById(content.getTypeId());
		if(type.getDepth() == 1) {
			content.setTypeId1(type.getId());
		} else if(type.getDepth() == 2) {
			content.setTypeId2(type.getId());
			content.setTypeId1(type.getParent_id());
		} else if(type.getDepth() == 3) {
			content.setTypeId3(type.getId());
			content.setTypeId2(type.getParent_id());
			type1 = contTypeCacheService.getById(type.getParent_id());
			content.setTypeId1(type1.getId());
		} else if(type.getDepth() == 4) {
			content.setTypeId4(type.getId());
			content.setTypeId3(type.getParent_id());
			type2 = contTypeCacheService.getById(type.getParent_id());
			content.setTypeId2(type2.getParent_id());
			type1 = contTypeCacheService.getById(type2.getParent_id());
			content.setTypeId1(type1.getId());
		}
			
	}
}
