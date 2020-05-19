package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class ForEachTag extends TagSupport {
	private static final long serialVersionUID = 1L;

	// c:forEach Ŭ�δ�...
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
		// #1. step�� ������ 1
		if (step == null) {
			step = 1;
		}
		// #2. ������ ������ ��쿡�� ��ü�� �����ϵ��� �����Ѵ�.
		if (step == 0 ||
				/* ����� �� ���߾�� �ϴ� ��� */
				(begin > end && step > 0) ||
				/* ������ �� ���߾�� �ϴ� ��� */
				(begin < end && step < 0)) {
			// �ݺ��� ��ȿ���� ���� ��쿡�� ��ü ������ ���´�
			return SKIP_BODY;
		}
		pageContext.setAttribute(var, begin);
		// ���� body�� �����ϸ� doAfterBody�� �̵��Ѵ�.
		return EVAL_BODY_AGAIN;
	}

	@Override
	public int doAfterBody() throws JspException {
		// #1. ������ ������ ��쿡�� �ٽ� �����Ѵ�.
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
		return EVAL_PAGE; // JSP ���� ���� �����ϱ�
	}

}
