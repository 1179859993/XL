package com.web.model.impl;

import java.util.List;

import com.web.dao.UserDao;
import com.web.dao.impl.UserDaoImpl;
import com.web.entity.Menu;
import com.web.entity.Page;
import com.web.entity.Role;
import com.web.entity.User;
import com.web.model.UserModel;

public class UserModelImpl implements UserModel{
	private UserDao userDao = new UserDaoImpl();
	
	
	public User loadUserByName(String userName) {
		return userDao.loadUserByName(userName);
	}

	/**
	 * 注册
	 */
	public void regUser(String userName, String userPass, String birth,
			int sex, String address, String phone, String school,
			int education, int work, String regdate) {
		userDao.regUser(userName, userPass, birth, sex, address, phone, school, education, work, regdate);
	}
	
	
	/**
	 * 加载所有用户
	 */
	public List<User> loadAllUsers() {
		System.out.println("模型层加载用户");
		
		return userDao.loadAllUsers();
	}
	/**
	 * 删除某一个用户
	 */
	public void deleteUser(String useName) {
		userDao.deleteUser(useName);
	}

	/**
	 * 查看某一个用户
	 */
	public User showUser(String useName) {
		return userDao.showUser(useName);
	}
	
	/**
	 * 添加班级
	 */
	public void addClass(String sName,int sType,String remark,long creationTime,long beginTime,long graduationTime){
		userDao.addClass(sName,sType,remark,creationTime,beginTime,graduationTime);
	}

	/**
	 * 添加学生
	 */
	public void addStudent(String studentName,String className) {
		userDao.addStudent(studentName, className);
	}

	/**
	 * 查看班级列表
	 */
	public List<Object[]> loadAllClass() {
		
		return userDao.loadAllClass();
	}

	/**
	 * 查看学生列表
	 */
	public List<Object[]> loadAllStudent() {

		return userDao.loadAllStudent();
	}

	/**
	 * 返回一个菜单集合
	 * 
	 * @param userName
	 * @return
	 */
	public List<Menu> loadMenu(String userName) {

		return userDao.loadMenu(userName);
	}


	/**
	 * 返回一个所有一级和二级的菜单集合
	 * 
	 * @param
	 * @return
	 */
	public List<Menu> loadAll12Menu() {

		return userDao.loadAll12Menu();
	}
	
	/**
	 * 在添加菜单选项中通过父级菜单的mid去查询相对应的等级level
	 * @param 
	 * @return
	 */
	public int loadLevelByMid(int mid){
		return userDao.loadLevelByMid(mid);
	}
	
	
	/**
	 * 真正的添加菜单选项来了
	 */
	public void addMenu(String mname,String url,int isshow,int parentid){
		int level = userDao.loadLevelByMid(parentid);
		userDao.addMenu(mname, url, isshow, level+1, parentid);
	}

	/**
	 * 查询所有的角色 返回所有的角色的集合
	 */
	public List<Role> showAllRoles(){
		
		return userDao.showAllRoles();
	}
	
	/**
	 * 通过角色的rid去查询他所拥有的菜单
	 */
	public List<Object[]> showMenubyRole_Rid(int rid){
		
		return userDao.showMenubyRole_Rid(rid);
	}
	
	/**
	 * 执行修改角色所拥有的菜单
	 */
	public void executeAlterMenu(int roleRid,int [] menusMid){
		userDao.executeAlterMenu(roleRid, menusMid);
	}
	
	/**
	 * 通过用户登录成功后的用户sid和用户拥有的权限（用户可以查看的菜单）的url 去rolemenu里查询
	 * 看返回的结果是否同时在一条记录中存在sid和url，存在着说明他有权查看这个链接里面的东西
	 * 查询用户的权利 用于拦截器里面的判断
	 */
	public boolean executeUserPower(int sid ,String methodName){
		return userDao.executeUserPower(sid, methodName);
	}
	
	
	
	

	@Override
	public void regUser(String userName, String userPass, String birth,
			String sex, String address, String phone, String school,
			String education, String work, String regdate) {
		userDao.executeAlterUser(userName, userPass,birth, sex, address, phone, school,education,work,regdate);
	}

	

	

}
