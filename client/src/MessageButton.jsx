import React, { useContext, useState } from "react";
import to from "await-to-js";
import { LoginContext } from "./LoginContext";
export default function  MessageButton(props){
  const [state,setState] = useContext(LoginContext)
  const [open,setOpen]=useState(false)

  const sendMessage=React.useCallback(async (e) => {
e.preventDefault()
let msg = e.target.msg.value
    const deroBridgeApi = state.deroBridgeApiRef.current
    
    const [err, res] = await to(deroBridgeApi.wallet('start-transfer', {

      "ringsize": 16,
     "transfers":[{
                    "destination":props.booker,
                    "amount":1,
                    "payload_rpc":[{
                            "name":"msg",
                            "datatype":"S",
                            "value":msg
                                    }
                                  ]
     } ],
     
     
    
  
 }))
 setOpen(false)

  }
  )
    return <div>{

      open?<form onSubmit={sendMessage}>
      <input type="text" id="msg"/>
      <button type={"submit"}>Send</button>
    </form>
      :<button onClick={()=>setOpen(true)}>Message</button>
    }
</div>
    }
        
        
    
