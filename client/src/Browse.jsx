import React from "react"
import { useContext } from "react"
import { LoginContext } from "./LoginContext"
import to from "await-to-js"
import { useEffect } from "react"
import hex2a from "./hex2a"
import ListingCard from "./ListingCard"

export default function Browse(){
const [state,setState]=useContext(LoginContext)

const getListings = async ()=>{
    const deroBridgeApi = state.deroBridgeApiRef.current
        let [err, res] = await to(deroBridgeApi.daemon('get-sc', {
                scid:"cfbd566d3678dec6e6dfa3a919feae5306ab12af1485e8bcf9320bd5a122b1d3",
                code:false,
                variables:true
        }))
         let scData = res.data.result.stringkeys 
         let search = /^[a-f0-9]{64}_owner$/


         let listings= await Promise.all(
            Object.keys(scData)
         .filter(key => search.test(key))
         .map(async key=>{
            let scid =key.substring(0,key.length-6)
            let meta = await getMeta(scid)
            meta.price=scData[`${scid}_price`]
            return meta
        })
         )
         
         console.log("listings",listings)
         setState({...state,listings:listings})
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
    getListings()
},[state.deroBridgeApiRef])

useEffect(()=>{
    if(!state.listings) return
    for(let i=0;i<state.listings.length;i++){
        getMeta(state.listings[i].scid)
    }
},[state.listings])

    return(<div className="listings-grid">
        {state.listings && state.listings.map(x=><ListingCard listing={x}/>)
        }
        
    </div>)

}