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
 

<form id="form1" name="f1" method="post"  action="kucuncx.jsp" >
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td colspan=7 height="33" align="left" bgcolor="#FFFFFF"><label></label>&nbsp;&nbsp;&nbsp;
<% 
String pyaopin = request.getParameter("yaopin")==null?"":request.getParameter("yaopin"); 
String startyaopin = request.getParameter("startyaopin")==null?"":request.getParameter("startyaopin"); 
String endyaopin = request.getParameter("endyaopin")==null?"":request.getParameter("endyaopin"); 
String prkdate = request.getParameter("rkdate")==null?"":request.getParameter("rkdate"); 
String startrkdate = request.getParameter("startrkdate")==null?"":request.getParameter("startrkdate"); 
String endrkdate = request.getParameter("endrkdate")==null?"":request.getParameter("endrkdate"); 
   %>

<%
 HashMap mmm = new HashMap();%> 
&nbsp;&nbsp;药品 &nbsp;:&nbsp; <input type=text class=''  size=20 name='yaopin' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;入库日期 &nbsp;:&nbsp; <input type=text class=''  size=10 name='startrkdate' onclick='WdatePicker();' />&nbsp;&nbsp;至&nbsp;&nbsp;
<input type=text class=''  size=10 name='endrkdate' onclick='WdatePicker();' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;<input type=submit class='' value='查询信息' /> &nbsp;&nbsp;<input type=button   class=''  value='添加信息' onclick="add();" /> &nbsp;&nbsp;</td>
    </tr>
</table>


<label></label>
<br />


<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">药品</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">入库日期</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">数量</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">入库批次</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">总价</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">操作</td>
    </tr>
                         
                         
                        
                          <% 
new CommDAO().delete(request,"kucun"); 
if(request.getParameter("yaopinid1")!=null){ 
 new CommDAO().commOper("update kucun set yaopin ='' where id="+request.getParameter("yaopinid1"));  
} 
if(request.getParameter("yaopinid2")!=null){ 
 new CommDAO().commOper("update kucun set yaopin ='' where id="+request.getParameter("yaopinid2"));  
} 
String sql = "select * from kucun where 1=1 " ;
 if(!pyaopin.equals("")){ 
 sql+= " and yaopin like'%"+pyaopin+"%' " ;
 }  
 if(!startyaopin.equals("")){  
 mmm.put("startyaopin",startyaopin) ;
 sql+= " and yaopin >'"+startyaopin+"' " ;
 }  
 if(!endyaopin.equals("")){  
 mmm.put("endyaopin",endyaopin) ;
 sql+= " and yaopin <'"+Info.getDay(endyaopin,1)+"' " ;
 }  
 if(!prkdate.equals("")){ 
 sql+= " and rkdate like'%"+prkdate+"%' " ;
 }  
 if(!startrkdate.equals("")){  
 mmm.put("startrkdate",startrkdate) ;
 sql+= " and rkdate >'"+startrkdate+"' " ;
 }  
 if(!endrkdate.equals("")){  
 mmm.put("endrkdate",endrkdate) ;
 sql+= " and rkdate <'"+Info.getDay(endrkdate,1)+"' " ;
 }  
  sql +=" order by id desc ";
String url = "kucuncx.jsp?1=1&yaopin="+pyaopin+"&rkdate="+prkdate+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr>

                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("yaopin")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("rkdate")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("tnum")%>  盒</td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("pichi")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("totprice")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><a href="javascript:update('<%=map.get("id")%>')">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="return confirm('确定要删除这条记录吗?')"  href="kucuncx.jsp?scid=<%=map.get("id")%>">删除</a></td>
</tr>
<%}%>
                         
                          <tr>
                            <td colspan=7 height="29" align="center" bgcolor="#FFFFFF">${ page.info}</td>
                            
    </tr>
</table>      
</form>                 
</body>
</html>
 <script language=javascript src='/tjsqyygl/js/ajax.js'></script>
<% 
mmm.put("yaopin",pyaopin); 
mmm.put("rkdate",prkdate); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/tjsqyygl/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/tjsqyygl/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('kucunxg.jsp?id='+no,'信息修改',550,171) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('kucuntj.jsp','信息添加',550,171) 
}
</script> 
<%@page import="cn.bukaa.util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="cn.bukaa.util.PageManager"%> 
<%@page import="cn.bukaa.dao.CommDAO"%> 
