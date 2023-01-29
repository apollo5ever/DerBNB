import React, { useState } from 'react';

const ImageGallery = ({ images }) => {
  for(let i=0;i<images.length;i++){
    console.log(images[i])
    if (!images[i].startsWith('ht')) {
      images[i] = `https://ipfs.io/ipfs/${images[i]}`;
  } 
  }
    


  const [currentImageIndex, setCurrentImageIndex] = useState(0);

  const handlePrevClick = () => {
    if (currentImageIndex === 0) {
      setCurrentImageIndex(images.length - 1);
    } else {
      setCurrentImageIndex(currentImageIndex - 1);
    }
  };

  const handleNextClick = () => {
    if (currentImageIndex === images.length - 1) {
      setCurrentImageIndex(0);
    } else {
      setCurrentImageIndex(currentImageIndex + 1);
    }
  };

  return (
    <div className="image-gallery">
      <button onClick={handlePrevClick}>Previous</button>
      <img src={images[currentImageIndex]} alt="Gallery Image" />
      <button onClick={handleNextClick}>Next</button>
    </div>
  );
};

export default ImageGallery;
