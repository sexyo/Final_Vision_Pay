<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.* , java.util.*" %>   
<%

	String store_name = "잔칫집";
	int amount = 15000;

	Map<String,Object> wmap = new HashMap<String,Object>();
	wmap.put("store_name",store_name);
	wmap.put("product","국수");
	wmap.put("amount",amount);

	
// 	Map<String,Object> wmap = (Map<String,Object>)request.getAttribute("wmap");
// 	out.println(wmap.values());
//     out.println(Wellet.payList.size());
//     if(Wellet.payList.size()==0){
//     	 Wellet.payList.add(wmap);
//     	 out.println("payList에 값이 없어서 add함");
//     }else{
//     	int i = 0;
//     	while(i == Wellet.payList.size()){
// 	    	if(!Wellet.payList.get(i).equals(wmap)){
// 		    	out.println("같은 값이 없어서 add");
// 				    Wellet.payList.add(wmap);
// 		    	out.println(Wellet.payList.size());
// 		    	out.println(Wellet.payList.get(i).values());
// 	   		}else{
// 	   			out.println("중복값 있음");
// 		    	break;
// 	   		}
//     		i++;
//     	}
//     }
//     out.println("Size:"+Wellet.payList.size());
//     for(int y=0;y<Wellet.payList.size();y++){
// 	    out.println("Size:"+Wellet.payList.get(y).values());
//     }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파리바게트 구매 페이지</title>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>
<body>
<div class="content">
	<div class="header" style="text-align: center;">
		<h4 id="store_name" class="modal-title"><%=wmap.get("store_name") %></h4>
	</div>
	<div class="body" style="text-align: center;">
		<%=wmap.get("product") %><br> <img src="images/케이크.jpg" id="imagepreview"
			style="width: 256px; height: 150px"> <br> <%=wmap.get("amount") %>
	</div>
	<div class="footer" style="text-align: center;">
	    <a href="/member/index">
			<button type="button" class="btn btn-default">
			결제
			</button>
		</a>
		<button type="button" class="btn btn-default" >취소</button>
	</div>
</div>
</body>
</html>
