document.addEventListener('DOMContentLoaded', () => {
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    // Add and remove panel for sign up and sign in
    signUpButton.addEventListener('click', () => {
        container.classList.add('right-panel-active');
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove('right-panel-active');
    });

    // Handle form submission for both sign up and sign in forms
    document.getElementById('loginForm').addEventListener('submit', handleFormSubmit);
    document.getElementById('registrationForm').addEventListener('submit', handleFormSubmit);
});

// Handle form submission with validation
function handleFormSubmit(event) {
    event.preventDefault();
    const form = event.target;
    const formType = form.id === 'registrationForm' ? 'signUp' : 'signIn';

    let isValid = true;
    const fields = getFormFields(formType);

    // Validate each field based on provided rules
    fields.forEach(({ id, minLength, errorId, validate }) => {
        const value = getInputValue(id);
        const errorElement = document.getElementById(errorId);
        const inputElement = document.getElementById(id);

        if (validate(value)) {
            errorElement.innerText = '';
            inputElement.style.borderColor = ''; // Reset border color
        } else {
            errorElement.innerText = `${id.replace(/([A-Z])/g, ' $1').toLowerCase()} must be at least ${minLength} characters`;
            inputElement.style.borderColor = 'red'; // Highlight invalid input
            isValid = false;
        }
    });

    // Additional validation for sign-up form
    if (formType === 'signUp') {
        validateSignUpForm();
    }

    if (isValid) {
        // Display success message
        document.getElementById(`${formType}Success`).style.display = 'block';
        setTimeout(() => {
            document.getElementById(`${formType}Success`).style.display = 'none'; // Hide success message after 3 seconds
        }, 3000);

        console.log(getFormData(formType)); // Output form data in the console
        form.reset(); // Reset form fields after successful submission
        // Perform any further actions here (e.g., sending data to the server)
    }
}

// Validate sign up form fields
function validateSignUpForm() {
    const password = getInputValue('signUpPassword');
    const confirmPassword = getInputValue('signUpConfirmPassword');
    const passwordErrorElement = document.getElementById('passwordError');

    // Password confirmation validation
    if (password !== confirmPassword) {
        passwordErrorElement.innerText = 'Passwords do not match';
        document.getElementById('signUpConfirmPassword').style.borderColor = 'red';
        return false;
    } else {
        passwordErrorElement.innerText = '';
        document.getElementById('signUpConfirmPassword').style.borderColor = '';
    }

    // Age validation
    const dob = getInputValue('signUpDOB');
    const dobErrorElement = document.getElementById('dobError');
    if (!validateAge(dob)) {
        dobErrorElement.innerText = 'You must be at least 16 years old';
        document.getElementById('signUpDOB').style.borderColor = 'red';
        return false;
    } else {
        dobErrorElement.innerText = '';
        document.getElementById('signUpDOB').style.borderColor = '';
    }
    
    return true; // If all validations pass
}

// Helper to get input value
function getInputValue(id) {
    return document.getElementById(id).value.trim();
}

// Fields definition for validation based on form type
function getFormFields(type) {
    if (type === 'signUp') {
        return [
            { id: 'signUpFirstName', minLength: 2, errorId: 'firstNameError', validate: value => value.length >= 2 },
            { id: 'signUpLastName', minLength: 2, errorId: 'lastNameError', validate: value => value.length >= 2 },
            { id: 'signUpEmail', minLength: 5, errorId: 'emailError', validate: validateEmail },
            { id: 'signUpPhone', minLength: 10, errorId: 'phoneError', validate: value => value.length === 10 && !isNaN(value) },
            { id: 'signUpLane', minLength: 3, errorId: 'laneError', validate: value => value.length >= 3 },
            { id: 'signUpCity', minLength: 3, errorId: 'cityError', validate: value => value.length >= 3 },
            { id: 'signUpDOB', minLength: 1, errorId: 'dobError', validate: value => !!value }, // Ensure date is selected
            { id: 'signUpImageUrl', minLength: 1, errorId: 'imageError', validate: validateImageFile },
            { id: 'signUpUsername', minLength: 4, errorId: 'usernameError', validate: value => value.length >= 4 },
            { id: 'signUpPassword', minLength: 6, errorId: 'passwordError', validate: value => value.length >= 6 },
            { id: 'signUpConfirmPassword', minLength: 6, errorId: 'passwordError', validate: value => value.length >= 6 }
        ];
    } else {
        return [
            { id: 'signInEmail', minLength: 5, errorId: 'signInEmailError', validate: validateEmail },
            { id: 'signInPassword', minLength: 6, errorId: 'signInPasswordError', validate: value => value.length >= 6 }
        ];
    }
}

// Function to get form data after validation
function getFormData(type) {
    if (type === 'signUp') {
        return {
            firstName: getInputValue('signUpFirstName'),
            lastName: getInputValue('signUpLastName'),
            email: getInputValue('signUpEmail'),
            phone: getInputValue('signUpPhone'),
            lane: getInputValue('signUpLane'),
            city: getInputValue('signUpCity'),
            dob: getInputValue('signUpDOB'),
            imageUrl: document.getElementById('signUpImageUrl').files[0], // Get the file from the input
            username: getInputValue('signUpUsername'),
            password: getInputValue('signUpPassword')
        };
    } else {
        return {
            email: getInputValue('signInEmail'),
            password: getInputValue('signInPassword')
        };
    }
}

// Validate email format
function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(String(email).toLowerCase());
}

// Validate the uploaded image file
function validateImageFile() {
    const file = document.getElementById('signUpImageUrl').files[0];
    if (!file) return false; // No file selected
    const validTypes = ['image/jpeg', 'image/png', 'image/gif']; // Valid file types
    return validTypes.includes(file.type);
}

// Validate age based on date of birth (16+)
function validateAge(dob) {
    const birthDate = new Date(dob);
    const today = new Date();
    const age = today.getFullYear() - birthDate.getFullYear();
    const monthDiff = today.getMonth() - birthDate.getMonth();
    return age > 16 || (age === 16 && monthDiff >= 0);
}


