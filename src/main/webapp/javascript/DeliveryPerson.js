document.addEventListener("DOMContentLoaded", function() {
    const registrationForm = document.getElementById("registrationForm");

    registrationForm.addEventListener("submit", function(event) {
        const eType = document.querySelector('input[name="eType"]:checked');

        if (!eType) {
            alert("Please select a type (Manager or Driver)");
            event.preventDefault();
        } else if (eType.value === "Driver") {
            // If Driver is selected, redirect to the delivery person registration form
            event.preventDefault(); // Prevent the default form submission
            window.location.href = "/EmployeeDPRegistration.jsp"; // Update with the correct path
        }
    });
});



document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("registrationForm");

    form.addEventListener("submit", function(event) {
        // Prevent form submission for validation
        event.preventDefault();

        // Validate email
        const email = document.getElementById("email").value;
        const emailPattern = /^[a-zA-Z0-9._%+-]+@emp\.freshco\.lk$/;
        if (!emailPattern.test(email)) {
            alert("Email must be in the format @emp.freshco.lk");
            return;
        }

        // Validate phone number
        const phone = document.getElementById("phone").value;
        const phonePattern = /^\d{10}$/;
        if (!phonePattern.test(phone)) {
            alert("Phone number must be 10 digits long");
            return;
        }

        // Validate NIC and License number
        const nic = document.getElementById("nic").value;

        const nicLicensePattern = /^\d{12}$/;
        if (!nicLicensePattern.test(nic)) {
            alert("NIC must be 12 digits long");
            return;
        }



        // Validate age (DOB)
        const dob = document.getElementById("dob").value;
        const birthDate = new Date(dob);
        const today = new Date();
        const age = today.getFullYear() - birthDate.getFullYear();
        const month = today.getMonth() - birthDate.getMonth();
        if (month < 0 || (month === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }

        if (age < 20) {
            alert("You must be over 20 years old");
            return;
        }

        // Validate password length
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("Confirmpassword").value;
        if (password.length < 8) {
            alert("Password must be at least 8 characters long");
            return;
        }

        // Check if passwords match
        if (password !== confirmPassword) {
            alert("Passwords do not match");
            return;
        }

        // If all validations pass, submit the form
        form.submit();
    });
});








// Admin js



document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector("form");

    form.addEventListener("submit", function(event) {
        // Prevent form submission for validation
        event.preventDefault();

        // Retrieve form values
        const email = document.getElementById("email").value;
        const phone = document.getElementById("phone").value;
        const dob = document.getElementById("dob").value;
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("Confirmpassword").value;

        // Validate email
        const emailPattern = /^[a-zA-Z0-9._%+-]+@adm\.freshco\.lk$/;
        if (!emailPattern.test(email)) {
            alert("Please enter a valid email ending with @adm.freshco.lk");
            return;
        }

        // Validate phone number
        const phonePattern = /^\d{10}$/;
        if (!phonePattern.test(phone)) {
            alert("Please enter a valid phone number with 10 digits.");
            return;
        }

        // Validate age (must be greater than 20)
        const birthDate = new Date(dob);
        const age = new Date().getFullYear() - birthDate.getFullYear();
        if (age <= 20) {
            alert("You must be older than 20 years.");
            return;
        }

        // Validate password length
        if (password.length < 8) {
            alert("Password must be at least 8 characters long.");
            return;
        }

        // Validate password confirmation
        if (password !== confirmPassword) {
            alert("Passwords do not match.");
            return;
        }

        // If all validations pass, submit the form
        form.submit();
    });
});