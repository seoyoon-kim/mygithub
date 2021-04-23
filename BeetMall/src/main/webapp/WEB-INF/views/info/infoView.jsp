<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#infoTitle{
		height:40px;
		text-align:center;
		lineheight:40px;
		border-bottom:1px solid #ddd;
		margin-bottom:12px;
	}
	.infoButton:first-child{
		margin-left:0px;
	}
	.infoButton{
		float:left;
		margin:0 5px;
		height:40px;
		line-height:40px;
		width:15%;
		background-color:#e06666;
		text-align:center;
		color:white;
		font-size:1.2em;
	}
	#infoSelect{
		height:1080px;
		position:relative;
	}
	#infoPrint{
		position:absolute;
		width:1080px;
		height:980px;
		top:40px;
		border: 5px solid #e06666;
		padding:10px;
		overflow:auto;
	}
</style>
<script>
	$(function(){
		$(".infoButton").click(function(){
			$("#infoPrint").text($(this).index()+", "+$(this).text());
		});
		
	});
</script>
<div class="section">
	<div id="infoTitle">
		<h2>이용안내</h2>
	</div>
	<div id="infoSelect">
		<div class="infoButton">이용안내</div>
		<div class="infoButton">이용약관</div>
		<div class="infoButton">개인정보처리방침</div>
		<div><div id="infoPrint"></div></div>
	</div>
	
</div>