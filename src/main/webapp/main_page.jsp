<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

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
            background-color: #f4f4f4;
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
		  margin-top: 200px;
		}
		.blink {
		  animation: blink 0.5s infinite;
		  font-size: 2.5rem;
		}
		
		@keyframes blink {
		  to {
		    opacity: 0;
		  }
		}
    </style>
</head>
<body>
<div class="text_box">
  <span class="text"></span><span class="blink">|</span>
</div>
<div class="container">
    <img src="img/mainpge.png" alt="프로필 사진">
</div>

<div class="container">
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

<div class="text_box">
  <span class="text"></span>
</div>


<script>
const content = "[ㅇㅇㅇ]님 안녕하세요. \n 끊임없이 성장하고 도전하는 \n [개발자]입니다.";
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
setInterval(typing, 200)
</script>

</body>
</html>
