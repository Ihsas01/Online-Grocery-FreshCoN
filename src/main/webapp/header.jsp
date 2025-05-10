<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Finger+Paint&display=swap');

        * {
            margin: 0;
            padding: 0;
            font-family: 'poppins', sans-serif;
            box-sizing: border-box;
        }

        .logo {
            font-family: 'Finger Paint', cursive;
        }

        body {
            background-color: #f5f5f5;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: white;
            border-bottom: 1px solid #e0e0e0;
        }

        .freshco {
            display: flex;
            align-items: center;
        }

        .freshco span {
            font-size: 18px;
            font-weight: bold;
            
        }
        .fresh {
            color: green;
        }

        .co {
            color: rgb(239, 185, 6);
        }

        .nav-links {
            display: flex;
            list-style: none;
        }

        .nav-links li {
            margin: 0 15px;
        }

        .nav-links a {
            text-decoration: none;
            font-size: 14px;
            color: black;
            padding: 10px 0;
            transition: color 0.3s;
        }

        .nav-links a:hover,
        .nav-links a.main-active {
            color: #0c0000;
            border-bottom: 2px solid #0ded2b;
        }

        .buttons {
            position: relative;
            display: flex;
            align-items: center;
            margin-left: 60%;
        }

        .user-pic {
            width: 30px;
            border-radius: 50%;
            cursor: pointer;
        }

        .sub-menu-wrap {
            display: none;
            position: absolute;
            top: 100%;
            right: 0;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 200px;
        }

        .sub-menu-wrap.active {
            display: block;
        }

        .sub-menu {
            padding: 10px;
        }

        .sub-menu ul {
            list-style: none;
        }

        .sub-menu ul li {
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .sub-menu ul li a {
            text-decoration: none;
            color: black;
            font-size: 14px;
        }

        .sub-menu ul li a:hover {
            color: #0ded2b;
        }

        .cart-icon {
            cursor: pointer;
        }
    </style>
</head>

<body>
    <header>
        <nav class="navbar">
            <div class="freshco">
                <span class="fresh">Fresh</span><span class="co">Co</span>
            </div>
            <ul class="nav-links">
                <li><a href="FreshCo">Home</a></li>
                <li><a href="aboutUs.jsp">About Us</a></li>
                <li><a href="Shop">Shop</a></li>
                <li><a href="FreshCo#contactUS">Contact Us</a></li>
            </ul>

            <div class="buttons">
                <%
                    HttpSession sessH = request.getSession(false); // Get the session 
                    String userTypo = (String) sessH.getAttribute("userType"); // Get userType
                    if (userTypo == null || userTypo.equals("guest")) {
                %>
                    <img src="./image/user.png" class="user-pic" alt="User Profile">
                    <div class="sub-menu-wrap">
                        <div class="sub-menu">
                            <ul>
                                <li><a href="login.jsp">Login</a><i class='bx bx-chevron-right'></i></li>
                            </ul>
                        </div>
                    </div>
                <%
                    } else {
                %>
                    <img src="<%= (String) session.getAttribute("imgUrl") %>" class="user-pic" alt="User Profile">
                    <div class="sub-menu-wrap">
                        <div class="sub-menu">
                            <ul>
                            	<li><a href="dashboard.jsp">Dashboard</a><i class='bx bx-chevron-right'></i></li>
                                <li><a href="EditProfile.jsp">Edit Profile</a><i class='bx bx-chevron-right'></i></li>
                                <li><a href="logout">Logout</a><i class='bx bx-chevron-right'></i></li>
                            </ul>
                        </div>
                    </div>
                <%
                    }
                %>
            </div>

            <div class="cart-icon" onclick="window.location.href='ViewCart'">
                <i class="fas fa-shopping-cart"></i>
            </div>

        </nav>
    </header>

    <script>
        const userPic = document.querySelector('.user-pic');
        const subMenuWrap = document.querySelector('.sub-menu-wrap');

        userPic.addEventListener('click', function() {
            subMenuWrap.classList.toggle('active');
        });

        document.addEventListener('click', function(event) {
            if (!userPic.contains(event.target) && !subMenuWrap.contains(event.target)) {
                subMenuWrap.classList.remove('active');
            }
        });
    </script>
</body>

</html>
