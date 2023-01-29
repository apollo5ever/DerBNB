import React from "react"
import { useContext } from "react"
import { LoginContext } from "./LoginContext"
import to from "await-to-js"
import { useEffect } from "react"
import hex2a from "./hex2a"
import ListingCard from "./ListingCard"
import { useParams } from "react-router-dom"
import { useState } from "react"
import Form from "./Form"
import Calendar from "./Calendar"
import ImageGallery from "./ImageGallery"

export default function Listing(){
const [state,setState]=useContext(LoginContext)
const params = useParams()
const scid = params.scid
const [listing,setListing] = useState({})
const onChange = (ranges) => {
    console.log(ranges);
  };

const getListing = async ()=>{
    const deroBridgeApi = state.deroBridgeApiRef.current
        let [err, res] = await to(deroBridgeApi.daemon('get-sc', {
                scid:"f97c7ce530feec7dae6f65afb998c3c833c477895a8839399d99de1d25d3deca",
                code:false,
                variables:true
        }))
         let scData = res.data.result.stringkeys 
         let list = await getMeta(scid)
         .then(list=> {
           list.price = scData[`${scid}_price`]
           list.damage = scData[`${scid}_damage_deposit`]
           return list
         })
         
         
            setListing(list)
          console.log("list",list)
}

const getMeta = async (scid) =>{
    const deroBridgeApi = state.deroBridgeApiRef.current
        let [err, res] = await to(deroBridgeApi.daemon('get-sc', {
                scid:scid,
                code:false,
                variables:true
        }))
         let scData = res.data.result.stringkeys
 try{        let metaData = scData["metadata"]
         if(metaData){
                    try{
                    let y = new Object({scid:scid,metadata:JSON.parse(hex2a(metaData)),price:0})
                    return y
                        }catch(error){
                    console.log(error,hex2a(metaData))
                    return new Object({scid:scid})
                }
            
         }
         else return(new Object({scid:scid}))
        }catch(error){
            console.log(error)
            return(new Object({scid:scid}))
         }

         
}


useEffect(()=>{
    getListing()
},[state.deroBridgeApiRef])



    return(<div>
        {listing.metadata && listing.metadata.photos ?
        <ImageGallery images={listing.metadata.photos}/>
        :""}
        {listing.price &&
        
        <p>This property is available for rent: {listing.price/100000} Dero per night with a {listing.damage/100000} Dero damage deposit.</p>
        
        }
         <Form property_id={listing.scid} price={listing.price} damage={listing.damage} />
    </div>)

}