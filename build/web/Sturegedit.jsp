<%-- [[0tg
    Document   : editRecord
    Created on : 24 Jan, 2020, 9:19:10 AM
    Author     : SAURABH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,com.beans.Stureg,com.daos.SturegDao"%>
<jsp:include page="base.jsp"></jsp:include>
    <body>
         
      
        <h1>Update the Data </h1>
         <%
            int id= request.getParameter("id")!=null? Integer.parseInt(request.getParameter("id")):0;
            SturegDao sd = new SturegDao();
            Stureg stureg = sd.getById(id);
            request.setAttribute("stureg1",stureg);
           
           %>
           
          
        <form  method="post">
        
<input type="hidden" name="id" value="<%=stureg.getId()%>" readonly="readonly"/>


User Id : <input type="text" value="<%=stureg.getUserid()%>"  class="form-control" id="userid" onblur="checkUserid(this.value,sp1);">
                              <span id ="sp1"> </span>
    <br><br>
    Age : <input type="text"  name="age" value="<%=stureg.getAge()%>">
    <br><br>
    Name : <input type="text" name="name" value="<%=stureg.getName()%>">
    <br><br>
    Father Name : <input type="text"  name="fname"  value="<%=stureg.getFname()%>">
    <br><br>
    Birth Date : <input type="date" name="dob" value="<%=stureg.getDob()%>">
    <br><br>
    Gender : 
   
    <input type="radio" name="gender" value="Male"<%if(stureg.getGender().equalsIgnoreCase("Male")) out.println("checked='checked'"); %>/>Male
        <br/>
        <input type="radio" name="gender" value="Female" <%if(stureg.getGender().equalsIgnoreCase("Female")) out.println("checked='checked'"); %>/> Female
    
    
    <br><br>
    Your E-mail : <input type="email"  name="email" value="<%=stureg.getEmail()%>">
    <br><br>
    Phone Number : <input type="phone" name="phone" value="<%=stureg.getPhone()%>">
    <br><br>
   <%-- File To Upload : <input type="file" name="image" id="fileToUpload"> --%>
    
    
    <br><br>
    Address : <input type="text" name="address"  value="<%=stureg.getAddress()%>">
    <br><br>
    Line : <input type="text" name="line"  value="<%=stureg.getLine()%>">
    <br><br>
    City : <input type="text" name="city" value="<%=stureg.getCity()%>">
    <br><br>
    Zip Code : <input type="text" name="zipcode" value="<%=stureg.getZipcode()%>">
    <br><br>
    Institute Name : <input type="text" name="instname"value="<%=stureg.getInstname()%>">
    <br><br>
   
    <input type ="submit" name ="submit" value="Register">
            
</form>
        
    
    <%
        if(request.getParameter("submit")!=null)
    {
    %>
        <jsp:useBean class="com.beans.Stureg" id="stureg1" scope ="request"></jsp:useBean>
        <jsp:setProperty name="stureg1" property="*"></jsp:setProperty>
        <%
        if (sd.update(stureg1))
            response.sendRedirect("Sturegshow.jsp");


        }
        %>
            
            
            
    </body>
</html>
