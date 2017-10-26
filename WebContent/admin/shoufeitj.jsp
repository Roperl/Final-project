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
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null)
{
String[] yaopinxx = request.getParameterValues("yaopinxx");
String blno = request.getParameter("blno");
for(String str:yaopinxx)
{
String yao = "";
String num = "";
try{
 yao = str.split(" - ")[0]+" - "+str.split(" - ")[1];
 num =  str.split(" - ")[2].split(":")[1];
}catch(Exception e)
{
continue;
}
new CommDAO().commOper("update yongyao set status='已划价' where yaoping='"+yao+"' and num='"+num+"'");
}
}
String tglparentid=request.getParameter("tglparentid")==null?"":request.getParameter("tglparentid"); 
ext.put("tglparentid",tglparentid); 
ext.put("status","已划价"); 
new CommDAO().insert(request,response,"shoufei",ext,true,false); 
%>
<body>

 
<form id="form1" name="f1" method="post"  action="shoufeitj.jsp?f=f&tglparentid=<%=tglparentid%>"   onsubmit="return checkform()" >

<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0"  >

<tr>
                            <td height="2" colspan="2" align="center"  >
                             </td>
    </tr></table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">

  

<tr>
                            <td width="18%" height="26" align="center" bgcolor="#FFFFFF">病例编号</td>
                            <td width="82%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<%=Info.getselect("blno","bl","blno~无名"," 1=1 ")%> 
<label id='clabelblno' />
&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="18%" height="26" align="center" bgcolor="#FFFFFF">药品信息</td>
                            <td width="82%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<span id="yaopinxxduox">
                            <%=Info.getcheckbox("yaopinxx","yongyao","yaoping~无名;num~数量"," 1=1 ")%>
                            <script language=javascript> 
function blnochange(){ 
document.getElementById("blno").onchange=blnochange; 
var blnovalue = document.getElementById("blno").value; 
var yaopinxxobj = document.getElementById("yaopinxx"); 
yaopinxxduox.innerHTML=""; 
var ajax = new AJAX(); 
ajax.post("/tjsqyygl/factory/getsonops.jsp?tj=n&zd=yaopinxx&glb=yongyao&glzd=yaoping~无名;num~数量&jlzd=blno&jlzdb=blno&value="+blnovalue+"&ctype=checkbox&ttime=<%=Info.getDateStr()%>"); 
var msg = ajax.getValue(); 
//alert(msg);
yaopinxxduox.innerHTML=msg; 
} 
</script> 
</span>&nbsp;                        </label><label id='clabeltotprice' /></td>
    </tr>
 

                          
                          
                          <tr>
                            <td height="30" colspan="2" align="center" bgcolor="#FFFFFF"><label>
                              <input type="submit"    name="button2" id="button2" value="提交信息" />
                              &nbsp;&nbsp;&nbsp;
                              <input type=button value='返回上页' onclick='window.location.replace("shoufeicx.jsp")' />
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
blnochange(); 
 
 function checkform(){  
var blnoobj = document.getElementById("blno");  
if(blnoobj.value==""){  
document.getElementById("clabelblno").innerHTML="&nbsp;&nbsp;<font color=red>请输入病例编号</font>";  
return false;  
}else{
document.getElementById("clabelblno").innerHTML="  ";  
}  
  
var totpriceobj = document.getElementById("totprice");  
if(totpriceobj.value=="0"){  
document.getElementById("clabeltotprice").innerHTML="&nbsp;&nbsp;<font color=red>无药品可划价</font>";  
return false;  
}else{
document.getElementById("clabeltotprice").innerHTML="  ";  
}  
  
return true;   
}   
</script>  
