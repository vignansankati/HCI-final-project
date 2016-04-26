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

        <link type="text/css" rel="stylesheet" href="welcome.css">

    </head>
    <body>
        <header>

            <!--------search button------->

            <span id="maincontent">
                <span> <a href="home.html">
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
            <ul>
                <li><a href="JobSearch.jsp">Home</a></li>
                <li><a href="appliedjobs.jsp">Applied Jobs</a></li>
                <li><a href="Consultancies.html">Consultancy</a></li>
                <li><a href="help.html">Help</a></li>
                <li><a href="contactus.html">Contact us</a></li>
                <li><a class="active" href="myProfile.jsp">My profile</a></li>
                <li style="float:right" class='right'><a href="Welcome.jsp">Logout</a></li>

            </ul>
        </nav>



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
                                <input type="text" name="emailid" placeholder="email id" class='update_txtbox' id="emailid" value="<%=spl.getEmailid()%>" readonly="true"><br>
                            </td>

                        </tr>


                        <tr>
                            <td>
                                <br> Mobile Number:
                            </td>
                            <td><br>
                                <input type="text" name="mob1" maxlength="3" size="3" placeholder="xxx" class='update_txtbox' id="mob1"> - 
                                <input type="text" name="mob2" maxlength="3" size="3" placeholder="xxx" class='update_txtbox' id="mob2"> - 
                                <input type="text" name="mob3" maxlength="4" size="4" placeholder="xxxx" class='update_txtbox' id="mob3"><br>
                            </td>
                        </tr>

                        <tr>
                            <td><br>
                                Security Question#1: 
                            </td>
                            <td><br>
                                <select class='update_content_ddb'>
                                    <option value="q1.0">Select</option>
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
                                <input type="text" name="secAnswer1" placeholder="answer" class='update_txtbox' id="secAnswer1"><br>
                            </td>
                        </tr>
                        <tr>
                            <td><br>

                                Security Question#2: 
                            </td>
                            <td><br>
                                <select class='update_content_ddb'>
                                    <option value="q2.0">Select</option>
                                    <option value="q2.1">What is the name of the place where you born?</option>
                                    <option value="q2.2">What was the name of your elementary / primary school?</option>
                                    <option value="q2.3">What is your pet’s name?</option>
                                    <option value="q2.4">What is your favorite color?</option>
                                </select><br>
                            </td>
                        </tr>
                        <tr>
                            <td><br>
                                Security Answer#2: 
                            </td>
                            <td><br>
                                <input type="text" name="secAnswer2" placeholder="answer" class='update_txtbox' id="secAnswer2"><br>
                            </td>
                        </tr>

                        <tr>
                            <td><br>
                                Resume Upload: </td>
                            <td><%=spl.getResume()%></td>
                            <td>
                                <br>


                                <br>
                            </td>
                        </tr>

                        <tr>
                            <td><br>
                                Cover Letter Upload: </td>
                            <td>
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

                    <input type="button" value="Update" class='upload_btn' id="updt_Btn">
                </center>  

            </fieldset>
        </form>

    </body>
</html>