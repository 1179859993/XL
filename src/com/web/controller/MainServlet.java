package com.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.web.entity.Menu;
import com.web.entity.Page;
import com.web.entity.Role;
import com.web.entity.User;
import com.web.model.UserModel;
import com.web.model.impl.UserModelImpl;
import com.web.util.DBUtil;

public class MainServlet extends HttpServlet{
	//控制层拥有模型层对象
	private UserModel userModel = new UserModelImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		String methodName = req.getParameter("methodName");
		Class c = MainServlet.class;
		try {
			Method m = c.getMethod(methodName , HttpServletRequest.class,HttpServletResponse.class);
			m.invoke(this, req,resp);
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 登录
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void login(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException{
		String username = req.getParameter("userName");
		String userPass = req.getParameter("userPass");
		System.out.println(username + "==>" + userPass);
		User user = userModel.loadUserByName(username);
		if(null == user){
			req.setAttribute("loginError", "此账号不存在");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}else{
			if(userPass.equals(user.getUserPass())){
				 HttpSession session = req.getSession();
			     session.setAttribute("user", user);
			     //返回一个菜单的集合出来
			     List<Menu> menu =  userModel.loadMenu(username);
			     session.setAttribute("menu", menu);
			     System.out.println("=========================");
				req.getRequestDispatcher("index.jsp").forward(req, resp);	
			}else{
				req.setAttribute("loginError", "密码错误");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
		}
	}
	/**
	 * 注册
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void reg(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		resp.setCharacterEncoding("utf-8");
		String userName = req.getParameter("userName");//名字
		String userPass = req.getParameter("userPass");
		Date t = new Date();
		DateFormat d = DateFormat.getDateInstance();
		String birth = d.format(t);
		
		String sex= req.getParameter("sex");
		String address = req.getParameter("address");
		String phone = req.getParameter("phone");
		String school = req.getParameter("school");
		String education = req.getParameter("education");
		String work = req.getParameter("work");
		
		Date time = new Date();
		DateFormat dfTime = DateFormat.getDateInstance();
		String regdate = dfTime.format(time);
		if (null != userModel.showUser(userName)) {
			req.setAttribute("regError", "已经存在这个账户了，不能注册！");
			req.getRequestDispatcher("reg.jsp").forward(req, resp);
		} else {
			req.setAttribute("regError", "注册成功！");
			userModel.regUser(userName, userPass,birth, sex, address, phone, school,education,work,regdate);
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
		
	}
	
	/**
	 * 添加班级
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addClass(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		String sName = req.getParameter("sName");
		int sType = req.getIntHeader("sType");
		String remark = req.getParameter("remark");
		long creationTime = req.getDateHeader("creationTime");
		long beginTime = req.getDateHeader("beginTime");
		long graduationTime = req.getDateHeader("graduationTime");
		
		userModel.addClass(sName,sType,remark,creationTime,beginTime,graduationTime);
		//传一个添加成功过去
		req.setAttribute("Prompt", sName+sType+remark+creationTime+beginTime+graduationTime+"添加成功");
		req.getRequestDispatcher("view/addClass.jsp").forward(req, resp);
		
	}
	
	/**
	 * 查看班级
	 */
	
	
	
	
	
	/**
	 * 安全退出
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logout(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException{
		req.getSession().invalidate();
		resp.sendRedirect("longin.jsp");
	}
	
	
	
	
	/**
	 * 查看所有的一级和二级菜单
	 */
	public void toAddMenu(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException{
		List<Menu> list =userModel.loadAll12Menu();
		
		//req.setAttribute("menuvoList", list);
		//req.getRequestDispatcher("/view/addMenu.jsp").forward(req, resp);
		
	}
	
	
	/**
	 * 添加菜单
	 */
	public void addMenu(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException{
		String mname = req.getParameter("menuName");
		String url = req.getParameter("url");
		String isshow = req.getParameter("isshow");
		String parentid = req.getParameter("mid");//父级菜单的编号
		userModel.addMenu(mname, url, Integer.valueOf(isshow), Integer.valueOf(parentid));
		req.getRequestDispatcher("showAllMenu.do?methodName=showAllMenu").forward(req, resp);
	}
	
	
	
	/**
	 * 通过角色的rid 去找到他对应的所拥有的菜单
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showRoleMenu(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException{
		int rid = Integer.valueOf(req.getParameter("rid"));
		List<Object[]>  menuList = userModel.showMenubyRole_Rid(rid);	
		req.setAttribute("menuList", menuList);
		req.setAttribute("rid", rid);
		req.getRequestDispatcher("view/alterRoleMenu.jsp").forward(req, resp);
	}
	
	
	
	
	
	
	
	
}


