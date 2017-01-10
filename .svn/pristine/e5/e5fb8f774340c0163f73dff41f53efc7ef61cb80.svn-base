package com.liyuhao.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.convention.annotation.ResultPath;
import org.springframework.beans.factory.annotation.Autowired;

import com.liyuhao.entity.*;
import com.liyuhao.service.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", location = "/success.jsp", type = "dispatcher"),
		@Result(name = "login", location = "login.jsp", type = "dispatcher") })
public class adminAction extends ActionSupport {

	private String name;
	private String password;
	private Admin admin;
	@Autowired
	private adminService adminService;

	public String execute() throws Exception {
		return "login";
	}

	@Actions({ @Action(value = "/login"), @Action(value = "/login1") })
	public String login() throws IOException {
		admin = adminService.login(name, password);
		if (admin == null) {
			return "login";
		} else {
			ActionContext.getContext().put("info", admin.toString());
			return "success";
		}
	}

	@Action(value = "/admin/login")
	public String loginTest() throws IOException {
		int s = adminService.findAll().size();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/data; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(s);
		out.flush();
		out.close();
		return null;
	}

	// http://localhost:8080/liyuhao/admin!error.action
	public String error() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/data; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write("error");
		out.flush();
		out.close();
		return null;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

}
