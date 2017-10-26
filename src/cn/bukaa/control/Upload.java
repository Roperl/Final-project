package cn.bukaa.control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bukaa.util.Info;


public class Upload extends HttpServlet {

	public Upload() {
		super();
	}
	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StringBuffer   sb   =   new   StringBuffer(50);   
		 response.setContentType("application/x-msdownload;charset=GB2312");   
        try {
			response.setHeader("Content-Disposition",   new   String(sb.toString()   
			         .getBytes(),   "ISO8859-1"));
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		 String filename = request.getParameter("filename");
		  if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0){
		     try {
				filename = new String(filename.getBytes("UTF-8"), "ISO8859-1");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		 }
		 else 
		      if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0){
		           try {
					filename = URLEncoder.encode(filename, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					 
				}
		      }
		 response.setContentType("text/plain");
		 response.setHeader("Location",filename);
		 response.reset();
		 response.setHeader("Cache-Control", "max-age=0" );
		 response.setHeader("Content-Disposition", "attachment; filename=" + filename);
		   

		    try {
				       BufferedInputStream bis = null;
					   BufferedOutputStream bos = null;
					   OutputStream fos = null;
					  // File f = new File(request.getRealPath("/upfile/")+"/"+filename);
					   //System.out.println(f);
					   bis = new BufferedInputStream((InputStream)new FileInputStream(request.getRealPath("/upfile/")+"/"+filename));
					    fos = response.getOutputStream();
					    bos = new BufferedOutputStream(fos);

					    int bytesRead = 0;
					    byte[] buffer = new byte[5 * 1024];
					    while ((bytesRead = bis.read(buffer)) != -1) {
					     bos.write(buffer, 0, bytesRead);
					    }
					    bos.close();
					    bis.close();
					    fos.close();
				
		               new Info().delPic(request.getRealPath("/upfile/")+"/", filename);
		     } catch (Exception e) {
				 
			}finally{
			}
	}
	public void init() throws ServletException {
	}

}
