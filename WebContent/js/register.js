/**
 * 
 */

function register() {
  var checkbox = document.getElementById("checkbox");

  if (checkbox.checked) {
    // Checkbox is checked, proceed with registration
    alert("Registration successful!");
    // Additional registration logic here
  } else {
    // Checkbox is not checked, display error message
    alert("Please click on the checkbox to proceed with registration.");
  }
}
