$(function(){
   var case1_Code = null;
   var case2_Code = null;
   var case3_Code = null; 
   var pageNo = null;
   var toggleNum = null;


   areaList();

   /* Area List 생성 */
   function getAreaSearchData(obj, num){
      var name = $(obj["areaCase" + num]).find("name");
      var code = $(obj["areaCase" + num]).find("code");

      $("#case" + num).empty();

      for(var i = 0; i < name.length; i++){

         if(name.eq(i).text().trim() == "세종특별자치시") {
            name.eq(i).text("세종시");
         }
         $("#case" + num).append("<li value='"+ code.eq(i).text() +"'>" + name.eq(i).text() + "</li>");
      }
   }

   /* Area Data 요청 */
   function areaList(){
      $.ajax({
         url : "areaList.do",
         mothod : "POST",
         data : {"case1":case1_Code,"case2":case2_Code,"case3":case3_Code},
         async:false,
         success : function(obj){

            for(var num = 1; num < 3; num++){
               getAreaSearchData(obj, num);
            }

            contentList();
         },
         error:function(){
            alert("에러");
         }
      });
   }

   /* Content Block 생성 */
   function getContentSize(obj, contentId, rows){
      var count = $(obj["content"]).find("totalCount").text().trim();
      var totalPage = Math.ceil(count / rows);
      $("#titles").empty();
      $("#pages").empty();
      for(var i = 0; i < rows; i++){
         if(contentId.eq(i).text().trim() != null){
            $("#titles").append("<li id='" + contentId.eq(i).text().trim() + "' class='contentId'></li>" );
            $("#"+ contentId.eq(i).text().trim()).append("<div id='content-text-" + i + "'class='text-side'></div><butten");
            $("#"+ contentId.eq(i).text().trim()).append("<div id='content-img-" + i + "'class='img-side'></div>" );
         }
      }
      for (var i = 1; i <= totalPage; i++) {
         $("#pages").append("<p id='"+i+"' class='pageNum'>"+ i + "</p>");
      }
   }

   /* Content Block > Title, Image, Content-text 입력 */
   function getContentData(contentId, rows){
      for(var i = 0; i < rows; i++){
         $.ajax({
            url : "overView.do",
            mothod : "POST",
            data : {"contentId" : contentId.eq(i).text().trim()},
            async:false,
            success : function(obj){

               var imgSrc = $(obj["overView"]).find("firstimage");
               var title = $(obj["overView"]).find("title");
               var overView = $(obj["overView"]).find("overview");

               $("#content-img-"+i).append("<img id='area-img' src='" + imgSrc.text()
                     + "' onerror='" + 'this.src="/trip/resources/images/no-image-icon-23494.png"' 
                     + "' alt='썸네일' />");
               $("#content-text-"+i).append("<p id='titleText" + i + "' class='titleText'>" + title.text() + "</p><hr>");
            },
            error:function(){
               alert("에러");
            }
         });
      }
   }

   /* Content Data 요청 */
   function contentList(){
      $.ajax({
         url : "contentList.do",
         mothod : "POST",
         data : {"case1":case1_Code,"case2":case2_Code,"case3":case3_Code,"pageNo":pageNo},
         async:false,
         success : function(obj){

            var contentId = $(obj["content"]).find("contentId");
            var rows = $(obj["content"]).find("numOfRows").text().trim();

            getContentSize(obj, contentId, rows);
            getContentData(contentId, rows);

            case1_Code = obj.case1;
            case2_Code = obj.case2;
            case3_Code = obj.case3;
         },
         error:function(){
            alert("에러");
         }
      });
   }

   /* 클릭 이벤트 */
   $("#case1").on("click", "li", function(){
      toggleNum = $(this).attr('value');
      if(toggleNum == case1_Code){
         $("#case2").toggle();
      }
      case1_Code = $(this).attr('value');
      case2_Code = null;
      case3_Code = null;
      pageNo = null;
      areaList();
      $(this).css("background-color", "#4C69BA");
      $(this).css("color", "white");
   });

   $("#case2").on("click", "li", function(){
      case2_Code = $(this).attr('value');
      case3_Code = null;
      pageNo = null;
      areaList();
   });

   $("#case3").on("click", "li", function(){
      case3_Code = $(this).attr('value');
      pageNo = null;
      areaList();
   });

   $("#pages").on("click", ".pageNum", function(){
      pageNo = $(this).attr('id');
      contentList();
   });

   $("#titles").on("click", ".img-side", function(){
      var con = $(this).parent().attr('id');
      if(case1_Code == null){
         case1_Code = "1";
      }
      if(case2_Code == null){
         case2_Code = "1";
      }
      if(case3_Code == null){
         case3_Code = "12";
      }
      if(pageNo == null){
         pageNo = "1";
      }
      location.href='areaDetail.do?con=' + con + '&type1=' + case1_Code 
      + '&type2=' + case2_Code + '&type3=' + case3_Code + '&page=' + pageNo;
   });

});