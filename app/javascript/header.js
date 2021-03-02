function pullDown(){
  const userPhoto = document.getElementById("user-photo")
  const pullDownMenu = document.getElementById("show-lists")
  // const pullDownChild = document.querySelectorAll(".pull-down-list")

  userPhoto.addEventListener('click', function(){
    
    if (pullDownMenu.getAttribute("style") == "display:block;") {
      userPhoto.setAttribute("style", "background-color:#ffffff;")
      pullDownMenu.removeAttribute("style", "display:block;")
    } else {
      userPhoto.setAttribute("style", "background-color:#FFBEDA;")
      pullDownMenu.setAttribute("style", "display:block;")
    }

  })

}


window.addEventListener('load',pullDown)
  
