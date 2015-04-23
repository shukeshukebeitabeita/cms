package com.bsb.cms.tag;

import java.io.IOException;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.bsb.cms.commons.web.SpringContextUtil;
import com.bsb.cms.content.service.content.ContContentService;
import com.bsb.cms.model.vo.content.TagContentVO;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 获取多条内容标签。 <cms:clist type_id="1,2", sort="[{id,asc},{name,desc}]" sql=""
 * count=10></cms:clist>
 * 
 * @author liuhj
 * 
 */
public class ContentListTag implements TemplateDirectiveModel {
	private static final Log log = LogFactory.getLog(ContentListTag.class);
	private ContContentService ContContentService;

	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		try {
			if (body != null) {
				TagContentVO tag;
				TemplateModel type_id = (TemplateModel) params.get("type_id");

				Long typeId;
				if (type_id != null) {
					typeId = Long.valueOf(type_id.toString());
				}

				tag = new TagContentVO();
				tag.setType_id(typeId);
				tag.setLevel(level);
				QuanNewestMemberDTO quanNewestMemberDTO = getQuanHeaderInfo(
						quanIdLong, quanGroup.getMasterId());
				setVariable(env, "quanMasterInfo", quanNewestMemberDTO);

				body.render(env.getOut());
			} else {
				throw new TemplateException("clist标签解析错误", env);
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

	}

	private void setVariable(Environment env, String name, Object value)
			throws Exception {
		env.setVariable(name, ObjectWrapper.DEFAULT_WRAPPER.wrap(value));// 标签内有效
		// env.getConfiguration().setSharedVariable(key,
		// value);//全局有效。多个页面中的标签共享。数据串供了
	}

	/**
	 * get bean
	 * 
	 * @return
	 */
	private ContContentService getContContentService() {
		if (ContContentService == null) {
			ContContentService = SpringContextUtil
					.getApplicationContextInstance().getBean(
							"contContentService", ContContentService.class);
		}

		return ContContentService;
	}
}
