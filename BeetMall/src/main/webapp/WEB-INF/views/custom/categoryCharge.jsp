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
	}
	#productDiv>ul>li:nth-child(5n+2){
	    font-size: xx-large;
	    font-weight: bold;
	}
	
	/* 상품페이지 부분 css끝 */	
	
    #main, #kAreamMall{
        overflow:auto;
    }
    #main{
        padding-left: 250px;
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
        border: 1px solid black;
        overflow: auto;
        width:300px;
        height:230px;
    }
    #productDiv>ul>li>img{
		width:197px;
	}
    #kAareaMain>div, #kAreamMall>div{
        float:left;
        width:50%;
    }
    #kContent{
        width: 600px;
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
	#boardUpddate{
		margin-left: 533px;
    	margin-top: 50px;
	}
	
	#searchBtn{
		left:0px;
		top:0px;
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
            $("#kContent").append(name+"&times;"+"&nbsp;&nbsp;");
        });
        $("#kContent").click(function(){
            kangsan();
        });
    });
    function kangsan(){
        //삭제아직 진행못함
    };
</script>
	<div class="section">
		<div id="main">
	        <h1>지역별 보기</h1>
	        <div id="kareaM">
	            <div id="kAareaMain">
	                <div>전체</div>
	                <div>서울</div>
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
	            <div id="kAreamMall">
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
		        <input type="submit" value="검색하기" id="boardUpddate"/>
	      	</form>
	    </div>
	    <hr/>
	    <select id="Sequence">
	        <option value="평점순" selected="selected">평점순</option>
	        <option value="가격순">가격순</option>
	        <option value="조회수순">조회수순</option>
	    </select>
	    <div id="productMain">
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/pi.gif"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
		</div>
	    <div class="page_wrap">
	        <div class="page_nation">
	            <a class="arrow pprev" href="#"></a>
	            <a class="arrow prev" href="#"></a>
	            <a href="#" class="active">1</a>
	            <a href="#">2</a>
	            <a href="#">3</a>
	            <a href="#">4</a>
	            <a href="#">5</a>
	            <a href="#">6</a>
	            <a href="#">7</a>
	            <a href="#">8</a>
	            <a href="#">9</a>
	            <a href="#">10</a>
	            <a class="arrow next" href="#"></a>
	            <a class="arrow nnext" href="#"></a>
	        </div>
	   </div>
	  </div>