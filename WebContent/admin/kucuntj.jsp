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
String tglparentid=request.getParameter("tglparentid")==null?"":request.getParameter("tglparentid"); 
ext.put("tglparentid",tglparentid); 
new CommDAO().insert(request,response,"kucun",ext,true,true); 
%>
<body>

 
<form id="form1" name="f1" method="post"  action="kucuntj.jsp?f=f&tglparentid=<%=tglparentid%>"   onsubmit="return checkform()" >

<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0"  >

<tr>
                            <td height="2" colspan="2" align="center"  >
                             </td>
    </tr></table>

<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">

  

<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">药品</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<%=Info.getselect("yaopin","yaopin","yname~无名"," 1=1 ")%> 
<label id='clabelyaopin' />
&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">入库日期</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<input type=text size='12' class=''   name='rkdate' onclick='WdatePicker();'  />&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">数量</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<input type=text size='8' class=''  id='tnum'  name='tnum'  onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'    />  盒<label id='clabeltnum' />&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">入库批次</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<input type=text  class='' id='pichi' name='pichi' size=35 /><label id='clabelpichi' />&nbsp;                        </label></td>
    </tr>
<tr>
                            <td width="24%" height="26" align="center" bgcolor="#FFFFFF">总价</td>
                            <td width="76%" height="26" align="left" bgcolor="#FFFFFF">
                              <label>
                            &nbsp;<input type=text size='8' class=''  id='totprice'  name='totprice'  onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'    /><label id='clabeltotprice' />&nbsp;                        </label></td>
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
var yaopinobj = document.getElementById("yaopin");  
if(yaopinobj.value==""){  
document.getElementById("clabelyaopin").innerHTML="&nbsp;&nbsp;<font color=red>请输入药品</font>";  
return false;  
}else{
document.getElementById("clabelyaopin").innerHTML="  ";  
}  
  
var tnumobj = document.getElementById("tnum");  
if(tnumobj.value==""){  
document.getElementById("clabeltnum").innerHTML="&nbsp;&nbsp;<font color=red>请输入数量</font>";  
return false;  
}else{
document.getElementById("clabeltnum").innerHTML="  ";  
}  
  
var tnumobj = document.getElementById("tnum");  
if(tnumobj.value!=""){  
if(isNaN(tnumobj.value)){  
document.getElementById("clabeltnum").innerHTML="&nbsp;&nbsp;<font color=red>数量只能是数字</font>";  
return false;
}else{  
document.getElementById("clabeltnum").innerHTML="";  
}  
}  
var pichiobj = document.getElementById("pichi");  
if(pichiobj.value==""){  
document.getElementById("clabelpichi").innerHTML="&nbsp;&nbsp;<font color=red>请输入入库批次</font>";  
return false;  
}else{
document.getElementById("clabelpichi").innerHTML="  ";  
}  
  
var pichiobj = document.getElementById("pichi");  
if(pichiobj.value!=""){  
var ajax = new AJAX();
ajax.post("/tjsqyygl/factory/checkno.jsp?table=kucun&col=pichi&value="+pichiobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabelpichi").innerHTML="&nbsp;&nbsp;<font color=red>入库批次已存在</font>";  
return false;
}else{document.getElementById("clabelpichi").innerHTML="  ";  
}  
}  
var totpriceobj = document.getElementById("totprice");  
if(totpriceobj.value==""){  
document.getElementById("clabeltotprice").innerHTML="&nbsp;&nbsp;<font color=red>请输入总价</font>";  
return false;  
}else{
document.getElementById("clabeltotprice").innerHTML="  ";  
}  
  
var totpriceobj = document.getElementById("totprice");  
if(totpriceobj.value!=""){  
if(isNaN(totpriceobj.value)){  
document.getElementById("clabeltotprice").innerHTML="&nbsp;&nbsp;<font color=red>总价只能是数字</font>";  
return false;
}else{  
document.getElementById("clabeltotprice").innerHTML="";  
}  
}  
return true;   
}   
</script>  
