function countText(){
  const inputText = document.getElementById("recipe-title");
  
  inputText.addEventListener("keyup", () => {
    const textLength = 140 - inputText.value.length;
    const textCountDisplay = document.getElementById("counter-title");
    textCountDisplay.innerHTML = textLength;
    
  });
  
}

window.addEventListener('load', countText);


