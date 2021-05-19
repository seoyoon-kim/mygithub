<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>    

<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- font-family: 'Nanum Gothic', sans-serif; -->
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- font-family: 'NanumSquare', sans-serif !important; -->
<style>
	#idCheck{
		text-align: center;
	    font-size: xxx-large;
	    border-top: 3px solid lightgray;
	    border-bottom: 3px solid lightgray;
	    padding-top: 30px;
	    padding-bottom: 30px;
	}
	
	#finish{
        margin-top: 80px;
    	margin-bottom: 50px;
	}
	
	#recieve{
	    margin-left: 150px;
	}
	
	td{
		font-size:20px;
		width: 150px;
	}
	
	.addr{
	    width: 400px;
	}
	
	#pay {
	    margin-top: 100px;
	    text-align: center;
	    margin-bottom: 50px;
	}
	
	#payyy {
	    width: 350px;
	    height: 50px;
	    background-color: rgb(252,118,45);
	    border: 1px solid lightgray;
	}
</style>
<script>
 $(function(){
	$("#payyy").click(function(){
		location.href="/sshj/categoryMain";
	});
 });
</script>
<div class="section">
	<div>
		<div id="finish"><h2>주문완료</h2></div>
			<div id="idCheck">주문이 완료 되었습니다. 감사합니다!</div>
		
		<div id="recieve">
			<div><h2>받는사람 정보</h2></div>
			<table>
				<tbody>
					<tr>
						<td>
							받는사람
						</td>
						<td class="addr">
							${vo}
						</td>
					</tr>
					<tr>
						<td>
							받는사람
						</td>
						<td class="addr">
							${vo1}${vo2}
						</td>
					</tr>
					<tr>
						<td>
							배송 요청사항
						</td>
						<td class="addr">
							${vo3}
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div id="pay"><button id="payyy">쇼핑 계속하기</button></div>
	</div>
</div>