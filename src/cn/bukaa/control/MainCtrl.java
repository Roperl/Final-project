package cn.bukaa.control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import cn.bukaa.dao.CommDAO;
import cn.bukaa.util.Info;

public class MainCtrl extends HttpServlet {

	public MainCtrl() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void go(String url, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void gor(String url, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			response.sendRedirect(url);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String ac = request.getParameter("ac");
		if (ac == null)
			ac = "";
		CommDAO dao = new CommDAO();
		String date = Info.getDateStr();
		String today = date.substring(0, 10);
		String tomonth = date.substring(0, 7);

		if (ac.equals("uploaddoc")) {
			try {
				String filename = "";
				request.setCharacterEncoding("utf-8");
				RequestContext requestContext = new ServletRequestContext(
						request);
				if (FileUpload.isMultipartContent(requestContext)) {

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request
							.getRealPath("/upfile/") + "/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100 * 1024 * 1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						if (fileItem.getName() != null
								&& fileItem.getSize() != 0) {
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(
									request.getRealPath("/upfile/") + "/"
											+ filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
						}
					}
				}

				go("/js/uploaddoc.jsp?docname=" + filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		if (ac.equals("uploaddoc2")) {
			try {
				String filename = "";
				request.setCharacterEncoding("utf-8");
				RequestContext requestContext = new ServletRequestContext(
						request);
				if (FileUpload.isMultipartContent(requestContext)) {

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request
							.getRealPath("/upfile/") + "/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100 * 1024 * 1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						if (fileItem.getName() != null
								&& fileItem.getSize() != 0) {
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(
									request.getRealPath("/upfile/") + "/"
											+ filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
						}
					}
				}

				go("/js/uploaddoc2.jsp?docname=" + filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		if (ac.equals("uploaddoc3")) {
			try {
				String filename = "";
				request.setCharacterEncoding("utf-8");
				RequestContext requestContext = new ServletRequestContext(
						request);
				if (FileUpload.isMultipartContent(requestContext)) {

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request
							.getRealPath("/upfile/") + "/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100 * 1024 * 1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						if (fileItem.getName() != null
								&& fileItem.getSize() != 0) {
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(
									request.getRealPath("/upfile/") + "/"
											+ filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
						}
					}
				}

				go("/js/uploaddoc3.jsp?docname=" + filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		// 导excel
		if (ac.equals("importexcel")) {
			String page = request.getParameter("page");
			String whzdstr = request.getParameter("whzdstr");
			String tablename = request.getParameter("tablename");
			try {
				String filename = "";
				request.setCharacterEncoding("utf-8");
				RequestContext requestContext = new ServletRequestContext(
						request);
				if (FileUpload.isMultipartContent(requestContext)) {

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request
							.getRealPath("/upfile/") + "/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100 * 1024 * 1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						if (fileItem.getName() != null
								&& fileItem.getSize() != 0) {
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(
									request.getRealPath("/upfile/") + "/"
											+ filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
						}
					}

					if (filename.indexOf(".xls") > -1) {
						Workbook workbook;
						try {
							workbook = Workbook.getWorkbook(new File(request
									.getRealPath("/upfile/") + "/" + filename));
							// 通过Workbook的getSheet方法选择第一个工作簿（从0开始）
							Sheet sheet = workbook.getSheet(0);
							// 通过Sheet方法的getCell方法选择位置为C2的单元格（两个参数都从0开始）
							for (int i = 1; i < 1000; i++) {
								Cell cell = null;
								try {
									String isql = "insert into " + tablename
											+ "(";

									for (String str : whzdstr.split("-")) {
										isql += str + ",";
									}
									isql = isql.substring(0, isql.length() - 1);
									isql += ")values(";

									int j = 0;
									int empty = 1;
									for (String str : whzdstr.split("-")) {
										cell = sheet.getCell(j, i);
										isql += "'" + cell.getContents() + "',";
										String content = cell.getContents() == null ? ""
												: cell.getContents();
										if (!"".equals(content.trim())) {
											empty = 0;
										}
										j++;
									}
									if (empty == 1)
										continue;
									isql = isql.substring(0, isql.length() - 1);
									isql += ")";
									dao.commOper(isql);
								} catch (Exception e) {
									continue;
								}

							}
							workbook.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
				go("/admin/" + page + "?docname=" + filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		if (ac.equals("uploadimg")) {
			try {
				String filename = "";
				request.setCharacterEncoding("utf-8");
				RequestContext requestContext = new ServletRequestContext(
						request);
				if (FileUpload.isMultipartContent(requestContext)) {

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request
							.getRealPath("/upfile/") + "/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100 * 1024 * 1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						if (fileItem.getName() != null
								&& fileItem.getSize() != 0) {
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(
									request.getRealPath("/upfile/") + "/"
											+ filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
						}
					}
				}

				go("/js/uploadimg.jsp?filename=" + filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		if (ac.equals("uploadimg2")) {
			try {
				String filename = "";
				request.setCharacterEncoding("utf-8");
				RequestContext requestContext = new ServletRequestContext(
						request);
				if (FileUpload.isMultipartContent(requestContext)) {

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request
							.getRealPath("/upfile/") + "/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100 * 1024 * 1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						if (fileItem.getName() != null
								&& fileItem.getSize() != 0) {
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(
									request.getRealPath("/upfile/") + "/"
											+ filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
						}
					}
				}

				go("/js/uploadimg2.jsp?filename=" + filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		if (ac.equals("uploadimg3")) {
			try {
				String filename = "";
				request.setCharacterEncoding("utf-8");
				RequestContext requestContext = new ServletRequestContext(
						request);
				if (FileUpload.isMultipartContent(requestContext)) {

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request
							.getRealPath("/upfile/") + "/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100 * 1024 * 1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						if (fileItem.getName() != null
								&& fileItem.getSize() != 0) {
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(
									request.getRealPath("/upfile/") + "/"
											+ filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
						}
					}
				}

				go("/js/uploadimg3.jsp?filename=" + filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		if (ac.equals("uploadimg4")) {
			try {
				String filename = "";
				request.setCharacterEncoding("utf-8");
				RequestContext requestContext = new ServletRequestContext(
						request);
				if (FileUpload.isMultipartContent(requestContext)) {

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request
							.getRealPath("/upfile/") + "/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100 * 1024 * 1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						if (fileItem.getName() != null
								&& fileItem.getSize() != 0) {
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(
									request.getRealPath("/upfile/") + "/"
											+ filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
						}
					}
				}

				go("/js/uploadimg4.jsp?filename=" + filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		if (ac.equals("uploadimg5")) {
			try {
				String filename = "";
				request.setCharacterEncoding("utf-8");
				RequestContext requestContext = new ServletRequestContext(
						request);
				if (FileUpload.isMultipartContent(requestContext)) {

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request
							.getRealPath("/upfile/") + "/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100 * 1024 * 1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						if (fileItem.getName() != null
								&& fileItem.getSize() != 0) {
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(
									request.getRealPath("/upfile/") + "/"
											+ filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
						}
					}
				}

				go("/js/uploadimg5.jsp?filename=" + filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		dao.close();
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
	}

}
