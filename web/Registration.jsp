<%-- 
    Document   : Registration
    Created on : Apr 8, 2016, 4:31:51 PM
    Author     : S525108
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel="stylesheet" href="regcss.css">
    </head>
    <body>

        <h1>Registration form </h1>

        <form action="RegistrationServlet" method="post">

            <table align="center">
                <tr><td>
                        <h3>*Required fields to be filled</h3>
                    </td></tr>
                <tr><td>
                        *Name:
                        <input type="text" name="firstname" id="firstname" placeholder="first name"> &nbsp; 
                        <input type="text" name="lastname" id="lastname" placeholder="last name"><br><br> </td>
                </tr>
                <tr><td>
                        *Email_Id: <input type="text" name="emailid" id="emailid" placeholder="email id"><br><br>
                    </td></tr>
                <tr><td>
                        *Password:  <input type="text" name="password" id="password" placeholder="password"><br><br>
                    </td></tr>
                <tr><td>
                        *Re-enter Password: <input type="text" name="reenter_password" placeholder="re-enter password"><br><br>
                    </td></tr>
                <tr><td>
                        *Mobile Number: <input type="text" name="mob1" maxlength="3" size="3" id="mob1" placeholder="xxx"> - 
                        <input type="text" name="mob2" maxlength="3" size="3" id="mob2" placeholder="xxx"> - 
                        <input type="text" name="mob3" maxlength="4" size="4" id="mob3" placeholder="xxxx"><br><br>
                    </td></tr>
                <tr><td>
                        *Security Question#1: 
                        <select name="security1" id="security1">
                            <option value="Select">Select</option>
                            <option value="What is the name of the place where you born?">What is the name of the place where you born?</option>
                            <option value="What was the name of your elementary / primary school?">What was the name of your elementary / primary school?</option>
                            <option value="What is your pet’s name?">What is your pet’s name?</option>
                            <option value="What is your favorite color?">What is your favorite color?</option>
                        </select><br><br>
                    </td></tr>
                <tr><td>
                        *Security Answer#1: <input type="text" name="secAnswer1" id="secAnswer1" placeholder="answer"><br><br>
                    </td></tr>
                <tr><td>
                        *Security Question#2: 
                        <select name="security2" id="security2">
                            <option value="Select">Select</option>
                            <option value="What is the name of the place where you born?">What is the name of the place where you born?</option>
                            <option value="What was the name of your elementary / primary school?">What was the name of your elementary / primary school?</option>
                            <option value="What is your pet’s name?">What is your pet’s name?</option>
                            <option value="What is your favorite color?">What is your favorite color?</option>
                        </select><br><br>
                    </td></tr>
                <tr><td>
                        *Security Answer#2: <input type="text" name="secAnswer2" id="secAnswer2" placeholder="answer"><br><br>
                    </td></tr>
                <tr><td>
                        *Student type:
                        <input type="radio" name="studentType" value="international">International
                        <input type="radio" name="studentType" value="national">National<br><br>
                    </td></tr>
                <tr><td>
                        *Resume Upload:  <br><br>
                <tr><td>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        <input type="reset" value="Reset"> &nbsp; &nbsp;
                        <input type="submit" value="Submit" >
                    </td></tr>
            </table>
        </form>
    </body>
</html>
