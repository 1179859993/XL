package com.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileuploadServlet  extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//1.创建文件处理工厂对象
		DiskFileItemFactory dff = new DiskFileItemFactory();
		//2.创建一个文件上传处理工具
		ServletFileUpload sfu = new ServletFileUpload(dff);
		
		
		try {
			//读取请求中的二进制数据  返回List集合
			List<FileItem> files = sfu.parseRequest(req);
			
			for(FileItem fi:files){
				//判断当前数据是否为普通表单字段（除文件上传之外的其他字段）
				if(fi.isFormField()){
					
				}else{
					//文件上传的二进制字段
					String fileName = fi.getName();//重新定义文件名
					//以最后一个.截取文件名
					String suffix = fileName.substring(fileName.lastIndexOf("."));
					
					
					//限制那些种类，可以上传   equalsIgnoreCase(suffix)  忽略大小写
					if(".jpg".equalsIgnoreCase(suffix) || ".png".equalsIgnoreCase(suffix) || ".gif".equalsIgnoreCase(suffix)){
						if(fi.getSize() <= 1024*1024*1){//规定上传文件大小
							Random random = new Random(); //随机数
							int i = random.nextInt(10000); //0-10000 的随机整数
							long l = new Date().getTime(); //当前系统毫秒数
							fileName = i+"."+l+suffix;  //新的文件名
							
							String path = this.getServletContext().getRealPath("files")+"/"+fileName;
							File f = new File(path);
							//将二进制数据写入文件保存在硬盘上
							fi.write(f);
							
							
							//插入数据库，修改响应的表数据
							String savePath="files/"+fileName;
							
							
							req.setAttribute("fileuploadMsg", "文件已上传");
						}else{
							req.setAttribute("fileuploadMsg", "文件大小不能超过1M");
						}
					}else{
						req.setAttribute("fileuploadMsg", "文件格式错误");
					}
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		req.getRequestDispatcher("files/fileupload.jsp").forward(req, resp);
	}
	
	

	
}
