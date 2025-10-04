// Main JavaScript file for the Tech Startup Website

// Function to initialize the website
function init() {
    console.log("Tech Startup Website Loaded");
    // Add event listeners or other initialization code here
}

// Function to handle navigation menu toggle
function toggleNav() {
    const nav = document.querySelector('.nav');
    nav.classList.toggle('active');
}

// Event listener for DOMContentLoaded
document.addEventListener('DOMContentLoaded', init);

// Example of adding an event listener for a button
const navToggleButton = document.querySelector('.nav-toggle');
if (navToggleButton) {
    navToggleButton.addEventListener('click', toggleNav);
}