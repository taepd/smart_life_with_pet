<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <%
  String msg = (String)request.getAttribute("msg");
  String url = (String)request.getAttribute("url");
  
  if(msg != null && url != null){
%>
	<script>
		alert('<%= msg %>');		 
	    location.href='<%=url%>';
	</script>
	
<%	  
  }
%>


 
 	
