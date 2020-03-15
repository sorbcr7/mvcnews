<%-- 
    Document   : home
    Created on : 19-Feb-2020, 10:54:25
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*;"%>
<jsp:include page="base.jsp"></jsp:include>
    <!DOCTYPE html>
    <html lang="en">

        <head>

            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">

            <title>GIST News - be updated</title>
            <link rel="icon" href="assets/images/rockets.png" type="image/x-icon"/>
            <!-- Bootstrap core CSS -->
        <jsp:include page="base.jsp"></jsp:include>

            <!-- Custom styles for this template -->
            <link href="assets/css/shop-homepage.css" rel="stylesheet">

        </head>

        <body>

            <!-- Navigation -->
        <jsp:include page="nav.jsp"></jsp:include>

            <!-- Page Content -->
            <div class="container">

                <div class="row">

                <jsp:include page="sidebar.jsp"></jsp:include>
                    <!-- /.col-lg-3 -->

                    <div class="col-lg-9">
                    <jsp:include page="crousel.jsp"></jsp:include>


                        <div class="row" id="livenews">

                        <%
                            int cat_id = request.getParameter("cat_id") != null ? Integer.parseInt(request.getParameter("cat_id")) : 0;

                            Connection con = null;
                            PreparedStatement smt = null;

                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trainingbatch1", "root", "");

                                String sql = "";
                                if (cat_id == 0) {
                                    sql = "select * from news order by id desc";
                                    smt = con.prepareStatement(sql);
                                } else {
                                    sql = " select * from news where id in (select news_id from newstype where cat_id=?)";
                                    smt = con.prepareStatement(sql);
                                    smt.setInt(1, cat_id);
                                }
                                ResultSet rs = smt.executeQuery();
                                while (rs.next()) {%>

                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="#"><img class="card-img-top" src="<%=rs.getString("image")%>"  alt=""></a>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="#"><%=rs.getString("title")%></a>
                                    </h4>

                                    <%
                                        String description = rs.getString("description");
                                        if (description.length() > 100) {
                                            description = description.substring(0, 100);
                                        }
                                    %>

                                    <p class="card-text"> <%=description%> </p>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted"> <a href="detailnews.jsp?id=<%=rs.getString("id")%>" class="btn btn-primary"> View More </a>
                                    </small>
                                </div>
                            </div>
                        </div>
                        <%}
                            } catch (Exception e) {
                                System.out.println("Error -> " + e.getMessage());
                            } finally {
                                con.close();
                                smt.close();
                            }
                        %>





                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Bootstrap core JavaScript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script>
            $(document).ready(function () {


                $("#search").click(function () {
                    $("#livenews").html("");
                    $.get("http://newsapi.org/v2/everything?q=" + $("#keyword").val() + "&from=2020-03-03&to=2020-03-03&sortBy=popularity&apiKey=1ddf8e8ce40b46c0b2d99f02215351c9", function (responseText) {
                        news = responseText;
                        articals = news['articles'];
                        for ( i = 0; i < articals.length; i++) {
                            article = '<div class="col-lg-4 col-md-6 mb-4">\
                            <div class="card h-100">\
                                <a href="#"><img class="card-img-top" src="' + articals[i].urlToImage + '"  alt=""></a>\
                                <div class="card-body">\
                                    <h4 class="card-title">\
                                        <a href="#">' + articals[i].title + '</a>\
                                    </h4>\
\
                                    <p class="card-text"> ' + articals[i].description + ' </p>\
                                </div>\
                                <div class="card-footer">\
                                    <small class="text-muted"> <a href="' + articals[i].url + '" class="btn btn-primary"> View More </a>\
                            </small>\
                                </div>\
                            </div>\
                        </div>';
                            $("#livenews").append(article);
                        }


                    });
                });

            });
        </script>


    </body>

</html>