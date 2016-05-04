<%-- 
    Document   : JobSearch
    Created on : Apr 15, 2016, 11:48:32 PM
    Author     : S525108
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="ojp.png" type="image/x-icon" /> 
        <title>Online Job Portal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link type="text/css" rel="stylesheet" href="home.css">

    </head>
    <body>
        <header>

            <!--------search button------->

            <span id="maincontent">
                <span> <a href="JobSearch.jsp">
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
            <script src="http://code.jquery.com/jquery-latest.min.js"></script>
            <script type='text/javascript'>
                function invokeServlet()
                {
                    // form a URL with the servlet name to be invoked
                    var URL = 'http://localhost:8080/Online_job_portal/JobsAppliedServlet';

                    // This line will inkove a servlet and reload your page
                    location.href = URL;
                }
            </script>
            <!--------search button Java script------->

        </header>
        <div>
            <nav>
                <ul>
                    <li><a class="active" href="JobSearch.jsp">Home</a></li>
                    <li><a href='#' onclick='invokeServlet()'>Applied Jobs</a></li>
                    <li><a href="Consultancies.html">Consultancies</a></li>
                    <li><a href="help.html">Help</a></li>
                    <li><a href="contactus.html">Contact Us</a></li>
                    <li><a href="myProfile.jsp">My Profile</a></li>
                    <li style="float:right" class='right'><a href="#openModal">Log Out</a></li>

                </ul>
            </nav>
            <div id="openModal" class="modalDialog">
                <div>	<a href="#close" title="Close" class="close">X</a>

                    <h2>Confirmation</h2>
                    <p>Are you sure you want to log out?</p>
                    <center><input type="button" value="yes" onclick="location.href = 'Login.jsp'" class="cnf_btn"></center>

                </div>
            </div>


        </div>
        <form action="JobSearchServlet" method="post">
            <table class="homeSearch">
                <tr><td>
                        <label>Job Type</label><br>
                        <select class='job_content_ddb' name="type" id="type">
                            <option value="select">select</option>
                            <option value="Full time">Full time</option>
                            <option value="Part time">Part time</option>
                            <option value="Internship">Internship</option>
                        </select>
                    </td><td>
                        <label>Job Category</label><br>
                        <select class='job_content_ddb' name="category" id="category">
                            <option value="select">select</option>
                            <option value="Accounting">Accounting</option><option value="Banking">Banking</option>
                            <option value="Customer Service">Customer Service</option><option value="Engineering">Engineering</option>
                            <option value="Government">Government</option><option value="Health Care">Health Care</option>
                            <option value="Information Technology">Information Technology</option><option value="Manufacturing">Manufacturing</option>
                            <option value="Sales & Marketing">Sales & Marketing</option><option value="Science & Bio-tech">Science & Bio-tech</option>
                            <option value="Transportation">Transportation</option><option value="Telecommunications">Telecommunications</option>
                            <option value="Teacher">Teacher</option><option value="Warehouse">Warehouse</option>
                        </select>
                    </td><td>
                        <label>Location</label><br>
                        <select class='job_content_ddb' name="location" id="location">
                            <option value="select">select</option>
                            <option value="Alabama">Alabama</option><option value="Alaska">Alaska</option>
                            <option value="Arizona">Arizona</option><option value="Arkansas">Arkansas</option>
                            <option value="California">California</option><option value="Connecticut">Connecticut</option>
                            <option value="Colorado">Colorado</option><option value="Delaware">Delaware</option>
                            <option value="Florida">Florida</option><option value="Georgia">Georgia</option>
                            <option value="Hawaii">Hawaii</option><option value="Idaho">Idaho</option>
                            <option value="Illinois">Illinois</option><option value="Indiana">Indiana</option>
                            <option value="Iowa">Iowa</option><option value="Kansas">Kansas</option>
                            <option value="Kentucky">Kentucky</option><option value="Louisiana">Louisiana</option>
                            <option value="Maine">Maine</option><option value="Maryland">Maryland</option>
                            <option value="Massachusetts">Massachusetts</option><option value="Michigan">Michigan</option>
                            <option value="Minnesota">Minnesota</option><option value="Mississippi">Mississippi</option>
                            <option value="Missouri">Missouri</option><option value="Montana">Montana</option>
                            <option value="Nebraska">Nebraska</option><option value="Nevada">Nevada</option>
                            <option value="New Hampshire">New Hampshire</option><option value="New Jersey">New Jersey</option>
                            <option value="New Mexico">New Mexico</option><option value="New York">New York</option>
                            <option value="North Carolina">North Carolina</option><option value="North Dakota">North Dakota</option>
                            <option value="Ohio">Ohio</option><option value="Oklahoma">Oklahoma</option>
                            <option value="Oregon">Oregon</option><option value="Pennsylvania">Pennsylvania</option>
                            <option value="Rhode Island">Rhode Island</option><option value="South Carolina">South Carolina</option>
                            <option value="South Dakota">South Dakota</option><option value="Tennesse">Tennesse</option>
                            <option value="Texas">Texas</option><option value="Utah">Utah</option>
                            <option value="Vermont">Vermont</option><option value="Virginia">Virginia</option>
                            <option value="Washington">Washington</option><option value="West Virginia">West Virginia</option>
                            <option value="Wisconsin">Wisconsin</option><option value="Wyoming">Wyoming</option>
                        </select>
                    </td><td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" id="submit" value="Search" class="jobSBtn">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
