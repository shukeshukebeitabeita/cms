
package com.bsb.cms.test;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bsb.cms.mapper.BlogMapper;
import com.bsb.cms.model.po.Blog;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-5-21
 * @since 1.0
 */
@Controller
//@RestController
public class Test {
	@Resource
	private BlogMapper blogMapper;

	@RequestMapping("/index.htm")
	public String test(){
		Blog b = blogMapper.selectBlog(1);
		System.out.println("////////////////////--" + b.getId());
		return "index";
	}
	
	@RequestMapping("/list.htm")
	public String testList(){
		List<Blog> b = blogMapper.blogListPage(0);
		System.out.println("////////////////////--" + b.size());
		return "index";
	}
	
	public String t(){
		return null;
	}
}
