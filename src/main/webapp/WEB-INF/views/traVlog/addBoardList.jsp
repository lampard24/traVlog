<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- BoardList 시작 -->
<div>
      <!-- BoardList 시작 -->
         
         <c:forEach items="${boardList }" var="board" varStatus="listNumber" begin="0" end="${count }">
<%--          <c:forEach items="${boardList }" var="board" varStatus="listNumber">    --%>
         <div class="board">
            <input type="hidden" id="bodno_${board.bodno }" name="bodno" value="${board.bodno }">
            <div class="memInfo"> 
            <img class="userimg" src="/resources/images/icon/user.png">
            <strong class="nick">${board.bodname }</strong>
            <img class="claim" alt="신고하기" src="/resources/images/icon/claim.png">
            </div>
            
            
            <div class="boardInfo">
            <strong class="title">${board.bodtitle }</strong>
            <c:if test="${board.startdate != null && board.enddate!=null }">
            <span class="Bdate">
            <img class="calender" src="/resources/images/icon/calender.png">
            ${board.startdate }
            <img class="airplane" src="/resources/images/icon/airplane.png">
            ${board.enddate }</span>
            </c:if>
            </div>
            
            <div class="boardImg">
<%--             <c:if test="${board.imageList != null }"> --%>
               <img class="contentImg"  src="/resources/images/BackGround/login.jpg">
<%--              </c:if> --%>
            </div>
            
            <div class="icon">
            <!-- 좋아요 기능  -->
            <button id="recoBtn_${board.bodno}" class="btnRecommend" onclick="recommend(${board.bodno });">
            <c:if test="${board.isExistsLikeData eq '1'}">
            <img id="like_${board.bodno}" class="like" width="30px;" src="/resources/images/icon/liked.png" >
            </c:if>
            <c:if test="${board.isExistsLikeData eq '0'}">
            <img id="like_${board.bodno}" class="like" width="30px;" src="/resources/images/icon/like.png">
            </c:if>
            </button>

            <button><img class="comm" width="30px;" src="/resources/images/icon/comment.png"></button>
            
            <!-- 보관기능 -->
            <button id="pinBtn_${board.bodno}" class="btnPin" onclick="pin(${board.bodno });">
            <c:if test="${board.isExistsPinData eq '1'}">
            <img id="pin_${board.bodno}" class="pin" width="30px;" src="/resources/images/icon/pined.png" >
            </c:if>
            <c:if test="${board.isExistsPinData eq '0'}">
            <img id="pin_${board.bodno}" class="pin" width="30px;" src="/resources/images/icon/pin.png">
            </c:if>
            </button>
            
            </div>
            <div class="Bcontent">
            <label>좋아요 <strong id="recommend_${board.bodno }">${board.recommendCnt }</strong> 개</label>
            ${board.bodcontent }
            </div>
         </div>
         </c:forEach>
         <!-- boardList 끝 -->
         
      </div>
         