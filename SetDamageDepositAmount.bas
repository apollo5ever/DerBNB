// this function allows the owner of the property to set the Damage Deposit Amount

Function SetDamageDepositAmount(damage_deposit Uint64) Uint64
10 IF LOAD("[nft scid]_owner") != ADDRESS_STRING(SIGNER()) THEN GOTO 40
20 STORE("damage_deposit", damage_deposit)
30 RETURN 0
40 RETURN 1
End Function
