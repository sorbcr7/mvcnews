<%-- 
    Document   : shownews
    Created on : 02-Feb-2020, 15:32:22
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>top news</title>
        <jsp:include page="base.jsp"></jsp:include>

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

            <script type="text/javascript">
             <%--
                    function loadNews(x, y) {

                    ajax = new XMLHttpRequest();
                    ajax.open("GET", "AjaxServlet?op=searchnews&id=" + x, true);
                    ajax.send();

                    ajax.onreadystatechange = function () {

                        if (this.readyState == 4 && this.status == 200) {
                            y.innerHTML = this.responseText;
                        }

                    };
                }

        --%>
                function submitForm() {
                    document.getElementById("form1").submit();
                }
            </script>
        </head>
        <body>
        <%
              String cat_id = request.getParameter("cat_id");
              if (cat_id==null)
                cat_id="-1";
                     
            %>
            <form id="form1" method="get">
                <div class="container">
                    <div class="row">
                        <select onchange="submitForm();" name="cat_id" id="cat_id" class="dropdown dropdown-header form-control">
                            <option value="-1">Select news Category </option>
                        <%
                            try {

                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trainingbatch1", "root", "");
                                String sql = "select * from news_category";
                                PreparedStatement smt = con.prepareStatement(sql);
                                ResultSet rs = smt.executeQuery();
                                  int i = 1;
                                  while (rs.next()) {%>
                                  <option value="<%=rs.getString("cat_id")%>" <%if(cat_id.equals(rs.getString("cat_id"))) out.println("selected");%>> <%=rs.getString("name")%> </option>
                        <br/>
                        <%}
                                con.close();
                            } catch (Exception e) {
                                System.out.println("Error " + e.getMessage());
                            }
                        %>
                    </select>

                    <br/>
                    <br/>

                    <!-- COde for Loading the News -->                 

                    <%
                         String sql = "";

                        try {

                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trainingbatch1", "root", "");
                            PreparedStatement smt=null;
                            
                            if (cat_id == null || cat_id.equals("") || cat_id.equals("-1")) {
                                  sql = "select * from news";
                                  smt = con.prepareStatement(sql);
                            } 
                            else {
                                sql = "select * from news where id in (select news_id from newstype where cat_id=?)";
                                 smt = con.prepareStatement(sql);
                                 smt.setString(1,cat_id);
                            }
                           

                            
                            ResultSet rs = smt.executeQuery();
                            int i = 1;
                            while (rs.next()) {%>


                    <div class="card col col-md-4" style="width:400px">
                        <h2><%=i++%></h2>
                        <img class="card-img-top" src="../Media/<%=rs.getString("image")%>" alt="Card image" style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title"> <%=rs.getString("title")%> </h4>
                            <% String news = rs.getString("description").trim();%>
                            <p class="card-text"> <%= news.length() > 100 ? news.substring(0, 100) : news%> ... </p>
                           <%-- <button onclick="loadNews('<%=rs.getString("id")%>', newspara);" class="btn btn-primary" data-toggle="modal" data-target="#myModal" > view Detailed news</button>
                           --%>  <br/>
                           <a href="detailnews.jsp?id=<%=rs.getString("id")%>" class ="btn btn-primary" >View Detailed News </a>
                            <a href="editNews.jsp?id=<%=rs.getString("id")%>"><i class="fa fa-pencil" aria-hidden="true"></i></a> 
                            <a href="NewsController?id=<%=rs.getString("id")%>&op=delete"> <i class="fa fa-trash" aria-hidden="true"></i> </a>

                        </div>
                    </div>

                    <%  System.out.println(rs.getString("title") + "<br/>");
                            }
                            con.close();
                        } catch (Exception e) {
                            System.out.println("Error :" + e.getMessage());
                        }
                    %>
                </div>
            </div>


            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                        </div>
                        <div class="modal-body">
                            <p id="newspara">

                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>         

        </form>
    </body>
</html>