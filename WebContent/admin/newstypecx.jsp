<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.bukaa.util.PageManager"%>
<%@page import="cn.bukaa.dao.CommDAO"%>
  <%
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String utype = user.get("utype").toString();
 %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="/newspubs/admin/commfiles/css/common.css" /> 
	<link rel="stylesheet" type="text/css" href="/newspubs/admin/commfiles/css/style.css" /> 
	<script type="text/javascript" src="/newspubs/js/popup.js"></script>
  </head>
  
  <body>
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<form name="f1" method="post"  action="newstypecx.jsp"      >
  	<table id="mainbody" border="0" width="100%" cellspacing="1"
					class="tableform">
			<tr>
     				 <td colspan=4 height="31" align="left" style="font-size: 12px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<% 
String ptypename = request.getParameter("typename")==null?"":request.getParameter("typename"); 
String starttypename = request.getParameter("starttypename")==null?"":request.getParameter("starttypename"); 
String endtypename = request.getParameter("endtypename")==null?"":request.getParameter("endtypename"); 
   %>

<%
 HashMap mmm = new HashMap();%> 
&nbsp;&nbsp; &nbsp;:&nbsp; <input type=text class=''  size=20 name='typename' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;<input type=submit class='' value='查询信息' /> &nbsp;&nbsp;<input type=button   class=''  value='添加信息' onclick="add();" /> &nbsp;&nbsp;</td>
	    </tr>
			</table>
  	
  	
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytab" id="table1">
<tr align="center">
          <td  background="/newspubs/admin/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3" colspan="10">信息列表</td>
        </tr>
        <tr align="center">
          <td  class="itemtitle" ></td>
<td  class="itemtitle" ></td>
<td  class="itemtitle" >操作</td>
    </tr>
        
     
        <% 
new CommDAO().delete(request,"newstype"); 
if(request.getParameter("typenameid1")!=null){ 
 new CommDAO().commOper("update newstype set typename ='' where id="+request.getParameter("typenameid1"));  
} 
if(request.getParameter("typenameid2")!=null){ 
 new CommDAO().commOper("update newstype set typename ='' where id="+request.getParameter("typenameid2"));  
} 
String sql = "select * from newstype where 1=1 " ;
 if(!ptypename.equals("")){ 
 sql+= " and typename like'%"+ptypename+"%' " ;
 }  
 if(!starttypename.equals("")){  
 mmm.put("starttypename",starttypename) ;
 sql+= " and typename >'"+starttypename+"' " ;
 }  
 if(!endtypename.equals("")){  
 mmm.put("endtypename",endtypename) ;
 sql+= " and typename <'"+Info.getDay(endtypename,1)+"' " ;
 }  
  sql +=" order by id desc ";
String url = "newstypecx.jsp?1=1&typename="+ptypename+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr align="center">

          <td align="center"><%=map.get("typename")%></td>
          <td align="center"><%=map.get("bei")%></td>
          <td align="center"><a href="javascript:update('<%=map.get("id")%>')">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="return confirm('确定要删除这条记录吗?')"  href="newstypecx.jsp?scid=<%=map.get("id")%>">删除</a></td>
</tr>
<%}%>
        
        
        <tr align="center">
          <td colspan=4 align="right" colspan="5">${page.info}</td>
        </tr>
      </table>
  </form>
</body>
</html>
 <script language=javascript src='/newspubs/js/ajax.js'></script>
<% 
mmm.put("typename",ptypename); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/newspubs/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/newspubs/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('newstypexg.jsp?id='+no,'信息修改',550,280) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('newstypetj.jsp','信息添加',550,280) 
}
</script> 
<%@page import="cn.bukaa.util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="cn.bukaa.util.PageManager"%> 
<%@page import="cn.bukaa.dao.CommDAO"%> 
