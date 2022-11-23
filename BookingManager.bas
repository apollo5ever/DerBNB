Function SetNewPrice(newPrice Uint64) Uint64
10 IF LOAD("owner") != ADDRESS_STRING(SIGNER()) THEN GOTO 30
20 STORE("newPrice", newPrice)
30 RETURN 1
40 RETURN 0
End Function 

Function ChangePrice() Uint64
10 IF EXISTS ("newPrice") THEN GOTO 20
11 RETURN 1
20 IF LOAD("newPrice") != price THEN GOTO 30
30 STORE("price", newPrice)
40 RETURN 0
End Function