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
	ul, li, a{
		list-style: none; padding:0; margin:0;
	}
	.main{
		margin-top:30px;
		height:1000px;
	}
	/*표*/
	table{
		width:90%;	
		border-spacing: 0;
		text-indent: initial;
		margin-left:50px;
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
	}
	th, .th{
		display: table-cell;
	    vertical-align: inherit;
	    font-weight: bold;
	    text-align: -internal-center;
   		background-color:#f6f6f6;;
   		/*#fcfcfc*/
	}
	thead{
		border-bottom: 2px solid #ccc;
	    border-top: 2px solid #ccc;
	    width:100%;
	}
	tr{
		display: table-row;
	    vertical-align: inherit;
	    border-color: inherit;
	    height:50px;
	}
	.td, .content{
		padding-left:20px;
	}
	.content{
		padding: 20px 0 20px;
	}
	td, .td,{
		height:50px;
	}
	.tr_head{
		font-weight:bold;
	}
	.tr_head li{
		float:left;
	}
	.menu, .th{
		width:150px; text-align:center;
	}
	.td, .th{ line-height:50px;}
	.td{
		width:30%; line-height:50px;
	}
	/*이전글, 다음글*/
	.prev_next_wrap{
		width:90%;
		margin:20px 0px 0px 50px;
	}
	.prev_next_wrap li{
		width:100%;
		height:40px;
		line-height:40px;
		border-bottom:1px solid lightgray;
	}
	.prev_next_wrap a{
		padding-left:20px;
		color: black;
	}
	a:hover, a:active, a:visited, a:link {
   		color: black;
   }
   #NoticeleftMenu{
   		display:block;
   }
   
</style>
<script>
//테이블 collapse
  //showHideFaq
</script>
	<div class="section">
		<div class="main">
			<fieldset>
			<table>
				<tbody>
					<tr class="tr_head">
						<th class="menu">제목</th>
						<td><span class="td">코로나19로 인한 픽업 서비스 중단 안내</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">작성자</th>
						<td ><span class="td">Beetmall</span></td>
					</tr>
					<tr class="tr_head">
					<td colspan="2">
						<ul>
							<li class="th">작성일</li>
							<li class="td">21/04/21</li>
							<li class="th">조회수</li>
							<li class="td">21</li>
						</ul>
					</tr>
				
					<tr>
						<td colspan="2">
							<span class="content" >
							
							고객님 안녕하세요.
							코로나19로 인한 픽업 서비스 중단 안내드립니다.
							2021.04.21 부터 어쩌구 저쩌구 
							저쩌구
						
							</span>
						</td>	
					</tr>
				</tbody>
			</table>
			<div class="prev_next_wrap">
				<ul class="prev_next_ul">
					<li class="prev"><strong>&#9651;이전글</strong><a href="">이전글이 없습니다.</a></li>
					<li class="next"><strong>&#9661;다음글</strong><a href="">다음글이 없습니다.</a></li>
				</ul>
			</div>
			</fieldset>
		</div>
<<<<<<< HEAD
		
=======
	
>>>>>>> branch 'develop' of https://github.com/kschoi93/BeetMall
	</div>