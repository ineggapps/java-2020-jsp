package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class ForEachTag extends TagSupport {
	private static final long serialVersionUID = 1L;

	// c:forEach 클로닝...
	private Integer begin;
	private Integer end;
	private Integer step;
	private String var;

	public void setBegin(Integer begin) {
		this.begin = begin;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	public void setStep(Integer step) {
		this.step = step;
	}

	public void setVar(String var) {
		this.var = var;
	}

	@Override
	public int doStartTag() throws JspException {
		// #1. step은 없으면 1
		if (step == null) {
			step = 1;
		}
		// #2. 조건을 만족할 경우에만 몸체를 실행하도록 설정한다.
		if (step == 0 ||
				/* 양수일 때 멈추어야 하는 경우 */
				(begin > end && step > 0) ||
				/* 음수일 때 멈추어야 하는 경우 */
				(begin < end && step < 0)) {
			// 반복이 유효하지 않을 경우에는 몸체 실행을 막는다
			return SKIP_BODY;
		}
		pageContext.setAttribute(var, begin);
		// 최초 body를 실행하면 doAfterBody로 이동한다.
		return EVAL_BODY_AGAIN;
	}

	@Override
	public int doAfterBody() throws JspException {
		// #1. 조건을 만족할 경우에만 다시 실행한다.
		if (step > 0 && end >= begin + step) {
			begin += step;
			pageContext.setAttribute(var, begin);
			return EVAL_BODY_AGAIN;
		} else if (step < 0 && end <= begin + step) {
			begin += step;
			pageContext.setAttribute(var, begin);
			return EVAL_BODY_AGAIN;
		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		begin = end = step = null;
		var = null;
		return EVAL_PAGE; // JSP 다음 내용 실행하기
	}

}
