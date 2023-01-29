import React, { useContext } from "react";
import to from "await-to-js";
import { LoginContext } from "./LoginContext";
export default function  CancelBooking(props){
  const [state,setState] = useContext(LoginContext)

  const cancel=React.useCallback(async () => {
    const deroBridgeApi = state.deroBridgeApiRef.current
    
    const [err0, res0] = await to(deroBridgeApi.wallet('start-transfer', {
      
         "scid": "f74ad1b79b77c511fa57bda13148f39243a4dd12ab81871bf5a7b857cd9299f7",
         "ringsize": 2,
        
          "sc_rpc": [{
             "name": "entrypoint",
             "datatype": "S",
             "value": "CancelBooking"
         },
         {
             "name": "property_id",
             "datatype": "S",
             "value": props.property_id
         },
         {
            "name": "timestamp_key",
            "datatype":"U",
            "value": parseInt(props.timestamp)
         }
     ]
     
     }))

  }
  )
    return <button onClick={cancel}>Reject</button>

    }
        
        
    
