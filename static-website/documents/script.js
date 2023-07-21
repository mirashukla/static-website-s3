// Get a reference to the button element
const changeColorButton = document.getElementById('changeColorButton');

// Function to generate a random color
function getRandomColor() {
  const letters = '0123456789ABCDEF';
  let color = '#';
  for (let i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}

// Function to handle button click event
function changeBackgroundColor() {
  const newColor = getRandomColor();
  document.body.style.backgroundColor = newColor;
}

// Add a click event listener to the button
changeColorButton.addEventListener('click', changeBackgroundColor);
