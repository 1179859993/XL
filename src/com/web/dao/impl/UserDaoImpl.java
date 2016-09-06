package com.web.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.web.dao.UserDao;
import com.web.entity.Menu;
import com.web.entity.Page;
import com.web.entity.Role;
import com.web.entity.User;
import com.web.util.DBUtil;

public class UserDaoImpl implements UserDao {

	public User loadUserByName(String userName) {
		User user = null;
		String sql = "select * from user where userName = ?  ";
		Object[] m = {userName};
		List<Object[]> list = DBUtil.DQL(sql,m);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(list.size()>0){
			Object[] os = list.get(0);
			user = new User((Integer)(os[0]),userName, (String)(os[2]), sdf.format((Date)(os[3])), (Integer)(os[4]), (String)(os[5]), (String)(os[6]), (String)(os[7]), (Integer)(os[8]), (Integer)(os[9]), sdf.format((Date)(os[10])));
		}
		return user;
	}

	/**
	 * 注册用户
	 */
	public void regUser(String userName, String userPass, String birth,
			int sex, String address, String phone, String school,
			int education, int work, String regdate) {
		String sql = "insert into  user(userName, userPass, sex, birth, sex, address, phone,school,education,work,regdate) values  (?,?,?,?,?,?,?,?,?,?)";
		DBUtil.DML(sql,new Object[]{userName, userPass, sex, birth, sex, address, phone,school,education,work,regdate});
	}
	
	
	/**
	 * 查询所有用户
	 */
	public List<User> loadAllUsers() {
		String sql = "select * from user";
		List<Object[]> list = DBUtil.DQL(sql, null);
		List<User> list1= new ArrayList<User>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(Object[] os : list){
			User user = new User((Integer)(os[0]),(String)(os[1]), (String)(os[2]), sdf.format((Date)(os[3])), (Integer)(os[4]), (String)(os[5]), (String)(os[6]), (String)(os[7]), (Integer)(os[8]), (Integer)(os[9]), sdf.format((Date)(os[10])));
			list1.add(user);
		}
		return list1;
	}

	/**
	 * 删除某一个用户
	 */
	public void deleteUser(String useName) {
		System.out.println(useName);
		String sql = "delete from user where username = ?";
		Object[]m={useName};
		DBUtil.DML(sql, m);
	}

	

	/**
	 * 添加班级
	 */
	public void addClass(String sName,int sType,String remark,long creationTime,long beginTime,long graduationTime) {
		Object[] m = {sName,sType,remark,creationTime,beginTime,graduationTime};
		String sql = "insert into class(sName,sType,remark,creationTime,beginTime,graduationTime) values (?,?,?,?,?,?)";
		DBUtil.DML(sql, m);
	}

	/**
	 * 添加学生
	 */
	public void addStudent(String studentName, String className) {
		Date date = new Date();
		String sql = "select * from class where cname = ?";
		List<Object []> list = DBUtil.DQL(sql, new Object[]{className});
		Object [] m = list.get(0);
		sql = "insert into student(sname,sdate,cid) values (?,?,?)";
		Object[] n = {studentName,date,m[0]};
		DBUtil.DML(sql, n);
	}

	/**
	 * 查看班级列表
	 */
	public List<Object[]> loadAllClass() {
		String sql = "select * from class order by cdate desc ";
		List<Object[]>list = DBUtil.DQL(sql, null);
		return list;
	}

	/**
	 * 查看学生列表
	 */
	public List<Object[]> loadAllStudent() {
		String sql = "select * from student order by sdate desc";
		List<Object[]>list = DBUtil.DQL(sql, null);
		return list;
	}

	


	/**
	 * 返回一个所有一级和二级的菜单集合
	 * @param 
	 * @return
	 */
	public List<Menu> loadAll12Menu(){
		String sql ="select *  from menu m  where m.level in (1,2)";
		List<Object[]>list = DBUtil.DQL(sql, null);
		List<Menu> list1= new ArrayList<Menu>();
		for(Object[] m : list){
			Menu menu = new Menu((Integer)m[0], (String)m[1], (String)m[2], (Integer)m[3], (Integer)m[4], (Integer)m[5]);
			list1.add(menu);
		}
		return list1;
	}
	
	/**
	 * 在添加菜单选项中通过父级菜单的mid去查询相对应的等级level
	 * @param 
	 * @return
	 */
	public int loadLevelByMid(int mid){
		String sql ="select *  from menu m  where m.mid = ?";
		List<Object[]>list = DBUtil.DQL(sql, new Object[]{mid});
		List<Menu> list1= new ArrayList<Menu>();
		for(Object[] m : list){
			Menu menu = new Menu((Integer)m[0], (String)m[1], (String)m[2], (Integer)m[3], (Integer)m[4], (Integer)m[5]);
			list1.add(menu);
		}
		int i = list1.get(0).getLevel();
		return i;
	}
	 
	/**
	 * 真正的添加菜单选项来了
	 */
	public void addMenu(String mname,String url,int isshow,int level,int parentid  ){
		String sql = "insert into menu( mname, url,isshow, level, parentid ) values(?,?,?,?,?) ";
		 DBUtil.DML(sql,new Object[]{mname, url,isshow, level, parentid});
	}
	
	/**
	 * 查询所有的角色
	 */
	public List<Role> showAllRoles(){
		String sql ="select *  from role ";
		List<Object[]>list = DBUtil.DQL(sql, null);
		List<Role> list1= new ArrayList<Role>();
		for(Object[] m : list){
			Role role = new Role((Integer)m[0], (String)m[1]);
			list1.add(role);
		}
		return list1;
	}

	/**
	 * 通过角色的rid去查询他所拥有的菜单
	 */
	public List<Object[]> showMenubyRole_Rid(int rid) {
		String sql ="select m.mid , m.mname ,m.parentid,(SELECT 1 from rolemenu rm  WHERE rm.mid = m.mid and  rm.rid = ?) from   menu m  where parentid >0 ";
		List<Object[]>menuList = DBUtil.DQL(sql, new Object[]{rid});
		return menuList;
	}
	
	/**
	 * 执行修改角色所拥有的菜单------------------------------------
	 */
	public void executeAlterMenu(int roleRid,int [] menusMid){
		//先执行删除原来角色所对应的菜单选项
		String sql = "delete from rolemenu where rid = ?";
		DBUtil.DML(sql, new Object []{roleRid});
		//然后执行插入数据到原来的角色里面
		sql ="insert into rolemenu(rid,mid) values(?,?) ";
		for(int i = 0 ;i <menusMid.length;i++ ){
			DBUtil.DML(sql,new Object[]{roleRid,menusMid[i]});
		}
	}

	/**
	 * 通过用户登录成功后的用户sid和用户拥有的权限（用户可以查看的菜单）的url 去rolemenu里查询
	 * 看返回的结果是否同时在一条记录中存在sid和url，存在着说明他有权查看这个链接里面的东西
	 * 查询用户的权利 用于拦截器里面的判断
	 */
	public boolean executeUserPower(int sid ,String methodName){
		//先查询url对应的在菜单栏中的mid
		String sql = "select mid from menu where url like ?";
		List<Object[]> list = DBUtil.DQL(sql, new Object []{"%"+methodName+"%"});
		int i = 0;
		if(null !=list && list.size()>0){
			Object[]m = list.get(0);
			i = (Integer)m[0];
		}
		
		
		//通过用户的sid 去查询查询他的角色的rid
		sql = "select rid from  userrole where sid = ?";
		List<Object[]> list1 = DBUtil.DQL(sql, new Object []{sid});
		Object[]m1 = list1.get(0);
		int j = (Integer)m1[0];
		
		//执行查询这个角色为编号为rid的用户是否拥有这个mid
		sql = "select * from rolemenu  where  rid = ? and mid = ?";
		List<Object[]> list2 = DBUtil.DQL(sql, new Object []{j,i});
		//假如查到有相对应的则返回true，没有返回false
		if(list2.size()>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public void executeAlterUser(String userName, String userPass,
			String birth, String sex, String address, String phone,
			String school, String education, String work, String regdate) {
			String sql = "insert into  user(userName, userPass, sex, birth, sex, address, phone,school,education,work,regdate) values  (?,?,?,?,?,?,?,?,?,?)";
			DBUtil.DML(sql,new Object[]{userName, userPass, sex, birth, sex, address, phone,school,education,work,regdate});
	}

	@Override
	public List<Menu> loadMenu(String userName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User showUser(String useName) {
		// TODO Auto-generated method stub
		return null;
	}

	

	

	


	
	
	
}
