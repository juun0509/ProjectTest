<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link href="<c:url value="/resources/css/product.css"/>" rel='stylesheet' />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div id="con">
    <div id="header"><h1>ë§ì¶¤ ììì </h1></div>
    <div id="main">
        <h3>ì°ì ìì ì¤ì </h3>

    <fieldset id="field">        
        <ul id="tag-list" style="list-style-type: decimal;"></ul>
    </fieldset>
    
    <fieldset id="field2">        
        <input class="tagBox" type="button" name="tagBox" value="#í¼ë¡&ë©´ì­" >
        <input class="tagBox" type="button" name="tagBox" value="#í¼ë¶" >
        <input class="tagBox" type="button" name="tagBox" value="#í­ì°í" >
        <input class="tagBox" type="button" name="tagBox" value="#ì¥&ë°°ë³" >
        <input class="tagBox" type="button" name="tagBox" value="#ë¤ì´ì´í¸" >
        <input class="tagBox" type="button" name="tagBox" value="#ë¼&ê´ì " >
        <input class="tagBox" type="button" name="tagBox" value="#ìì°ë¶" >
        <input class="tagBox" type="button" name="tagBox" value="#ë² ì´ë¹&í¤ì¦" >
        <input class="tagBox" type="button" name="tagBox" value="#ë" >
        <input class="tagBox" type="button" name="tagBox" value="#ê°" >
        <input class="tagBox" type="button" name="tagBox" value="#ë¹ë¨" >
        <input class="tagBox" type="button" name="tagBox" value="#íì" >
        <input class="tagBox" type="button" name="tagBox" value="#ê°±ëê¸°" >
        <input class="tagBox" type="button" name="tagBox" value="#ì¬ì±" > 
        <input class="tagBox" type="button" name="tagBox" value="#ë¨ì±&ì ë¦½ì " >
        <input class="tagBox" type="button" name="tagBox" value="#í¸ë¥´ëª¬" >
        <input class="tagBox" type="button" name="tagBox" value="#íëª¨" >
        <input class="tagBox" type="button" name="tagBox" value="#ë¹ì¼" >
        <input class="tagBox" type="button" name="tagBox" value="#ë" >
        <input class="tagBox" type="button" name="tagBox" value="#ì" >
        <input class="tagBox" type="button" name="tagBox" value="#ê¸°í" >

    </fieldset>

     
    <input id="tag" type="text" name="tag" size="7" placeholder="#íê·¸ë¥¼ ìë ¥í´ì£¼ì¸ì (ìµë 10ê°)" >
        
    <fieldset id="field3">
        <h3>ê°ê²©ì¤ì </h3>
        <input id="priceMin" type="text" name="tag" size="3" placeholder="0" >
        <p>~</p>
        <input id="priceMax" type="text" name="tag" size="3" placeholder="1,000,000" >
    </fieldset>
    <button type="button" id="search">ê²ì</button>



    </div>
    <div id="main2">
        <fieldset id="field4">        
            <p>ì¶ì²ì¡°í© 1) ìíx+ìíy+ìíz</p>
            <p>ì´ ìµì:</p>
            <p>ì´ ê°ê²©:</p>
            <button type="button" class="view"><ìì¸ë³´ê¸°></button>
        </fieldset>



    </div>
  
</div>



<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
        
            $(document).ready(function () {
                var tag = {};
                var counter = 0;
        
                // ìë ¥í ê°ì íê·¸ë¡ ìì±íë¤.
                function addTag (value) {
                    tag[counter] = value;
                    counter++; // del-btn ì ê³ ì  id ê° ëë¤.
                }
        
                // tag ìì ìë ê°ì array type ì¼ë¡ ë§ë¤ì´ì ëê¸´ë¤.
                function marginTag () {
                    return Object.values(tag).filter(function (word) {
                        return word !== "";
                    });
                }
            
                // ìë²ì ì ê³µ
                $("#tag-form").on("submit", function (e) {
                    var value = marginTag(); // return array
                    $("#rdTag").val(value); 
        
                    $(this).submit();
                });
        
                $("#tag").on("keypress", function (e) {
                    var self = $(this);
        
                    //ìí°ë ì¤íì´ì¤ë° ëë ìë ì¤í
                    if (e.key === "Enter" || e.keyCode == 32) {
        
                        var tagValue = self.val(); // ê° ê°ì ¸ì¤ê¸°
        
                        // í´ìíê·¸ ê° ìì¼ë©´ ì¤íX
                        if (tagValue !== "") {
        
                            // ê°ì íê·¸ê° ìëì§ ê²ì¬íë¤. ìë¤ë©´ í´ë¹ê°ì´ array ë¡ return ëë¤.
                            var result = Object.values(tag).filter(function (word) {
                                return word === tagValue;
                            })
                        
                            // í´ìíê·¸ê° ì¤ë³µëìëì§ íì¸
                            if (result.length == 0) { 
                                $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                                addTag(tagValue);
                                self.val("");
                            } else {
                                alert("íê·¸ê°ì´ ì¤ë³µë©ëë¤.");
                            }
                        }
                        e.preventDefault(); // SpaceBar ì ë¹ê³µê°ì´ ìê¸°ì§ ìëë¡ ë°©ì§
                    }
                });
        
                // ì­ì  ë²í¼ 
                // ì¸ë±ì¤ ê²ì¬ í ì­ì 
                $(document).on("click", ".del-btn", function (e) {
                    var index = $(this).attr("idx");
                    tag[index] = "";
                    $(this).parent().remove();
                });
        })
        </script>
</body>
</html>