 <%
 int pag=1; int totPages=5;
 pag= Integer.parseInt(request.getAttribute("pagno").toString());
 totPages= Integer.parseInt(request.getAttribute("totpages").toString());
 System.out.println("pag="+pag);
 String baseurl=request.getAttribute("baseurl").toString();
 System.out.println("baseurl="+baseurl);
 
 String div="content-wrapper"; 
 %>
 <div class="col-sm-9 text-right">
 <nav>
  <ul id="pagination" class="pagination">
  <%  if (pag > 1) { System.out.println("1");%>
  <li><a href="javascript:loadPage('1');">First</a></li>
     <%if(!(pag==2 || pag==3)) {System.out.println("2");%>
    <li id="1"><a href="javascript:loadPage(1);">1</a></li>
    <%} %>
    <li id="<%=pag-1%>">
      <a href="javascript:loadPage(<%=pag-1%>);" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <%  } 
  if(totPages<=5){
    for (int i = 1; i <= totPages; i++) {
        if (i == pag) { System.out.println("3");
	%>
		<li class="active" id="<%=i%>"><a href="javascript:loadPage(<%=i%>);"><%=i%></a></li>
	<% 
        } else if(!((pag==4 || pag==5) && i==1)) { System.out.println("4");
	%>
	    <li id="<%=i%>"><a href="javascript:loadPage(<%=i%>);"><%=i%></a></li>
	<%  
        }
    }//for
  }else{
	  if(pag<=3){
		  System.out.println("5");
		  for(int j=1;j<=3;j++){
			  if(j==pag){ System.out.println("6");
				  %>
					<li class="active" id="<%=j%>"><a href="javascript:loadPage(<%=j%>);"><%=j%></a></li>
				<%   
			  }else{ System.out.println("7");
				  %>
				    <li id="<%=j%>"><a href="javascript:loadPage(<%=j%>);"><%=j%></a></li>
				<%  
		  }
	  }//for
			if(pag==3){System.out.println("8");
				%>
			    <li id="<%=4%>"><a href="javascript:loadPage(<%=4%>);"><%=4%></a></li>
			<%  
			}
  }else{
	  if(pag==totPages){
		  System.out.println("9");
	  %>
	   <li disabled><a>...</a></li>
		  <li ><a href="javascript:loadPage(<%=pag-1%>);"><%=pag-1%></a></li>
			<li class="active"><a href="javascript:loadPage(<%=pag%>);"><%=pag%></a></li>
	<%   
	  }else{
		  System.out.println("10");
		  %>
		   <li disabled><a>...</a></li>
	  <li id="<%=pag-1%>"><a href="javascript:loadPage(<%=pag-1%>);"><%=pag-1%></a></li>
		<li class="active" id="<%=pag%>"><a href="javascript:loadPage(<%=pag%>);"><%=pag%></a></li>
		<li id="<%=pag+1%>"><a href="javascript:loadPage(<%=pag+1%>);"><%=pag+1%></a></li>
		<%if(!(pag+1==totPages)){%>
		<li disabled><a>...</a></li>
			<%}
	  }
  }
  }
    if (pag < totPages && totPages>5){
	%>
    <li id="<%=pag+1%>">
      <a href="javascript:loadPage(<%=pag+1%>);" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    <%if(!(pag-1==totPages || pag==totPages || pag+1==totPages)) {%>
    <li id="<%=totPages%>"><a href="javascript:loadPage(<%= totPages%>);"><%=totPages%></a></li>
    <%} %>
    <li id="<%=totPages%>"><a href="javascript:loadPage(<%= totPages%>);">Last</a></li>
    <%  
        }else if(pag < totPages && totPages<=5){
        	%>
            <li id="<%=pag+1%>">
              <a href="javascript:loadPage(<%=pag+1%>);" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
            <li id="<%=totPages%>"><a href="javascript:loadPage(<%= totPages%>);">Last</a></li>
            <%  
        }
    %>

  </ul>
</nav>
</div>
<div class="col-sm-3">
<input id="pageNum" style="width:40px;height:32px;margin:20px 0px 20px 0px" type="text"/> &nbsp;&nbsp;<button class="btn btn-primary" onclick="javascript:gotoPage(pageNum)">GO TO PAGE</button>
</div>
<script>
var pageSend=$('.pagination').find( "li.active" ).attr('id');
function gotoPage(pageNum){
	cpage=pageNum.value;
	totalPage=<%=totPages%>;
	if(cpage><%=totPages%>){
		alert('There is only '+totalPage+' pages available');
		$('#pageNum').val("");
	}else if(cpage=="" || cpage==0){
		$('#pageNum').val("");
	}else{
		loadPage(cpage);
	}
}
</script>   
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 <%-- <%
 int pag=1; int totPages=5;
 pag= Integer.parseInt(request.getAttribute("pagno").toString());
 totPages= Integer.parseInt(request.getAttribute("totpages").toString());
 System.out.println("pag="+pag);
 String baseurl=request.getAttribute("baseurl").toString();
 System.out.println("baseurl="+baseurl);
 
 String div="content-wrapper"; 
 %>
 
 <nav>
  <ul class="pagination">
  <%  if (pag > 1) { %>
  <li><a href="javascript:loadPage('1');">First</a></li>
    <li>
      <a href="javascript:loadPage(<%=pag-1%>);" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <%  } 
    for (int i = 1; i <= totPages; i++) {
        if (i == pag) {
	%>
		<li class="active"><a href=""><%=i%></a></li>
	<% 
        } else { 
	%>
	    <li><a href="javascript:loadPage(<%=i%>);"><%=i%></a></li>
	<%  
        }
    }//for
    if (pag < totPages){
	%>
    <li>
      <a href="javascript:loadPage(<%=pag+1%>);" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    <li><a href="javascript:loadPage(<%= totPages%>);">Last</a></li>
    <%  
        }
    %>

  </ul>
</nav> --%>