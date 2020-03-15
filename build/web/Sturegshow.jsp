<%@page import="com.daos.SturegDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,com.beans.Stureg,com.daos.SturegDao,java.util.ArrayList"%>
<jsp:include page="base.jsp"></jsp:include>
<body> 
        <h1>List of User </h1>
        <table width="600" border='1' cellspacing='0' class="table table-striped">
            <tr>
                <th>USERID</th> <th>AGE</th><th>ZIPCODE</th> <th>Name</th> <th>Father Name</th><th>BIRTH DATE</th> <th>GENDER</th> <th>EMAIL</th><th>PHONE</th><th>FILE TO UPLOAD</th>
                <th>ADDRESS</th><th>LINE</th><th>CITY</th><th>INSTITUTE NAME</th><th>PASSWORD</th><th>ACTION</th>
            </tr>
         
        <%
            SturegDao sd = new SturegDao();
            ArrayList<Stureg> rows =new ArrayList();
            int start= request.getParameter("start")!=null? Integer.parseInt(request.getParameter("start")):0;
            int end=3;
            int total= sd.getRecordCount();
            rows = sd.getRowsByLimit(start, end);
            for(Stureg stureg : rows)
              {%>
          
          <tr>
              <td><%=stureg.getUserid()%></td>
              <td><%=stureg.getAge()%></td>
               <td><%=stureg.getZipcode()%></td>
               <td><%=stureg.getName()%></td>
              <td><%=stureg.getFname()%></td>
              <td><%=stureg.getDob()%></td>
              <td><%=stureg.getGender()%></td>
              <td><%=stureg.getEmail()%></td> 
              <td><%=stureg.getPhone()%></td>
              <td><img src="<%=stureg.getImage()%>" style="width:64px; height:64px;"></td>
              
              <td><%=stureg.getAddress()%></td>
              <td><%=stureg.getLine()%></td>
              <td><%=stureg.getCity()%></td>
              <td><%=stureg.getInstname()%></td>
              <td><%=stureg.getPassword()%></td>
              <td><a href="Sturegedit.jsp?id=<%=stureg.getId()%>"> <i class="fa fa-pencil-square fa-lg" aria-hidden="true"></i> </a> <a href="SturegController?id=<%=stureg.getId()%>&op=delete"><i class="fa fa-trash fa-lg" aria-hidden="true"></i></a>
        </td>
          </tr>
        
        <%}%>
            
           
        </table>
   
     
            <br/>
    <span style="float:left"><a href="Sturegshow.jsp?start=<%=start-end%>" class="btn btn-primary <% if(start==0) out.println("disabled");%>">Previous</a></span>
    <center>
    <%
     int pages = total/end + (total%end==0?0:1);
       for(int i=0; i<pages; i++)
       {%>
       <span style="text-decoration: none; align-content: center;  <% if(Math.floor(start/end) == i) out.println("background-color: orange");%>" class="btn btn-dark"><a href="Sturegshow.jsp?start=<%=end*i%>">Page <%=i+1%> </a></span> 
       <%}
        %>
     <span style="float:right"><a href="Sturegshow.jsp?start=<%=start+end%>" class="btn btn-primary <% if(start+end >=total)out.println(" disabled");%> ">NEXT</a></span>
  
    </center> 
    <br/><br/>
    <a href='Stureg.jsp' class="btn btn-primary"><i class="fa fa-plus-square" aria-hidden="true"></i>Add More Record</a>
        
        
        
        

                
</body>
</html>