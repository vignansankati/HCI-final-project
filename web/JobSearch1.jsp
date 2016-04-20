<%-- 
    Document   : JobSearch
    Created on : Apr 15, 2016, 11:48:32 PM
    Author     : S525108
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="login.Job"%>
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
        <div>
            <nav>
                <ul>
                    <li><a class="active" href="JobSearch.jsp">Home</a></li>
                    <li><a href="appliedjobs.jsp">Applied Jobs</a></li>
                    <li><a href="Consultancies.html">Consultancies</a></li>
                    <li><a href="help.html">Help</a></li>
                    <li><a href="contactus.html">Contact us</a></li>
                    <li><a href="myProfile.jsp">My profile</a></li>
                    <li style="float:right" class='right'><a href="Welcome.jsp">Logout</a></li>

                </ul>
            </nav>

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
                            <option value="Arizona">Arizona</option><option value="s4">Arkansas</option>
                            <option value="California">California</option><option value="s6">Connecticut</option>
                            <option value="s7">Colorado</option><option value="s8">Delaware</option>
                            <option value="s9">Florida</option><option value="s10">Georgia</option>
                            <option value="s11">Hawaii</option><option value="s12">Idaho</option>
                            <option value="s13">Illinois</option><option value="s14">Indiana</option>
                            <option value="Iowa">Iowa</option><option value="s16">Kansas</option>
                            <option value="s17">Kentucky</option><option value="s18">Louisiana</option>
                            <option value="s19">Maine</option><option value="s20">Maryland</option>
                            <option value="s21">Massachusetts</option><option value="s22">Michigan</option>
                            <option value="s23">Minnesota</option><option value="s24">Mississippi</option>
                            <option value="s25">Missouri</option><option value="s26">Montana</option>
                            <option value="s27">Nebraska</option><option value="s28">Nevada</option>
                            <option value="s29">New Hampshire</option><option value="s30">New Jersey</option>
                            <option value="s31">New Mexico</option><option value="s32">New York</option>
                            <option value="s33">North Carolina</option><option value="s34">North Dakota</option>
                            <option value="s35">Ohio</option><option value="s36">Oklahoma</option>
                            <option value="s37">Oregon</option><option value="s38">Pennsylvania</option>
                            <option value="s39">Rhode Island</option><option value="s40">South Carolina</option>
                            <option value="s41">South Dakota</option><option value="s42">Tennesse</option>
                            <option value="s43">Texas</option><option value="s44">Utah</option>
                            <option value="s45">Vermont</option><option value="s46">Virginia</option>
                            <option value="s47">Washington</option><option value="s48">West Virginia</option>
                            <option value="s49">Wisconsin</option><option value="s50">Wyoming</option>
                        </select>
                    </td><td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" id="submit" value="Search">
                    </td>
                </tr>
            </table>

            <table class="table2">
                <tr>
                    <th>Job ID</th>
                    <th>Job Title</th>   
                    <th>Description</th>  
                    <th>Posted Date</th>
                    <th>Last Date</th>
                    <th>Apply</th>
                </tr>
                <%
                    ArrayList<Job> specialList = (ArrayList<Job>) request.getAttribute("jobList");
                    System.out.println("Category in search 1 " + specialList.get(0).getJobCategory());
                    int numberOfJobs = (int) request.getAttribute("jobCount");
                    if (numberOfJobs > 0) {
                %>
                <%
                    for (Job spl : specialList) {
                %>
                <tr>
                    <td><%=spl.getJobId()%></td>
                    <td><%=spl.getJobTitle()%></td>
                    <td><%=spl.getJobDescription()%></td>
                    <td><%=spl.getPostingDate()%></td>
                    <td><%=spl.getLastDate()%></td>
                    <td>Apply</td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </form>
    </body>
</html>
