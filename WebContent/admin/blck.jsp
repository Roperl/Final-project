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
swindow.onload() { 

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
 

<form id="form1" name="f1" method="post"  action="blck.jsp" >
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td colspan=10 height="33" align="left" bgcolor="#FFFFFF"><label></label>
<% 
String pblno = request.getParameter("blno")==null?"":request.getParameter("blno"); 
String startblno = request.getParameter("startblno")==null?"":request.getParameter("startblno"); 
String endblno = request.getParameter("endblno")==null?"":request.getParameter("endblno"); 
String pisyb = request.getParameter("isyb")==null?"":request.getParameter("isyb"); 
String startisyb = request.getParameter("startisyb")==null?"":request.getParameter("startisyb"); 
String endisyb = request.getParameter("endisyb")==null?"":request.getParameter("endisyb"); 
String pbingr = request.getParameter("bingr")==null?"":request.getParameter("bingr"); 
String startbingr = request.getParameter("startbingr")==null?"":request.getParameter("startbingr"); 
String endbingr = request.getParameter("endbingr")==null?"":request.getParameter("endbingr"); 
String psfid = request.getParameter("sfid")==null?"":request.getParameter("sfid"); 
String startsfid = request.getParameter("startsfid")==null?"":request.getParameter("startsfid"); 
String endsfid = request.getParameter("endsfid")==null?"":request.getParameter("endsfid"); 
   %>

<%
 HashMap mmm = new HashMap();%>&nbsp;  
病例编号 : <input type=text class=''  size=15 name='blno' />&nbsp; 
是否医保 : <select name='isyb'>
<option value="">不限</option>
<option value='是'>是</option> 
<option value='否'>否</option> 
</select> 
&nbsp; 患者姓名 : <input type=text class=''  size=12 name='bingr' />&nbsp; 身份证号码 : <input type=text class=''  size=20 name='sfid' />  <input type=submit class='' value='查询信息' /> &nbsp; <br /></td>
    </tr>
</table>


<label></label>
<br />


<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">病例编号</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">科室</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">是否医保</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">患者姓名</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">身份证号码</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">性别</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">诊断结果</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">挂号时间</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">操作</td>
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
 if(!pisyb.equals("")){ 
 sql+= " and isyb like'%"+pisyb+"%' " ;
 }  
 if(!startisyb.equals("")){  
 mmm.put("startisyb",startisyb) ;
 sql+= " and isyb >'"+startisyb+"' " ;
 }  
 if(!endisyb.equals("")){  
 mmm.put("endisyb",endisyb) ;
 sql+= " and isyb <'"+Info.getDay(endisyb,1)+"' " ;
 }  
 if(!pbingr.equals("")){ 
 sql+= " and bingr like'%"+pbingr+"%' " ;
 }  
 if(!startbingr.equals("")){  
 mmm.put("startbingr",startbingr) ;
 sql+= " and bingr >'"+startbingr+"' " ;
 }  
 if(!endbingr.equals("")){  
 mmm.put("endbingr",endbingr) ;
 sql+= " and bingr <'"+Info.getDay(endbingr,1)+"' " ;
 }  
 if(!psfid.equals("")){ 
 sql+= " and sfid like'%"+psfid+"%' " ;
 }  
 if(!startsfid.equals("")){  
 mmm.put("startsfid",startsfid) ;
 sql+= " and sfid >'"+startsfid+"' " ;
 }  
 if(!endsfid.equals("")){  
 mmm.put("endsfid",endsfid) ;
 sql+= " and sfid <'"+Info.getDay(endsfid,1)+"' " ;
 }  
  sql +="  and (1!=1 " ; 
  sql +="  or  (uname is not null and uname !='') " ;
  sql +="  ) ";
  sql +=" order by id desc ";
String url = "blck.jsp?1=1&blno="+pblno+"&isyb="+pisyb+"&bingr="+pbingr+"&sfid="+psfid+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr>

                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("blno")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("keshi")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("isyb")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("bingr")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("sfid")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("sex")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("zdjg")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("savetime")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><a href="blxgx.jsp?id=<%=map.get("id")%>">查看详细</a>  </td>
</tr>
<%}%>
                         
                          <tr>
                            <td colspan=10 height="29" align="center" bgcolor="#FFFFFF">${ page.info}</td>
                            
    </tr>
</table>      
</form>                 
</body>
</html>
 <script language=javascript src='/tjsqyygl/js/ajax.js'></script>
<% 
mmm.put("blno",pblno); 
mmm.put("isyb",pisyb); 
mmm.put("bingr",pbingr); 
mmm.put("sfid",psfid); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/tjsqyygl/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/tjsqyygl/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('blxgx.jsp?id='+no,'信息修改',550,280) 
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
