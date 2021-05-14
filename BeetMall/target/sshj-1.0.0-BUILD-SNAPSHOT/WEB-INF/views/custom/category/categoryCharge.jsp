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
	#coloor{
		color:red;
	}
	/* 상품페이지 부분 css끝 */
	
    #main, #kAreamMall{
        overflow:auto;
    }
    #main{
        padding-left: 250px;
        border: 1px solid lightgray;
        margin-top:80px;
    }
    h1{
        padding-left: 200px;
        padding-bottom: 20px;
    }
    #kareaM{
        overflow:auto;
        width: 600px;
    }
    #kareaM>div{
        float:left;
    }
    #kAareaMain, #kAreamMall{
        border: 1px solid gray;
        overflow: auto;
        width:300px;
        height:230px;
    }
    #productDiv>ul>li>img{
		width:197px;
	}
    #kAareaMain>div, #kAreamMall>div{
        float: left;
	    padding-left: 30px;
	    padding-top: 10px;
	    letter-spacing: 2px;
	    width: 50%;
	    cursor: pointer;
    }
    #kContent{
        width: 600px;
	    height: 100px;
	    background-color: rgb(245,245,245);
	    overflow: auto;
	    margin-top: 10px;
    }
    #kContent>div{
    	float:left;
    }
    
    #Sequence{
		margin-left:20px;
	    width: 125px;
	    padding: .5em;
	    height: 38px;
		border: 1px solid #999;
		font-family: inherit;
		background: url('<%=request.getContextPath()%>/img/karrow.jpg') no-repeat 95% 50%/30px;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}
	#boardUpddate{
		margin-left: 533px;
		margin-top: 10px;
	}
	
	#searchBtn{
		left:0px;
		top:0px;
	}
	#kAreamMall>div>div {
    	padding-top: 10px;
	}
</style>
<script>
    $(function(){
        var area; //스타일을 담아줄값
        var areaid; //아이디를 담아줄값
        var clickid; //소주제명
        $("#kAareaMain>div").click(function(){ //대분류를 클릭했을때
            var font = $(this).text(); //클릭했을때 변수 담아주기
            $("#"+areaid).css("display","none");
            $("#kAreamAll").css("display","none");
            if(font == '전체'){
                areaid = $("#kAreamAll").attr('id');
                area= $("#kAreamAll").attr("style");
                if(area =='display: none;'){
                    $("#kAreamAll").css("display","block")
                }
            }
            if(font == '서울'){
                areaid = $("#kAreaMseoul").attr('id');
                area= $("#kAreaMseoul").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMseoul").css("display","block")
                }
            }
            if(font == '부산'){
                areaid = $("#kAreaMbusan").attr('id');
                area= $("#kAreaMbusan").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMbusan").css("display","block")
                }
            }
            if(font == '대구'){
                areaid = $("#kAreaMdegu").attr('id');
                area= $("#kAreaMdegu").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMdegu").css("display","block")
                }
            }
            if(font == '인천'){
                areaid = $("#kAreaMincon").attr('id');
                area= $("#kAreaMincon").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMincon").css("display","block")
                }
            }
            if(font == '광주'){
                areaid = $("#kAreaMkangu").attr('id');
                area= $("#kAreaMkangu").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMkangu").css("display","block")
                }
            }
            if(font == '대전'){
                areaid = $("#kAreaMdegun").attr('id');
                area= $("#kAreaMdegun").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMdegun").css("display","block")
                }
            }
            if(font == '울산'){
                areaid = $("#kAreaMsoulsan").attr('id');
                area= $("#kAreaMsoulsan").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMsoulsan").css("display","block")
                }
            }
            if(font == '세종'){
                areaid = $("#kAreaMsegun").attr('id');
                area= $("#kAreaMsegun").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMsegun").css("display","block")
                }
            }
            if(font == '경기'){
                areaid = $("#kAreaMyoungigo").attr('id');
                area= $("#kAreaMyoungigo").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMyoungigo").css("display","block")
                }
            }
            if(font == '강원'){
                areaid = $("#kAreaMgongwondo").attr('id');
                area= $("#kAreaMgongwondo").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMgongwondo").css("display","block")
                }
            }
            if(font == '충북'){
                areaid = $("#kAreaMchongbuk").attr('id');
                area= $("#kAreaMchongbuk").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMchongbuk").css("display","block")
                }
            }
            if(font == '충남'){
                areaid = $("#kAreaMchongnum").attr('id');
                area= $("#kAreaMchongnum").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMchongnum").css("display","block")
                }
            }
            if(font == '전북'){
                areaid = $("#kAreaMsanboak").attr('id');
                area= $("#kAreaMsanboak").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMsanboak").css("display","block")
                }
            }
            if(font == '전남'){
                areaid = $("#kAreaMsannam").attr('id');
                area= $("#kAreaMsannam").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMsannam").css("display","block")
                }
            }
            if(font == '경북'){
                areaid = $("#kAreaMsanboak").attr('id');
                area= $("#kAreaMsanboak").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMsanboak").css("display","block")
                }
            }
            if(font == '경남'){
                areaid = $("#kAreaMsannam").attr('id');
                area= $("#kAreaMsannam").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMsannam").css("display","block")
                }
            }
            if(font == '제주도'){
                areaid = $("#kAreaMjejudo").attr('id');
                area= $("#kAreaMjejudo").attr("style");
                if(area =='display: none;'){
                    $("#kAreaMjejudo").css("display","block")
                }
            }
        });
        $("#kAreamMall").children().children().click(function(){
            var name= $(this).text();
            $(this).css("color","red");
            $("#kContent").append("<div style='padding-left: 10px; letter-spacing: 1px;'><span>"+name+"</span><span class='arrea' style='cursor: pointer;'>&times;</span>"+"&nbsp;&nbsp;</div>");
        });
       
        $(document).on('click',"#kContent>div", function(){
        	$(this).remove();
        });
        
        //서버로보낼값
        $('#boardUpddate').submit(function(){
        	
        });
    });
    $(document).ready(function(){
 		$('#Sequence').change(function(){
	   		if($('#Sequence option:selected').val() == "평점높은순"){
	            var url = "/sshj/highhigh1";		
	            $.ajax({
	            	url:url,
	    			success:function(result){
	    				console.log('평점높은순 가져오기 성공');
	    				$("#productMain").empty();
	    				$("#productMain").html(result);
	    				console.log("result = "+result);
	    			},error:function(e){
	    				console.log(e.responseText);
	    				console.log("평점높은순 가져오기 실패");
	    			}
	            });
	   		}else if($('#Sequence option:selected').val() == "평점낮은순"){
	            var url = "/sshj/lowlow1";		
	            $.ajax({
	            	url:url,
	    			success:function(result){
	    				console.log('평점낮은순 가져오기 성공');
	    				$("#productMain").empty();
	    				$("#productMain").html(result);
	    				console.log("result = "+result);
	    			},error:function(e){
	    				console.log(e.responseText);
	    				console.log("평점낮은순 가져오기 실패");
	    			}
	            });
	   		}else if($('#Sequence option:selected').val() == "가격높은순"){
/* 	   			var url = "/sshj/lowlow1";		
	            $.ajax({
	            	url:url,
	    			success:function(result){
	    				console.log('평점낮은순 가져오기 성공');
	    				$("#productMain").empty();
	    				$("#productMain").html(result);
	    				console.log("result = "+result);
	    			},error:function(e){
	    				console.log(e.responseText);
	    				console.log("평점낮은순 가져오기 실패");
	    			}
	            }); */
	   		}else if($('#Sequence option:selected').val() == "가격낮은순"){
	   			alert("가격낮은순");
	   		}
 		});
 	});
</script>
	<div class="section">
		<div id="main">
	        <h1>지역별 보기</h1>
	        <div id="kareaM">
	            <div id="kAareaMain">
	                <div style="padding-top: 20px;">전체</div>
	                <div style="padding-top: 20px;">서울</div>
	                <div>부산</div>
	                <div>대구</div>
	                <div>인천</div>
	                <div>광주</div>
	                <div>대전</div>
	                <div>울산</div>
	                <div>세종</div>
	                <div>경기</div>
	                <div>강원</div>
	                <div>충북</div>
	                <div>충남</div>
	                <div>전북</div>
	                <div>전남</div>
	                <div>경북</div>
	                <div>경남</div>
	                <div>제주도</div>
	            </div>
	            <div id="kAreamMall" style="border-left-width: 0px;">
	                <div id="kAreamAll" style="display: flex;">
	                    <div id="kAreamAllAll">전체/전체</div>
	                </div>
	                <div id="kAreaMseoul" style="display: none;">
	                    <div>전체</div>
	                    <div>강남구</div>
	                    <div>강동구</div>
	                    <div>강북구</div>
	                    <div>강서구</div>
	                    <div>관악구</div>
	                    <div>광진구</div>
	                    <div>구로구</div>
	                    <div>금천구</div>
	                    <div>노원구</div>
	                    <div>도봉구</div>
	                    <div>동대문구</div>
	                    <div>동작구</div>
	                    <div>마포구</div>
	                    <div>서대문구</div>
	                    <div>서초구</div>
	                    <div>성동구</div>
	                    <div>성북구</div>
	                    <div>송파구</div>
	                    <div>양천구</div>
	                    <div>영등포구</div>
	                    <div>용산구</div>
	                    <div>은평구</div>
	                    <div>종로구</div>
	                    <div>중구</div>
	                    <div>중랑구</div>
	                </div>
	                <div id="kAreaMbusan" style="display: none;">
	                    <div>부산/전체</div>
	                    <div>동래구</div>
	                    <div>부산진구</div>
	                    <div>북구</div>
	                    <div>사상구</div>
	                    <div>사하구</div>
	                    <div>서구</div>
	                    <div>수영구</div>
	                    <div>연제구</div>
	                    <div>영동구</div>
	                    <div>중구</div>
	                    <div>해운대구</div>
	                </div>
	                <div id="kAreaMdegu" style="display: none;">
	                    <div>대구/전체</div>
	                    <div>남구</div>
	                    <div>달서구</div>
	                    <div>달성군</div>
	                    <div>동구</div>
	                    <div>북구</div>
	                    <div>서구</div>
	                    <div>수성구</div>
	                    <div>중구</div>
	                </div>
	                <div id="kAreaMincon" style="display: none;">
	                    <div>인천/전체</div>
	                    <div>강화군</div>
	                    <div>계양구</div>
	                    <div>남동구</div>
	                    <div>동구</div>
	                    <div>미추홀구</div>
	                    <div>부평구</div>
	                    <div>서구</div>
	                    <div>연수구</div>
	                    <div>웅진군</div>
	                    <div>중구</div>
	                </div>
	                <div id="kAreaMkangu" style="display: none;">
	                    <div>광주/전체</div>
	                    <div>광산구</div>
	                    <div>남구</div>
	                    <div>동구</div>
	                    <div>북구</div>
	                    <div>서구</div>
	                </div>
	                <div id="kAreaMdegun" style="display: none;">
	                    <div>대전/전체</div>
	                    <div>대덕구</div>
	                    <div>동구</div>
	                    <div>서구</div>
	                    <div>유성구</div>
	                    <div>중구</div>
	                </div>
	                <div id="kAreaMsoulsan" style="display: none;">
	                    <div>울산/전체</div>
	                    <div>남구</div>
	                    <div>동구</div>
	                    <div>북구</div>
	                    <div>울주군</div>
	                    <div>중구</div>
	                </div>
	                <div id="kAreaMsegun" style="display: none;">
	                    <div>세종/전체</div>
	                    <div>세종</div>
	                </div>
	                <div id="kAreaMyoungigo" style="display: none;">
	                    <div>경기도/전체</div>
	                    <div>가평군</div>
	                    <div>고양시</div>
	                    <div>과천시</div>
	                    <div>광명시</div>
	                    <div>광주시</div>
	                    <div>구리시</div>
	                    <div>군포시</div>
	                    <div>김포시</div>
	                    <div>남양주시</div>
	                    <div>동두천시</div>
	                    <div>부천시</div>
	                    <div>성남시</div>
	                    <div>수원시</div>
	                    <div>시흥시</div>
	                    <div>안산시</div>
	                    <div>안성시</div>
	                    <div>안양시</div>
	                    <div>양주시</div>
	                    <div>양평군</div>
	                    <div>여주시</div>
	                    <div>연천군</div>
	                    <div>오산시</div>
	                    <div>용인시</div>
	                    <div>의왕시</div>
	                    <div>의정부시</div>
	                    <div>이천시</div>
	                    <div>파주시</div>
	                    <div>평택시</div>
	                    <div>포천군</div>
	                    <div>포천시</div>
	                    <div>하남시</div>
	                    <div>화성시</div>
	                </div>
	                <div id="kAreaMgongwondo" style="display: none;">
	                    <div>강원도/전체</div>
	                    <div>강릉시</div>
	                    <div>고성군</div>
	                    <div>동해시</div>
	                    <div>삼척시</div>
	                    <div>속초시</div>
	                    <div>양구군</div>
	                    <div>양양군</div>
	                    <div>영월군</div>
	                    <div>원주시</div>
	                    <div>인제군</div>
	                    <div>정선군</div>
	                    <div>철원군</div>
	                    <div>춘천시</div>
	                    <div>태백시</div>
	                    <div>평창군</div>
	                    <div>흥천군</div>
	                    <div>화천군</div>
	                    <div>횡성군</div>
	                </div>
	                <div id="kAreaMchongbuk" style="display: none;">
	                    <div>충북/전체</div>
	                    <div>괴산군</div>
	                    <div>단양군</div>
	                    <div>보은군</div>
	                    <div>영동군</div>
	                    <div>옥천군</div>
	                    <div>음성군</div>
	                    <div>제천시</div>
	                    <div>증평군</div>
	                    <div>진천군</div>
	                    <div>청원군</div>
	                    <div>청주시</div>
	                    <div>충주시</div>
	                </div>
	                <div id="kAreaMchongnum" style="display: none;">
	                    <div>충남/전체</div>
	                    <div>계룡시</div>
	                    <div>공주시</div>
	                    <div>당진시</div>
	                    <div>보령시</div>
	                    <div>부여군</div>
	                    <div>서산시</div>
	                    <div>서천군</div>
	                    <div>아산시</div>
	                    <div>연기군</div>
	                    <div>예산군</div>
	                    <div>천안시</div>
	                    <div>청양군</div>
	                    <div>태안군</div>
	                    <div>흥성군</div>
	                </div>
	                <div id="kAreaMsanboak" style="display: none;">
	                    <div>전북/전체</div>
	                    <div>고창군</div>
	                    <div>군산시</div>
	                    <div>김제시</div>
	                    <div>남원시</div>
	                    <div>무주군</div>
	                    <div>부안군</div>
	                    <div>순창군</div>
	                    <div>완주군</div>
	                    <div>익산시</div>
	                    <div>임실군</div>
	                    <div>장수군</div>
	                    <div>전주시</div>
	                    <div>정읍시</div>
	                    <div>진안군</div>
	                </div>
	                <div id="kAreaMsannam" style="display: none;">
	                    <div>전남/전체</div>
	                    <div>강진군</div>
	                    <div>고흥군</div>
	                    <div>곡성군</div>
	                    <div>광양시</div>
	                    <div>구례군</div>
	                    <div>나주시</div>
	                    <div>담양군</div>
	                    <div>목포시</div>
	                    <div>무안군</div>
	                    <div>보성군</div>
	                    <div>순천시</div>
	                    <div>신안군</div>
	                    <div>여수시</div>
	                    <div>영광군</div>
	                    <div>영암군</div>
	                    <div>완도군</div>
	                    <div>장성군</div>
	                    <div>장흥군</div>
	                    <div>진도군</div>
	                    <div>함평군</div>
	                    <div>해남군</div>
	                    <div>화순군</div>
	                </div>
	                <div id="kAreaMchangbunk" style="display: none;">
	                    <div>경북/전체</div>
	                    <div>강진군</div>
	                    <div>고흥군</div>
	                    <div>곡성군</div>
	                    <div>광양시</div>
	                    <div>구례군</div>
	                    <div>나주시</div>
	                    <div>담양군</div>
	                    <div>목포시</div>
	                    <div>무안군</div>
	                    <div>보성군</div>
	                    <div>순천시</div>
	                    <div>신안군</div>
	                    <div>여수시</div>
	                    <div>영광군</div>
	                    <div>영암군</div>
	                    <div>완도군</div>
	                    <div>장성군</div>
	                    <div>장흥군</div>
	                    <div>진도군</div>
	                    <div>함평군</div>
	                    <div>해남군</div>
	                    <div>화순군</div>
	                </div>
	                <div id="kAreaMchangnum" style="display: none;">
	                    <div>경남/전체</div>
	                    <div>거제시</div>
	                    <div>거창군</div>
	                    <div>고성군</div>
	                    <div>김해시</div>
	                    <div>남해군</div>
	                    <div>밀양시</div>
	                    <div>사천시</div>
	                    <div>산청군</div>
	                    <div>양산시</div>
	                    <div>의령군</div>
	                    <div>진주시</div>
	                    <div>창녕군</div>
	                    <div>창원시</div>
	                    <div>통영시</div>
	                    <div>하동군</div>
	                    <div>함안군</div>
	                    <div>함양군</div>
	                    <div>합천군</div>
	                </div>
	                <div id="kAreaMjejudo" style="display: none;">
	                    <div>제주도/전체</div>
	                    <div>서귀포시</div>
	                    <div>제주시</div>
	                </div>
	            </div>
	        </div>
	        <form>
		        <div id="kContent">
				
		        </div>
		        <input type="submit" value="검색하기" id="boardUpddate" class="btn" style="margin-bottom: 20px;"/>
	      	</form>
	    </div>
	    <hr/>
	    <select id="Sequence">
	        <option value="평점높은순" selected="selected">평점높은순</option>
			<option value="평점낮은순">평점낮은순</option>
			<option value="가격높은순">가격높은순</option>
			<option value="가격낮은순">가격낮은순</option>
	    </select>
	    <div id="productMain">
			<c:forEach var="data" items="${list}">
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
			</c:forEach>
		</div>
	    <div class="page_wrap" style="text-align:center;">
			<div class="page_nation">
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="/sshj/categoryMain?pageNum=${pageVO.pageNum-1}"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
	              <c:if test="${p<=pageVO.totalPage}">
	                 <c:if test="${p==pageVO.pageNum }"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="/sshj/categoryMain?pageNum=${p}">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
	              <a class="arrow next" href="/sshj/categoryMain?pageNum=${pageVO.pageNum+1}"></a>
	           </c:if>
			</div>
		 </div>
	  </div>