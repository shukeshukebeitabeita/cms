package com.bsb.cms.moss.controller.publisher;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bsb.cms.commons.web.JSONResultDTO;
import com.bsb.cms.model.dto.content.ContTypeDTO;

@Controller
@RequestMapping("/moss/pub/")
public class PublisherController {
	// log
	private static final Log log = LogFactory.getLog(PublisherController.class);
	@Resource(name="publisherRunnable")
	PublisherRunnable publisherRunnable;

	/**
	 * 发布栏目
	 * @param typeId
	 * @return
	 */
	@RequestMapping("pub_type.htm")
	@ResponseBody
	public JSONResultDTO publishType(String typeId) {
		JSONResultDTO result = new JSONResultDTO();
		try {
			ContTypeDTO type = new ContTypeDTO();
			type.setId(Long.valueOf(typeId));
			
			publisherRunnable.setType(type);
			Thread t = new Thread(publisherRunnable);
			t.start();
			log.debug("publisherRunnable start");
			
		} catch (Exception e) {
			result.setMessage("发布失败.请重试或联系管理员。");
			result.setResult(JSONResultDTO.ERROR);
			log.error(e.getMessage(), e.getCause());
		}

		return result;
	}
}


