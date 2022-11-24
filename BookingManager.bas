Function ChangePrice(newPrice Uint64) Uint64
10 IF LOAD("unitOwner") != ADDRES_STRING(SIGNER()) THEN GOTO 40
20 STORE("newPrice", newPrice)
30 RETURN 0
40 RETURN 1
End Function 
