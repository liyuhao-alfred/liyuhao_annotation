package com.liyuhao.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionContext;

@Results({ @Result(name = "next", location = "/next.jsp", type = "dispatcher"),
		@Result(name = "error", location = "error.jsp", type = "dispatcher"),
		@Result(name = "redirectAction", location = "./child/child", type = "redirectAction"),
		@Result(name = "redirectAction1", location = "./child/childAction", type = "redirectAction"),
		@Result(name = "redirect", location = "http://sunflowers.iteye.com", type = "redirect") })
public class NavigatorAction {
	private String actionName;

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String index() {
		outputMsg("method:index");
		return "next";
	}

	public String execute() {
		outputMsg("method:execute,no index method");
		return "next";
	}

	public String error() {
		try {
			throw new Exception();
		} catch (Exception e) {
			outputMsg(e);
			return "error";
		}
	}

	public String redirect() {
		System.out.println("重定向：rediret");
		return "redirect";
	}

	public String redirectAction() {
		outputMsg("navigatorAction 跳转而来，原地址是navigator!redirectAction.action，请查看地址栏");
		return "redirectAction";
	}

	public String redirectAction1() {
		outputMsg("navigatorAction1 跳转而来，原地址是navigator!redirectAction1.action，请查看地址栏");
		return "redirectAction1";
	}

	@Action(value = "/test/childTest")
	public String action() {
		outputMsg("@action ---method:action");
		return "next";
	}

	@Actions({ @Action(value = "/test/action1"), @Action(value = "/test/action2") })
	public String actions() {
		outputMsg("@actions ---method:actions,action=" + actionName);
		return "next";
	}

	private void outputMsg(Object msg) {
		System.out.println(msg);
		ActionContext.getContext().put("msg", msg);
	}
}