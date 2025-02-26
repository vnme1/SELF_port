<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3306/SELF_Port";
String USER = "root";
String PASSWORD = "1234";

// 세션에서 로그인한 사용자 ID 가져오기
String userid = (String) session.getAttribute("U_id");
if (userid == null) {
    response.sendRedirect("login/login_test.jsp");
    return;
}

System.out.println("현재 로그인한 사용자 ID: " + userid); // 디버깅용

// 기본값 설정
String U_email = "이메일 정보 없음";
String M_job = "직업 정보 없음";
String M_now = "현재 상황 없음";
String M_skill = "기술 정보 없음";
String M_hobby = "취미 정보 없음";
String M_number = "전화번호 없음";
String M_github = "#";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    conn = DriverManager.getConnection(URL, USER, PASSWORD);
    
    // 1️ user 테이블에서 이메일 가져오기
    String userSql = "SELECT U_email FROM user WHERE U_id = ?";
    pstmt = conn.prepareStatement(userSql);
    pstmt.setString(1, userid);
    rs = pstmt.executeQuery();
    if (rs.next()) {
        U_email = rs.getString("U_email");
    } else {
        System.out.println("user 테이블에서 ID를 찾을 수 없음: " + userid);
    }
    
    rs.close();
    pstmt.close();

    // 2️ Mypage 테이블에서 정보 가져오기
    String mypageSql = "SELECT M_job, M_skill, M_hobby, M_number, M_github, M_now FROM Mypage WHERE U_id = ?";
    pstmt = conn.prepareStatement(mypageSql);
    pstmt.setString(1, userid);
    rs = pstmt.executeQuery();
    
    if (rs.next()) {
        M_job = rs.getString("M_job") != null ? rs.getString("M_job") : "직업 정보 없음";
        M_skill = rs.getString("M_skill") != null ? rs.getString("M_skill") : "기술 정보 없음";
        M_hobby = rs.getString("M_hobby") != null ? rs.getString("M_hobby") : "취미 정보 없음";
        M_number = rs.getString("M_number") != null ? rs.getString("M_number") : "전화번호 없음";
        M_github = rs.getString("M_github") != null ? rs.getString("M_github") : "#";
        M_now = rs.getString("M_now") != null ? rs.getString("M_now") : "현재 상황 없음";
    } else {
        System.out.println("Mypage 테이블에서 ID를 찾을 수 없음: " + userid);
    }
    
    rs.close();
    pstmt.close();
    
 	// 3 Study 테이블에서 정보 가져오기

} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
<!DOCTYPE html>
<html>

<head>

<header>
        <div class="inner">
            <ul id="gnb">
                <li><a href="#">INTRODUCE</a></li>
                <li><a href="#">MYPAGE</a></li>
                <li><a href="#">PROJECT</a></li>
                <li><a href="#">TODOLIST</a></li>
                <li><a href="#">LOCATION</a></li>
            </ul>
            
            <ul class="util">
            
                <li><a href="#">Contact</a></li>
                <li><a href="#">Help</a></li>
                <%
				    if ((String)session.getAttribute("U_id") != null) {          
				        // 로그인 상태일 때의 출력 
				        String U_id = (String) session.getAttribute("U_id");
				        // 로그인 아이디 정보 userid 변수에 저장
				%>
                <li><a href="login/logout_test.jsp"><%= U_id %>님 Logout</a></li>
                <!--또는 session.getAttribute("userName") -->
                <%
				    }else {
                %>
                <li><a href="login/login_test.jsp">Login</a></li>
                
                <% } %>
                <li><a href="user/register.jsp">Join</a></li>
            </ul>
        </div>
    </header>
    <meta charset="UTF-8">
    <title>자기소개 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- 📌 외부 CSS 파일 연결 -->
    <link rel="stylesheet" type="text/css" href="css/css_main.css">

    
</head>
<body>
<div class="text_box">
  <span class="text"></span><span class="blink">|</span>
</div>

<div class="container">
    <img src="img/mainpge.png" alt="프로필 사진">
    <h2>마이페이지</h2>
        <p>저는 <%= M_job %>이며,</p>
        <p> <%= M_now %>.</p>
        <p>좋아하는 기술: <%= M_skill %></p>
        <p>취미: <%= M_hobby %></p>

        <div class="contact">
            <p>📧 이메일: <a href="mailto:<%= U_email %>"><%= U_email %></a></p>
            <p>📞 전화번호: <%= M_number %></p>
            <p>🔗 <a href="<%= M_github %>" target="_blank">GitHub</a></p>
        </div>

        <a href="user/Mypage.jsp">정보 입력하기</a>
</div>


<div class="container">
    <h2>내가 진행한 프로젝트</h2>
    <div class="wrap"> <!-- 배너 표시 영역 -->
        <div class="rolling-list"> <!-- 원본 배너 -->
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
    } else if(userid == null){
    	content = "안녕하세요. \n끊임없이 성장하고 도전하는 \n[개발자]입니다.";
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
</script>   
<script> 
    document.addEventListener("DOMContentLoaded", function () {
        console.log("페이지 로드 완료!"); // 디버깅 메시지
        
        let roller = document.querySelector('.rolling-list');
        if (!roller) {
            console.error("⚠️ rolling-list 요소를 찾을 수 없습니다.");
            return;
        }
        
        roller.id = 'roller1'; // ID 부여

        let clone = roller.cloneNode(true); // 요소 복제
        clone.id = 'roller2';
        document.querySelector('.wrap').appendChild(clone);

        document.querySelector('#roller1').style.left = '0px';
        document.querySelector('#roller2').style.left = document.querySelector('.rolling-list ul').offsetWidth + 'px';

        // 애니메이션 클래스 추가
        roller.classList.add('original');
        clone.classList.add('clone');

        console.log("롤링 배너 적용 성공");
    });
    
</script>
<!--속도제어-->

</body>
</html>
