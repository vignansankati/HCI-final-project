<%-- 
    Document   : Registration
    Created on : Apr 8, 2016, 4:31:51 PM
    Author     : S525108
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <link rel="shortcut icon" href="ojp.png" type="image/x-icon" /> 
        <title>Online Job Portal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel="stylesheet" href="welcome.css">
        <script type="text/javascript" src="registration.js"></script>
    </head>
    <body>
        <header>

            <!--------search button------->

            <span id="maincontent">
                <span> <a href="welcome.html">
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
                <li><a  href="Welcome.jsp">Home</a></li>
                <li><a href="contactus_welcome.html">Contact us</a></li>
                <li><a href="aboutus_welcome.html">About us</a></li>
                <li><a href="Help_welcome.html">Help</a></li>
                <li class="active" style="float:right"><a href="Registration.jsp">Signup</a></li>
                <li style="float:right"><a href="Welcome.jsp">Login</a></li>

            </ul>
        </nav>

        <h1 class='reg_title'>Registration form </h1>

        <form action="RegistrationServlet" method="post" enctype="multipart/form-data">
            <fieldset>
                <center>  
                    <table class='reg_content'>
                        <tr>
                            <td>
                                <h3><span class="req">*</span>Required fields to be filled</h3>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="req">*</span>Name:
                            </td>
                            <td>
                                <input type="text" name="firstname" placeholder="first name" class='reg_txtbox' id="firstname" required> &nbsp; 
                                <input type="text" name="lastname" placeholder="last name" class='reg_txtbox' id="lastname"><br>

                            </td>
                        </tr>
                        <tr>
                            <td><br>
                                <span class="req">*</span>Email_Id:
                            </td>
                            <td><br>
                                <input type="text" name="emailid" placeholder="email id" class='reg_txtbox' id="emailid"><br>
                            </td>
                        </tr>
                        <tr>
                            <td><br>
                                <span class="req">*</span>Password: 
                            </td>
                            <td><br>
                                <span class="tooltip">
                                    <input type="text" name="password" placeholder="password" class='reg_txtbox' id="password">
                                    <span class="tooltiptext">Password must be between 6 to 10 characters</span>
                                </span>
                                <br>
                            </td>
                        </tr>
                        <tr>
                            <td><br>
                                <span class="req">*</span>Re-enter Password:
                            </td>
                            <td><br>
                                <input type="text" name="reenter_password" placeholder="re-enter password" class='reg_txtbox' id="repassword"><br>
                            </td>
                        </tr>
                        <tr>
                            <td><br>
                                &nbsp;&nbsp;Mobile Number:
                            </td>
                            <td><br>
                                <input type="text" name="mob1" maxlength="3" size="3" placeholder="xxx" class='reg_txtbox' id="mob1"> - 
                                <input type="text" name="mob2" maxlength="3" size="3" placeholder="xxx" class='reg_txtbox' id="mob2"> - 
                                <input type="text" name="mob3" maxlength="4" size="4" placeholder="xxxx" class='reg_txtbox' id="mob3"><br>
                            </td>
                        </tr>

                        <tr>
                            <td><br>
                                <span class="req">*</span>Security Question#1: 
                            </td>
                            <td><br>
                                <select class='reg_content_ddb' name="security1" id="security1">
                                    <option value="Select">Select</option>
                                    <option value="What is the name of the place where you born?">What is the name of the place where you born?</option>
                                    <option value="What was the name of your elementary / primary school?">What was the name of your elementary / primary school?</option>
                                    <option value="What is your pet’s name?">What is your pet’s name?</option>
                                    <option value="What is your favorite color?">What is your favorite color?</option>
                                </select><br>
                            </td>
                        </tr>
                        <tr>
                            <td><br>
                                <span class="req">*</span>Security Answer#1: 
                            </td>
                            <td><br>
                                <input type="text" name="secAnswer1" placeholder="answer" class='reg_txtbox' id="secAnswer1"><br>
                            </td>
                        </tr>
                        <tr>
                            <td><br>
                                <span class="req">*</span>Security Question#2: 
                            </td>
                            <td><br>
                                <select class='reg_content_ddb' name="security2" id="security2">
                                    <option value="Select">Select</option>
                                    <option value="What is the name of the place where you born?">What is the name of the place where you born?</option>
                                    <option value="What was the name of your elementary / primary school?">What was the name of your elementary / primary school?</option>
                                    <option value="What is your pet’s name?">What is your pet’s name?</option>
                                    <option value="What is your favorite color?">What is your favorite color?</option>
                                </select><br>
                            </td>
                        </tr>
                        <tr>
                            <td><br>
                                <span class="req">*</span>Security Answer#2: 
                            </td>
                            <td><br>
                                <input type="text" name="secAnswer2" placeholder="answer" class='reg_txtbox' id="secAnswer2"><br>
                            </td>
                        </tr>
                        <tr>
                            <td><br>
                                <span class="req">*</span>Student type:
                            </td>
                            <td><br>
                                <input type="radio" name="studentType" value="international" class='reg_content'>International
                                <input type="radio" name="studentType" value="national" class='reg_content'>National<br>
                            </td>
                        </tr>
                        <tr>
                            <td><br>
                                <span class="req">*</span>Resume Upload: </td>
                            <td><input type="file" id="resume" name="resume" size="50"/></td>
                            <td>

                            <td>
                                <br><br><br>

                            </td>
                        </tr>
                        <br><br>
                    </table>
                </center>  

                <center>
                    <input type="reset" value="Reset" class='reg_btn'> &nbsp; &nbsp;
                    <input type="submit" value="Sign up" class='reg_btn' id="reg_Btn">
                </center>  

            </fieldset>
        </form>
    </body>
</html>
