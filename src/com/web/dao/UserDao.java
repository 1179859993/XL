package com.web.dao;

import java.util.List;

import com.web.entity.Page;
import com.web.entity.Menu;
import com.web.entity.Role;
import com.web.entity.User;

public interface UserDao {
	public User loadUserByName(String userName);

	/**
	 * 加载所有用户
	 */
	public List<User> loadAllUsers();
	
	/**
	 * 注册一个用户
	 */
	public void regUser(String userName, String userPass, String birth,
			int sex, String address, String phone, String school,
			int education, int work, String regdate);
	/**
	 * 删除某一个用户
	 */
	public void deleteUser(String useName);
	
	/**
	 * 查看某一个用户
	 */
	public User showUser(String useName);
	
	/**
	 * 添加班级
	 */
	public void addClass(String sName,int sType,String remark,long creationTime,long beginTime,long graduationTime);
	
	/**
	 * 添加学生
	 */
	public void addStudent(String studentName,String className);
	
	/**
	 * 查看班级列表
	 */
	public List<Object[]> loadAllClass();
	
	/**
	 * 查看学生列表
	 */
	public List<Object[]> loadAllStudent();
	
	/**
	 * 返回一个不同角色的菜单集合
	 * @param userName
	 * @return
	 */
	public List<Menu> loadMenu(String userName);
	
	/**
	 * 返回一个所有一级和二级的菜单集合
	 * @param 
	 * @return
	 */
	public List<Menu> loadAll12Menu();
	
	/**
	 * 在添加菜单选项中通过父级菜单的mid去查询相对应的等级level
	 * @param 
	 * @return
	 */
	public int loadLevelByMid(int mid);
	
	/**
	 * 真正的添加菜单选项来了
	 */
	public void addMenu(String mname,String url,int isshow,int level,int parentid  );
	
	/**
	 * 查询所有的角色 返回所有的角色的集合
	 */
	public List<Role> showAllRoles();
	
	/**
	 * 查询不同角色拥有的不同的菜单，就是不同角色能操作的菜单
	 */
	public List<Object[]> showMenubyRole_Rid(int rid);
	
	/**
	 * 执行修改角色所拥有的菜单
	 */
	public void executeAlterMenu(int roleRid,int [] menusMid);
	
	/**
	 * 通过用户登录成功后的用户sid和用户拥有的权限（用户可以查看的菜单）的url 去rolemenu里查询
	 * 看返回的结果是否同时在一条记录中存在sid和url，存在着说明他有权查看这个链接里面的东西
	 * 查询用户的权利 用于拦截器里面的判断
	 */
	public boolean executeUserPower(int sid ,String url);
	
	
	
	
	public void executeAlterUser(String userName, String userPass,
			String birth, String sex, String address, String phone,
			String school, String education, String work, String regdate);
}

	
