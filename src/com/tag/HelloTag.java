package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloTag extends TagSupport{
	private static final long serialVersionUID = 1L;

	/* 
	<a>몸체</a>
	<br /> (몸체 없음)
	<img src="속성이있는태그"/>
	 */
	

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try {
			out.print("<b>반가워요</b>");
		} catch (Exception e) {
			throw new JspException(e);
		}
		return SKIP_BODY;//몸체가 없는 태그
	}
	
	
	
}
