<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice Write Page</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 네이버 스마트 에디터 -->
<script type="text/javascript" src="/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
	
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["notcontent"].exec("UPDATE_CONTENTS_FIELD", []);

    // 유효성 검사
 	var nottitle = document.getElementById("nottitle").value;
	var notcontent = $("#notcontent").val();
	console.log(notcontent);
    
	 if(nottitle == "" || nottitle == null || nottitle == "&nbsp;" || nottitle == "<p>&nbsp;</p>" || nottitle == "<br>") {
 		alert("제목을 입력하세요.");
 		document.getElementById("nottitle").focus();
 		return false;
	} else if(document.getElementById("nottitle").value.length >= 25) {
 		alert("제목 길이 제한 초과!!");
 		document.getElementById("nottitle").focus();
		return false;
	} else if(notcontent == "" || notcontent == null || notcontent == "&nbsp;" || notcontent == "<p>&nbsp;</p>" || notcontent == "<br>" || notcontent == "<p><br></p>") {
		alert("본문 내용을 입력하세요.");
		document.getElementById("notcontent").focus();
		return false; 
	} else if(document.getElementById("notcontent").value.length >= 2500) {
		alert("본문 길이 제한 초과!!");
		document.getElementById("notcontent").focus();
		return false;
	} else {
		try {
			alert("공지사항 작성 완료!!");
			elClickedObj.form.submit();
			return true;

		} catch(e) {}	 
 	}
}
    
$(document).ready(function() {
// 	$("#btnWrite").click(function() {
// 		submitContents($(this));
// 	});
	
	$("#title").focus();
	
	$("#cancel").click(function() {
		history.back(-1);
	})
	
});

</script>

<style type="text/css">
.pagename {
	color: skyblue;
/* 	text-shadow: 3px 3px 3px black, 3px 3px 5px gold; */
}
</style>

</head>
<body>


<div class="wrap">
<jsp:include page="/resources/util/Manage_Page/sideMenu.jsp" />

<div class="container">
<div class="content">
<h1 class="pagename">공지사항 작성</h1>
<hr>

<form action="/Manage_Page/noticeWrite.do" method="post" enctype="multipart/form-data" onsubmit="submitContents()">

<%-- <input type="hidden" id="notname" name="notname" value="${sessionScope.nickname }" /> --%>
	
<div class="form-group">
	<label for="nottitle">제목</label><br>
	<input type="text" id="nottitle" name="nottitle" class="form-control" placeholder="공지사항 제목을 입력하세요." />
</div>
 
<div class="form-group">
	<label for="file">첨부파일</label>
	<input type="file" id="file" name="file" class="btn-primary" /><br>
</div>

<div class="form-group">
	<label for="notcontent">내용</label><br>
	<textarea rows="10"id="notcontent" name="notcontent" style="display: none;"></textarea>
</div>

	<!-- 가운데 정렬 class="center-block" -->
	<input type="button" id="btnWrite" class="center-block btn-lg btn-success" value="작성" onclick="submitContents(this)" />
<!-- 	<a href="/board/list.do">목록으로</a> -->
	
</form>
</div>	<!-- content END -->
</div>	<!-- container END -->
</div>	<!-- wrap END -->


<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "notcontent",
    sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html",
    fCreator: "createSEditor2",
    htParams : {
    	bUseToolbar: true, // 툴바 사용여부
    	bUseVerticalResizer: false, //입력창 크기 조절바
    	bUseModeChanger: true, //모드 탭
    	fOnBeforeUnload : function(){}
    }
});
</script>

</body>
</html>