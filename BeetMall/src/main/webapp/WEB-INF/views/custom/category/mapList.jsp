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
	#productDiv>ul>li:nth-child(5n+2){
	    font-size: xx-large;
	    font-weight: bold;
	}
	
	#categoryAll>img, #categoryFruit>img, #categoryVege>img, #categorySall>img{
		width:95px;
		height:96px;
		border-radius:80%;
		object-fit:cover;
	}
	
	/* 상품페이지 부분 css끝 */
	#mainName{
		padding-bottom: 20px;
	}
	/* 지도부분 */
	.info {position:relative;top:5px;left:5px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;font-size:12px;padding:5px;background:#fff;list-style:none;margin:0;} 
	.info:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
	.info .label {display:inline-block;width:50px; color:black;}
	.number {font-weight:bold;color:#00a0e9;} 
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
	/* 지도부분끝 */
	
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=675d2e2b842e770a2d48d54759ba1d32&libraries=services,clusterer,drawing"></script>
<script>
	var ajaax; //ajax를쓰기위한 Title값 받아오기
</script>
<div class="section">
	<div id="mainName"><h1>지도로 찾는 동네 농장</h1></div>
	<div id="idididididididiidididi" style="height:400px;"></div>
	<div>※실제 위치와 상이할수 있습니다.</div>
	<div>※자신의 위치에서 마우스 왼쪽버튼을 누른후 목적지에서 오른쪽버튼을 누르면 직선거리가 표시됩니다.</div> 
	<div class="main">
			<hr/>
		<div id="productMain">
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k016.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k017.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k018.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k019.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k020.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k021.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k022.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k016.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k017.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k018.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k019.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k020.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k021.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k022.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k016.png"></li>
					<li>28,000원</li>
					<li>제목제목제목제목제목제목</li>
					<li>리뷰 50,000|4.8/5</li>
					<li>판매지역 이강산</li>
				</ul>
			</div>
			<div id="productDiv">
				<ul>
					<li><img src="/sshj/img/k017.png"></li>
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
</div>


<script>
	var mapContainer = document.getElementById('idididididididiidididi'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.55233, 126.93761), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	////////////마커 클러스트리 시작//////////////////////////
	// 마커 클러스터러를 생성합니다 
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 7 // 클러스터 할 최소 지도 레벨 
    });
	////////////마커 클러스트리 끝//////////////////////////
	
	
	///////////마커 배열로만들어서 찍어주기////////////
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	
	var markers = []; //markers생성
	var marker = [];
	<c:forEach items="${list}" var="data"> 
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    marker${data.storenum} = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: new kakao.maps.LatLng("${data.latitude}", "${data.logetitude}"), // 마커를 표시할 위치
	        title : "${data.farmname}", // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	    markers.push(marker${data.storenum});
		////////////마커 클릭이벤트////////////////////////////////
	    // 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker${data.storenum}, 'click', function() {
		      console.log(marker${data.storenum}.getTitle());
		      ajaax = marker${data.storenum}.getTitle();
		});
		////////////마커 클릭이벤트끝////////////////////////////////
	    console.log("markers" + markers);
    </c:forEach>
	clusterer.addMarkers(markers);
	///////////////찍어주기 끝//////////////////////
	////////////마커 클러스트리 클릭이벤트//////////////////////////
    // 마커 클러스터러에 클릭이벤트를 등록합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

        // 현재 지도 레벨에서 1레벨 확대한 레벨
        var level = map.getLevel()-1;

        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
        map.setLevel(level, {anchor: cluster.getCenter()});
    });
    
    ////////////마커 클러스트리 클릭이벤트 끝//////////////////////////
	
	////////////////////컨트롤////////////////////////////
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	////////////////////////////컨트롤끝///////////////////////////////
	////////////////////////////현재위치 가져오기///////////////////////////
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;">당신의위치는?</div>'; // 인포윈도우에 표시될 내용입니다
	        
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message);
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(37.55233, 126.93761),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}
	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {
	
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;
	
	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}    
	////////////////////////현재위치 가져오기 끝////////////////////////
	
	///////////////////////영역설정하기///////////////////////////////////
	var drawingFlag = false; // 원이 그려지고 있는 상태를 가지고 있을 변수입니다
	var centerPosition; // 원의 중심좌표 입니다
	var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
	var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
	var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
	var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다
	
	var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다
	
	// 지도에 클릭 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	        
	    // 클릭 이벤트가 발생했을 때 원을 그리고 있는 상태가 아니면 중심좌표를 클릭한 지점으로 설정합니다
	    if (!drawingFlag) {    
	        
	        // 상태를 그리고있는 상태로 변경합니다
	        drawingFlag = true; 
	        
	        // 원이 그려질 중심좌표를 클릭한 위치로 설정합니다 
	        centerPosition = mouseEvent.latLng; 
	
	        // 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
	        if (!drawingLine) {
	            drawingLine = new kakao.maps.Polyline({
	                strokeWeight: 3, // 선의 두께입니다
	                strokeColor: '#00a0e9', // 선의 색깔입니다
	                strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	                strokeStyle: 'solid' // 선의 스타일입니다
	            });    
	        }
	        
	        // 그려지고 있는 원을 표시할 원 객체를 생성합니다
	        if (!drawingCircle) {                    
	            drawingCircle = new kakao.maps.Circle({ 
	                strokeWeight: 1, // 선의 두께입니다
	                strokeColor: '#00a0e9', // 선의 색깔입니다
	                strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	                strokeStyle: 'solid', // 선의 스타일입니다
	                fillColor: '#00a0e9', // 채우기 색깔입니다
	                fillOpacity: 0.2 // 채우기 불투명도입니다 
	            });     
	        }
	        
	        // 그려지고 있는 원의 반경 정보를 표시할 커스텀오버레이를 생성합니다
	        if (!drawingOverlay) {
	            drawingOverlay = new kakao.maps.CustomOverlay({
	                xAnchor: 0,
	                yAnchor: 0,
	                zIndex: 1
	            });              
	        }
	    }
	    });
	
	// 지도에 마우스무브 이벤트를 등록합니다
	// 원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
	kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
	        
	    // 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
	    if (drawingFlag) {
	
	        // 마우스 커서의 현재 위치를 얻어옵니다 
	        var mousePosition = mouseEvent.latLng; 
	        
	        // 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
	        var linePath = [centerPosition, mousePosition];     
	        
	        // 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
	        drawingLine.setPath(linePath);
	        
	        // 원의 반지름을 선 객체를 이용해서 얻어옵니다 
	        var length = drawingLine.getLength();
	        
	        if(length > 0) {
	            
	            // 그려지고 있는 원의 중심좌표와 반지름입니다
	            var circleOptions = { 
	                center : centerPosition, 
	            radius: length,                 
	            };
	            
	            // 그려지고 있는 원의 옵션을 설정합니다
	            drawingCircle.setOptions(circleOptions); 
	                
	            // 반경 정보를 표시할 커스텀오버레이의 내용입니다
	            var radius = Math.round(drawingCircle.getRadius()),   
	            content = '<div class="info">반경 <span class="number">' + radius + '</span>m</div>';
	            
	            // 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
	            drawingOverlay.setPosition(mousePosition);
	            
	            // 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
	            drawingOverlay.setContent(content);
	            
	            // 그려지고 있는 원을 지도에 표시합니다
	            drawingCircle.setMap(map); 
	            
	            // 그려지고 있는 선을 지도에 표시합니다
	            drawingLine.setMap(map);  
	            
	            // 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
	            drawingOverlay.setMap(map);
	            
	        } else { 
	            
	            drawingCircle.setMap(null);
	            drawingLine.setMap(null);    
	            drawingOverlay.setMap(null);
	            
	        }
	    }     
	});     
	
	// 지도에 마우스 오른쪽 클릭이벤트를 등록합니다
	// 원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
	// 마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
	kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
	
	    if (drawingFlag) {
	
	        // 마우스로 오른쪽 클릭한 위치입니다 
	        var rClickPosition = mouseEvent.latLng; 
	
	        // 원의 반경을 표시할 선 객체를 생성합니다
	        var polyline = new kakao.maps.Polyline({
	            path: [centerPosition, rClickPosition], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
	            strokeWeight: 3, // 선의 두께 입니다
	            strokeColor: '#00a0e9', // 선의 색깔입니다
	            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            strokeStyle: 'solid' // 선의 스타일입니다
	        });
	        
	        // 원 객체를 생성합니다
	        var circle = new kakao.maps.Circle({ 
	            center : centerPosition, // 원의 중심좌표입니다
	            radius: polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
	            strokeWeight: 1, // 선의 두께입니다
	            strokeColor: '#00a0e9', // 선의 색깔입니다
	            strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            strokeStyle: 'solid', // 선의 스타일입니다
	            fillColor: '#00a0e9', // 채우기 색깔입니다
	            fillOpacity: 0.2  // 채우기 불투명도입니다 
	        });
	        
	        var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
	            content = getTimeHTML(radius); // 커스텀 오버레이에 표시할 반경 정보입니다
	
	        
	        // 반경정보를 표시할 커스텀 오버레이를 생성합니다
	        var radiusOverlay = new kakao.maps.CustomOverlay({
	            content: content, // 표시할 내용입니다
	            position: rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
	            xAnchor: 0,
	            yAnchor: 0,
	            zIndex: 1 
	        });  
	
	        // 원을 지도에 표시합니다
	        circle.setMap(map); 
	        
	        // 선을 지도에 표시합니다
	        polyline.setMap(map);
	        
	        // 반경 정보 커스텀 오버레이를 지도에 표시합니다
	        radiusOverlay.setMap(map);
	        
	        // 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
	        var radiusObj = {
	            'polyline' : polyline,
	            'circle' : circle,
	            'overlay' : radiusOverlay
	        };
	        
	        // 배열에 추가합니다
	        // 이 배열을 이용해서 "모두 지우기" 버튼을 클릭했을 때 지도에 그려진 원, 선, 커스텀오버레이들을 지웁니다
	        circles.push(radiusObj);   
	    
	        // 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
	        drawingFlag = false;
	        
	        // 중심 좌표를 초기화 합니다  
	        centerPosition = null;
	        
	        // 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
	        drawingCircle.setMap(null);
	        drawingLine.setMap(null);   
	        drawingOverlay.setMap(null);
	    }
	});    
	    
	// 지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
	function removeCircles() {         
	    for (var i = 0; i < circles.length; i++) {
	        circles[i].circle.setMap(null);    
	        circles[i].polyline.setMap(null);
	        circles[i].overlay.setMap(null);
	    }         
	    circles = [];
	}
	
	// 마우스 우클릭 하여 원 그리기가 종료됐을 때 호출하여 
	// 그려진 원의 반경 정보와 반경에 대한 도보, 자전거 시간을 계산하여
	// HTML Content를 만들어 리턴하는 함수입니다
	function getTimeHTML(distance) {
	
	    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
	    var walkkTime = distance / 67 | 0;
	    var walkHour = '', walkMin = '';
	
	    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
	    if (walkkTime > 60) {
	        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
	    }
	    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'
	
	    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
	    var bycicleTime = distance / 227 | 0;
	    var bycicleHour = '', bycicleMin = '';
	
	    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
	    if (bycicleTime > 60) {
	        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
	    }
	    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'
	
	    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
	    var content = '<ul class="info">';
	    content += '    <li>';
	    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">도보</span>' + walkHour + walkMin;
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
	    content += '    </li>';
	    content += '</ul>'
	
	    return content;
	}
	///////////////////////영역설정하기 끝///////////////////////////////////
</script>