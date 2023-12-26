<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link href="<c:url value="/resources/css/requestBoard.css"/>" rel='stylesheet' />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <script src="https://cdn.ckeditor.com/ckeditor5/40.2.0/classic/ckeditor.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
</head>
<body>

 <div id=board>
                  
                  <!-- 게시물 목록 테이블(표) -->
                  <table id="table">
                  <tr>
                  <th width="5%">번호</th>
                  <th width="80%" >제목</th>
                  <th width="5%">글쓴이</th>
                  <th width="5%">작성일</th>
                  <th width="5%">조회수</th>
                  </tr>
              
                  <!-- 목록의 내용 
                <c:choose>
                <c:when test="${empty list }">
                  <tr><td colspan="5" align="center">등록된 게시물이 없습니다</td></tr>
                 </c:when>
                 
                 <c:otherwise>-->
                     
                      <c:choose>
                      <c:when test="${not empty param.searchWord}">
                      <c:url value="view" var="viewUrl">
                      <c:param name="searchField" value='${empty param.searchField?"title":param.searchField}'/>
                      <c:param name="searchWord" value='${empty param.searchWord?"":param.searchWord}'/>
                      <c:param name="pageNum" value='${empty param.pageNum?1:param.pageNum}'/>
                      <c:param name="num" value="${ dto.num}"/>
                </c:url>	
                </c:when>
                <c:otherwise>
                <c:url value="view" var="viewUrl">
                    <c:param name="pageNum" value='${empty param.pageNum? 1: param.pageNum }'/>
                    <c:param name="num" value='${dto.num }'/>	 
                </c:url>
                </c:otherwise>
                </c:choose>
                </c:otherwise>
                </c:choose>
                        
                          <c:forEach var="board" items="${list}">
                          <tr>
                           
                           <td>${board.bno}</td> <!-- 게시물 번호 -->
                           <td id="titletd">
                          <a href="<c:url value='/board/read${ph.sc.queryString}&bno=${board.bno}'/>">${board.title }</a> 
                          </td>
                          <td>${board.writer} </td>
                          <td>${board.view_cnt} </td>
                          
                          
                        <fmt:formatDate var="today" value="${now}" pattern="yyyy.MM.dd"/>
                         <fmt:formatDate var="reg_date" value="${board.reg_date}" pattern="yyyy.MM.dd"/>
                          <c:choose>
                          <c:when test="${ today <= reg_date }">
                          <td class="regdate"> <fmt:formatDate value="${board.reg_date}" pattern="HH:mm"/></td>
                          </c:when>
                          <c:otherwise>
                         <td class="regdate"><fmt:formatDate value="${board.reg_date}" pattern="yyyy.MM.dd"/></td>
                          </c:otherwise>
                          </c:choose>

                          
        
                           </tr>
                        
                        </c:forEach>
                 
                  </table>
    
                  <form id="searchList">
                   
                    <select name="option">
                    <option value="A" ${ph.sc.option=='A'||ph.sc.option==''? "selected" : "" }>제목+내용</option>
                    <option value="T" ${ph.sc.option=='T'? "selected" : "" }>제목</option>
                    <option value="C" ${ph.sc.option=='C'? "selected" : "" }>내용</option>
                    <option value="W" ${ph.sc.option=='W'? "selected" : "" }>글쓴이</option>
                    </select>
                    <img src="/html/js/img/돋보기.png">
                    <input type="text" name="keyword"
                    value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요"> <!--  onsubmit="return searchCheck(this)" -->
                    <button id="sBtn">검색</button>
                  
                </form>
                <div id="dBtn">
                    <button type="button" onclick='location.href="<c:url value='/board/write'/>"'>글쓰기</button>
                </div>
           
    
    
    
    
                  <div id="page">
                 <c:if test="${ph.showPrev }">
             
                 <a href="<c:url value='/board/list${ph.sc.getQueryString(ph.beginPage-1) }'/>">&lt;</a>
                 </c:if>
                 <c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
                 <a class='${ph.sc.page== i ? "active": "" }' href="<c:url value='/board/list${ ph.sc.getQueryString(i)}'/>">${i }</a>
                 </c:forEach>
                 <c:if test="${ph. showNext }">
                 <a href="<c:url value='/board/list${ph.sc.getQueryString(ph.endPage+1) }'/>">&gt;</a>
    
                  </c:if>
                  </div>
                </div>   
               
        


            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
             
       
        </body>
        </html>
              

