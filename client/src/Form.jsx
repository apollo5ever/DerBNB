import React, { useState, useCallback, useContext} from "react";
import to from "await-to-js";
import Calendar from "./Calendar";
import { LoginContext } from "./LoginContext";

const Form = (props) => {
  const [dateRange, setDateRange] = useState({});
  const [state,setState] = useContext(LoginContext)

  const handleSubmit = () => {
    // Do something with the date range, for example:
    console.log(dateRange);

    const start=dateRange.startDate.getTime()/1000
    const end=dateRange.endDate.getTime()/1000
    const price = Math.ceil((end-start)*props.price/86400 + props.damage)
    requestBooking(dateRange.startDate.getTime()/1000,dateRange.endDate.getTime()/1000,price)
  };

  const requestBooking=React.useCallback(async (start,end,price) => {
    const deroBridgeApi = state.deroBridgeApiRef.current
    
    const [err0, res0] = await to(deroBridgeApi.wallet('start-transfer', {
      
         "scid": "f97c7ce530feec7dae6f65afb998c3c833c477895a8839399d99de1d25d3deca",
         "ringsize": 2,
         "transfers":[
            {
                "destination":"deto1qypyr02kkev76vwdsm3rxscyfwndq0tvq0x68p78t5w86x6fx99g7qqqr6dzk",
                "burn":price
            }

         ],
          "sc_rpc": [{
             "name": "entrypoint",
             "datatype": "S",
             "value": "RequestBooking"
         },
         {
             "name": "property_id",
             "datatype": "S",
             "value": props.property_id
         },
         {
            "name": "timestamp_key",
            "datatype":"U",
            "value": parseInt(new Date().getTime()/1000)
         },
         {
            "name":"start_timestamp",
            "datatype":"U",
            "value":parseInt(start)
         },
         {
            "name":"end_timestamp",
            "datatype":"U",
            "value":parseInt(end)
         }
     ]
     
     }))

  }
  )

  return (
    <form>
      <Calendar onChange={setDateRange} />
      <button type="button" onClick={handleSubmit}>
        Request Booking
      </button>
    </form>
  );
};

export default Form;
