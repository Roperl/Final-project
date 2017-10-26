<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.bukaa.dao.CommDAO"%>
<%@page import="cn.bukaa.util.PageManager"%>
<%@page import="cn.bukaa.util.Info"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理页面</title>
<!-- 调用CSS，JS -->
<link href="/tjsqyygl/admin/images/style.css" rel="stylesheet"
	type="text/css" />
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
	new CommDAO().delete(request, "sysuser");
	String id = request.getParameter("id");
	String erjitype = request.getParameter("erjitype");
	String myztree = request.getParameter("myztree");
	HashMap ext = new HashMap();
	ext.put("utype", "管理员");
	new CommDAO().update(request, response, "sysuser", ext, true, true);
	HashMap mmm = new CommDAO().getmap(id, "sysuser");
%>
<body>


	<form id="form1" name="f1" method="post"
		action="sysuserxg.jsp?f=f&id=<%=mmm.get("id")%>"
		onsubmit="return checkform()">

		<table width="99%" border="0" align="center" cellpadding="0"
			cellspacing="0">

			<tr>
				<td height="2" colspan="2" align="center"></td>
			</tr>
		</table>

		<table width="99%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#BBD3EB">



			<tr>
				<td width="24%" height="26" align="center" bgcolor="#FFFFFF">用户名</td>
				<td width="76%" height="26" align="left" bgcolor="#FFFFFF"><label>
						&nbsp;<input type=text class='' id='uname' name='uname' size=35 />
						<label id="clabeluname" />&nbsp; </label></td>
			</tr>
			<tr>
				<td width="24%" height="26" align="center" bgcolor="#FFFFFF">密码</td>
				<td width="76%" height="26" align="left" bgcolor="#FFFFFF"><label>
						&nbsp;<input type=text class='' id='upass' name='upass' size=35 />
						<label id="clabelupass" />&nbsp;</label></td>
			</tr>
			<tr>
				<td width="24%" height="26" align="center" bgcolor="#FFFFFF">姓名</td>
				<td width="76%" height="26" align="left" bgcolor="#FFFFFF"><label>
						&nbsp;<input type=text class='' id='tname' name='tname' size=35 /><label
						id='clabeltname' />&nbsp; </label></td>
			</tr>
			<tr>
				<td width="24%" height="26" align="center" bgcolor="#FFFFFF">性别</td>
				<td width="76%" height="26" align="left" bgcolor="#FFFFFF"><label>
						&nbsp;<span id="sexdanx"><label><input type=radio
								name='sex' value='男' />&nbsp;男 </label> <label><input
								type=radio name='sex' value='女' />&nbsp;女 </label> </span>&nbsp; </label></td>
			</tr>
			<tr>
				<td width="24%" height="26" align="center" bgcolor="#FFFFFF">联系电话</td>
				<td width="76%" height="26" align="left" bgcolor="#FFFFFF"><label>
						&nbsp;<input type=text class='' id='tel' name='tel' size=35 /><label
						id='clabeltel' />&nbsp; </label></td>
			</tr>
			<tr>
				<td width="24%" height="26" align="center" bgcolor="#FFFFFF">联系邮箱</td>
				<td width="76%" height="26" align="left" bgcolor="#FFFFFF"><label>
						&nbsp;<input type=text class='' id='email' name='email' size=35 /><label
						id='clabelemail' />&nbsp; </label></td>
			</tr>
			<tr>
				<td width="24%" height="26" align="center" bgcolor="#FFFFFF">联系地址</td>
				<td width="76%" height="26" align="left" bgcolor="#FFFFFF"><label>
						&nbsp;<input type=text class='' id='addrs' name='addrs' size=35 /><label
						id='clabeladdrs' />&nbsp; </label></td>
			</tr>
			<tr>
				<td width="24%" height="26" align="center" bgcolor="#FFFFFF">相片</td>
				<td width="76%" height="26" align="left" bgcolor="#FFFFFF"><label>
						&nbsp;<%=Info.getImgUpInfo(65)%>&nbsp; </label></td>
			</tr>



			<tr>
				<td height="30" colspan="2" align="center" bgcolor="#FFFFFF"><label>
						<input type="submit" name="button2" id="button2" value="提交信息" />
						&nbsp;&nbsp;&nbsp; <input type=button value='返回上页'
						onclick='popclose();' /> </label></td>
			</tr>
		</table>
	</form>
</body>
</html>
