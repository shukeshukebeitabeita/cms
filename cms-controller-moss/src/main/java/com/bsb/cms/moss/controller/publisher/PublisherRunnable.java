package com.bsb.cms.moss.controller.publisher;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bsb.cms.content.service.content.ContContentPublisherService;
import com.bsb.cms.model.dto.content.ContTypeDTO;

@Component
public class PublisherRunnable implements Runnable {
	@Resource(name = "contContentPublisherService")
	private ContContentPublisherService contContentPublisherService;

	ContTypeDTO type;

	@Override
	public void run() {
		contContentPublisherService.publishType(type);
	};

	public void setType(ContTypeDTO type) {
		this.type = type;
	}
}
