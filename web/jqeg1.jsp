<%-- 
    Document   : jqeg1
    Created on : 28 Feb, 2020, 10:17:57 AM
    Author     : guraman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <jsp:include page="base.jsp"></jsp:include>
          <%--If we are not using javascript than we can use jquery aither at the top or bottom bt 
while using jquery at the bottom we have to write  $(document).ready(function(){ });
          IT IS PREFERABLE TO WRITE JAVASCRIPT AT THE TOP AND JQUERY AT BOTTOM.
          --%>
          <script>
              $(document).ready(function(){
                      //alert("hello");
                      $("#b1").click(function(){
                          // $("#div1").hide();
                          $("#div1").slideUp(2000,function(){alert("DIV IS HIDDEN NOW");});
                          
                      });
                       
                      $("#b2").click(function(){
                          // $("#div1").show();
                          $("#div1").slideDown(2000,function(){alert("DIV IS SHOWN NOW");});
                          
                      });
                            
                              
                         //$("input").clcik(function(){alert("ok");});   
                         $("#b3").click(function(){
                              $("#div1").slideToggle(2000);
                     
                             });
            
            });
              
              </script>
          
          
          
    </head>
    <body style='background-color: buttonhighlight;'>
        <input type="button" value="Hide div" id="b1"/>
        <input type="button" value="Show div" id="b2"/>
         <input type="button" value="Hide/Show div" id="b3"/>
        <div id="div1" style="background-color: bisque; height:200px"></div>
    </body>
</html>
