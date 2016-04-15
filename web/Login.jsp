<%-- 
    Document   : Login
    Created on : Apr 7, 2016, 12:21:07 AM
    Author     : S525108
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1 align="center">Login</h1>
        <form action="LoginServlet" method="post">
            <table align="center">
                <tr>
                    <td>
                        username  
                    </td>
                    <td>
                        <input type="text" id ="username" name="username">
                    </td>
                </tr>
                <tr>
                    <td>
                        password  
                    </td>
                    <td>
                        <input type="text" id="password" name="password">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" id="submit" value="Login">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
