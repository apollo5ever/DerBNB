import React, { useState, useCallback, useContext} from "react";
import to from "await-to-js";
import Calendar from "./Calendar";
import { LoginContext } from "./LoginContext";
import { differenceInCalendarDays,addDays } from "date-fns";

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
      
         "scid": "cfbd566d3678dec6e6dfa3a919feae5306ab12af1485e8bcf9320bd5a122b1d3",
         "ringsize": 2,
         "transfers":[
            {
                "destination":"dero1qytqfq2feqy63k0ycdj464h93h5xpqnwhwqldhqphha599jnwx60yqq4m3zxj",
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
      <Calendar onChange={setDateRange} disabledDates={props.disabledDates} />
      <button type="button" onClick={handleSubmit}>
        Request Booking
      </button>
    </form>
  );
};

export default Form;
