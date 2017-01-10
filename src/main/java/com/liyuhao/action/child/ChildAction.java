package com.liyuhao.action.child;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionContext;

@Results({ @Result(name = "next", location = "next.jsp", type = "dispatcher") })
public class ChildAction {
	private String actionName;

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String execute() {
		System.out.println("childAction 默认方法执行");
		return "next";
	}

	@Action(value = "/child/childAction")
	public String action() {
		outputMsg("@action ---method:com.liyuhao.action.child.action");
		return "next";
	}

	private void outputMsg(Object msg) {
		System.out.println(msg);
		ActionContext.getContext().put("msg", msg);
	}
}