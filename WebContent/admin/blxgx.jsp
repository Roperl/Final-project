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
<% 
new CommDAO().delete(request,"bl"); 
String id = request.getParameter("id"); 
String erjitype = request.getParameter("erjitype"); 
String myztree = request.getParameter("myztree"); 
HashMap ext = new HashMap(); 
ext.put("uname",Info.getUser(request).get("uname")); 
new CommDAO().update(request,response,"bl",ext,true,false); 
HashMap mmm = new CommDAO().getmap(id,"bl"); 
%>
<body>

 
<form id="form1" name="f1" method="post"  action="blxgx.jsp?f=f&id=<%=mmm.get("id")%>"   onsubmit="return checkform()" >

<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0"  >

<tr>
                            <td height="2" colspan="2" align="center"  >
                             </td>
    </tr></table>

<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">

  

<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">病例编号</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<%=mmm.get("blno")%>&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">科室</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<%=mmm.get("keshi")%>&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">是否医保</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<%=mmm.get("isyb")%>&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">患者姓名</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<%=mmm.get("bingr")%>&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">身份证号码</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<%=mmm.get("sfid")%>&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">性别</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<%=mmm.get("sex")%>&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">生日</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<%=mmm.get("birth")%>&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">既往病史</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<%=mmm.get("jwbs")%>&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">主述</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<%=mmm.get("zs")%>&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">诊断结果</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<%=mmm.get("zdjg")%>&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">医师</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<%=mmm.get("uname")%>&nbsp;                        </label></td>
    </tr>

                          
                          
                          <tr>
                            <td height="30" colspan="2" align="center" bgcolor="#FFFFFF"><label>
                          
                              <input type=button value='返回上页' onclick='window.location.replace("blck.jsp")' />
                            </label></td>
    </tr>
</table>
 

   
</form>                 
</body>
</html>
 <script language=javascript src='/tjsqyygl/js/My97DatePicker/WdatePicker.js'></script> 
<script language=javascript src='/tjsqyygl/js/ajax.js'></script> 
<script language=javascript src='/tjsqyygl/js/popup.js'></script> 
<%@page import="cn.bukaa.util.Info"%> 
<%@page import="cn.bukaa.util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="cn.bukaa.util.PageManager"%> 
<%@page import="cn.bukaa.dao.CommDAO"%> 
<script language=javascript >  
 
</script>  
<script language=javascript >  
 function checkform(){  
return true;   
}   
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
