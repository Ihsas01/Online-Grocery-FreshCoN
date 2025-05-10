const categorySelect = document.getElementById("category");

        categorySelect.addEventListener("change", function() {
            const selectedCategory = categorySelect.value;
            const targetSection = document.getElementById(selectedCategory);

            if (targetSection) {
                targetSection.scrollIntoView({
                    behavior: "smooth"
                });
            }
        });

        let cartCount = 0;
        const cart = {};

        function addToCart(productName, productPrice, quantity) {
            if (cart[productName]) {
                cart[productName].quantity += parseInt(quantity);
            } else {
                cart[productName] = {
                    price: productPrice,
                    quantity: parseInt(quantity)
                };
            }
            updateCartCount();
        }

        function updateCartCount() {
            cartCount = Object.keys(cart).reduce((sum, key) => sum + cart[key].quantity, 0);
            document.querySelector('.cart-count').innerText = cartCount;
        }

        function openCart() {
            const cartItems = document.getElementById('cart-items');
            const cartTotalElement = document.getElementById('cart-total');
            cartItems.innerHTML = '';
            let total = 0;

            Object.keys(cart).forEach(product => {
                const productTotal = cart[product].quantity * cart[product].price;
                total += productTotal;
                cartItems.innerHTML += `<div>${product}: ${cart[product].quantity} x ${cart[product].price}/=</div>`;
            });

            cartTotalElement.innerText = `Total: ${total}/=`;
            document.getElementById('cart-modal').style.display = 'block';
        }

        function closeCart() {
            document.getElementById('cart-modal').style.display = 'none';
        }

        function clearCart() {
            Object.keys(cart).forEach(product => delete cart[product]);
            updateCartCount();
            closeCart();
        }

		function checkout() {
		    if (cartCount > 0) {
		        // Create a string to send as query parameters
		        let params = new URLSearchParams();
		        params.append('cartItems', JSON.stringify(cart)); // Convert cart object to JSON string
		        
		        const xhr = new XMLHttpRequest();
		        xhr.open('POST', 'YourCheckoutServletURL'); // Replace with your servlet URL
		        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

		        xhr.onload = function () {
		            if (xhr.status === 200) {
		                alert('Products added to the database successfully!');
		                // Optionally redirect to another page or refresh
		                window.location.href = 'redirectURL'; // Replace with your redirect URL
		            } else {
		                alert('Error: ' + xhr.responseText);
		            }
		        };

		        xhr.onerror = function () {
		            alert('Request failed.');
		        };

		        xhr.send(params.toString());
		    } else {
		        alert('Your cart is empty. Please add items to your cart before checking out.');
		    }
		}
	