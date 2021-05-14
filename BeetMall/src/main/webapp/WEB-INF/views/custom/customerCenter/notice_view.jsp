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
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
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
		border-bottom: 1px solid #ccc;
	    border-top: 1px solid #ccc;
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
		overflow:auto;
		width:100%;
		margin:20px 0px 0px 50px;
   	 	margin-top: 100px;
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
   .prev_next_ul{
   		width: 900px;
   }
   fieldset{
    	margin-top: 150px;
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
						<td><span class="td">${vo.infonum}</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">작성자</th>
						<td ><span class="td">${vo.infotitle}</span></td>
					</tr>
					<tr class="tr_head">
					<td colspan="2">
						<ul>
							<li class="th">작성일</li>
							<li class="td">${vo.infowritedate}</li>
							<li class="th">조회수</li>
							<li class="td">${vo.infohit}</li>
						</ul>
					</tr>
				
					<tr>
						<td colspan="2">
							<span class="content" >${vo.infocontent}</span>
						</td>	
					</tr>
				</tbody>
			</table>
			<div class="prev_next_wrap">
				<ul class="prev_next_ul">
					<c:if test="${vo.prevNo==0}">
						${vo.prevSubject}
					</c:if>
					<c:if test="${vo.prevNo>0}">
						<li class="prev"><strong>&#9651;  이전글</strong><a href="notice_view2?infonum=${vo.prevNo}">${vo.prevSubject}</a></li>
					</c:if>
					<c:if test="${vo.nextNo>0}">
						<li class="next"><strong>&#9661;  다음글</strong><a href="notice_view2?infonum=${vo.nextNo}">${vo.nextSubject}</a></li>
					</c:if>
					<c:if test="${vo.nextNo==0}">
						${vo.nextSubject}
					</c:if>
				</ul>
			</div>
			</fieldset>
		</div>
	</div>