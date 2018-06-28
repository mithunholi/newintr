<%-- 
    Document   : respJson
    Created on : Dec 2, 2014, 3:03:44 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msgType=(String) request.getAttribute("type");
    String msg=(String) request.getAttribute("msg");
    String act=(String) request.getAttribute("act");
    
    String respJson = " { \"type\": \""+msgType+"\","
                    + "   \"msg\": \""+msg+"\","
                    + "   \"act\": \""+act+ "\"}";
        /*
            respText = " { \"msg\": \"Failed to delete records\","
                    + "    \"act\": \"" + urlstr + "&q=" + QUERY.VIEWALL + "&cmd=" + CMD.BACK + "\"}";
        */   
%>

<%=respJson%>