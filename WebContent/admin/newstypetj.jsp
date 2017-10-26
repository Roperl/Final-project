<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.bukaa.dao.CommDAO"%>
<%@page import="cn.bukaa.util.Info"%>
  <%
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String utype = user.get("utype").toString();
 %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="/newspubs/admin/commfiles/css/common.css" /> 
	<link rel="stylesheet" type="text/css" href="/newspubs/admin/commfiles/css/style.css" /> 
	
  </head>
  
  <% 
HashMap ext = new HashMap(); 
String tglparentid=request.getParameter("tglparentid")==null?"":request.getParameter("tglparentid"); 
ext.put("tglparentid",tglparentid); 
new CommDAO().insert(request,response,"newstype",ext,true,true); 
%>
<body>
  <form name="f1" method="post"  action="newstypetj.jsp?f=f&tglparentid=<%=tglparentid%>"   onsubmit="return checkform()"  >
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytab" id="table1">
        <tr align="center" style="display: ">
          <td colspan="2"  background="/newspubs/admin/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3">添加类别</td>
        </tr>
        
         <tr align="center">
          <td width="23%" align="center"> </td>
          <td width="77%" align="left"> 
            <input type=text  class='' id='typename' name='typename' size=35 /><label id='clabeltypename' />           </td>
        </tr>
<tr align="center">
          <td width="23%" align="center"> </td>
          <td width="77%" align="left"> 
            <input type=text  class='' id='bei' name='bei' size=35 /><label id='clabelbei' />           </td>
        </tr>

       
        <tr align="center">
          <td colspan="2" align="center" height="28">
            <label>
              <input type="submit" name="button" id="button" value="提交信息">
            </label> &nbsp;&nbsp;
           <input type=button value='返回上页' onclick='popclose();' />               </td>
        </tr>
      </table>
  </form> 
</body>
</html>
 
<script language=javascript src='/newspubs/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/newspubs/js/popup.js'></script>
<script language=javascript src='/newspubs/js/ajax.js'></script>
<%@page import="cn.bukaa.util.Info"%>
<%@page import="cn.bukaa.util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="cn.bukaa.util.PageManager"%> 
<%@page import="cn.bukaa.dao.CommDAO"%> 
<script language=javascript >  
 
 function checkform(){  
var typenameobj = document.getElementById("typename");  
if(typenameobj.value==""){  
document.getElementById("clabeltypename").innerHTML="&nbsp;&nbsp;<font color=red>请输入</font>";  
return false;  
}else{
document.getElementById("clabeltypename").innerHTML="  ";  
}  
  
var typenameobj = document.getElementById("typename");  
if(typenameobj.value!=""){  
var ajax = new AJAX();
ajax.post("/newspubs/factory/checkno.jsp?table=newstype&col=typename&value="+typenameobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabeltypename").innerHTML="&nbsp;&nbsp;<font color=red>已存在</font>";  
return false;
}else{document.getElementById("clabeltypename").innerHTML="  ";  
}  
}  
return true;   
}   
</script>  
