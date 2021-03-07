function countText(formName, formCounter, limitTextCount){
  const inputText = document.getElementById(formName);
  
  inputText.addEventListener("keyup", () => {
    const textLength = limitTextCount - inputText.value.length;
    const textCountDisplay = document.getElementById(formCounter);
    textCountDisplay.innerHTML = textLength;
    
  });
  
}


window.addEventListener('load', function(){
  if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
    countText("recipe-title", "counter-title", 40);
    countText("recipe-detail", "counter-detail", 140);
    countText("recipe-info1", "counter-info1", 140);
    countText("recipe-info2", "counter-info1", 140);
    countText("recipe-info3", "counter-info1", 140);
    countText("recipe-info4", "counter-info1", 140);
    countText("recipe-info5", "counter-info1", 140);
  }
});
