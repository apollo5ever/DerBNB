import React, { useState, useEffect, useContext } from "react";


import RentalCard from "./RentalCard";
import ListingCard from "./ListingCard";
import hex2a from "./hex2a";
import { Link, useParams } from "react-router-dom";
import { LoginContext } from "./LoginContext";
import to from "await-to-js";

const UserPage = () => {
    
    const [activeRentals, setActiveRentals] = useState([]);
    const [pastRentals, setPastRentals] = useState([]);
    const [listings, setListings] = useState([]);
    const params = useParams()
    const address = params.address
    const [state,setState] = useContext(LoginContext)

    const getRentals = async ()=>{
        if(listings.length==0) return
        const deroBridgeApi = state.deroBridgeApiRef.current 
        let [err, res] = await to(deroBridgeApi.daemon('get-sc',{
            scid:"f97c7ce530feec7dae6f65afb998c3c833c477895a8839399d99de1d25d3deca",
            code:false,
            variables:true
        }))
        let scData = res.data.result.stringkeys 
        let search = /request/
        let rentalRequests = Object.keys(scData)
        .filter(key=>search.test(key))
        .filter(key=>{
            console.log(key)
            console.log(key.substring(0,64))
            console.log(listings)
            for(let i=0;i<listings.length;i++){
                console.log("because")
                if(key.substring(0,64)==listings[i].scid && /payment/.test(key)) return true
            }
            console.log("why")
            
        })
        .map(x=>new Object({start:scData[`${x.substring(0,64)}_request_bk_start_${x.slice(-10)}`], end:scData[`${x.substring(0,64)}_request_bk_end_${x.slice(-10)}`], booker:hex2a(scData[`${x.substring(0,64)}_request_booker_${x.slice(-10)}`]), payment:scData[`${x.substring(0,64)}_request_payment_${x.slice(-10)}`],scid:x.substring(0,64),timestamp:x.slice(-10)}))
        console.log(rentalRequests)
        setActiveRentals(rentalRequests)
    }

    const getListings = async ()=>{
        const deroBridgeApi = state.deroBridgeApiRef.current
            let [err, res] = await to(deroBridgeApi.daemon('get-sc', {
                    scid:"f97c7ce530feec7dae6f65afb998c3c833c477895a8839399d99de1d25d3deca",
                    code:false,
                    variables:true
            }))
             let scData = res.data.result.stringkeys 
             let search = /_owner/
             let listingz= await Promise.all(
                Object.keys(scData)
             .filter(key => search.test(key))
             .filter(key=>hex2a(scData[key])==address)
             .map(async key=>{
                let scid =key.substring(0,key.length-6)
                let meta = await getMeta(scid)
                meta.price=scData[`${scid}_price`]
                return meta
            })
             )
             
             console.log(listingz)
             setListings(listingz)
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

    useEffect(() => {
        getListings()
        // Fetch user's active rentals and past rentals using user id
        // Fetch user's listings using user id
        // Set the state with the fetched data
    }, []);

    useEffect(()=>{
        getRentals()
    },[listings])

    return (
        <div className="user-page">
           
            <h2>Rental Requests</h2>
            <div className="active-rentals-container">
                {activeRentals.map(rental => (
                    <RentalCard scid={rental.scid} booker={rental.booker} payment={rental.payment} start={rental.start} end={rental.end} timestamp={rental.timestamp} />
                ))}
            </div>
            <h2>Active Rentals</h2>
            <div className="past-rentals-container">
                {pastRentals.map(rental => (
                    <RentalCard rental={rental} key={rental.id} />
                ))}
            </div>
            <h2>My Listings</h2>
            <div className="listings-grid">
                {listings.map(listing => (
                    <div>
                        <ListingCard listing={listing} key={listing.id} />
                        <Link to={`/edit/${listing.scid}`}>Edit</Link>
                    </div>
                ))}
            </div>
        </div>
    );
};

export default UserPage;
