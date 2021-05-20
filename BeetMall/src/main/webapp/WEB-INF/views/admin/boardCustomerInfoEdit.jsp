<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<link rel ="stylesheet" href="<%=request.getContextPath() %>/resources/css/sshj_admin_2.css" type="text/css">
<style>
	/*맨 위 top Bar*/
	#topBar>h5 {
		padding-left: 260px;
		width: 600px !important;
	}
	
	#contentBox {
		height: 3200px;
		top: 50px;
	}
	
	table {
		-webkit-box-shadow: 4px 6px 15px -7px #C4C4C4;
	}
	/*회원정보 전체*/
	#container {
		top: -50px !important;
	}
	
	#infoBox, button, #infoTitle>p {
		position: relative;
	}
	
	#infoBox {
		left: 15px;
		top: 20px;
		width: 550px !important;
		height: 550px;
		background-color: white;
		border-radius: 10px;
		-webkit-box-shadow: 4px 6px 15px -7px #C4C4C4;
		box-shadow: 4px 6px 15px -7px #C4C4C4;
	}
	
	input[type=text] {
		padding-left: 5px;
		width: 300px;
	}
	
	button {
		color: black;
	}
	
	thead {
		border-bottom: 1px solid gray;
	}
	
	.tgr .mileTop:nth-of-type(1), .tga .favoriteTop:nth-of-type(1), .tgc .tg-yrou:nth-of-type(1)
		{
		border-radius: 10px 0 0 0;
	}
	
	.tgr .mileTop:nth-of-type(5), .tga .favoriteTop:nth-of-type(4), .tgc .tg-yrou:nth-of-type(3)
		{
		border-radius: 0 10px 0 0;
	}
	
	tr {
		border-bottom: 1px solid lightgray;
		background-color: white;
	}
	
	#info {
		top: -383px;
		left: 50px;
		width: 500px !important;
	}
	
	/*회원정보 항목 */
	#infoHeader {
		top: 11px;
		left: -60px;
	}
	
	#infoHeader li {
		padding-top: 22px !important;
	}
	/*회원정보 내용 */
	#info li:nth-of-type(5) {
		padding-left: 100px;
	}
	
	#info li:nth-of-type(7)>input {
		width: 190px;
		position: relative;
		left: 55px;
	}
	
	#infoBox button {
		font-size: 15px;
		border: 1px solid lightgray;
		width: 100x;
	}
	
	#addrBtnd {
		left: 115px;
		height: 26px !important;
	}
	
	button {
		height: 30px;
		width: 100px;
		border: 1px solid lightgray;
	}
	/*회원정보 회색 바*/
	#mileBar, #favoriteFarmBar, #cartBar {
		font-size: 20px;
		letter-spacing: 2px;
		background-color: rgb(40, 40, 100);
		color: white;
	}
	/*회원정보 버튼*/
	.btns {
		position: relative;
		float: left;
		top: -355px;
		left: 85px;
		font-size: 15px;
	}
	
	.btns>button {
		margin-right: 30px;
	}
	
	/*오른쪽 구매현황*/
	#buyHistory {
		position: relative;
		top: -550px !important;
		left: 555px;
		height: 320px;
	}
	
	#buyBox {
		position: relative;
		top: -40px;
	}
	
	#buyBox>div, #stopNum, #stopDays {
		border: 1px solid lightgray;
		border-radius: 5px;
		float: left;
		text-align: center;
		padding: 20px 10px;
		margin-right: 8px;
	}
	
	#buyBox>div:nth-of-type(1), #buyBox>div:nth-of-type(2) {
		position: relative;
		top: -175px;
		left: 35px;
		width: 200px;
		margin-right: 30px;
	}
	
	#buyBox>div:nth-of-type(3), #buyBox>div:nth-of-type(4), #buyBox>div:nth-of-type(5)
		{
		position: relative;
		top: -155px;
		left: 40px;
		width: 128px;
		margin-right: 20px;
	}
	
	#buyHistory>div:nth-of-type(2) {
		margin-left: 45px;
	}
	
	#buyHistory>div:nth-of-type(4) {
		margin-left: 30px;
	}
	
	#buyHistory>div:nth-of-type(2), #buyHistory>div:nth-of-type(3) {
		width: 200px;
		margin-top: 40px;
	}
	
	#buyHistory>div:nth-of-type(4), #buyHistory>div:nth-of-type(5),
		#buyHistory>div:nth-of-type(6) {
		width: 140px;
		margin-top: 20px;
	}
	
	#buyING, #buyDone, #cancelReq, #refundReq, #changeReq {
		font-weight: bold;
	}
	
	#buyINGfloat {
		display: flex;
		margin-left: 80px;
	}
	
	#buyHistory, #reportBox {
		margin: 20px 0 0 570px;
	}
	
	#reportBox {
		height: 205px;
		position: relative;
		top: -550px !important;
		left: 555px;
	}
	
	#reportsBox {
		position: relative;
		top: -40px;
	}
	
	#stopNum, #stopDays {
		display: flex;
		position: relative;
		width: 180px;
	}
	
	#stopNum {
		left: 60px;
		padding-left: 35px;
	}
	
	#stopDays {
		left: 80px;
		padding-left: 20px;
	}
	
	input {
		border: 1px solid gray;
	}
	
	/*마일리지 내역*/
	#mileHistory {
		margin-top: 50px;
		position: relative;
		top: -600px;
	}
	
	#mileBar {
		position: relative;
		top: 100px;
		height: 50px;
		padding: 20px 0 0 20px;
	}
	
	#mileBar>div {
		position: relative;
		width: 200px;
		top: -10px;
	}
	
	#mileHistory button {
		border-color: lightgray;
	}
	
	#mileBigBtn {
		margin: 150px 0 0 80px;
	}
	
	#mileBtn {
		position: relative;
		top: -30px;
		left: 660px;
	}
	
	#mileBtn>button {
		width: 80px;
	}
	
	.numSpace {
		margin-left: 15px;
		font-weight: bold;
		color: fuchsia;
	}
	
	/*마일리지 표*/
	#mileTbl {
		margin-left: 80px;
	}
	
	.tg {
		border-collapse: collapse;
		border-color: #aaa;
		border-spacing: 0;
	}
	
	.tgr td {
		border-bottom-width: 1px;
		border-color: #aaa;
		border-style: solid;
		border-top-width: 1px;
		border-width: 0px;
		color: #333;
		font-size: 14px;
		overflow: hidden;
		padding: 10px 5px;
		word-break: normal;
	}
	
	.tgr th {
		background-color: #FAF9F6;
		border-bottom-width: 1px #aaa solid;
		border-top-width: 1px;
		border-width: 0px;
		color: #404040;
		font-size: 14px;
		font-weight: normal;
		overflow: hidden;
		padding: 10px 5px;
		word-break: normal;
	}
	
	.tgr .mileTop {
		font-weight: bold;
		text-align: center;
		vertical-align: middle
	}
	
	.tgr .tgr-vj7v, .tgr .mileDate, .tgr .mileRow, .tgr .tgr-xpxz, .tgr .tgr-0ok3
		{
		text-align: center;
		vertical-align: middle;
	}
	
	.tgr .tgr-vj7v, .tgr .tg-xpxz {
		color: #3531ff;
	}
	
	.tgr .tgr-0ok3 {
		border-color: inherit;
		color: #fe0000;
	}
	
	#milepage {
		position: relative;
		top: - 50px;
	}
	
	.mileSubject {
		float: left;
		vertical-align: middle;
		margin: 15px 0 0 20px;
	}
	
	.mileName {
		font-size: 16px;
		margin-bottom: 5px;
	}
	
	/*즐겨찾는 농장*/
	#favoriteFarm {
		position: relative;
		top: 1800px;
	}
	
	#favoriteFarmBar {
		position: relative;
		height: 50px;
		padding: 10px 0 0 20px;
	}
	
	/*즐겨찾기 농장 테이블*/
	.tga {
		border: none;
		border-collapse: collapse;
		border-color: #aaa;
		border-spacing: 0;
	}
	
	.tga td {
		background-color: #fff;
		border-color: #aaa;
		border-style: solid;
		border-width: 0px;
		color: #333;
		font-family: Arial, sans-serif;
		font-size: 14px;
		overflow: hidden;
		padding: 10px 5px;
		word-break: normal;
	}
	
	.tga th {
		background-color: #FAF9F6;
		border: #aaa solid;
		border-width: 0px;
		color: #404040;
		font-family: Arial, sans-serif;
		font-size: 14px;
		font-weight: normal;
		overflow: hidden;
		padding: 10px 5px;
		word-break: normal;
	}
	
	.tga .tg-uron {
		border-color: #ffffff;
		color: #000000;
		font-size: 15px;
		text-align: center;
		vertical-align: middle
	}
	
	.tga .favoriteTop {
		font-size: 15px;
		font-weight: bold;
		text-align: center;
		vertical-align: middle
	}
	
	.tga .tg-8goc {
		font-size: 15px;
		text-align: center;
		vertical-align: middle
	}
	
	.tga .favoriteIntro {
		border-color: #ffffff;
		font-size: 15px;
		text-align: left;
		vertical-align: middle
	}
	
	.tga .tg-3hmd {
		border-color: #ffffff;
		font-size: 15px;
		text-align: center;
		vertical-align: middle
	}
	
	#favoriteFarm button {
		width: 80px;
	}
	
	#favoriteFarmTbl {
		position: relative;
		top: 150px;
		left: 20px;
	}
	
	#farmpage {
		position: relative;
		top: 150px;
	}
	
	/*장바구니*/
	#cart {
		position: relative;
		top: 2300px;
	}
	
	#cartBar {
		position: relative;
		height: 50px;
		padding: 10px 0 0 20px;
	}
	
	/*장바구니 테이블*/
	.tgc {
		border: none;
		border-collapse: collapse;
		border-color: #aaa;
		border-spacing: 0;
	}
	
	.tgc td {
		background-color: #fff;
		border-color: #aaa;
		border-style: solid;
		border-width: 0px;
		color: #333;
		font-family: Arial, sans-serif;
		font-size: 14px;
		overflow: hidden;
		padding: 10px 5px;
		word-break: normal;
	}
	
	.tgc th {
		background-color: #FAF9F6;
		border: #aaa solid;
		border-width: 0px;
		color: #404040;
		font-family: Arial, sans-serif;
		font-size: 14px;
		font-weight: normal;
		overflow: hidden;
		padding: 10px 5px;
		word-break: normal;
	}
	
	.tgc .tg-yrou {
		border-color: inherit;
		font-size: 15px;
		font-weight: bold;
		text-align: center;
		vertical-align: middle
	}
	
	.tgc .tg-7btt {
		border-color: inherit;
		font-weight: bold;
		text-align: center;
		vertical-align: top
	}
	
	.tgc .tg-hysb {
		border-color: inherit;
		text-align: center;
		vertical-align: middle
	}
	
	.tgc .tg-0pky {
		border-color: inherit;
		text-align: left;
		vertical-align: top
	}
	
	.tgc .favoriteIntro {
		border-color: #ffffff;
		font-size: 15px;
		text-align: left;
		vertical-align: middle
	}
	
	.tgc .tg-3hmd {
		border-color: #ffffff;
		font-size: 15px;
		text-align: center;
		vertical-align: middle
	}
	/*장바구니 테이블*/
	#cartTbl {
		position: relative;
		top: 350px;
		left: 40px;
	}
	
	#cartpage {
		position: relative;
		top: 330px;
	}
	
	.cartProduct {
		font-size: 16px;
		margin-bottom: 5px;
		padding-left: 50px;
	}
	
	.cartDetail {
		padding-left: 50px;
	}
	
	/*페이징 이미지 링크*/
	.page_nation .pprev {
		background: #f8f8f8
			url('<%=request.getContextPath()%>/img/kpage_pprev.png') no-repeat
			center center;
		margin-left: 0;
	}
	
	.page_nation .prev {
		background: #f8f8f8
			url('<%=request.getContextPath()%>/img/kpage_prev.png') no-repeat
			center center;
		margin-right: 7px;
	}
	
	.page_nation .next {
		background-image: :url('<%=request.getContextPath()%>/img/kpage_next.png')
			no-repeat center center;
		margin-left: 7px;
		background-color: #f8f8f8
	}
	
	.page_nation .nnext {
		background: #f8f8f8
			url('<%=request.getContextPath()%>/img/kpage_nnext.png') no-repeat
			center center;
		margin-right: 0;
	}
	
	#addrBtnd {
		z-index: 2;
	}
	
	/* 포인트 */
	#cMyPageLeft {
		display: block;
	}
	
	#mypointList {
		height: 1080px;
		position: absolute;
		top: 620px;
	}
	
	.Pbuttons {
		height: 40px;
		width: 80px;
		background-color: #e06666;
		color: white;
		line-height: 40px;
		text-align: center;
		border-radius: 7%;
		margin-left: 1px;
	}
	
	#pointSelect>div {
		float: left;
	}
	
	#pointSelectDate {
		float: right;
	}
	
	#pointSelectDate>div {
		float: left;
	}
	
	#pointUl {
		width: 1080px;
		margin-top: 54px;
		margin-left: 0px;
	}
	
	#pointUl>li {
		width: 11%;
		height: 60px;
		margin: 5px 0;
		float: left;
	}
	
	#pointUl>li:nth-child(5n+2) {
		width: 50%;
	}
	
	#pointUl>li:nth-child(5n+1) {
		width: 16%;
	}
	
	#pointUl>li:nth-child(5n+1) {
		width: 150px;
	}
	
	#pointUl>li:nth-child(5n+2) {
		width: 442px;
	}
	
	#pointUl>li:nth-child(5n+5) {
		width: 200px;
	}
	
	#pointUl>li:nth-child(1), #pointUl>li:nth-child(2), #pointUl>li:nth-child(3),
		#pointUl>li:nth-child(4) {
		line-height: 60px;
	}
	
	#pointUl>li:nth-child(1), #pointUl>li:nth-child(2), #pointUl>li:nth-child(3),
		#pointUl>li:nth-child(4), #pointUl>li:nth-child(5) {
		font-size: 14px;
		text-align: center;
		padding-bottom: 40px;
	}
	
	#pointUl>li:nth-child(5n+1), #pointUl>li:nth-child(5n+3), #pointUl>li:nth-child(5n+4),
		#pointUl>li:nth-child(5n) {
		text-align: center;
	}
	
	#pointUl>li:nth-child(5n+1), #pointUl>li:nth-child(5n+2), #pointUl>li:nth-child(5n+3),
		#pointUl>li:nth-child(5n+4), #pointUl>li:nth-child(5n) {
		
	}
	
	.pointdate {
		line-height: 60px;
	}
	
	.pointtitle {
		font-size: 1.1em;
	}
	
	.pointdetail {
		font-size: 0.9em;
		color: #999;
	}
	
	.pointprice {
		line-height: 60px;
	}
	
	.pointup, .pointdown {
		font-size: 0.9em;
		line-height: 60px;
	}
	
	.pointup {
		color: red;
	}
	
	.pointdown {
		color: blue;
	}
	
	.pointresult {
		font-weight: bold;
		line-height: 60px;
	}
	
	#pointUl img {
		height: 58px;
		width: 58px;
		float: left;
	}
	
	#mypointListDiv {
		overflow: auto;
	}
	
	#linkStop>a:link, #linkStop>a:active, #linkStop>a:visited, #linkStop>a:hover
		{
		text-decoration: none;
		color: black;
	}
	
	#mileBigBtn, #mileBtn, #mileTbl {
		display: none;
	}
	/* 포인트 */
	#favoriteFarm, #cart {
		position: absolute;
	}
	/* 농장 css */
	.Pbuttons {
		height: 40px;
		width: 80px;
		background-color: #e06666;
		color: white;
		line-height: 40px;
		text-align: center;
		border-radius: 7%;
		margin-left: 1px;
	}
	
	#favSelect>div {
		float: left;
	}
	
	#favSelectDate {
		float: right;
	}
	
	#favSelectDate>div {
		float: left;
	}
	
	#favUl {
		padding: 0px;
		margin: 0px;
		width: 1080px;
	}
	
	#favUl>li {
		height: 60px;
		line-height: 60px;
		margin: 5px 0;
		text-align: center;
	}
	
	#favUl>li:nth-child(1), #favUl>li:nth-child(2), #favUl>li:nth-child(3),
		#favUl>li:nth-child(4) {
		border-bottom: 1px solid #e06666;
	}
	/* #favUl>li:nth-child(5n+3){
			width:240px;
		}
		#favUl>li:nth-child(5n+2){
			width:530px;
			line-height:60px;
			float:left;
		    padding-left: 30px;
		}
		#favUl>li:nth-child(5n+1){
			width:60px;
		} */
	.buyttitle, .buydetail {
		line-height: 30px;
		text-align: left;
		float: left;
		width: 430px;
	}
	
	#favUl img {
		height: 58px;
		width: 58px;
		float: left;
		margin-right: 5px;
	}
	
	#cMyPageLeft {
		display: block;
	}
	
	.buytitle {
		font-size: 1.1em;
	}
	
	.buydetail {
		font-size: 0.9em;
		color: #999;
	}
	
	.wordcut {
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	
	.buybutton {
		width: 70px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		margin: 1px;
		padding: 0px;
		border: none;
		background-color: #e06666;
		color: white;
		border-radius: 5px;
	}
	
	.buybutton2 {
		width: 70px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		margin: 1px;
		padding: 0px;
		border: none;
		background-color: #e06666;
		color: white;
		border-radius: 5px;
	}
	
	#deletee>input {
		float: right;
	}
	
	#deletee {
		overflow: auto;
	}
	
	.buybuttonNo {
		width: 70px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		margin: 1px;
		padding: 0px;
		border: none;
		background-color: #e06666;
		color: white;
		border-radius: 5px;
		opacity: 60%;
	}
	
	#ttile {
		padding-top: 30px;
		overflow: auto;
		padding-bottom: 30px;
		font-size: 25px;
	}
	
	#subtitle {
		margin-left: 20px;
		font-size: 14px;
	}
	
	#ttile h2 {
		float: left;
	}
	
	input[type="checkbox"] {
		display: inline-block;
		width: 20px;
		height: 20px;
		border: 2px solid #bcbcbc;
		cursor: faver;
	}
	
	.like {
		height: 20px;
		width: 20px;
		background-size: 20px 20px;
		float: right;
		margin-top: 20px;
		margin-left: 25px;
	}
	
	.like {
		background-image: url(/sshj/img/dlike.png);
	}
	
	#hh>div {
		float: left
	}
	
	.hate {
		height: 20px;
		margin-left: 5px;
	}
	
	#favUl>li {
		float: left;
		height: 60px;
		line-height: 60px;
	}
	
	#favUl>li:nth-child(4n+1) {
		width: 590px !important;
		padding-left: 90px;
		float: left;
	}
	
	#favUl>li:nth-child(4n+2) {
		width: 240px;
	}
	
	#favUl>li:nth-child(4n+3) {
		width: 120px;
	}
	
	#favUl>li:nth-child(4n) {
		width: 120px;
	}
	/* 장바구니 */
	
	#wisht {
	float: left;
	width: 100%; 
	height: 20px;
	margin-top: 10px;
	font-weight: bold;
	margin-bottom: 30px;
	}
	#wisht>b{
		padding-top:20px;
		padding-left:20px;
		
	}
	.wishListTitle {
		width: 1080px;
		border-bottom: 2px solid #ddd;
		margin-top: 3%;
		margin-left:0px !important;
		height: 40px;
	}
	.wishList {
		width: 1080px;
	}
	.wishList>li>input{
	line-height:15px;
	height:15px;
	}
	.wishListTitle>li {
		float: left;
		line-height: 40px;
		width:180px;
		text-align:center;
		font-size:18px;
		color:gray;
		margin-bottom:10px;
		
	}
	.wishListTitle>li:nth-child(4n+1) {
		padding-left: 194px;
		width:700px;
	}
	.wishListTitle>li:nth-child(4n+2) {
		width:120px;
	}
	.wishListTitle>li:nth-child(4n+3) {
		width:200px;
	}
	.wishListTitle>li:nth-child(4n) {
		width: 60px;
	}
	/*--------------------게시판 리스트들---------------------------*/
	.wishList{
		border-bottom:1px solid #eee;
		height: 150px;
		margin:0 !important;
		width: 1080px;
	}
	.wishList>li {
		float: left;
		height: 150px;
		padding-top:20px;
		padding-bottom:20px;
	}
	.wishList>li:nth-child(7n+1) {
	  width: 200px;
	  padding-left:10px;
	  padding-right:50px;
	}
	.wishList>li:nth-child(7n+2) {
	  width: 500px;
	}
	.wishList>li:nth-child(7n+3) {
	  text-align:center;
	  line-height: 90px;
	  width:120px;
	}
	.wishList>li:nth-child(7n+4) {
	  text-align:center;
	  line-height: 90px;
	  width:200px;
	}
	.wishList>li:nth-child(7n+5) {
	  text-align:center;
	  line-height: 90px;
	  width: 0px !important;
	} 
	.wishList>li:nth-child(7n+6) {
	  text-align:center;
	  line-height: 90px;
	  width: 60px !important;	
	}
	.wishList>li:nth-child(7n) {
	  text-align:center;
	  line-height: 90px;
	  width: 0px !important;
	}
	.wishList>li>a>img {
		width: 100px;
		height: 100px;
		border-radius: 2px;
	}
	/*--------------------게시판 버튼들---------------------------*/
	#nogetbutton {
		line-height: 20px;
		margin-left:960px;
		color: #fff;
		border-radius: 5px;
		background: gray;
		text-decoration: none;
		display: inline-block;
		border: none;
		height: 30px;
		width:120px;
		
	}
	#nogetbutton:hover {
		color: red;
	}
	#wishCenterButton {
		width: 100%;
		float:left;
		padding-left:850px;
		margin-top:30px;
		margin-bottom:30px;
	}
	#wishPriceTitle {
	    background-color:#E8F1F4;
		float:left;
		width: 100%;
		margin-bottom: 50px;
		height:150px;
	}
	/*버튼----------------------------------------------------------------*/
	#swishbtn, #twishbtn {
		padding: 3px 10px;
		color: #666666;
		border-radius: 8px;
		background: #fff;
		box-shadow: 0 0px 3px 0 rgba(0, 0, 0, 0.5);
		text-align: center;
		text-decoration: none;
		display: inline-block;
		border: none;
	}
	/*버튼*/
	#swishbtn:hover, #twishbtn:hover {
		background: gray;
		color: white;
		display: inline-block;
	}
	#delbutton{
	border:none;
	width:15px;
	font-size:20px;
	background-color:white;
	color:gray;
	}
	#getbutton {
		padding: 3px 10px;
		color: #666666;
		border-radius: 8px;
		background: #fff;
		box-shadow: 0 0px 3px 0 rgba(0, 0, 0, 0.5);
		text-align: center;
		text-decoration: none;
		display: inline-block;
		border: none;
		line-height: 20px;
		height: 25px;
	}
	#getbutton:hover {
		background-color: #eee;
		color: red;
		display: inline-block;
	}
	#whisListPage {
		font-size: 17px;
		height:1080px;
	}
	.wishList a:active, .wishList a:link, .wishList a:hover, .wishList a:visited{
		color: black;
	}
	#menuListUl{
		font-size:14px;
	}
	#ptitle>a{
	font-size:19px;
	font-weight:bold;
	}
	#ptitleprice{
	color:gray;
	}
	#optitle{
	color:gray;
	font-weight:bold;
	}
	#wishone{
	font-size:20px;
	}
	#wishtotal{
	font-size:20px;
	}
	#pbtn,#mbtn{
	width:20px;
	height:20px;
	font-size:20px;
	margin-left:2px;
	margin-right:2px;
	border:none;
	}
	#paybtn{
	height:30px;
	border:1px solid #ddd;
	font-size:15px;
	}

	.wishlistbox{
		position: absolute;
		top:2700px;
	}
	#cart{
		display:none;
	}
	#stopModal{
		height:1606px;
		width:1920px;
		
		overflow-x:hidden;
		overflow-y:hidden;
		background-color: black;
		opacity: 70%;
		display: none;
		position: static;
		top:-250px;
		left:-320px;
		z-index:2;
	}
	#stopDiv{
		width:800px;
		height:800px;
		background-color: white;
		border:1px solid red;
		display:none;
		position: absolute;
	}
</style>

<%@ include file="/inc/top.jspf" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//주소검색
	$(function(){
		$("#addrBtnd").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            $("#userzipcode").val(data.zonecode);
		            $("#useraddr").val(data.address);
		            document.getElementById('userdetailaddr').focus();
		        }
		    }).open();
		});
		$("#useredit").click(function(){
			if(confirm('해당 정보로 수정하시겠습니까?')){
				$("#userinfoForm").submit();
			}
		})
		$("#userlist").click(function(){
			location.href="customerListA?pageNum="+$("#prevPageNum").val();
		});
		$("#userstop").click(function(){
			$("#stopModal").css("display","block");
		})
		
		
	});
	$(document).on('click','#allView',function(){
		location.href="boardCustomerInfoEdit?userid="+$("#useridhidden").val()
	});
	$(document).on('click','#saveView',function(){
		if($("#month").val()!=null && $("#month").val()!=''){
			location.href="mypoiboardCustomerInfoEditnt?type=save&month="+$("#month").val();
		}else{
			location.href="boardCustomerInfoEdit?type=save"
		}
	})
	$(document).on('click','#spendView',function(){
		if($("#month").val()!=null && $("#month").val()!=''){
			location.href="boardCustomerInfoEdit?type=spend&month="+$("#month").val();
		}else{
			location.href="boardCustomerInfoEdit?type=spend"
		}
	})
	$(document).on('click', '#3monthView', function(){
		if($("#type").val()!=null && $("#type").val()!=''){
			location.href="boardCustomerInfoEdit?month=3&type="+$("#type").val();
		}else{
			location.href="boardCustomerInfoEdit?month=3";
		}
	});
	$(document).on('click', '#6monthView', function(){
		if($("#type").val()!=null && $("#type").val()!=''){
			location.href="boardCustomerInfoEdit?month=6&type="+$("#type").val();
		}else{
			location.href="boardCustomerInfoEdit?month=6";
		}
	});
	$(document).on('click', '#12monthView', function(){
		if($("#type").val()!=null && $("#type").val()!=''){
			location.href="boardCustomerInfoEdit?month=12&type="+$("#type").val();
		}else{
			location.href="boardCustomerInfoEdit?month=12";
		}
	});
	function pagelistA(pagenum){
		var lin = "boardCustomerInfoEdit?pageNumA="+pagenum;
		lin += "&userid="+$("#useridhidden").val();
		if($("#month").val()>0){
			lin += "&month="+$("#month").val();
		}
		if($("#type").val()!=null && $("#type").val()!=''){
			lin += "&month="+$("#type").val();
		}
		location.href=lin;
	}
	function pagelistB(pagenum){
		var lin = "boardCustomerInfoEdit?pageNumB="+pagenum;
		lin += "&userid="+$("#useridhidden").val();
		location.href=lin;
	}
	function pagelistC(pagenum){
		var lin = "boardCustomerInfoEdit?pageNumC="+pagenum;
		lin += "&userid="+$("#useridhidden").val();
		location.href=lin;
	}
</script> 
<div id="topBarContainer">
	<div id="topBar">			
		<h5><strong><a href="boardCustomerInfoEdit">일반회원 정보수정</a></strong></h5>			
	</div>  
</div> 
<div id="body1">
	<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">
		<div id="contentBox"> 
		<input type="hidden" value="${ilist.userid}" id="useridhidden"/>
		<input type="hidden" value="${prevPageNum}" id="prevPageNum"/>
		<!-- 회원정보 파트 -->
	   		<div id="infoBox">
		 	<div id="infoTitle"><p>일반회원 정보</p></div>
		 		<ul id="infoHeader">
		 			<li>이름</li>
					<li>아이디</li>
					<li>이메일</li>
					<li>생년월일</li>
					<li>가입일</li>
					<li>연락처</li>
					<li><button type="button" class="success" id="addrBtnd">주소 검색</button></li>
					<li>주소</li>
					<li>상세주소</li> 
		 		</ul>
	 			<form id="userinfoForm"  method="post" action="userinfoupdate">
	 				<c:if test="${editOk == 'Y'}">
	 					<script>
	 						alert("수정에 성공했습니다!");
	 					</script>
	 				</c:if>
	 				<c:if test="${editOk == 'N'}">
	 					<script>
	 						alert("수정에 실패했습니다!");
	 					</script>
	 				</c:if>
			 		<ul id="info">
			 			<li><input type="text" value="${ilist.username}" name="username"/></li>
						<li><input type="text" value="${ilist.userid}"name="userid"/></li>
						<li><input type="text" value="${ilist.useremail}"name="useremail"/></li>
						<li><input type="text" value="${ilist.birthday}"name="birthday" disabled/></li>
						<li><input type="text" value="${ilist.joindate}"name="joindate" disabled/></li>
						<li><input type="text" value="${ilist.userphone}"name="userphone"/></li>
						<li><input type="text" value="${ilist.userzipcode}" id="userzipcode"name="userzipcode"/></li>
						<li><input type="text" value="${ilist.useraddr}" id="useraddr"name="useraddr"/></li>
						<li><input type="text" value="${ilist.userdetailaddr}" id="userdetailaddr"name="userdetailaddr"/></li>
			 		</ul>
				</form>  
		 		<div class="btns">
					<button class="success" value="회원 목록" name="customerList" id="userlist" >회원 목록</button>
					<button class="success" value="수정" id="useredit" >수정</button>
					<button class="success" value="정지" name="del" id="userstop">정지</button>
				</div>
		 	</div>
		 	
		 	<!-- 구매내역 파트 -->
	   		<div id="buyHistory">
			 	<div id="buyTitle"><p>구매현황</p></div> 	
			 	<section id="buyBox">		 
					<div>결제 완료 <br/><div id="buyINGfloat"><div id="buyING" style="color:red">${olist1}</div>건</div></div>
					<div>구매 확정 <br/><span id="buyDone" style="color:green">${olist2}</span>건</div>
					<div>배송중 <br/><span id="cancelReq" style="color:orange">${olist3}</span>건</div>
					<div>환불 <br/><span id="refundReq" style="color:blue">${olist4}</span>건</div>
					<div>환불 진행중 <br/><span id="changeReq" style="color:purple">${olist5}</span>건</div>	 
			 	</section> 	 
		 	</div> 
		 	
		 	<!-- 신고내역 파트 -->
		 	<div id="reportBox">
			 	<div id="reportTitle"><div id="reportHead">신고내역</div></div> 	
			 	<section id="reportsBox">		 
					<div id="stopNum">정지 횟수 <div class="numSpace">${rlist.ordercount}</div>회</div>
					<div id="stopDays">정지 총 일수  <div class="numSpace">${rlist.reportsum}</div>일</div>		
			 	</section> 	 
		 	</div>
		 	
		 	<!-- 마일리지 파트 -->
		 	<c:if test="${pageVOA.pageNum >=2}">
			 	<script>
			 		$(function(){
			 			location.href="#pageNumA";
			 		})
			 	</script>
		 	</c:if>
	 	<div id="mypointList"><a name="pageNumA"></a>
	 	<div id="mileBar" style="top:0px;"><div><strong>회원 마일리지 내역</strong></div></div>
		<c:if test="${type != null}">
			<input type="hidden" id="type" value="${type}"/>
		</c:if>
		<c:if test="${month != null}">
			<input type="hidden" id="month" value="${month}"/>
		</c:if>
		<h2>마이포인트</h2>
		<h4>현재 포인트 : ${mypoint}p</h4>
		<div style="margin-bottom:20px;">
			<b style="font-size:15px;">${ilist.userid}</b>님의 포인트 적립 현황입니다.<br/>
			저희 비트몰에서는 구매가격의 1%를 포인트로 적립해드리고 있습니다.<br/> 
			포인트는 현금과 동일하게 사용하실 수 있으며, 구매시 사용하여 할인받을 수 있습니다.<br/>
			오늘도 비트몰을 이용해주셔서 감사합니다. <br/>
		</div>
		<div id="pointSelect">
			<div class="btn" id="allView">전체</div>
			<div class="btn" id="saveView">적립</div>
			<div class="btn" id="spendView">소비</div>
		</div>
		<div id="pointSelectDate">
			<div class="btn" id="3monthView">3개월</div>
			<div class="btn" id="6monthView">6개월</div>
			<div class="btn" id="12monthView">1년</div>
		</div>
			<ul id="pointUl">
				<li>일시</li>
				<li>상품</li>
				<li>판매가</li>
				<li>마일리지</li>
				<li>잔여<br/>마일리지</li>
				<c:forEach var="vo" items="${listA}">
					<li><span class="pointdate">${vo.orderdate}</span></li>
					<li id="linkStop">
						<a href="customproduct?no=${vo.productnum}"><img src="/sshj/resources/sellerProductImgs/${vo.thumbimg}" style="margin-right:10px;"></a>
						<a href="customproduct?no=${vo.productnum}"><span class="pointtitle wordcut">${vo.productname}</span><br/></a>
						<a href="customproduct?no=${vo.productnum}"><span class="pointdetail wordcut">${vo.productcontent }</span></a>
					</li>
					<li><span class="pointprice">${vo.orderprice}</span>원</li>
					<c:if test="${vo.changepoint > 0}">
						<li><span><span class="pointup">${vo.changepoint}p적립</span></span></li>
					</c:if>
					<c:if test="${vo.changepoint < 0}">
						<li><span><span class="pointdown">${vo.changepoint * -1}p소비</span></span></li>
					</c:if>
					<li><span class="pointresult">${vo.usedpoint}p</span></li>
				</c:forEach>
			</ul>
			
			<!-- 페이징 -->
			<div class="page_wrap">	
				<div class="page_nation">
				   <c:if test="${pageVOA.pageNum>1}"><!-- 이전페이지가 있을때 -->
				   		<a class="arrow prev" href="javascript:pagelistA(${pageVOA.pageNum-1})"></a>
				   </c:if>
				   <!-- 페이지 번호                   1                                    5                     -->
		           <c:forEach var="p" begin="${pageVOA.startPageNum}" step="1" end="${pageVOA.startPageNum + pageVOA.onePageNum-1}">
		              <c:if test="${p<=pageVOA.totalPage}">
		                 <c:if test="${p==pageVOA.pageNum }"> <!-- 현재페이지일때 실행 -->
		                    <a class="active">${p}</a>
		                 </c:if>   
		                 <c:if test="${p!=pageVOA.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
		                    <a href="javascript:pagelistA(${p})">${p}</a>
		                 </c:if>
		              </c:if>
		           </c:forEach>
		           <c:if test="${pageVOA.pageNum < pageVOA.totalPage}">
		              <a class="arrow next" href="javascript:pagelistA(${pageVOA.pageNum+1})"></a>
		           </c:if>
				</div>
			 </div>
		</div>
	<!-- 여까지 포인트 -->
		 	
			<!-- 즐겨찾기 농장 파트 -->
	 		<div id="favoriteFarm">
				<div id="favoriteFarmBar"><strong>회원 즐겨찾기 농장</strong></div>
				<div id="myfavList">
					<div id="ttile" class="ttile">즐겨찾기한 농장</div>
					<div id="subtitle">${ilist.userid} 회원이 즐겨찾기한 농장입니다.</div>
					<div>
						<ul id="favUl">
							<li>소개</li>
							<li>위치</li>
							<li>즐겨찾기한 사용자</li>
							<li>구경하기</li>
							
							<c:forEach var="data" items="${listB}">
								<li>
									<img src="/sshj/img/${data.farmprofile}"><span class="buyttitle wordcut">${data.farmname}</span><span class="buydetail wordcut">${data.farmintro}</span>
								</li>
								<li><span class="favprice">${data.storeaddr}</span></li>
								<li id="hh"><div class="like"></div><div class="hate">${data.goodTotal}명</div></li>
								<li><input type="button" class="buybutton" value="구경가기" onclick="click22(${data.storenum})"/></li>
							</c:forEach>				
						</ul>
					</div>
				</div>
				<div class="page_wrap">	
			<div class="page_nation">
			   <c:if test="${pageVOB.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="javascript:pagelistB(${pageVOB.pageNum-1})"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVOB.startPageNum}" step="1" end="${pageVOB.startPageNum + pageVOB.onePageNum-1}">
	              <c:if test="${p<=pageVOB.totalPage}">
	                 <c:if test="${p==pageVOB.pageNum }"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVOB.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="javascript:pagelistB(${p})">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVOB.pageNum < pageVOB.totalPage}">
	              <a class="arrow next" href="javascript:pagelistB(${pageVOB.pageNum+1})"></a>
	           </c:if>
			</div>
		 </div>
	 		</div>
	 		<!-- 장바구니 부분 -->
	 		
			<div class="wishlistbox"><a name="pageNumC"></a>
				<div id="cartBar">
						<strong>회원 장바구니</strong>
					</div>
				<ul class="wishListTitle">
					<li><b>상품정보</b></li>
					<li><b>상품수량</b></li>
					<li><b>구매가격</b></li>
					<li><b>제거</b></li>
				</ul>

				<c:forEach var="wl" items="${listC}">

					<ul class="wishList">
						<li><a href=""><img src="img/${wl.thumbimg}"></a></li>
						<!-- 이미지 -->

						<li>
							<div id="ptitle">
								<a href="">${wl.productname}</a>
							</div>
							<!-- 상품이름 -->
							<div id="ptitleprice">원가: ${wl.productprice}원</div>
							<!-- 상품가격 -->
							<div id="ptitlediscount">할인가격: ${wl.saleprice}원</div>
							<!-- 할인가격 --> <c:if test="${wl.optionnum>0}">
								<div id="optitle">
									추가옵션 :${wl.optionname}${wl.optionprice} x ${wl.wishoptionnum}
									개 <span id="wishoptionCount"></span>
								</div>
								<!-- 옵션이름 -->
								<!-- 옵션 수량 -->
							</c:if> <c:if test="${wl.optionnum<=0}">
								<div id="optitle">&nbsp;</div>
								<!-- 옵션이름 -->
								<!-- 옵션 수량 -->
							</c:if>

						</li>

						<li>
							<input type="button" id="mbtn" class="mCount" value="-" />
							<input type="hidden" value="${((wl.productprice-wl.saleprice)*wl.wishnum)+(wl.optionprice*wl.wishoptionnum)}">
							<span id="prtnum">${wl.wishnum}</span> 
							<input type="button" id="pbtn" class="pCount" value="+" /> 
							<input type="hidden" value="${wl.productprice}"> 
							<input type="hidden" value="${wl.saleprice}"> 
							<input type="hidden" value="${wl.wishnum}"> 
							<input type="hidden" value="${wl.optionprice}"> 
							<input type="hidden" value="${wl.wishoptionnum}"> 
							<input type="hidden" value="${wl.optionname}"> 
							<input type="hidden"value="${wl.productname}">
						</li>
						<!-- 상품수량 -->

						<!--                                          상품가격         할인가격   *     상품갯수      옵션가격      *      옵션갯수     -->
						<li><span id="oneproductTotalPrice">${((wl.productprice-wl.saleprice)*wl.wishnum)+(wl.optionprice*wl.wishoptionnum)}원</span></li>
						<!-- 총가격 -->

						
						<!-- <li><input type="checkbox" name="checkbox" value=""/></li> -->
						<li>
							<input type="hidden" value="${((wl.productprice-wl.saleprice)*wl.wishnum)+(wl.optionprice*wl.wishoptionnum)}">
							<input type="hidden" value="${wl.productprice}"> 
							<input type="hidden" value="${wl.saleprice}"> 
							<input type="hidden" value="${wl.wishnum}"> 
							<input type="hidden" value="${wl.optionprice}">
						</li>
						<li><input type="button" value="x" id="delbutton" /></li>

					</ul>

				</c:forEach>
				<!-- 페이징 표시--------- -->
				<c:if test="${pageVOC.pageNum >=2}">
			 	<script>
			 		$(function(){
			 			location.href="#pageNumC";
			 		})
			 	</script>
		 		</c:if>
				<div class="page_wrap">
					<div class="page_nation">
						<c:if test="${pageVOC.pageNum>1}">
							<!-- 이전페이지가 있을때 -->
							<a class="arrow prev"
								href="javascript:pagelistC(${pageVOC.pageNum-1})"></a>
						</c:if>
						<!-- 페이지 번호                   1                                    5                     -->
						<c:forEach var="p" begin="${pageVOC.startPageNum}" step="1"
							end="${pageVOC.startPageNum + pageVOC.onePageNum-1}">
							<c:if test="${p<=pageVOC.totalPage}">
								<c:if test="${p==pageVOC.pageNum}">
									<!-- 현재페이지일때 실행 -->
									<a class="active">${p}</a>
								</c:if>
								<c:if test="${p!=pageVOC.pageNum}">
									<!-- 현재페이지가 아닐때 실행 -->
									<a
										href="javascript:pagelistC(${p})">${p}</a>
								</c:if>
							</c:if>
						</c:forEach>
						<c:if test="${pageVOC.pageNum < pageVOC.totalPage}">
							<a class="arrow next"
								href="javascript:pagelistC(${pageVOC.pageNum+1})"></a>
						</c:if>
					</div>
				</div>
				<div id="wishPriceTitle">
					<div id="wishone">상품 가격:</div>
					<div id="wishtotal">총 구매가격:</div>
				</div>

				</div>
				<div id="cart">
					
					<div id="cartTbl">
						<table class="tgc" style="table-layout: fixed; width: 973px">
							<colgroup>
								<col style="width: 130px">
								<col style="width: 93px">
								<col style="width: 554px">
								<col style="width: 196px">
							</colgroup>
							<thead>
								<tr>
									<th class="tg-yrou">일시</th>
									<th class="tg-7btt" colspan="2">상품</th>
									<th class="tg-yrou">판매가</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="tg-hysb">2021-05-29<br>13:00
									</td>
									<td class="tg-0pky"><img
										src="<%=request.getContextPath()%>/img/dsweetpotato1.jpg"
										width="80" height="80"></td>
									<td class="favoriteIntro">
										<div class="cartProduct wordCut" style="font-weight: bold">맛깔나는
											귤</div>
										<div class="cartDetail wordCut">싱싱농산 귤은 언제나 맛있다! 우리
											싱싱농장에서 정성으로 키운 싱싱한 귤을 빠른 배송으로 받아보세요!</div>
									</td>
									<td class="tg-3hmd">17,960원</td>
								</tr>
								<tr>
									<td class="tg-hysb">2021-05-25<br>12:30
									</td>
									<td class="tg-0pky"><img
										src="<%=request.getContextPath()%>/img/dsweetpotato1.jpg"
										width="80" height="80"></td>
									<td class="favoriteIntro">
										<div class="cartProduct wordCut" style="font-weight: bold">맛깔나는
											귤</div>
										<div class="cartDetail wordCut">싱싱농산 귤은 언제나 맛있다! 우리
											싱싱농장에서 정성으로 키운 싱싱한 귤을 빠른 배송으로 받아보세요!</div>
									</td>
									<td class="tg-3hmd">28,650원</td>
								</tr>
								<tr>
									<td class="tg-hysb">2021-05-30<br>19:25
									</td>
									<td class="tg-0pky"><img
										src="<%=request.getContextPath()%>/img/dsweetpotato1.jpg"
										width="80" height="80"></td>
									<td class="favoriteIntro">
										<div class="cartProduct wordCut" style="font-weight: bold">맛깔나는
											귤</div>
										<div class="cartDetail wordCut">싱싱농산 귤은 언제나 맛있다! 우리
											싱싱농장에서 정성으로 키운 싱싱한 귤을 빠른 배송으로 받아보세요!</div>
									</td>
									<td class="tg-3hmd">85,620원</td>
								</tr>
								<tr>
									<td class="tg-hysb">2021-05-30<br>11:21
									</td>
									<td class="tg-0pky"><img
										src="<%=request.getContextPath()%>/img/dsweetpotato1.jpg"
										width="80" height="80"></td>
									<td class="favoriteIntro">
										<div class="cartProduct wordCut" style="font-weight: bold">맛깔나는
											귤</div>
										<div class="cartDetail wordCut">싱싱농산 귤은 언제나 맛있다! 우리
											싱싱농장에서 정성으로 키운 싱싱한 귤을 빠른 배송으로 받아보세요!</div>
									</td>
									<td class="tg-3hmd">26,600원</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="page_wrap" id="cartpage">
						<div class="page_nation">
							<a class="arrow pprev"
								href="<%=request.getContextPath()%>/img/kpage_pprev.png"></a> <a
								class="arrow prev" href="#"></a> <a href="#" class="active">1</a>
							<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
							<a href="#">6</a> <a href="#">7</a> <a href="#">8</a> <a href="#">9</a>
							<a href="#">10</a> <a class="arrow next" href="#"></a> <a
								class="arrow nnext" href="#"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="stopModal"></div>
		<div id="stopDiv">
		</div>
</div>
</html>