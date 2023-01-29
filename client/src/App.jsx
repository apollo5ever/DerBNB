import { useState, useRef, useContext,useEffect,useCallback} from 'react'
import React from 'react'
import './App.css'
import {HashRouter,Routes,Route,Outlet} from 'react-router-dom'
import Browse from './Browse'
import DeroBridgeApi from 'dero-rpc-bridge-api'
import { LoginContext, LoginProvider } from "./LoginContext";
import to from 'await-to-js'
import Front from './Front'
import Listing from './Listing'
import UserPage from './UserPage'
import Navbar from './Navbar'

function App() {
  const deroBridgeApiRef = useRef();
  const [state, setState] = useContext(LoginContext);

  const getAddress = useCallback(async () => {
    const deroBridgeApi = deroBridgeApiRef.current;

    const [err0, res0] = await to(deroBridgeApi.wallet("get-address", {}));

    console.log("get-address-error", err0);
    console.log(res0);
    if (err0 == null) {
     return res0.data.result.address
      
    }
  });

  useEffect(() => {
    const load = async () => {
      deroBridgeApiRef.current = new DeroBridgeApi();
      const deroBridgeApi = deroBridgeApiRef.current;

      const [err] = await to(deroBridgeApi.init());
      if (err) {
        setState((state)=>({...state, bridgeInitText:<a
          href="https://chrome.google.com/webstore/detail/dero-rpc-bridge/nmofcfcaegdplgbjnadipebgfbodplpd"
          target="_blank"
          rel="noopener noreferrer"
        >
          Not connected to extension. Download here.
        </a>}))
     console.log("not connected")
      } else {
        const address= await getAddress()
        


        setState({ ...state, deroBridgeApiRef: deroBridgeApiRef, bridgeInitText:"rpc-bridge connected",userAddress:address });
        console.log("connected")
        console.log(state)
            }
    };

    window.addEventListener("load", load);
    return () => window.removeEventListener("load", load);
  }, []);
  

  return (
    <div>
   
    
   <HashRouter>
    <Navbar address={state.userAddress}/>
    <Routes>
      <Route path="/" element={<Front/>}>
        <Route path="/browse" element={<Browse/>}/>
        <Route path="/listing/:scid" element={<Listing/>}/>
        <Route path="/user/:address" element={<UserPage/>}/>
      </Route>

    </Routes>
   </HashRouter>
   <Outlet/>
   
   </div>
  )
}

export default App
