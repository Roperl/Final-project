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

 
<form id="form1" name="f1" method="post"  action="blxg.jsp?f=f&id=<%=mmm.get("id")%>"   onsubmit="return checkform()" >

<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0"  >

<tr>
                            <td height="2" colspan="2" align="center"  >
                             </td>
    </tr></table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">

  

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
                            &nbsp;<input type=text  class='' id='bingr' name='bingr' size=35 /><label id='clabelbingr' />&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">身份证号码</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<input type=text  class='' id='sfid' name='sfid' size=35 /><label id='clabelsfid' />&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">性别</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<span id="sexdanx"><label><input type=radio name='sex' value='男' />&nbsp;男 </label>
<label><input type=radio name='sex' value='女' />&nbsp;女 </label>
</span>&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">生日</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<input type=text size='12'   class=''   name='birth' onclick='WdatePicker();'  />&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">既往病史</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<textarea  cols='35'   style='margin-top: 1px;margin-bottom: 1px'  class=''   name='jwbs'   ></textarea>&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">主述</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<textarea  cols='35'   style='margin-top: 1px;margin-bottom: 1px'  class=''   name='zs'   ></textarea>&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">诊断结果</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<textarea  cols='35'   style='margin-top: 1px;margin-bottom: 1px'  class=''   name='zdjg'   ></textarea>&nbsp;                        </label></td>
    </tr>

                          
                          
                          <tr>
                            <td height="30" colspan="2" align="center" bgcolor="#FFFFFF"><label>
                              <input type="submit"    name="button2" id="button2" value="提交信息" />
                              &nbsp;&nbsp;&nbsp;
                              <input type=button value='返回上页' onclick='window.location.replace("jzblcx.jsp")' />
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
var bingrobj = document.getElementById("bingr");  
if(bingrobj.value==""){  
document.getElementById("clabelbingr").innerHTML="&nbsp;&nbsp;<font color=red>请输入患者姓名</font>";  
return false;  
}else{ 
document.getElementById("clabelbingr").innerHTML="  ";  
}  
var sfidobj = document.getElementById("sfid");  
if(sfidobj.value==""){  
document.getElementById("clabelsfid").innerHTML="&nbsp;&nbsp;<font color=red>请输入身份证号码</font>";  
return false;  
}else{ 
document.getElementById("clabelsfid").innerHTML="  ";  
}  
return true;   
}   
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
