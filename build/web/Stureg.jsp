<%-- 
    Document   : NEW
    Created on : 31 Jan, 2020, 3:25:51 PM
    Author     : guraman
--%>



<%@page contentType="text/html" pageEncoding="UTF-8" import="com.beans.Stureg,com.daos.SturegDao"%>
 <jsp:include page="base.jsp"></jsp:include>
<script type="text/javascript">
    
    
    
        $(document).ready(function(){
                     
                      $("#form1").submit(function(e){
                         x = $("#password").val();
                         y = $("#cpassword").val();
                     
                       if (x === y)
                            return true;
                        else
                        {
                            alert('sorry! password and confirm password not matched');
                            e.preventDefault();
                        }
                    });


                    $("#userid").blur(function () {
                        $("#sp1").load("SturegController?op=check_userid&userid=" + $(this).val());
                    });


                    $("#accept").change(function () {
                        if ($(this).prop("checked") == true) 
                            $("#submit").prop("disabled",false);
                       else  
                             $("#submit").prop("disabled",true);
                       
                    });

                });

    
    <%--
    function matchPwd(x,y)
    {
        if(x===y)
            return true;
        else
        {
            alert('sorry! Password and Confirm Passsword not matched');
            return false;
        }
    }
    
    function checkValue(x,y)
    {
        if(x.checked==true)
        {
           y.disabled=false;
        }
        else
        {
            y.disabled=true;
        }
    }


  
            function checkUserid(x,y){
                ajax = new XMLHttpRequest();
                ajax.open("GET","SturegController?op=check_userid&userid="+x,true);
                ajax.send();
                
                ajax.onreadystatechange=function(){
                    if(this.readyState==4 && this.status==200){
                        y.innerHTML = this.responseText;
                    }
                }
            }

--%>
    
    </script>

    <body>
        <jsp:useBean id="stureg" class="com.beans.Stureg" scope="session"></jsp:useBean>
        <h1><b> REGISTRATION FORM FOR STUDENTS </b></h1>
             <h2><b> SIGN UP AS :  <b/></h2>
             
             <form  method='post' id="form1" action="addpic.jsp" class="form"> 
            User Id : <input type="text" placeholder="User Id" name="userid" value="${stureg.userid}" required="required" class="form-control" id="userid" onblur="checkUserid(this.value,sp1);">
                              <span id ="sp1"> </span>
                            
    <br><br>
    Age : <input type="text" placeholder="Age" name="age" required="required"  class="form-control" value="${stureg.age}">
    <br><br>
    Name : <input type="text" placeholder="Your Name" name="name" required="required"  class="form-control" value="${stureg.name}">
    <br><br>
    Father Name : <input type="text" placeholder="Father Name" name="fname" required="required"  class="form-control" value="${stureg.fname}">

    <br><br>
    Birth Date : <input type="date" placeholder="Birth Date" name="dob" required="required"  class="form-control" value="${stureg.dob}">
    <br><br>
    Gender :
     <input type="radio" name="gender" value="Male" ${stureg.gender eq "Male"? "checked":""} />Male
                                    <br/>
    <input type="radio" name="gender" value="Female" ${stureg.gender eq "Female"? "checked":""} /> Female
    <br>
    Your E-mail : <input type="email" placeholder="Your E-mail" name="email" required="required"  class="form-control" value="${stureg.email}">
    <br><br>
    Phone Number : <input type="phone" placeholder="Phone Number" name="phone" required="required"  class="form-control" value="${stureg.phone}">
 <%--  File To Upload : <input type="file" name="image" id="fileToUpload"> --%>
    
    
    <br><br>
    Address : <input type="text" name="address" placeholder="address" title="Please enter your Address" required="required"  class="form-control" value="${stureg.address}">
    <br><br>
    Line : <input type="text" name="line" placeholder="line" title="Please enter your Line" required="required"  class="form-control" value="${stureg.line}">
    <br><br>
    City : <input type="text" name="city" placeholder="city" title="Please enter your City" required="required"  class="form-control" value="${stureg.city}">
    <br><br>
    Zip Code : <input type="text" name="zipcode" placeholder="Zip code" title="Please enter your Zip code" required="required"  class="form-control" value="${stureg.zipcode}">
    <br><br>
    Institute Name : <input type="text" name="instname" placeholder="Institute Name" title="Please enter your Institute name" required="required"  class="form-control" value="${stureg.instname}">
    <br><br>
 
    Enter Password:
     <input type="password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" name="password" id="password" required="required"  class="form-control">
    <br/>
      <b>Password must contains atleast one uppercase,one lowercase , one special char and more than 8 characters</b>
  Confirm Password:
          <input type="password" name="cpassword" id="cpassword" required="required"  class="form-control">

    <br><br><br>
    <input type="checkbox" value="accept" name="accept" id="accept" onchange="checkValue(this,submit);" />  <span><B>I Accept Terms & Conditions</B></span>
   
    <input type="submit" name="submit" id="submit" value="Next Page" class="btn btn-primary" disabled="disabled"> 
    
             </form>

             <a href="Stureglogin.jsp">CLICK HERE FOR LOGIN </a>
          
              <%--    
        <%
            if(request.getParameter("submit")!=null){%>
            <jsp:useBean id="stureg1" class="com.beans.Stureg"></jsp:useBean>
            <jsp:setProperty name="stureg1" property="*"></jsp:setProperty>
           
            
            <% SturegDao sdo = new SturegDao();    
            if(sdo.add(stureg1))
                out.println("<script>alert('data saved!');</script>");
            }%>
    --%>
	
    </body>
</html>