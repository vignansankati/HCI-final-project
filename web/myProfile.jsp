<%-- 
    Document   : myProfile
    Created on : Apr 16, 2016, 6:09:46 PM
    Author     : S525108
--%>

<%@page import="login.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="ojp.png" type="image/x-icon" /> 
        <title>Online Job Portal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="updatevalidation.js" type="text/javascript"></script>
        <link type="text/css" rel="stylesheet" href="welcome.css">

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
            <!--------search button Java script------->

        </header>
        <script type='text/javascript'>
            function invokeServlet()
            {
                // form a URL with the servlet name to be invoked
                var URL = 'http://localhost:8080/Online_job_portal/JobsAppliedServlet';

                // This line will inkove a servlet and reload your page
                location.href = URL;
            }
        </script>
        <nav>
            <ul>
                <li><a href="JobSearch.jsp">Home</a></li>
                <li><a href='#' onclick='invokeServlet()'>Applied Jobs</a></li>
                <li><a href="Consultancies.html">Consultancy</a></li>
                <li><a href="help.html">Help</a></li>
                <li><a href="contactus.html">Contact Us</a></li>
                <li><a class="active" href="myProfile.jsp">My Profile</a></li>
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



        <form>
            <fieldset>
                <center>
                    <%
                        ArrayList<User> specialList = (ArrayList<User>) session.getAttribute("myProfile");
//                System.out.println("Category in search 1 " + specialList.get(0).getJobCategory());
                        if (specialList.size() > 0) {
                    %>
                    <%
                        for (User spl : specialList) {
                            String phone = String.valueOf(spl.getPhonenumber());
                    %>
                    <table class='update_content'>
                        <tr>
                            <td>
                                <h3>Update Resume</h3>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Email Id:
                            </td>
                            <td>
                                <input type="text" name="emailid" placeholder="email id" class='update_txtbox' id="emailid" value="<%=spl.getEmailid()%>" readonly="true" disabled="true"><br>
                            </td>

                        </tr>


                        <tr>
                            <td>
                                <br> Mobile Number:
                            </td>
                            <td><br>
                                <input type="text" name="mob1" maxlength="3" size="3" placeholder="xxx" class='update_txtbox' id="mob1" value="<%=phone.substring(0, 3)%>" readonly="true" disabled="true"> - 
                                <input type="text" name="mob2" maxlength="3" size="3" placeholder="xxx" class='update_txtbox' id="mob2" value="<%=phone.substring(3, 6)%>" readonly="true" disabled="true"> - 
                                <input type="text" name="mob3" maxlength="4" size="4" placeholder="xxxx" class='update_txtbox' id="mob3" value="<%=phone.substring(6)%>" readonly="true" disabled="true"><br>
                            </td>
                        </tr>

                        <tr>
                            <td><br>
                                Security Question#1: 
                            </td>
                            <td><br>
                                <select class="update_content_ddb" id="secQuestion1" required>
                                    <option value="">Select</option>
                                    <option value="q1.1">What is the name of the place where you born?</option>
                                    <option value="q1.2">What was the name of your elementary / primary school?</option>
                                    <option value="q1.3">What is your pet’s name?</option>
                                    <option value="q1.4">What is your favorite color?</option>
                                </select><br>
                            </td>
                        </tr>
                        <tr>
                            <td><br>
                                Security Answer#1: 
                            </td>
                            <td><br>
                                <input type="text" name="secAnswer1" placeholder="answer" class='update_txtbox' id="secAnswer1" required><br>
                            </td>
                        </tr>
                        <tr>
                            <td><br>

                                Security Question#2: 
                            </td>
                            <td><br>
                                <select class='update_content_ddb' required>
                                    <option value="">Select</option>
                                    <option value="q2.1">What is the name of dream company?</option>
                                    <option value="q2.2">What was the name of your High school?</option>
                                    <option value="q2.3">What is your pet name?</option>
                                    <option value="q2.4">What is your favorite animal?</option>
                                </select><br>
                            </td>
                        </tr>
                        <tr>
                            <td><br>
                                Security Answer#2: 
                            </td>
                            <td><br>
                                <input type="text" name="secAnswer2" placeholder="answer" class='update_txtbox' id="secAnswer2" required><br>
                            </td>
                        </tr>

                        <tr>
                            <td><br>
                                Resume Upload: </td>
                            <td><br><input type="file" id="resume" class="resumeBtn" name="resume" size="200" required/></td>
                            <td>
                                <br>


                                <br>
                            </td>
                        </tr>

                        <tr>
                            <td><br>
                                Cover Letter Upload: </td>
                            <td><br><input type="file" id="resume" class="resumeBtn" name="resume" size="200"  required/></td>
                        <br>


                        <br>
                        </td>
                        </tr>
                        <%
                                }
                            }%>

                    </table>

                </center>
                <center>
<br>
                    <input type="button" value="Update" class='upload_btn' onclick="return updateProfile()" id="updt_Btn">
                </center>  

            </fieldset>
        </form>

    </body>
</html>