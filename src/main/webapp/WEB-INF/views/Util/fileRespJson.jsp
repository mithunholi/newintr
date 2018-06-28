<%-- 
    Document   : respJson
    Created on : Dec 2, 2014, 3:03:44 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msgType=(String) request.getAttribute("type");
    String msg=(String) request.getAttribute("msg");
    String url=(String) request.getAttribute("url");
    System.out.println("urlimage==="+url);
    String thumbUrl=(String) request.getAttribute("thumbUrl");
    String div=(String) request.getAttribute("div");
    
    String fileRespJson = " { \"type\": \""+msgType+"\","
                    + "   \"msg\": \""+msg+ "\","
                    + "   \"url\": \"" +url+ "\","
                    + "   \"thumbUrl\": \"" +thumbUrl+ "\","
                    + "   \"div\": \""+div+ "\"}";
        /*
            respText = " { \"msg\": \"Failed to delete records\","
                    + "    \"act\": \"" + urlstr + "&q=" + QUERY.VIEWALL + "&cmd=" + CMD.BACK + "\"}";
        */   
%>
<%=fileRespJson%>