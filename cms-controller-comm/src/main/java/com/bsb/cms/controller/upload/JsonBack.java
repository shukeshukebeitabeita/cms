package com.bsb.cms.controller.upload;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-9-4
 * @since 1.0
 */
public class JsonBack {
	 public static void print(HttpServletResponse response, Object obj) {
	        PrintWriter pw = null;
	        try {
	            pw = response.getWriter();
	            response.setCharacterEncoding("UTF-8");
	            response.setContentType("text/html;charset=UTF-8");
	            pw.print(obj);
	            pw.flush();
	            pw.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
}
