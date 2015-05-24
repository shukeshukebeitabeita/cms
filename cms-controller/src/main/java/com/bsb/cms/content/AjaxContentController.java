package com.bsb.cms.content;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bsb.cms.commons.web.JSONResultDTO;
import com.bsb.cms.content.service.content.ContContentService;
import com.bsb.cms.content.service.content.ContTypeCacheService;
import com.bsb.cms.model.dto.content.ContContentDTO;
import com.bsb.cms.model.dto.content.ContTypeDTO;
import com.bsb.cms.model.vo.content.TagContentVO;

/**
 * 右侧内容取得。
 * com.bsb.cms.tag.ContentListTag
 * @author liuhj
 *
 */
@Controller
@RequestMapping("/c/")
public class AjaxContentController {
	@Resource(name="contContentService")
	private ContContentService contContentService;
	@Resource(name="contTypeCacheService")
	private ContTypeCacheService contTypeCacheService;
	
	@RequestMapping(value = "get.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONResultDTO get(TagContentVO conditions) {
		JSONResultDTO result = new JSONResultDTO();
		Long typeId = null;
		ContTypeDTO contTypeDTO;
		List<ContContentDTO> contentList;
		try {
			contTypeDTO = contTypeCacheService.getById(typeId);
			conditions.setLevel(contTypeDTO.getDepth());
			contentList = contContentService.findListOfTag(conditions);
	
			result.setData(contentList);
		} catch (Exception e) {
			result.setMessage("AjaxContentController:get失败。");
			result.setResult(JSONResultDTO.ERROR);
			e.printStackTrace();
		}

		return result;
	}

}
