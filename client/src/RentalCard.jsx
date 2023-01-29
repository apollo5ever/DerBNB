import React from "react";
import { Link } from "react-router-dom";
import CancelBooking from "./CancelButton";
import ConfirmBooking from "./ConfirmButton";
import MessageButton from "./MessageButton";
export default function RentalCard(props){
    
    var start = new Date(props.start*1000)
      var startString = (start.getMonth()+1).toString()+"/"+start.getDate().toString()+"/"+start.getUTCFullYear().toString()
       
      var end = new Date(props.end*1000)
      var endString = (end.getMonth()+1).toString()+"/"+end.getDate().toString()+"/"+end.getUTCFullYear().toString()
    

        return <div className="request-card">
            <div className="request-card-user"><b>User:</b>{props.booker}</div>
            <div className="request-card-time"><b>From:</b>{startString} <b>To:</b>{endString}</div>
            <div className="request-card-payment"><b>Paid:</b>{props.payment/100000} Dero</div>
            <div className="request-card-scid"><b>property:</b>{props.scid}</div>
            
           
        
        <ConfirmBooking property_id={props.scid} timestamp={props.timestamp}/>
        <CancelBooking property_id={props.scid} timestamp={props.timestamp}/>
        <MessageButton booker = {props.booker}/>
        </div>;
    }
        
        
    
