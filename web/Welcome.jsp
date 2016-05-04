<%-- 
    Document   : Welcome
    Created on : Apr 9, 2016, 3:35:43 PM
    Author     : S525108
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="ojp.png" type="image/x-icon" /> 
        <title>Online Job Portal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link type="text/css" rel="stylesheet" href="welcome.css">
    </head>
    <body>

        <header>

            <!--------search button------->

            <span id="maincontent">
                <span> <a href="Login.jsp">
                        <img src="ojp.png" alt="logo" class='logo' width="72" height="55">
                    </a>
                    <span class='title' > Online Job Portal </span>

                    <button type="button" value="Search"  id="Sbutton">Search</button>
                </span>
                <input type="text" name="search" class='search' placeholder="search"> </span>

            <span id="overlay"></span>
            <span id="popup">

                <span class="popupcontent"><br><br>
                    <span class="popupcontent_text">

                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <strong>SORRY! </strong><br><br>
                        &nbsp;&nbsp; Search option is not available right now</span>
                    <br><br>
                    <img src="Coming-Soon.png" alt="logo" class='logo' width="500" height="250">
                </span>
                <span class="popupcontrols">
                    <span id="popupclose"><input type="button" value="close search" class="popClose"></span>
                </span>
            </span>

            <!--------search button------->


            <!--------search button Java script------->
            <script type="text/javascript">

                // Initialize Variables
                var closePopup = document.getElementById("popupclose");
                var overlay = document.getElementById("overlay");
                var popup = document.getElementById("popup");
                var Sbutton = document.getElementById("Sbutton");
                // Close Popup Event
                closePopup.onclick = function () {
                    overlay.style.display = 'none';
                    popup.style.display = 'none';
                };
                // Show Overlay and Popup
                Sbutton.onclick = function () {
                    overlay.style.display = 'block';
                    popup.style.display = 'block';
                }
            </script>
            <!--------search button Java script------->

        </header>

        <nav>
            <ul class="topnav">
                <li><a class="active" href="Login.jsp">Home</a></li>
                <li><a href="contactus_welcome.html">Contact Us</a></li>
                <li><a href="aboutus_welcome.html">About Us</a></li>
                <li><a href="Help_welcome.html">Help</a></li>
                <li style="float:right" class='right'><a href="Registration.jsp">Sign Up</a></li>
                <li style="float:right" class='right'><a href="Login.jsp">Log In</a></li>

            </ul>
        </nav>
        <section>
            <div class='section1'>

                <img src="jobsearch.jpg" alt="welcome_image" class='welcome_image' width="800" height="520">

            </div>
        </section>
        <aside>
            <form action="LoginServlet" method="post">
                <div class='aside1'>
                    <center>
                        <table>
                            <tr>
                                <td><label class='home_lables'>Email-Id:</label>  </td>              
                                <td><input type="text" class='login_txtbox' name="username" placeholder="Enter email id" id="username" required/>
                                </td>
                            <br><br><br><br><br><br><br>
                            </tr>
                            <tr>
                                <td><br><label class='home_lables'>Password:</label></td>
                                <td><br><input type="password" class='login_txtbox' name="password" placeholder="Enter password" id="password" required/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <br><input type="submit" id="submit" value="Log In" class="loginBtn">
                                <td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    &nbsp;<br><br><a href="reset_password.html" style=" font-family: calibri">Forgot password?</a>
                                <td>
                            </tr>
                        </table>


                    </center>
                </div>
            </form>
        </aside>

    </body>
</html>