<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fresh Co</title>


        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f0f0f0;
            }
            
            .main {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background-image: url(./image/delivey_person.png);
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
            }
            
            .registration {
                padding: 30px;
                width: 50%;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                backdrop-filter: blur(5px);
            }
            
            h2 {
                margin-bottom: 20px;
                font-size: 30px;
                color: #000000;
                text-align: center;
                font-style: italic;
            }
            
            .form-row {
                display: flex;
                justify-content: space-between;
            }
            
            .sub-part {
                margin-bottom: 15px;
                width: 100%;
            }
            
            .sub-part label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
            }
            
            .sub-part input,
            .sub-part select {
                width: 50%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            
            .eType-group {
                display: flex;
                align-items: center;
            }
            
            .form-actions {
                display: flex;
                justify-content: flex-end;
                gap: 10px;
            }
            
            .back-btn,
            .reset-btn,
            .submit-btn {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-weight: bold;
            }
            
            .back-btn {
                background-color: #007bff;
                color: white;
            }
            
            .reset-btn {
                background-color: #ccc;
                color: #333;
            }
            
            .submit-btn {
                background-color: #ff6600;
                color: white;
            }
            
            @media (max-width: 768px) {
                .main {
                    flex-direction: column;
                }
                .registration {
                    width: 90%;
                    padding: 20px;
                }
                .form-row {
                    flex-direction: column;
                    align-items: flex-start;
                }
            }
        </style>
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
        <div class="main">
            <div class="registration">
                <h2>Driver REGISTRATION FORM</h2>
                <form id="registrationForm" action="AddDelPerson" method="post" enctype="multipart/form-data">
                    <div class="form-row">
                        <div class="sub-part">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" placeholder="Enter your Email" required>
                        </div>
                        <div class="sub-part">
                            <label for="phone">Phone:</label>
                            <input type="tel" id="phone" name="phone" placeholder="Enter your Phone Number" maxlength="10" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="sub-part">
                            <label for="nic">NIC:</label>
                            <input type="text" id="nic" name="nic" maxlength="12" required>
                        </div>
                        <div class="sub-part">
                            <label for="Dimg">Add Driver Image</label>
                            <input type="file" id="Dimg" name="imgUrl" required >
                        </div>

                    </div>
                    <div class="form-row">
                        <div class="sub-part">
                            <label for="city">City:</label>
                            <input type="text" id="address" name="city" placeholder="Enter your City" maxlength="20" required>
                        </div>
                        <div class="sub-part">
                            <label for="dob">DOB:</label>
                            <input type="date" id="dob" name="dob" max="2004-12-31" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="sub-part">
                            <label for="LNumber">License Number:</label>
                            <input type="text" id="LNumber" name="drivingLicenseNum" maxlength="10" required>
                        </div>
                        <div class="sub-part">
                            <label for="vNumber">Vehicle Number:</label>
                            <input type="text" id="vNumber" name="vehicleNum" maxlength="7" required>
                        </div>
                    </div>
                    <div class="form-row">

                    </div>
                    <div class="form-row">
                        <div class="sub-part">
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="password" placeholder="Enter Password" maxlength="20" required>
                        </div>

                        <div class="sub-part">
                            <label for="password">Confirm Password:</label>
                            <input type="password" id="Confirmpassword" name="Confirmpassword" placeholder="Enter Confirm password" maxlength="20" required>
                        </div>
                    </div>
                    <div class="form-actions">

                        <button type="reset" class="reset-btn">Reset All</button>
                        <button type="submit" class="submit-btn">Submit Form</button>
                    </div>
                </form>
            </div>
        </div>



        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const form = document.getElementById('registrationForm');
                const emailField = document.getElementById('email');
                const phoneField = document.getElementById('phone');
                const nicField = document.getElementById('nic');
                const dobField = document.getElementById('dob');
                const licenseField = document.getElementById('LNumber');
                const passwordField = document.getElementById('password');
                const confirmPasswordField = document.getElementById('Confirmpassword');

                form.addEventListener('submit', function(event) {
                    let errorMessages = [];

                    // Email validation
                    const email = emailField.value;
                    const emailRegex = /^[a-zA-Z0-9._%+-]+@emp\.freshco\.lk$/;
                    if (!emailRegex.test(email)) {
                        errorMessages.push("Email must be in the format '@emp.freshco.lk'.");
                    }

                    // Phone and License number validation (10 digits)
                    const phone = phoneField.value;
                    const phoneRegex = /^\d{10}$/;
                    if (!phoneRegex.test(phone)) {
                        errorMessages.push("Phone number must be exactly 10 digits.");
                    }

                    const license = licenseField.value;
                    if (!phoneRegex.test(license)) {
                        errorMessages.push("License number must be exactly 10 digits.");
                    }

                    // NIC validation (12 digits)
                    const nic = nicField.value;
                    const nicRegex = /^\d{12}$/;
                    if (!nicRegex.test(nic)) {
                        errorMessages.push("NIC must be exactly 12 digits.");
                    }

                    // Age validation (must be at least 20 years old)
                    const dob = new Date(dobField.value);
                    const age = new Date().getFullYear() - dob.getFullYear();
                    if (age < 20) {
                        errorMessages.push("You must be at least 20 years old.");
                    }

                    // Password validation (at least 8 characters)
                    const password = passwordField.value;
                    if (password.length < 8) {
                        errorMessages.push("Password must be at least 8 characters long.");
                    }

                    // Confirm password validation
                    const confirmPassword = confirmPasswordField.value;
                    if (password !== confirmPassword) {
                        errorMessages.push("Passwords do not match.");
                    }

                    // If there are any errors, show them in an alert and prevent form submission
                    if (errorMessages.length > 0) {
                        alert(errorMessages.join("\n"));
                        event.preventDefault();
                    } else {
                        // Show success message if validation is successful
                        alert("Successfully registered!");
                        // Optionally, you can submit the form here or let it submit naturally
                    }
                });
            });
        </script>

    </body>

    </html>