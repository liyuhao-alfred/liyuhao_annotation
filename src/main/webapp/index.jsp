<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>struts2 convention测试</title>
<style>
* {
	line-height: 2em;
}

a:visited, a:hover, a:active, a:link {
	color: #00f;
}
</style>
</head>
<body>
	后台Action&nbsp;
	<ul class="horizontal">
		<li>com.liyuhao.action.NavigatorAction</li>
		<li>com.liyuhao.action.child.ChildAction</li>
	</ul>
	页面资源&nbsp;
	<ul class="horizontal">
		<li>error.jsp</li>
		<li>index.jsp</li>
		<li>next.jsp</li>
		<li>child/next.jsp</li>
	</ul>
	<ul>
		<li>主题：确认action内默认执行方法是execute还是index<br />
			请求url：navigator.action&nbsp;&nbsp;<br /> 类型：dispatcher <br />
			方法：execute或index <br /> <a href="./navigator.action">执行默认方法</a></li>

		<li>主题：测试如何跳转到站外<br />
			请求url：navigator!redirect.action&nbsp;&nbsp; <br />
			类型：redirect（旧版本使用ServletRedirectResult.class） <br /> 方法：redirect <br />
			<a href="./navigator!redirect.action">跳转到站外</a></li>

		<li>主题：测试redirectAction、basePackage内子包action的映射、以及参数传递<br />
			请求url：navigator!redirectAction.action&nbsp;&nbsp; <br />
			类型：redirectAction （旧版本使用ServeltActionRedirectResult.class） <br />
			方法：redirectAction <br />
			location：child/child(basePackage=com.liyuhao.action,this&nbsp;package=com.liyuhao.action.child)
			<br /> <font color="red">注意</font><br />
			1：ChildAction内的execute方法返回指向location="next.jsp"，查看结果页面next.jsp是根目录资源还是/child/next.jsp资源
			<br /> 2： redirectAction方法向请求作用域设置了msg信息，查看是否显示了msg <br /> <a
			href="./navigator!redirectAction.action">跳转到站内action</a></li>

		<li>主题：测试redirectAction1、basePackage内子包action的映射、以及参数传递<br />
			请求url：navigator!redirectAction1.action&nbsp;&nbsp; <br />
			类型：redirectAction1 （旧版本使用ServeltActionRedirectResult.class） <br />
			方法：redirectAction1 <br />
			location：child/child(basePackage=com.liyuhao.action,this&nbsp;package=com.liyuhao.action.child)
			<br /> <font color="red">注意</font><br />
			1：ChildAction内的action方法返回指向location="next.jsp"，查看结果页面next.jsp是根目录资源还是/child/next.jsp资源
			<br /> 2： redirectAction1方法向请求作用域设置了msg信息，查看是否显示了msg <br /> <a
			href="./navigator!redirectAction1.action">跳转到站内action</a></li>

		<li>主题：错误跳转<br /> 请求url：navigator!error.action&nbsp;&nbsp; <br />
			<a href="./navigator!error.action">生成错误</a></li>

		<li>主题：@Action的使用已经Result的location绝对与相对的区别<br />
			使用注解@Action(value="/test/childTest") <br />
			请求url：/test/childTest.action&nbsp;&nbsp; <br /> <font color="red">注意</font>：类仍然是NavigatorAction
			<br /> <a href="./test/childTest.action">next.jsp为绝对路径</a></li>

		<li>主题：@Actions的使用<br /> 注解@Actions({
			@Action(value="/test/actions1"), @Action(value="/test/actions2") })<br />
			请求<br /> url：/test/action1.action <br /> url：/test/action2.action <br />
			<font color="red">注意</font>：类仍然是NavigatorAction <br /> <a
			href="./test/action1.action?actionName=action1">action1</a>&nbsp;<a
			href="./test/action2.action?actionName=action2">action2</a></li>
	</ul>
</body>
</html>
