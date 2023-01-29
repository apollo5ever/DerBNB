import { LoginContext, LoginProvider } from "./LoginContext";
import React from "react";
import { useContext } from "react";
import { Outlet } from "react-router-dom";
import { useEffect } from "react";

export default function Front(){
    const [state, setState] = useContext(LoginContext);
    console.log(state)

    useEffect(()=>{
        console.log(state)
    },[state])


    return(<div>
        
        {state.bridgeInitText && state.bridgeInitText}
        
        <Outlet />
    </div>)

}