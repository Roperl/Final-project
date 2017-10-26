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
 

<form id="form1" name="f1" method="post"  action="pd.jsp" >
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td colspan=9 height="33" align="left" bgcolor="#FFFFFF"><label></label>&nbsp;&nbsp;&nbsp;
<% 
String pyname = request.getParameter("yname")==null?"":request.getParameter("yname"); 
String startyname = request.getParameter("startyname")==null?"":request.getParameter("startyname"); 
String endyname = request.getParameter("endyname")==null?"":request.getParameter("endyname"); 
String psyz = request.getParameter("syz")==null?"":request.getParameter("syz"); 
String startsyz = request.getParameter("startsyz")==null?"":request.getParameter("startsyz"); 
String endsyz = request.getParameter("endsyz")==null?"":request.getParameter("endsyz"); 
   %>

<%
 HashMap mmm = new HashMap();%> 
&nbsp;&nbsp;药品名称 &nbsp;:&nbsp; <input type=text class=''  size=20 name='yname' />&nbsp;&nbsp;&nbsp; &nbsp;<input type=submit class='' value='查询信息' /> &nbsp; &nbsp; &nbsp; <br /></td>
    </tr>
</table>


<label></label>
<br />


<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
                          <tr>
                            <td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">药品名称</td>
 
  
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">单价</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">是否医保药品</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">医保单价</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">入库数量</td>
<td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">总进货金额</td>
 <td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">当前库存</td>
 <td height="27" align="center" background="/tjsqyygl/admin/images/index1_72.gif" bgcolor="#FFFFFF">总销售金额</td>
    </tr>
                         
                         
                        
                          <% 
new CommDAO().delete(request,"yaopin"); 
if(request.getParameter("ynameid1")!=null){ 
 new CommDAO().commOper("update yaopin set yname ='' where id="+request.getParameter("ynameid1"));  
} 
if(request.getParameter("ynameid2")!=null){ 
 new CommDAO().commOper("update yaopin set yname ='' where id="+request.getParameter("ynameid2"));  
} 
String sql = "select * from yaopin where 1=1 " ;
 if(!pyname.equals("")){ 
 sql+= " and yname like'%"+pyname+"%' " ;
 }  
 if(!startyname.equals("")){  
 mmm.put("startyname",startyname) ;
 sql+= " and yname >'"+startyname+"' " ;
 }  
 if(!endyname.equals("")){  
 mmm.put("endyname",endyname) ;
 sql+= " and yname <'"+Info.getDay(endyname,1)+"' " ;
 }  
 if(!psyz.equals("")){ 
 sql+= " and syz like'%"+psyz+"%' " ;
 }  
 if(!startsyz.equals("")){  
 mmm.put("startsyz",startsyz) ;
 sql+= " and syz >'"+startsyz+"' " ;
 }  
 if(!endsyz.equals("")){  
 mmm.put("endsyz",endsyz) ;
 sql+= " and syz <'"+Info.getDay(endsyz,1)+"' " ;
 }  
  sql +=" order by id desc ";
String url = "pd.jsp?1=1&yname="+pyname+"&syz="+psyz+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr>

                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("yname")%></td> 
                             
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("price")%> / 盒</td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("isyb")%></td>
                            <td height="28" align="center" bgcolor="#FFFFFF"><%=map.get("ybprice")%> / 盒</td>
                            <td height="28" align="center" bgcolor="#FFFFFF">
                            
                            <%
                            int tots = new CommDAO().getInt("select sum(tnum) from kucun where yaopin='"+map.get("yname")+"'");
                            %>
                            <%=tots %>
                            </td>
                            <td height="28" align="center" bgcolor="#FFFFFF">
                            
                            <%
                            int totp = new CommDAO().getInt("select sum(totprice) from kucun where yaopin='"+map.get("yname")+"'");
                            %>
                            <%=totp %>
                            </td>
                            <td height="28" align="center" bgcolor="#FFFFFF">
                            
                            <%
                            int tot = new CommDAO().getInt("select sum(tnum) from kucun where yaopin='"+map.get("yname")+"'");
                            int stot =  new CommDAO().getInt("select sum(num) from yongyao where yaoping like'%"+map.get("yname")+" %'");
                             %>
                            <%=tot-stot %>
                            </td>
                            <td height="28" align="center" bgcolor="#FFFFFF">
                            
                            <%
                            int totx = 0;
                            for(HashMap m:new CommDAO().select("select * from yongyao where status in('已缴费','已取药') and yaoping like'%"+map.get("yname")+"%'"))
                            {
                            String yaoping = m.get("yaoping").toString();
                            String num = m.get("num").toString();
                            totx+=Integer.parseInt(num)*Integer.parseInt(yaoping.split(" - ")[1].split(":")[1]);
                            }
                            %>
                            <%=totx %>
                            </td>
                             
</tr>
<%}%>
                         
                          <tr>
                            <td colspan=8 height="29" align="center" bgcolor="#FFFFFF">${ page.info}</td>
                            
    </tr>
</table> 
</form>                 
</body>
</html>
 <script language=javascript src='/tjsqyygl/js/ajax.js'></script>
<% 
mmm.put("yname",pyname); 
mmm.put("syz",psyz); 
%>

<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/tjsqyygl/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/tjsqyygl/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('yaopinxg.jsp?id='+no,'信息修改',550,335) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('yaopintj.jsp','信息添加',550,335) 
}
</script> 
<%@page import="cn.bukaa.util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="cn.bukaa.util.PageManager"%> 
<%@page import="cn.bukaa.dao.CommDAO"%> 
