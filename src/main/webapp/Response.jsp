<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FreshCo</title>

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, rgb(46, 45, 45), #504e4e);
        }

        .main-box {
            width: 600px;
            margin: 40px auto;
            background: linear-gradient(to right, #cbd4cb, #c9cec7);
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .profile-header {
            text-align: center;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.6);
        }

        .main-form {
            padding: 40px;
        }

        h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .group {
            margin-bottom: 20px;
        }

        .group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }

        .group textarea {
            width: 90%;
            height: 200px;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .group textarea:focus {
            border-color: #5f2c84;
            box-shadow: 0 0 8px rgba(95, 44, 132, 0.2);
            outline: none;
        }

        .save-btn {
            background-color: #5f2c84;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
            margin-top: 20px;
            width: 100%;
            max-width: 250px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .save-btn:hover {
            background-color: #4a206a;
        }
    </style>
    <script>
        function confirmSubmission() {
            return confirm("Are you sure you want to submit the response?");
        }
    </script>
</head>

<body>
<%
	String errorMessage = (String) request.getAttribute("errorMessage");
	if (errorMessage != null) {
	%>
	<script>
        alert("<%= errorMessage %>");
	</script>
	<%
	}
	%>
    <div class="main-box">
        <div class="profile-header">
            <h2>Response</h2>
        </div>

        <div class="main-form">
            <form id="profileForm" method="post" action="ResUpdate" onsubmit="return confirmSubmission();">
                <div class="group">
                    <label for="Response">Response</label>
                    <textarea name="response" id="Response"></textarea>
                </div>
                <%
    String enID = request.getParameter("EnID");
    if (enID == null || enID.isEmpty()) {
        out.println("<script>alert('EnID parameter is missing or null');</script>");
    }
%>
                
				<input type="hidden" name="enID" value="<%= request.getParameter("EnID") %>" />
                <button type="submit" value="Response" class="save-btn">Save</button>
                <button type="button" class="save-btn" onclick="history.back();">Back</button>
            </form>
        </div>
    </div>
</body>

</html>
