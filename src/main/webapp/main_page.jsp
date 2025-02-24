<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3306/spring5fs";
String sql = "select * from user";
%>
<%
	//세션 체크 *
	String userid = (String)session.getAttribute("U_id");
	if(userid == null) {
		response.sendRedirect("login_test.jsp");
	}

%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>자기소개 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" >
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #47494D;
            text-align: center;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        
        img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-top: 10px;
        }
        h1 {
            color: #333;
        }
        p {
            color: #666;
        }
        table{
        	margin: 50px auto;
            width: 500px;
        	text-align: center;
        	color: #47494D;
        	border-collapse: collapse;
        }
		th, td {
		    padding: 10px;
		    border-bottom: 1px solid #47494D;
		}

        .contact {
            margin-top: 20px;
        }
        .contact a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .contact a:hover {
            text-decoration: underline;
        }
        .text_box{
			height: 250px;
			font-size: 2rem;
			text-align: center;
			font-weight : bold; 
			color: #ffffff;
			margin-top: 200px;
		}

		.blink {
		  animation: blink 0.5s infinite;
		  font-size: 2.5rem;
		}
		
		@keyframes caret {
		  50% {
		    opacity:0;
		  }
		}
		
		
		body::-webkit-scrollbar {
		  display: none;
		}
		.wrap { 
		  display: flex; 
		  overflow: hidden;
		}
		.wrap .rolling-list ul { 
			display: flex;
		}
		.wrap .rolling-list ul li { 
			width: 589px; 
			height: 276px; 
		    box-sizing: border-box; 
		    border-radius: 20px; 
		    margin: 0 16px; 
		    padding: 46px 31px; 
		    display: flex; 
		    align-items: center; 
		    flex-shrink: 0; 
		}
		.wrap .rolling-list ul li:nth-child(1) { 
			background-color: #b0c2c9;
		}
		.wrap .rolling-list ul li:nth-child(2) { 
			background-color: #c3d1d6; 
		}
		.wrap .rolling-list ul li:nth-child(3) { 
			background-color: #d7e0e4;
		}
		.wrap .rolling-list ul li:nth-child(4) { 
			background-color: #ebeff1;
		}
		.wrap .rolling-list ul li:nth-child(even) {
			margin-top: 80px;
		}
		.wrap .rolling-list ul li .image-wrap { 
			padding-right: 32px; 
		    width: 156px; 
		    flex-shrink: 0; 
		}
		.wrap .rolling-list ul li .image-wrap > img { 
			width: 100%;
		}
		.wrap .rolling-list ul li .desc { 
			font-family: 'BMJUA';
		}
		.wrap .rolling-list ul li .desc strong { 
			display: block; 
		    font-size: 24px; 
		    margin-bottom: 24px;
		}
		.wrap .rolling-list ul li .desc span { 
			font-size: 18px;
		    line-height: 1.2;
		}
		.rolling-list.original {
			animation: rollingleft1 33s linear infinite;
		}
		.rolling-list.clone {
			animation: rollingleft2 33s linear infinite;
		}
		
		@keyframes rollingleft1 {
			0% { transform: translateX(0); }
			50% { transform: translateX(-100%); }
			50.01% { transform: translateX(100%); }
			100% { transform: translateX(0); }
		}
		
		@keyframes rollingleft2 {
			0% { transition: translateX(0); }
			100% { transform: translateX(-200%); }
		}
		
    </style>
</head>
<body>
<div class="text_box">
  <span class="text"></span><span class="blink">|</span>
</div>

<div class="container">
<img src="img/mainpge.png" alt="프로필 사진">
<br><br>
<h2>WHO?</h2>
    <p>저는 <%= "웹 개발자" %>이며, 현재 JSP와 Java를 공부하고 있습니다.</p>
    <p>좋아하는 기술: <%= "Java, JSP, Spring, MySQL" %></p>
    <p>취미: <%= "코딩, 제과, 여행" %></p>

    <div class="contact">
        <p>📧 이메일: <a href="mailto:test@example.com">test@example.com</a></p>
        <p>📞 전화번호: <%= "010-1234-5678" %></p>
        <p>🔗 <a href="https://github.com/vnme1" target="_blank">GitHub</a></p>
    </div>
</div>

<div class="container">
<h2>내가 진행한 프로젝트</h2>
<div class="wrap"> <!-- 배너표시영역 -->
	<div class="rolling-list"> <!-- 원본배너 -->
		<ul>
			<li>
				<div class="image-wrap"><img src="./img/img_banner1.svg" alt=""></div>
				<div class="desc">
					<strong>동네의사</strong>
                    <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit.<br/>
					Neque cumque ratione provident nulla veniam nihil quaerat, illum officiis hic.<br/> 
					Laborum in eos possimus, quo ullam nobis nam nemo fuga ipsam?</span>
                </div>
			</li>
			<li>
				<div class="image-wrap"><img src="./img/img_banner2.svg" alt=""></div>
				<div class="desc">
					<strong>ToDo 리스트</strong>
					<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit.<br/>
                    Neque cumque ratione provident nulla veniam nihil quaerat, illum officiis hic.<br/>
					Laborum in eos possimus, quo ullam nobis nam nemo fuga ipsam?</span>
				</div>
			</li>
			<li>
				<div class="image-wrap"><img src="./img/img_banner3.svg" alt=""></div>
				<div class="desc">
					<strong>여행일정관리</strong>
					<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit.<br/>
					Neque cumque ratione provident nulla veniam nihil quaerat, illum officiis hic.<br/>
					Laborum in eos possimus, quo ullam nobis nam nemo fuga ipsam?</span>
				</div>
			</li>
		</ul>
	</div>
</div>

</div>

<div class="container">
<h2>공부일정?</h2>
<table cellspacing = 0>
        <tr>
            <td>시간</td>
            <td>요일</td>
            <td>할일</td>
        </tr>
        <tr>
            <td>09:00 ~ 09:50</td>
            <td>월</td>
            <td>코딩 개념 이해</td>
        </tr>
        <tr>
            <td>10:00 ~ 10:50</td>
            <td>화</td>
            <td>코딩 개념 이해</td>
        </tr>
        <tr>
            <td>11:00 ~ 11:50</td>
            <td>수</td>
            <td>코딩 개념 이해</td>
        </tr>
        <tr>
            <td>12:00 ~ 12:50</td>
            <td>목</td>
            <td>코딩 패턴 정리</td>
        </tr>
        <tr>
            <td>점심시간~</td>
            <td>금</td>
            <td>코딩 패턴 정리</td>
        </tr>
        <tr>
            <td>14:00 ~ 14:50</td>
            <td>월</td>
            <td>코딩 패턴 정리</td>
        </tr>
        <tr>
            <td>15:00 ~ 15:50</td>
            <td>월</td>
            <td>프로젝트 개발</td>
        </tr>
        <tr>
            <td>16:00 ~ 16:50</td>
            <td>월</td>
            <td>프로젝트 개발</td>
        </tr>
        <tr>
            <td>17:00 ~ 17:50</td>
            <td>월</td>
            <td>프로젝트 개발</td>
        </tr>
    </table>
</div>

<div class="text_box">
  <span class="text"></span>
</div>




<script>
    // JSP 변수를 JavaScript 변수로 변환
    var userid = "<%= userid %>"; 

    let content;
    if (userid === "root") {
        content = "관리자님 안녕하세요. \n끊임없이 성장하고 도전하는 \n[개발자]입니다.";
    } else {
        content = userid + "님 안녕하세요. \n끊임없이 성장하고 도전하는 \n[개발자]입니다.";
    }

    const text = document.querySelector(".text");
    let i = 0;

    function typing() {
        if (i < content.length) {
            let txt = content[i++];
            text.innerHTML += txt === "\n" ? "<br/>" : txt;
        } else {
            setTimeout(() => {
                text.textContent = "";
                i = 0;
                typing(); // 다시 타이핑 시작
            }, 2000);
        }
    }
    setInterval(typing, 200);
    TypeHangul.type('.text_box',{
    intervalType: 80
    });
    
    //무한배너
    // 롤링 배너 복제본 생성
	let roller = document.querySelector('.rolling-list');
	roller.id = 'roller1'; // 아이디 부여
	
	let clone = roller.cloneNode(true)
	// cloneNode : 노드 복제. 기본값은 false. 자식 노드까지 복제를 원하면 true 사용
	clone.id = 'roller2';
	document.querySelector('.wrap').appendChild(clone); // wrap 하위 자식으로 부착
	
	document.querySelector('#roller1').style.left = '0px';
	document.querySelector('#roller2').style.left = document.querySelector('.rolling-list ul').offsetWidth + 'px';
	// offsetWidth : 요소의 크기 확인(margin을 제외한 padding값, border값까지 계산한 값)
	
	roller.classList.add('original');
	clone.classList.add('clone');
    
</script>
<!--속도제어-->

</body>
</html>
