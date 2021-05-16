<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{margin:0px; padding:0px; list-style-type :none; font-family: 'Nanum Gothic', sans-serif;}
	#leftMenu{ display:block;}
	/*버튼*/
	button, .btn{
		padding: 3px 10px;
		color: #666666;
		border-radius: 8px;
		background:#fff;
		box-shadow: 0 0px 3px 0 rgba(0,0,0,0.5);
		text-align: center;
 		text-decoration: none;
		display: inline-block;
		border:none;
	}
	/*버튼*/
	.btn:onclick{
		background: gray;
		color:white;
	} 
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
	/* 상품페이지 부분 css끝 */
	.main{
		width:1080px;
	}
	#mainName{
		text-align: left;
	    margin-top: 100px;
	    margin-bottom: 80px;
	}
	#pickupMain{
		float: right;
		vertical-align: middle;
		padding-top: 15px;
   		font-size: large;
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
	#hrMain{
		overflow:auto;
    	height: 100px;
	}
	#hrMain>#Sequence, #hrMain>div, #hrMain>pickupMain{
		float:left;
	    padding-left: 30px;
	}
	#hrMain>div{
		padding-top:10px;
	}
	
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	#minNum{
		width:120px;
	}
	#MaxNum{
		width:150px;
	}
</style>
<script>
	$(function(){
		$("#searchForm").submit(function(){
			//searchWord있는지 없는지 찾기 , 있을때만 데이터 넘기기
			if($('#searchWord').val()==""){
				alert("검색어를 입력하세요.");
				return false;
			}
			return true;
		});
		$("#paySearchForm").submit(function(){
			//searchWord있는지 없는지 찾기 , 있을때만 데이터 넘기기
			if($('#payStart').val()==""){
				alert("최소값을 입력하세요.");
				return false;
			}else if($('#payfinish').val()==""){
				alert("최대값를 입력하세요.");
				return false;
			}else{
				return true;
			}
		});
		
		$('#Sequence').change(function(){
	   		if($('#Sequence option:selected').val() == "평점높은순"){
	            if($("#payStart").val() != null && $("#payStart").val()!=''){//페이시작이 널이아닐때
	            	location.href="/sshj/payCategory?payStart="+$("#payStart").val()+"&payfinish="+$("#payfinish").val()+"&type=1"
	            }else{
	            	location.href="/sshj/payCategory?pay="+$("#pay").val()+"&type=1"
	            }
	   		}else if($('#Sequence option:selected').val() == "평점낮은순"){
	   		 	if($("#payStart").val() != null && $("#payStart").val()!=''){//페이시작이 널이아닐때
	            	location.href="/sshj/payCategory?payStart="+$("#payStart").val()+"&payfinish="+$("#payfinish").val()+"&type=2"
	            }else{
	            	location.href="/sshj/payCategory?pay="+$("#pay").val()+"&type=2"
	            }
	   		}else if($('#Sequence option:selected').val() == "리뷰많은순"){
	   		 	if($("#payStart").val() != null && $("#payStart").val()!=''){//페이시작이 널이아닐때
	            	location.href="/sshj/payCategory?payStart="+$("#payStart").val()+"&payfinish="+$("#payfinish").val()+"&type=3"
	            }else{
	            	location.href="/sshj/payCategory?pay="+$("#pay").val()+"&type=3"
	            }
	   		}else if($('#Sequence option:selected').val() == "리뷰적은순"){
	   			if($("#payStart").val() != null && $("#payStart").val()!=''){//페이시작이 널이아닐때
	            	location.href="/sshj/payCategory?payStart="+$("#payStart").val()+"&payfinish="+$("#payfinish").val()+"&type=4"
	            }else{
	            	location.href="/sshj/payCategory?pay="+$("#pay").val()+"&type=4"
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
	});
	
	//이전페이지 가기
	function prevPage(){
		var loca = "/sshj/payCategory?";
		if($("#pay").val() != null && $("#pay").val()!=''){
			loca += "pay="+$("#pay").val();
		}
		
		if($("#payStart").val() != null && $("#payStart").val()!=''){
			loca += "payStart="+$("#payStart").val()+"&payfinish="+$("#payfinish").val();
		}
		
		if($("#type").val() != null && $("#type").val()!=''){
				loca += "type="+$("#type").val();
		}
		
		if($("#pageNum").val() != null && $("#pageNum").val()!=''){
			if($("#pay").val() != null && $("#pay").val()!='' || 
			   $("#type").val() != null && $("#type").val()!='' ||
			   $("#payStart").val() != null && $("#payStart").val()!=''){
				var pagenumgg = Number($("#pageNum").val())-1
				loca += "&pageNum="+ pagenumgg ;
			}else{
				var pagenumgg = Number($("#pageNum").val())-1
				loca += "pageNum="+ pagenumgg;
			}
		}
		
		if($("#searchWord").val() != null && $("#searchWord").val()!=''){
			if($("#pay").val() != null && $("#pay").val()!='' || 
			   $("#type").val() != null && $("#type").val()!='' ||
			   $("#payStart").val() != null && $("#payStart").val()!=''||
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
		var loca = "/sshj/payCategory?";
		if($("#pay").val() != null && $("#pay").val()!=''){
			loca += "pay="+$("#pay").val();
		}
		if($("#type").val() != null && $("#type").val()!=''){
			if($("#pay").val() != null && $("#pay").val()!=''){
				loca += "&pay="+$("#pay").val();
			}else{
				loca += "type="+$("#type").val();
			}
		}
		if($("#pageNum").val() != null && $("#pageNum").val()!=''){
			if($("#pay").val() != null && $("#pay").val()!='' ||
			   $("#type").val() != null && $("#type").val()!='' ||
			   $("#payStart").val() != null && $("#payStart").val()!=''){
				var pagenumgg = Number($("#pageNum").val())+1
				loca += "&pageNum="+ pagenumgg ;
			}else{
				var pagenumgg = Number($("#pageNum").val())+1
				loca += "pageNum="+ pagenumgg;
			}
		}
		if($("#searchWord").val() != null && $("#searchWord").val()!=''){
			if($("#pay").val() != null && $("#pay").val()!='' ||
			   $("#type").val() != null && $("#type").val()!='' ||
			   $("#payStart").val() != null && $("#payStart").val()!='' ||
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
			var loca = "/sshj/payCategory?";
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
	<div class="main">
		<div id="mainName"><h1>가격대별 찾기</h1></div>
			<c:if test="${pageVO.type != null}">
				<input type="hidden" id="type" value="${pageVO.type}"/>
			</c:if>
			<c:if test="${pageVO.pay != null}">
				<input type="hidden" id="pay" value="${pageVO.pay}"/>
			</c:if>
			<c:if test="${pageVO.payStart != null}">
				<input type="hidden" id="payStart" value="${pageVO.payStart}"/>
			</c:if>
			<c:if test="${pageVO.payfinish != null}">
				<input type="hidden" id="payfinish" value="${pageVO.payfinish}"/>
			</c:if>
			<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">
				<input type="hidden" id="searchWord" value="${pageVO.searchWord}"/>
			</c:if>
			<c:if test="${pageVO.pageNum != null && pageVO.pageNum != ''}">
				<input type="hidden" id="pageNum" value="${pageVO.pageNum}"/>
			</c:if>
			<div id="search_container">
				<form method="get" action="payCategory" id="searchForm">
					<span id="search_box">
						<input type="text" id="searchWord" name="searchWord" placeholder="검색하기"><input type="submit" id="searchBtn" value="검색"/>
					</span>
				</form>
			</div>
			<div id="hrMain">
				<hr/>
					<select id="Sequence" style="padding-left: 10px; width: 109px;">
						<option value="평점높은순">평점높은순</option>
						<option value="평점낮은순">평점낮은순</option>
						<option value="리뷰많은순">리뷰많은순</option>
						<option value="리뷰적은순">리뷰적은순</option>
					</select>
					<div style="cursor: pointer;"><a href="/sshj/payCategory?pay=5000" id="taag">5,000원 이하</a></div>
					<div style="cursor: pointer;"><a href="/sshj/payCategory?pay=10000" id="taag">10,000원 이하</a></div>
					<div style="cursor: pointer;"><a href="/sshj/payCategory?pay=50000" id="taag">50,000원 이하</a></div>
					<div style="cursor: pointer;"><a href="/sshj/payCategory?pay=50001" id="taag">50,000원 이상</a></div>
					<div>
						<form method="get" action="payCategory" id="paySearchForm">
							<input type="number" id="payStart" name="payStart" min="1000"/>~ <input type="number" id="payfinish" name="payfinish" min="1000"/>
							<input type="submit" class="btn" value="검색하기"/>
						</form>
					</div>
			</div>
			<hr/>
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
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" end="${(pageVO.startPageNum + pageVO.onePageNum)-1}">
         		<!--p가 총페이지수보다 작거나같을때  레코드가 있는 페이지까지만 표시 -->
            	<c:if test="${p<=pageVO.totalPage}">  
					<!--현재페이지 :  현재보고있는 페이지 표시 -->
	               <c:if test="${p==pageVO.pageNum}">
	                  <a class="active" href="javascript:clickPage()">${p}</a>
	               </c:if>
	               <!-- 현재페이지가 아닐 때 -->
	               <c:if test="${p!=pageVO.pageNum}">
	                  <a href="javascript:void(0)" onclick="javascript:clickPage(${p})">${p}</a>
	               </c:if>
            	</c:if>
       		</c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">   
	              <a class="arrow next" href="javascript:nextPage()"></a>
	           </c:if>
			</div>
		 </div>
	</div>
</div>