<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fresh Co</title>
   
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
        }
        
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('./image/loginBackground.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            backdrop-filter: blur(5px);
        }
        
        .container {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
            display: flex;
            width: 900px;
            max-width: 100%;
            min-height: 95%;
            overflow: hidden;
            position: relative;
        }
        
        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }
        
        .sign-in-container {
            left: 0;
            width: 50%;
            z-index: 2;
        }
        
        .sign-up-container {
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
        }
        
        .container.right-panel-active .sign-in-container {
            transform: translateX(100%);
        }
        
        .container.right-panel-active .sign-up-container {
            transform: translateX(100%);
            opacity: 1;
            z-index: 5;
        }
        
        form {
            background: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 0 50px;
            height: 100%;
        }
        
        h1 {
            font-weight: bold;
            margin: 0 0 20px;
            color: white;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        }
        
        p {
            font-weight: bold;
            margin: 0 0 20px;
            color: black;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        }
        
        span {
            font-size: 14px;
            color: #888;
            margin-bottom: 20px;
        }
        
        input {
            background: #eee;
            border: none;
            padding: 15px;
            margin: 8px 0;
            width: 100%;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
        }
        
        input:focus {
            outline: none;
            background: #ddd;
        }
        
        .sub-buttons,
        button {
            border-radius: 20px;
            border: 1px solid #4CAF50;
            background: #4CAF50;
            color: #fff;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
            cursor: pointer;
        }
        
        .sub-buttons,
        button:hover {
            background: #05f50d;
        }
        
        .sub-buttons,
        button:active {
            transform: scale(0.95);
        }
        
        .sub-buttons,
        button.ghost {
            background: transparent;
            border-color: #fff;
            margin-top: 15px;
        }
        
        .sub-buttons,
        button.ghost:hover {
            background: #05f50d;
            color: black;
        }
        
        .overlay-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: transform 0.6s ease-in-out;
            z-index: 100;
        }
        
        .container.right-panel-active .overlay-container {
            transform: translateX(-100%);
        }
        
        .overlay {
            background: #4CAF50;
            background: -webkit-linear-gradient(to right, #4CAF50, #56ab2f);
            background: linear-gradient(to right, #4fdb53, #499327);
            position: absolute;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }
        
        .container.right-panel-active .overlay {
            transform: translateX(50%);
        }
        
        .overlay-panel {
            position: absolute;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 0 40px;
            height: 100%;
            width: 50%;
        }
        
        .overlay-left {
            transform: translateX(-20%);
        }
        
        .container.right-panel-active .overlay-left {
            transform: translateX(0);
        }
        
        .overlay-right {
            right: 0;
            transform: translateX(0);
        }
        
        .container.right-panel-active .overlay-right {
            transform: translateX(20%);
        }
        
        .a {
            color: #333;
            font-size: 14px;
            text-decoration: none;
            margin: 15px 0;
        }
        
        .a:hover {
            color: blue;
            text-decoration: underline;
        }
        
        .error {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
        
        .success-message {
            color: green;
            font-size: 14px;
            margin-top: 10px;
            display: none;
        }
        
        .enter_details {
            color: green;
        }
        /* Grid layout for sign-up form */
        
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            width: 100%;
        }
    </style>

</head>

<body>
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form id="signUpForm" action="RegisterCustomer" method="post" enctype="multipart/form-data">
                <h1>Create Account</h1>
                <span class="enter_details">Enter Following Details</span>
                <div class="form-grid">
                    <div>
                        <input type="text" id="signUpFirstName" placeholder="First Name" name="fName" maxlength="25" required />
                        <span id="firstNameError" class="error"></span>
                    </div>
                    <div>
                        <input type="text" id="signUpLastName" placeholder="Last Name" name="lName" maxlength="25" required />
                        <span id="lastNameError" class="error"></span>
                    </div>
                    <div>
                        <input type="email" id="signUpEmail" placeholder="Email" name="email" required />
                        <span id="emailError" class="error"></span>
                    </div>
                    <div>
                        <input type="text" id="signUpPhone" placeholder="Phone Number" name="phone" maxlength="10" required />
                        <span id="phoneError" class="error"></span>
                    </div>
                    <div>
                        <input type="text" id="signUpLane" placeholder="Lane" name="lane" maxlength="30" required />
                        <span id="laneError" class="error"></span>
                    </div>
                    <div>
                        <input type="text" id="signUpCity" placeholder="City" name="city" maxlength="20" required />
                        <span id="cityError" class="error"></span>
                    </div>
                    <div>
                        <input type="date" id="signUpDOB" placeholder="Date of Birth" name="dob" max="2009-12-31" required />
                        <span id="dobError" class="error"></span>
                    </div>
                    <div>
                        <input type="file" id="signUpImageUrl" name="imgUrl" required />
                        <span id="imageError" class="error"></span>
                        <img id="imagePreview" src="" alt="Image Preview" style="display:none; width: 100px; margin-top: 10px;" />
                    </div>

                </div>
                <div class="form-grid">
                    <div>
                        <input type="password" id="signUpPassword" placeholder="Password" name="password" maxlength="20" required />
                        <span id="passwordError" class="error"></span>
                    </div>

                    <div>
                        <input type="password" id="signUpConfirmPassword" placeholder="Confirm Password" name="password" maxlength="20" required />
                        <span id="passwordError" class="error"></span>
                    </div>
                </div>
                <button type="submit">Sign Up</button>
                <span id="signUpSuccess" class="success-message">Sign Up Successful!</span>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form id="signInForm" action="login" method="post">
                <h1>Sign in</h1>
                <input type="email" id="signInEmail" name="email" placeholder="Enter Your Email" required />
                <span id="emailError" class="error"></span>
                <input type="password" id="signInPassword" name="password" placeholder="Enter Your Password" maxlength="20" required />
                <span id="passwordError" class="error"></span>
                <input type="submit" class="sub-buttons" value="Sign In">
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p>To keep connected with us, please login with your personal info</p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello, Friend!</h1>
                    <p>Enter your personal details and start your journey with us</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>

    <script>
    
    
        document.addEventListener('DOMContentLoaded', function() {
            const signUpForm = document.getElementById('signUpForm');
            const signInForm = document.getElementById('signInForm');

            // Sign Up
            signUpForm.addEventListener('submit', function(event) {
                let errorMessages = [];//  store all error
                let isValid = true;

                // Email validation 
                const emailField = document.getElementById('signUpEmail');
                const email = emailField.value;
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; //  email format 
                if (!emailRegex.test(email)) {
                    errorMessages.push("Please enter a valid email address.");
                    isValid = false;
                }

                // Phone number 
                const phoneField = document.getElementById('signUpPhone');
                const phone = phoneField.value;
                const phoneRegex = /^\d{10}$/;// check 10 numbers
                if (!phoneRegex.test(phone)) {
                    errorMessages.push("Phone number must be exactly 10 digits.");
                    isValid = false;
                }

                // Date of Birth  
                const dobField = document.getElementById('signUpDOB');
                const dob = new Date(dobField.value);
                const age = new Date().getFullYear() - dob.getFullYear();
                if (age < 16) { // must be at least 16 years old
                    errorMessages.push("You must be at least 16 years old.");
                    isValid = false;
                }

                // check Password 
                const passwordField = document.getElementById('signUpPassword');
                const password = passwordField.value;
                if (password.length < 8) { //   8 characters
                    errorMessages.push("Password must be at least 8 characters long.");
                    isValid = false;
                }

                
                const confirmPasswordField = document.getElementById('signUpConfirmPassword');
                const confirmPassword = confirmPasswordField.value;
                if (password !== confirmPassword) {
                    errorMessages.push("Passwords do not match.");
                    isValid = false;
                }

                //  validation fails  didnt submit form & show the error msg.

                if (!isValid) {
                    alert(errorMessages.join("\n")); // show all error msg
                    event.preventDefault();//didn't submit if any error is show
                } else {
                    // Show success msg if validation is successful
                    document.getElementById('signUpSuccess').style.display = 'block';
                    setTimeout(() => {
                        document.getElementById('signUpSuccess').style.display = 'none';
                    }, 3000); //sucess msg
                }
            });

            // Sign In Form Validation
            signInForm.addEventListener('submit', function(event) {
                let errorMessages = [];
                let isValid = true;

               
                const validUsername = "testuser"; 
                const validPassword = "password123"; 

                const usernameField = document.getElementById('signInEmail');
                const username = usernameField.value;

                const passwordField = document.getElementById('signInPassword');
                const password = passwordField.value;


                //  validation fails  didnt submit form & show the error msg.
                if (!isValid) {
                    alert(errorMessages.join("\n"));
                    event.preventDefault();
                }
            });
        });

        // sign in & sign up click
        document.getElementById('signIn').addEventListener('click', function() {
            document.getElementById('container').classList.remove('right-panel-active');
        });

        document.getElementById('signUp').addEventListener('click', function() {
            document.getElementById('container').classList.add('right-panel-active');
        });
    </script>
</body>

</html>