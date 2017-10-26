<%@page import="cn.bukaa.util.StrUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.bukaa.dao.CommDAO"%>
<%@page import="cn.bukaa.util.PageManager"%>
<%@page import="cn.bukaa.util.Info"%>
<%@page import="cn.bukaa.util.StrUtil"%>
 <%
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String utype = user.get("utype").toString();
String blno = StrUtil.generalSrid();
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
HashMap ext = new HashMap(); 
String tglparentid=request.getParameter("tglparentid")==null?"":request.getParameter("tglparentid"); 
ext.put("tglparentid",tglparentid); 
new CommDAO().insert(request,response,"bl",ext,true,true); 
%>
<body>

 
<form id="form1" name="f1" method="post"  action="bltj.jsp?f=f&tglparentid=<%=tglparentid%>"   onsubmit="return checkform()" >

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
                            &nbsp;<input type=text  class='' id='blno' name='blno' size=35 value="<%blno.toString();%>" /><label id='clabelblno' />&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">科室</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<input type=text  class='' id='keshi' name='keshi' size=35 /><label id='clabelkeshi' />&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">是否医保</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<span id="isybdanx"><label><input type=radio checked=checked name='isyb' id='isyb' value='是' />&nbsp;是 </label>
<label><input type=radio  name='isyb' id='isyb' value='否' />&nbsp;否 </label>
</span>&nbsp;                        </label></td>
    </tr>

                          
                          
                          <tr>
                            <td height="30" colspan="2" align="center" bgcolor="#FFFFFF"><label>
                              <input type="submit"    name="button2" id="button2" value="提交信息" />
                              &nbsp;&nbsp;&nbsp;
                              <input type=button value='返回上页' onclick='popclose();' />
                            </label></td>
    </tr>
</table>
 

   
</form>                 
</body>
</html>
 <script language=javascript src='/tjsqyygl/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/tjsqyygl/js/popup.js'></script>
<script language=javascript src='/tjsqyygl/js/ajax.js'></script>
<%@page import="cn.bukaa.util.Info"%>
<%@page import="cn.bukaa.util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="cn.bukaa.util.PageManager"%> 
<%@page import="cn.bukaa.dao.CommDAO"%> 
<script language=javascript >  
 
 function checkform(){  
var blnoobj = document.getElementById("blno");  
if(blnoobj.value==""){  
document.getElementById("clabelblno").innerHTML="&nbsp;&nbsp;<font color=red>请输入病例编号</font>";  
return false;  
}else{
document.getElementById("clabelblno").innerHTML="  ";  
}  
  
var blnoobj = document.getElementById("blno");  
if(blnoobj.value!=""){  
var ajax = new AJAX();
ajax.post("/tjsqyygl/factory/checkno.jsp?table=bl&col=blno&value="+blnoobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabelblno").innerHTML="&nbsp;&nbsp;<font color=red>病例编号已存在</font>";  
return false;
}else{document.getElementById("clabelblno").innerHTML="  ";  
}  
}  
var keshiobj = document.getElementById("keshi");  
if(keshiobj.value==""){  
document.getElementById("clabelkeshi").innerHTML="&nbsp;&nbsp;<font color=red>请输入科室</font>";  
return false;  
}else{
document.getElementById("clabelkeshi").innerHTML="  ";  
}  
  
return true;   
}   
</script>  
