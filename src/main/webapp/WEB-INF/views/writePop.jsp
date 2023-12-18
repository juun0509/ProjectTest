<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   <style>
        html{
            overflow:hidden;
        }
        body{
            margin: 0;
        }
        *{
            font-family: 'omyu_pretty';
        }
        #pop{
            width: 280px;
            height: 330px;
        }
        #searchPro{
            width: 230px;
            height: 40px;
            border: none;
            padding-left: 3px;
            font-size: 20px;
            color: rgb(74, 190, 202);
            border-bottom:3px solid rgb(74, 190, 202);
            margin-top: 5px;
            margin-bottom: 10px;
        }

        #inputPop{
            text-align: center;
        }

        #prodPop{
            height: 190px;
            overflow: auto;

        }
        
        .imgPop{
            width: 215px;
            margin: auto;
            margin-bottom: 15px;
            overflow: hidden;
            cursor: pointer;
        }
        #pop img{
            float: left;
            width: 50px;
            height: 50px;
            line-height: 50px;
        }
        #pop p{
            font-size: 18px;
            margin-left: 60px;
        }
      
        #pbtns{
            margin-top: 20px;
            display: inline-flex;
            
        }
      
        #cancel{
            width: 140px;
            height: 50px;
            margin: 0;
            font-family: 'KCC-Ganpan';
            border: none;
            border-top: 1px solid #dddddd;
            background-color: white;
            cursor: pointer;
        }
        #submit{
            width: 140px;
            height: 50px;
            margin: 0;
            font-family: 'KCC-Ganpan';
            border: none;
            border-top: 1px solid #dddddd;
            background-color: white;
            color: rgb(74, 190, 202);
            cursor: pointer;
        }
        #prodPop::-webkit-scrollbar{
            width: 20px;
            background-color: whitesmoke;
        }
        #prodPop::-webkit-scrollbar-thumb{
            background-color: #dddddd;
        }
        #pbtns button:hover{
            background-color: black;
        }
        #pbtns button:focus{
            background-color: black;
        }

        #cancel:hover{
            color: white;
        }
        #cancel:focus{
            color: white;
        }

        @font-face {
        font-family: 'KCC-Ganpan';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        }
        @font-face {
        font-family: 'omyu_pretty';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        }
    </style>
</head>
<body>
	<div id="pop">
          
            <div id="inputPop"><input id="searchPro" type="text" placeholder="상품을 검색해주세요"></div>
            
            
            <div id="prodPop">
                <div class="imgPop">
                    <img src="/tonicbank/resources/img/slide1.jpg" alt="" class="img">
                    <p>상품명</p>
                </div>
                <div class="imgPop">
                    <img src="/tonicbank/resources/img/slide1.jpg" alt="" class="img">
                    <p>상품명</p>
                </div>
                <div class="imgPop">
                    <img src="/tonicbank/resources/img/slide1.jpg" alt="" class="img">
                    <p>상품명</p>
                </div>
                <div class="imgPop">
                    <img src="/tonicbank/resources/img/slide1.jpg" alt="" class="img">
                    <p>상품명</p>
                </div>
            </div>
       


            
            <div id="pbtns"> 
                <button type="button" id="cancel">CANCEL</button>
                <button type="submit" id="submit">SUBMIT</button>
            </div>

    </div>
</body>
</html>