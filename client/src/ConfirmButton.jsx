import React, { useContext } from "react";
import to from "await-to-js";
import { LoginContext } from "./LoginContext";
export default function  ConfirmBooking(props){
  const [state,setState] = useContext(LoginContext)

  const conf=React.useCallback(async () => {
    const deroBridgeApi = state.deroBridgeApiRef.current
    
    const [err0, res0] = await to(deroBridgeApi.wallet('start-transfer', {
      
         "scid": "f97c7ce530feec7dae6f65afb998c3c833c477895a8839399d99de1d25d3deca",
         "ringsize": 2,
        
          "sc_rpc": [{
             "name": "entrypoint",
             "datatype": "S",
             "value": "ConfirmBooking"
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
    return <button onClick={conf}>Confirm Booking</button>

    }
        
        
    
