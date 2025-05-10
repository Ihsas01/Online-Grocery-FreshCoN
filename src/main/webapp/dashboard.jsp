<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fresh Co</title>

        <style>
           
            
        
        /* Container for the entire dashboard */
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        /* Title section at the top */
        .title-section {
            
            margin-bottom: 20px;
        }
        .title-section h1 {
            font-size: 46px;
            color: #333;
        }
        /* Dashboard cards in a row */
        .dashboard {
            display: flex;
            justify-content: space-between;
            gap: 30px;
        }
        .card {
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            height:150px;
           
            padding: 20px;
            text-align: center;
            position: relative;
            color: #333;
        }
        .card h2 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }
        .clock :hover{
            transform: scale(1.1);
            transition: all ease 0.1s;
        }
         .calendar :hover{
            transform: scale(1.1);
            transition: all ease 0.1s;
        }
       
        .card .time, .card .calendar {
            font-size: 40px;
            color: #2d2d2d;
        }
        .card .description {
            font-size: 16px;
            color: #888;
        }
        /* For the clock, weather, and calendar icons */
        .icon {
            width: 50px;
            height: 50px;
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .clock-icon {
            background: url('./image/clock1.png') no-repeat center;
            background-size: contain;
        }
       
        .calendar-icon {
            background: url('./image/calendar.png') no-repeat center;
            background-size: contain;
        }
        /* Colors */
        .card.clock {
            background-color: #dceffb; /* Light blue */
        }
        .card.weather {
            background-color: #f8d6e7; /* Light pink */
        }
        .card.calendar {
            background-color: #dff8da; /* Soft green */
        }
        
        .buttonsone {
            position: relative;
            display: flex;
            align-items: center;
            width:50px;
            padding: 20px;
            
        }

        .user-picone {
            width: 150px;
            border-radius: 50%;
            cursor: pointer;
      
            
        </style>


    </head>

    <body>
    
<jsp:include page = "Dash.jsp"/>

        <div id="main">
        
        <div class="buttonsone">
                <%
                    HttpSession sessH = request.getSession(false); // Get the session without creating a new one
                    String userTypo = (String) sessH.getAttribute("userType"); // Get userType from the session

                    if (userTypo == null || userTypo.equals("guest")) {
                %>
                    <img src="./image/user.png" class="user-picone" alt="User Profile">
                    
                    
                <%
                    } else {
                %>
                    <img src="<%= (String) session.getAttribute("imgUrl") %>" class="user-picone" alt="User Profile">
                    
                        
                            
                <%
                    }
                %>
            </div>
            
            <%String userType = (String) session.getAttribute("userType");%>


            <section class="graph">
                <div class="graph-box" id="graph1">
                    <h1> FreshCo <%= userType %></h1>
                </div>

                

            </section>
        
            <div class="container">
        <!-- Title Section -->
        
        
        <div class="title-section">
            <h1>Welcome to the Dashboard</h1>
        </div>

        <!-- Dashboard Section with Clock, Weather, and Calendar -->
        <div class="dashboard">
            <!-- Clock Card -->
            <div class="card clock">
                <h2>Current Time</h2>
                <div class="time" id="clock">08:34 AM</div>
                <div class="icon clock-icon"></div>
            </div>

            <!-- Calendar Card -->
            <div class="card calendar">
                <h2>Today's Date</h2>
                <div class="calendar" id="calendar">October 12, 2024</div>
                <div class="description" id="day">Saturday</div>
                <div class="icon calendar-icon"></div>
            </div>
        </div>
    </div>
    
    
    
    
    <script>
        // JavaScript code for updating time
        function updateTime() {
            const now = new Date();
            let hours = now.getHours();
            let minutes = now.getMinutes();
            const ampm = hours >= 12 ? 'PM' : 'AM';
            hours = hours % 12;
            hours = hours ? hours : 12; // the hour '0' should be '12'
            minutes = minutes < 10 ? '0' + minutes : minutes;
            const timeString = hours + ':' + minutes + ' ' + ampm;
            document.getElementById('clock').textContent = timeString;
        }

        // JavaScript code for updating calendar
        function updateCalendar() {
            const now = new Date();
            const options = { month: 'long', day: 'numeric', year: 'numeric' };
            const dateString = now.toLocaleDateString('en-US', options);
            const dayString = now.toLocaleDateString('en-US', { weekday: 'long' });

            document.getElementById('calendar').textContent = dateString;
            document.getElementById('day').textContent = dayString;
        }

        // Call the functions to update time and calendar
        setInterval(updateTime, 1000); // Update time every second
        updateTime(); // Initial call for time
        updateCalendar(); // Initial call for calendar
    </script>
           

        </div>
        <footer>
            <jsp:include page="footer.jsp" />
        </footer>

    </body>

    </html>