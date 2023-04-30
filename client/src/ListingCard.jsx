import React from "react";
import { Link } from "react-router-dom";
export default function ListingCard({listing}){
    let imgSrc;
    if (listing.metadata && listing.metadata.photos && listing.metadata.photos[0].startsWith('ht')) {
        imgSrc = listing.metadata.photos[0];
    } else if(listing.metadata && listing.metadata.photos){
        imgSrc = `https://ipfs.io/ipfs/${listing.metadata.photos[0]}`;
      
    }
       
    

        return <div className="listing-card">
            
            <div className="image-container">
                {
                listing.metadata && listing.metadata.photos ? 
                <img src={imgSrc}/> : 
                <div>{listing.scid}</div>
                }
               { listing.price?<div className="price">{listing.price/100000} Dero per Night</div>:""}
        </div>
        <Link to={`/listing/${listing.scid}`}>See More</Link>
        
        </div>;
    }
        
        
    
