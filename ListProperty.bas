Function ListProperty(scid String) Uint64
10 IF ASSETVALUE(scid)!=1 THEN GOTO 100
20 STORE(scid+"_owner",ADDRESS_STRING(SIGNER()))
99 RETURN 0
100 RETURN 1
End Function 

Function RemoveProperty(scid String) Uint64
10 IF "_owner" !=1 THEN GOTO 100
20 DELETE(scid+"_owner",ADDRESS_STRING(SIGNER()))
99 RETURN 0
100 RETURN 1
End Function 
