package cn.bukaa.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bukaa.dao.CommDAO;
import cn.bukaa.util.Info;

public class UserController extends MainCtrl {

	private CommDAO dao;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		dao = new CommDAO();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String ac = request.getParameter("ac");
		String date = Info.getDateStr();
		String today = date.substring(0, 10);
		String tomonth = date.substring(0, 7);
		if ("login".equals(ac)) {
			login(request, response);
		}else if("logout".equals(ac)){
			logout(request,response);
		}
		else if("uppass".equals(ac)){
			updatePass(request, response);
		}
		
	}
	private void logout(HttpServletRequest request,HttpServletResponse response) {
		request.getSession().invalidate();
		gor("login.jsp", request, response);
		
	}
	private void login(HttpServletRequest request, HttpServletResponse response){
		String pagerandom = request.getParameter("pagerandom") == null ? ""
				: request.getParameter("pagerandom");
		String random = (String) request.getSession()
				.getAttribute("random");
		if (!pagerandom.equals(random) && request.getParameter("a") != null) {
			request.setAttribute("random", "");
			go("/login.jsp", request, response);
		} else {
			dao = new CommDAO();
			String username = request.getParameter("uname");
			String password = request.getParameter("upass");
			String utype = request.getParameter("utype");
			request.getSession().setAttribute("utype", utype);
			List<HashMap> list = dao
					.select("select * from sysuser where uname='"
							+ username + "'");
			if (list.size() == 1) {
				HashMap map = list.get(0);
				List<HashMap> ulist = dao
						.select("select * from sysuser where uname='"
								+ username + "' and upass='" + password
								+ "'");

				if (ulist.size() == 1
						&& password.equals(map.get("upass").toString())) {

					request.getSession().setAttribute("admin", map);
					dao = new CommDAO();
					HashMap<String,Object> ext = new HashMap<String,Object>();
					ext.put("userid", map.get("id"));
					ext.put("tname", map.get("tname"));
					ext.put("oper", "登录");
					request.setAttribute("f", "f");
					dao.insert(request, response, "log", ext, false, true);
					gor("admin/index.jsp", request, response);

				} else {
					request.setAttribute("error", "");
					go("/login.jsp", request, response);
				}
			} else {
				request.setAttribute("error", "");
				go("/login.jsp", request, response);
			}
		}

	}
	
	private void  updatePass(HttpServletRequest request, HttpServletResponse response){
		dao = new CommDAO();
		String olduserpass = request.getParameter("oldpass");
		String userpass = request.getParameter("upass");
		String copyuserpass = request.getParameter("repass");
		HashMap user = dao.getmap(Info.getUser(request).get("id")
				.toString(), "sysuser");
		if (!(((String) user.get("upass")).equals(olduserpass))) {
			request.setAttribute("error", "");
			go("/admin/uppass.jsp", request, response);
		} else {
			String id = (String) user.get("id");
			String sql = "update sysuser set upass='" + userpass
					+ "' where id=" + id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/uppass.jsp", request, response);
		}
	}

}
