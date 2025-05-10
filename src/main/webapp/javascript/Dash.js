
function formFrame(comLink) {
    var modal = document.getElementById("myModal");
    var iframe = document.getElementById("modalIframe");
    var span = document.getElementsByClassName("close")[0];

    // Attach click event to all links and buttons
    $(document).on('click', function(event) {
        event.preventDefault(); // Prevent default link behavior
        iframe.src = comLink; // Use comLink if provided
        modal.style.display = "block";
    });
	span.onclick = function() {
	               modal.style.display = "none";
	               iframe.src = "";
	           };


	           window.onclick = function(event) {
	               if (event.target == modal) {
	                   modal.style.display = "none";
	                   iframe.src = "";
				   }
    }
}