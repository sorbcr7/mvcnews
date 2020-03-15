<%-- 
    Document   : nav
    Created on : 17 Feb, 2020, 4:32:29 PM
    Author     : Lenovo
--%>


  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#"> <img src="assets/images/rockets.png" align="left" height="25" width="30">&nbsp;
      <a class="navbar-brand" href="#">Gist news</a>
       <ul class="navbar-nav ml-auto">
           
               <input type="text" id="keyword" class="form-control" placeholder="enter keyword to search">
               <i class="fa fa-search btn btn-primary" id="search"></i>
           
       </ul>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item <% if(request.getRequestURI().contains("home.jsp")) out.println(" active ");%>">
            <a class="nav-link" href="home.jsp"><i class="fa fa-home"></i>Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item<% if(request.getRequestURI().contains("aboutus.jsp")) out.println(" active ");%>">
            <a class="nav-link" href="aboutus.jsp"><i class="fa fa-vcard"></i>About</a>
          </li>
          <li class="nav-item<% if(request.getRequestURI().contains("services.jsp")) out.println(" active ");%>">
            <a class="nav-link" href="services.jsp"><i class="fa fa-server"></i>Services</a>
          </li>
          <li class="nav-item<% if(request.getRequestURI().contains("contactus.jsp")) out.println(" active ");%>">
            <a class="nav-link" href="contactus.jsp"><i class="fa fa-map-marker"></i>Contact</a>
          </li>
          <li class="nav-item<% if(request.getRequestURI().contains("login.jsp")) out.println(" active ");%>">
              <a class="nav-link" href="login.jsp"><i class="fa fa-user"></i>login</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>