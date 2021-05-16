<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{margin:0px; padding:0px; list-style-type :none; font-family: 'Nanum Gothic', sans-serif;}
	#leftMenu{ display:block;}
	/* 페이징처리부분 */
	.page_wrap {
		text-align:center;
		font-size:0;
		padding-bottom: 30px;
	}
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:35px;
		height:35px;
		line-height:35px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.page_nation .arrow {
		border:1px solid #ccc;
	}
	.page_nation .pprev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_pprev.png') no-repeat center center;
		margin-left:0;
	}
	.page_nation .prev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation .nnext {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_nnext.png') no-repeat center center;
		margin-right:0;
	}
	.page_nation a.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	/* 페이징처리끝 */
	/* 상품페이지 부분 */
	#productMain{
		width: 1100px;
		overflow:auto;
		padding-left: 40px;
	}
	#productMain div{
		text-align: left;
		margin-right: 65px;
		margin-bottom: 30px;
	}
	#productDiv{
		width:200px;
		float: left;
	}
	#productDiv>ul>li>img{
		width:198px;
		height:198px;
		border-radius: 10%;
	}
	#productDiv>ul>li{
		width:200px;
		padding-top: 3px;
	}
	#productDiv>ul>li:nth-child(5n+2){
	    font-size: x-large;
	    font-weight: bold;
	}
	#productDiv>ul>li:nth-child(5n+1){
	    padding-top:15px;
	}
	
	#categoryAll>img, #categoryFruit>img, #categoryVege>img, #categorySall>img{
		width:95px;
		height:96px;
		border-radius:80%;
		object-fit:cover;
	}
	#taag:link,#taag:visited,#taag:hover,#taag:active{
		color:black;
	}
	
	/* 상품페이지 부분 css끝 */
	.main{
		width:1080px;
	}
	#mainName{
		text-align: center;
		margin-bottom: 40px;
		margin-top: 80px;
	}
	#category{
		overflow: auto;
		height:200px;
		width:auto;
		padding-left:120px;
	}
	#category li{
		float: left;
		text-align: center;
		padding-left : 90px;
		padding-right : 10px;
	}
	#pickupMain{
		float: right;
		vertical-align: middle;
   		font-size: large;
	    padding-top: 5px;
	}
	#Sequence{
		margin-left:20px;
		width: 100px;
		padding: .5em;
		border: 1px solid #999;
		font-family: inherit;
		background: url('<%=request.getContextPath()%>/img/karrow.jpg') no-repeat 95% 50%/30px;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}
	#pickup{
		width: 17px;
    	height: 17px;
	}
	#categorySubmenu> #pickupMain, #Sequence{
		position:relative;
		height:40px;
		width: 105px;
	}
	#category2{
		position:absolute;
		left:550px;
		top: 685px;
		width:830px;
		height:21px;
		overflow:hidden;
	}
	#category2>span>div>a{
		text-align: center;
		padding:20px;
		cursor:pointer;
	}
	#coloor{
		color:red;
	}
	#search_container{
		width: 100%;
    	margin: 0 auto;
    	margin-bottom: 10px;
    	overflow: auto;
    	padding-right: 50px;
	}
	#searchForm{
	    float: right;
	}
	#search_box{
		border: none;
	}
	#searchWord{
		height: 30px;
	}
	#searchBtn{
	    margin-left: -1px;
	    background: white;
	    width: 50px;
	    height: 30px;
        border: 1px solid black;
	}
	#categoryAll,#categoryFruit,#categoryVege,#categorySall{
		color:black;
	}
</style>
<script>
//검색어 확인
	$(function(){		
		$("#searchForm").submit(function(){
			//searchWord있는지 없는지 찾기 , 있을때만 데이터 넘기기
			if($('#searchWord').val()==""){
				alert("검색어를 입력하세요.");
				return false;
			}
			return true;
		});

	    $("#pickup").change(function(){
	        if($("#pickup").is(":checked")){
	        	if($("#item").val() != null && $("#item").val()!='' && $("#type").val() != null && $("#type").val()!=''){//두개다 널이아닐때
	        		location.href="/sshj/categoryMain?item="+$("#item").val()+"&type="+$("#type").val()	+"&pick=1"
	        	}else if($("#item").val() != null && $("#item").val()!=''){//아이템만 널이아닐때
	        		location.href="/sshj/categoryMain?item="+$("#item").val()+"&pick=1"
	        	}else if($("#type").val() != null && $("#type").val()!=''){//타입만 널이아닐때
	        		location.href="/sshj/categoryMain?type="+$("#type").val()+"&pick=1"
	        	}else{
	        		location.href="/sshj/categoryMain?&pick=1"
	        	}
	        }else{
	        	if($("#item").val() != null && $("#item").val()!='' && $("#type").val() != null && $("#type").val()!=''){//두개다 널이아닐때
	        		location.href="/sshj/categoryMain?&item="+$("#item").val()+"&type="+$("#type").val()	
	        	}else if($("#item").val() != null && $("#item").val()!=''){//아이템만 널이아닐때
	        		location.href="/sshj/categoryMain?&item="+$("#item").val()
	        	}else if($("#type").val() != null && $("#type").val()!=''){//타입만 널이아닐때
	        		location.href="/sshj/categoryMain?&type="+$("#type").val()
	        	}else{
	        		location.href="/sshj/categoryMain"
	        	}	
	        }
	    });
	    $('#Sequence').change(function(){
	   		if($('#Sequence option:selected').val() == "평점높은순"){
	            if($("#item").val() != null && $("#item").val()!='' && $("#pick").val() != null && $("#pick").val()!=''){ //두개다 널이 아닐때
	            	location.href="/sshj/categoryMain?item="+$("#item").val()+"&type=1&pick=1"
	            }else if($("#item").val() != null && $("#item").val()!=''){ //아이템만 널이아닐떄
	            	location.href="/sshj/categoryMain?item="+$("#item").val()+"&type=1"
	            }else if($("#pick").val() != null && $("#pick").val()!=''){ //픽업만 널이아닐때
	            	location.href="/sshj/categoryMain?type=1&pick=1"
	            }else{//다 널일때
	            	location.href="/sshj/categoryMain?type=1"
	            }
	   		}else if($('#Sequence option:selected').val() == "평점낮은순"){
	   			if($("#item").val() != null && $("#item").val()!='' && $("#pick").val() != null && $("#pick").val()!=''){ //두개다 널이 아닐때
	            	location.href="/sshj/categoryMain?item="+$("#item").val()+"&type=2&pick=1"
	            }else if($("#item").val() != null && $("#item").val()!=''){ //아이템만 널이아닐떄
	            	location.href="/sshj/categoryMain?item="+$("#item").val()+"&type=2"
	            }else if($("#pick").val() != null && $("#pick").val()!=''){ //픽업만 널이아닐때
	            	location.href="/sshj/categoryMain?type=2&pick=1"
	            }else{//다 널일때
	            	location.href="/sshj/categoryMain?type=2"
	            }
	   		}else if($('#Sequence option:selected').val() == "리뷰많은순"){
	   			if($("#item").val() != null && $("#item").val()!='' && $("#pick").val() != null && $("#pick").val()!=''){ //두개다 널이 아닐때
	            	location.href="/sshj/categoryMain?item="+$("#item").val()+"&type=3&pick=1"
	            }else if($("#item").val() != null && $("#item").val()!=''){ //아이템만 널이아닐떄
	            	location.href="/sshj/categoryMain?item="+$("#item").val()+"&type=3"
	            }else if($("#pick").val() != null && $("#pick").val()!=''){ //픽업만 널이아닐때
	            	location.href="/sshj/categoryMain?type=3&pick=1"
	            }else{//다 널일때
	            	location.href="/sshj/categoryMain?type=3"
	            }
	   		}else if($('#Sequence option:selected').val() == "리뷰적은순"){
	   			if($("#item").val() != null && $("#item").val()!='' && $("#pick").val() != null && $("#pick").val()!=''){ //두개다 널이 아닐때
	            	location.href="/sshj/categoryMain?item="+$("#item").val()+"&type=4&pick=1"
	            }else if($("#item").val() != null && $("#item").val()!=''){ //아이템만 널이아닐떄
	            	location.href="/sshj/categoryMain?item="+$("#item").val()+"&type=4"
	            }else if($("#pick").val() != null && $("#pick").val()!=''){ //픽업만 널이아닐때
	            	location.href="/sshj/categoryMain?type=4&pick=1"
	            }else{//다 널일때
	            	location.href="/sshj/categoryMain?type=4"
	            }
	   		}
 		});
	    //타입1로넘어오면 설정하기
	    if($('#type').val()=='1'){
	    	$('#Sequence').val('평점높은순').prop("selected",true);
	    }else if($('#type').val()=='2'){
	    	$('#Sequence').val('평점낮은순').prop("selected",true);
	    }else if($('#type').val()=='3'){
	    	$('#Sequence').val('리뷰많은순').prop("selected",true);
	    }else if($('#type').val()=='4'){
	    	$('#Sequence').val('리뷰적은순').prop("selected",true);
	    }
	    
	    //픽업 성공하면 checked로 설정하기
	    if($('#pick').val()=='1'){
	    	$("input:checkbox[id='pickup']").attr("checked", true);
	    }
	});
	
	//이전페이지 가기
	function prevPage(){
		var loca = "/sshj/categoryMain?";
		if($("#item").val() != null && $("#item").val()!=''){
			loca += "item="+$("#item").val();
		}
		if($("#type").val() != null && $("#type").val()!=''){
			if($("#item").val() != null && $("#item").val()!=''){
				loca += "&type="+$("#type").val();
			}else{
				loca += "type="+$("#type").val();
			}
		}
		if($("#pick").val()!=null && $("#pick").val()!=''){
			if($("#item").val() != null && $("#item").val()!='' ||
			   $("#type").val() != null && $("#type").val()!=''){
				loca += "&pick="+$("#pick").val();
			}else{
				loca += "pick="+$("#pick").val();
			}
		}
		if($("#pageNum").val() != null && $("#pageNum").val()!=''){
			if($("#item").val() != null && $("#item").val()!='' ||
			   $("#type").val() != null && $("#type").val()!='' ||
			   $("#pick").val() != null && $("#pick").val()!=''){
				var pagenumgg = Number($("#pageNum").val())-1
				loca += "&pageNum="+ pagenumgg ;
			}else{
				var pagenumgg = Number($("#pageNum").val())-1
				loca += "pageNum="+ pagenumgg;
			}
		}
		if($("#searchWord").val() != null && $("#searchWord").val()!=''){
			if($("#item").val() != null && $("#item").val()!='' ||
			   $("#type").val() != null && $("#type").val()!='' ||
			   $("#pick").val() != null && $("#pick").val()!='' ||
			   $("#pageNum").val() != null && $("#pageNum").val()!=''){
				loca += "&searchWord="+$("#searchWord").val();
			}else{
				loca += "searchWord="+$("#searchWord").val();
			}
		}
		location.href=loca;
		return loca;
	}
	
	//다음페이지 가기
	function nextPage(){
		var loca = "/sshj/categoryMain?";
		if($("#item").val() != null && $("#item").val()!=''){
			loca += "item="+$("#item").val();
		}
		if($("#type").val() != null && $("#type").val()!=''){
			if($("#item").val() != null && $("#item").val()!=''){
				loca += "&type="+$("#type").val();
			}else{
				loca += "type="+$("#type").val();
			}
		}
		if($("#pick").val()!=null && $("#pick").val()!=''){
			if($("#item").val() != null && $("#item").val()!='' ||
			   $("#type").val() != null && $("#type").val()!=''){
				loca += "&pick="+$("#pick").val();
			}else{
				loca += "pick="+$("#pick").val();
			}
		}
		if($("#pageNum").val() != null && $("#pageNum").val()!=''){
			if($("#item").val() != null && $("#item").val()!='' ||
			   $("#type").val() != null && $("#type").val()!='' ||
			   $("#pick").val() != null && $("#pick").val()!=''){
				var pagenumgg = Number($("#pageNum").val())+1
				loca += "&pageNum="+ pagenumgg ;
			}else{
				var pagenumgg = Number($("#pageNum").val())+1
				loca += "pageNum="+ pagenumgg;
			}
		}
		if($("#searchWord").val() != null && $("#searchWord").val()!=''){
			if($("#item").val() != null && $("#item").val()!='' ||
			   $("#type").val() != null && $("#type").val()!='' ||
			   $("#pick").val() != null && $("#pick").val()!='' ||
			   $("#pageNum").val() != null && $("#pageNum").val()!=''){
				loca += "&searchWord="+$("#searchWord").val();
			}else{
				loca += "searchWord="+$("#searchWord").val();
			}
		}
		location.href=loca;
		return loca;
	}
	
	//클릭한 페이지 이동하기
	function clickPage(click){
		var loca = "/sshj/categoryMain?";
		if($("#item").val() != null && $("#item").val()!=''){
			loca += "item="+$("#item").val();
		}
		if($("#type").val() != null && $("#type").val()!=''){
			if($("#item").val() != null && $("#item").val()!=''){
				loca += "&type="+$("#type").val();
			}else{
				loca += "type="+$("#type").val();
			}
		}
		if($("#pick").val()!=null && $("#pick").val()!=''){
			if($("#item").val() != null && $("#item").val()!='' ||
			   $("#type").val() != null && $("#type").val()!=''){
				loca += "&pick="+$("#pick").val();
			}else{
				loca += "pick="+$("#pick").val();
			}
		}
		if($("#pageNum").val() != null && $("#pageNum").val()!=''){
			if($("#item").val() != null && $("#item").val()!='' ||
			   $("#type").val() != null && $("#type").val()!='' ||
			   $("#pick").val() != null && $("#pick").val()!=''){
				console.log(this);
				loca += "&pageNum="+ click;
			}else{
				console.log(this);
				loca += "pageNum="+ click;
			}
		}
		if($("#searchWord").val() != null && $("#searchWord").val()!=''){
			if($("#item").val() != null && $("#item").val()!='' ||
			   $("#type").val() != null && $("#type").val()!='' ||
			   $("#pick").val() != null && $("#pick").val()!='' ||
			   $("#pageNum").val() != null && $("#pageNum").val()!=''){
				loca += "&searchWord="+$("#searchWord").val();
			}else{
				loca += "searchWord="+$("#searchWord").val();
			}
		}
		location.href=loca;
		return loca;
	}
</script>
<div class="section">
	<c:if test="${pageVO.item != null}">
		<input type="hidden" id="item" value="${pageVO.item}"/>
	</c:if>
	<c:if test="${pageVO.type != null}">
		<input type="hidden" id="type" value="${pageVO.type}"/>
	</c:if>
	<c:if test="${pageVO.pick != null}">
		<input type="hidden" id="pick" value="${pageVO.pick}"/>
	</c:if>
	<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">
		<input type="hidden" id="searchWord" value="${pageVO.searchWord}"/>
	</c:if>
	<c:if test="${pageVO.pageNum != null && pageVO.pageNum != ''}">
		<input type="hidden" id="pageNum" value="${pageVO.pageNum}"/>
	</c:if>
	<div class="main">
		<div id="mainName"><h1>상품 품목별(야채)</h1></div>
			<ul id="category">
				<li><a href="categoryMain"><span id="categoryAll" style="cursor:pointer"><img src="/sshj/img/kmain.png"><br/><br/>전체</span></a></li>
				<li><a href="categoryMain?item=Fruit"><span id="categoryFruit" style="cursor:pointer"><img src="/sshj/img/kfruit.png"><br/><br/>과일</span></a></li>
				<li><a href="categoryMain?item=vegetable"><span id="categoryVege" style="cursor:pointer"><img src="/sshj/img/kvegetable.png"><br/><br/>채소</span></a></li>
				<li><a href="categoryMain?item=Rice"><span id="categorySall" style="cursor:pointer"><img src="/sshj/img/krice.png"><br/><br/>쌀/잡곡</span></a></li>
			</ul>
			<div id="search_container">
				<form method="get" action="categoryMain" id="searchForm">
					<span id="search_box">
						<input type="text" id="searchWord" name="searchWord" placeholder="검색하기"><input type="submit" id="searchBtn" value="검색"/>
					</span>
				</form>
			</div>
			<div id="categorySubmenu">
			<hr/>
				<select id="Sequence" name="Sequence">
					<option value="평점높은순">평점높은순</option>
					<option value="평점낮은순">평점낮은순</option>
					<option value="리뷰많은순">리뷰많은순</option>
					<option value="리뷰적은순">리뷰적은순</option>
				</select>
				<span id="pickupMain"><input type="checkbox" id="pickup" value="pickup"/>&nbsp;픽업여부</span>
			<hr/>
			</div>
		<div id="productMain">
			<c:forEach var="data" items="${list}">
				<a href="/sshj/customproduct?productnum=${data.productnum}" id="taag">
					<div id="productDiv">
						<ul style="width:200px;">
							<li><img src="/sshj/img/${data.thumbimg}"></li>
							<li>
								<c:if test="${data.saleprice==null || data.saleprice=='' || data.salefinish=='1' || data.salestart=='1'}">
									${data.productprice}원
								</c:if>
								<c:if test="${data.saleprice != null && data.saleprice != '' && data.salefinish !='1' && data.salestart !='1'}">
									${data.proprice}원
								</c:if>
							</li>
							<li>${data.productname}</li>
							<c:if test="${data.totalscore==1}">
								<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★☆☆☆☆</span></li>
							</c:if>
							<c:if test="${data.totalscore==2}">
								<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★☆☆☆</span></li>
							</c:if>
							<c:if test="${data.totalscore==3}">
								<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★★☆☆</span></li>
							</c:if>
							<c:if test="${data.totalscore==4}">
								<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★★★☆</span></li>
							</c:if>
							<c:if test="${data.totalscore==5}">
								<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★★★★</span></li>
							</c:if>
							<li>${data.storeaddr}</li>
							<li>${data.username}</li>
						</ul>
					</div>
				</a>
			</c:forEach>
		</div>
		<div class="page_wrap" style="text-align:center;">
			<div class="page_nation">
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="javascript:prevPage()"></a>
			   		<%-- <a class="arrow prev" href="/sshj/categoryMain?pageNum=${pageVO.pageNum-1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a> --%>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" end="${(pageVO.startPageNum + pageVO.onePageNum)-1}">
         		<!--p가 총페이지수보다 작거나같을때  레코드가 있는 페이지까지만 표시 -->
            	<c:if test="${p<=pageVO.totalPage}">  
					<!--현재페이지 :  현재보고있는 페이지 표시 -->
	               <c:if test="${p==pageVO.pageNum}">
	                  <a class="active" href="javascript:clickPage()">${p}</a>
	                  <%-- <a class="active" href="categoryMain?pageNum=${p}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchWord=${pageVO.searchWord}</c:if>">${p}</a> --%>
	               </c:if>
	               <!-- 현재페이지가 아닐 때 -->
	               <c:if test="${p!=pageVO.pageNum}">
	                  <a href="javascript:void(0)" onclick="javascript:clickPage(${p})">${p}</a>
	                  <%-- <a href="categoryMain?pageNum=${p}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchWord=${pageVO.searchWord}</c:if>">${p}</a> --%>
	               </c:if>
            	</c:if>
       		</c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
	              <%-- <a class="arrow next" href="/sshj/categoryMain?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchWord=${pageVO.searchWord}</c:if>"></a> --%>
	              <a class="arrow next" href="javascript:nextPage()"></a>
	           </c:if>
			</div>
		 </div>
	</div>
</div>