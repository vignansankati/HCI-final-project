<%-- 
    Document   : Welcome
    Created on : Apr 9, 2016, 3:35:43 PM
    Author     : S525108
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript">
            function check() {
                document.getElementById("login").onclick = function () {
                    location.href = "Login.jsp";
                };
                document.getElementById("Signup").onclick = function () {
                    location.href = "Registration.jsp";
                };
            }
        </script>
    </head>
    <body onload="check()">
        <h1 align="center">Login</h1>
        <form action="LoginServlet">
            <table align="center">
                <tr>
                    <td>
                        Login  
                    </td>
                    <td>
                        <input type="button" id="login" value="Login" >

                    </td>
                </tr>
                <tr>
                    <td>
                        Signup  
                    </td>
                    <td>
                        <input type="button" id="Signup" value="Signup">
                    </td>
                </tr>

            </table>
        </form>
    </body>
</html>
