import { differenceInCalendarDays,addDays } from "date-fns";

export default function GetBookings(scData,scid){

    let disabledDates = [];
    let startSearch = new RegExp(`${scid}_bk_start_`)
    let intervals =  Object.keys(scData)
    .filter(key => startSearch.test(key))
    .map(key=>new Object({
        start: new Date(scData[key]*1000),
        end: new Date(scData[key.replace("start","end")]*1000)
    }))

    
    
    // let endSearch = new RegExp(`${scid}_bk_end_`)
    // let endDates =  Object.keys(scData)
    // .filter(key => endSearch.test(key))


   
    
    for(let k=0 ; k<intervals.length; k++){

        for (let i = differenceInCalendarDays(intervals[k].end,intervals[k].start) + 1; i--; intervals[k].start < intervals[k].end) {
            console.log("DISABLED DATES",disabledDates)
            disabledDates.push(intervals[k].start);
            intervals[k].start = addDays(intervals[k].start, 1);
            }

    }
   



return(disabledDates)

}