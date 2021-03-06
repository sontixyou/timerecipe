if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
      let imageSize = 200;
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('width', imageSize);
      blobImage.setAttribute('height', imageSize);
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    }
    document.getElementById('recipe-image').addEventListener('change', function(e){
      
      const imageContent = document.querySelector('img');
      if (imageContent) {
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });

  });
}