<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.bukaa.dao.CommDAO"%>
<%@page import="cn.bukaa.util.PageManager"%>
<%@page import="cn.bukaa.util.Info"%>
 <%
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String utype = user.get("utype").toString();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理页面</title>
<!-- 调用CSS，JS -->
<link href="/tjsqyygl/admin/images/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: ;
}
.STYLE1 {
	color: #333333;
	font-size: x-large;
	font-family: Arial, Helvetica, sans-serif;
}
-->
</style>
<script language="javascript">
window.onload() { 

if(top.location != self.location){ 

var a = window.parent.document.getElementsByTagName('iframe'); 

for (var i=0; i<a.length; i++){ 

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight+320; return;}}} 
} 
</script>
<script language=javascript>
function show(no)
{
for(var i=1;i<20;i++)
{
var a = document.getElementById(no+"@"+i);
if(a==null)
{
continue;
}
if(a.style.display=="")
{
a.style.display="none";
}else{
a.style.display="";
}
}

}
</script>
<script type="text/javascript">
function showzhi(inn)
{
var a = document.getElementById("loca");
a.innerHTML=inn;
}
function change(no)
{
var c = document.getElementById("c");
c.innerHTML=no;
}
</script>

</head>
<body>
 

<form id="form1" name="f1" method="post"  action="blcx.jsp" >
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td colspan=6 height="33" align="left" bgcolor="#FFFFFF"><label></label>&nbsp;&nbsp;&nbsp;
<% 
String pblno = request.getParameter("blno")==null?"":request.getParameter("blno"); 
String startblno = request.getParameter("startblno")==null?"":request.getParameter("startblno"); 
String endblno = request.getParameter("endblno")==null?"":request.getParameter("endblno"); 
String pkeshi = request.getParameter("keshi")==null?"":request.getParameter("keshi"); 
String startkeshi = request.getParameter("startkeshi")==null?"":request.getParameter("startkeshi"); 
String endkeshi = request.getParameter("endkeshi")==null?"":request.getParameter("endkeshi"); 
   %>

<%
 HashMap mmm = new HashMap();%> 
&nbsp;&nbsp;病例编号 &nbsp;:&nbsp; <input type=text class=''  size=20 name='blno' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;科室 &nbsp;:&nbsp; <input type=text class=''  size=20 name='keshi' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;<input type=submit class='' value='查询信息' /> &nbsp;&nbsp;<input type=button   class=''  value='添加信息' onclick="add();" /> &nbsp;&nbsp;</td>
    </tr>
</table>


<label></label>
<br />


<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">病例编号</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">科室</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">是否医保</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">挂号时间</td>
 
    </tr>
                         
                         
                        
                          <% 
new CommDAO().delete(request,"bl"); 
if(request.getParameter("blnoid1")!=null){ 
 new CommDAO().commOper("update bl set blno ='' where id="+request.getParameter("blnoid1"));  
} 
if(request.getParameter("blnoid2")!=null){ 
 new CommDAO().commOper("update bl set blno ='' where id="+request.getParameter("blnoid2"));  
} 
String sql = "select * from bl where 1=1 " ;
 if(!pblno.equals("")){ 
 sql+= " and blno like'%"+pblno+"%' " ;
 }  
 if(!startblno.equals("")){  
 mmm.put("startblno",startblno) ;
 sql+= " and blno >'"+startblno+"' " ;
 }  
 if(!endblno.equals("")){  
 mmm.put("endblno",endblno) ;
 sql+= " and blno <'"+Info.getDay(endblno,1)+"' " ;
 }  
 if(!pkeshi.equals("")){ 
 sql+= " and keshi like'%"+pkeshi+"%' " ;
 }  
 if(!startkeshi.equals("")){  
 mmm.put("startkeshi",startkeshi) ;
 sql+= " and keshi >'"+startkeshi+"' " ;
 }  
 if(!endkeshi.equals("")){  
 mmm.put("endkeshi",endkeshi) ;
 sql+= " and keshi <'"+Info.getDay(endkeshi,1)+"' " ;
 }  
  sql +=" order by id desc ";
String url = "blcx.jsp?1=1&blno="+pblno+"&keshi="+pkeshi+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr>

                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("blno")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("keshi")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("isyb")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("savetime")%></td>
                         
</tr>
<%}%>
                         
                          <tr>
                            <td colspan=6 height="29" align="center" bgcolor="#FFFFFF">${ page.info}</td>
                            
    </tr>
</table>      
</form>                 
</body>
</html>
 <script language=javascript src='/tjsqyygl/js/ajax.js'></script>
<% 
mmm.put("blno",pblno); 
mmm.put("keshi",pkeshi); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/tjsqyygl/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/tjsqyygl/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('blxg.jsp?id='+no,'信息修改',550,280) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('bltj.jsp','信息添加',550,280) 
}
</script> 
<%@page import="cn.bukaa.util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="cn.bukaa.util.PageManager"%> 
<%@page import="cn.bukaa.dao.CommDAO"%> 
