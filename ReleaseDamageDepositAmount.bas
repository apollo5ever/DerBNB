/* 
This function allows the owner of the property to Release ALL or PART of the Damage Deposit Amount 
confirming there is no damage to their property after renter has left
*/

Function ReleaseDamageDepositAmount(property_id Uint64, booking_id Uint64, damage_amount_in_dero Uint64, damage_description String) Uint64
10 IF LOAD(property_id + "_owner") != ADDRESS_STRING(SIGNER()) THEN GOTO 1000 // only the owner of the property can release deposit
20 IF property_id | booking_id == "" THEN GOTO 1000 // fail IF property_id OR booking_id arguments are empty
30 DIM renter as String // the dero address of the renter to send dero deposit back to
40 DIM deposit as Uint64 // the damage_deposit amount that was stored in SetDamageDepositAmount function
50 DIM damage as Uint64 // the amount of damage in dero
60 DIM release as Uint64 // the deposit amount less damage amount to be released back to renter
70 LET renter = LOAD(property_id + "_booker_" + booking_id) // dero address of the renter that was stored in ConfirmBooking function
80 LET deposit = LOAD(property_id + "_" + damage_deposit) // dero amount stored in SetDamageDepositAmount function
90 IF damage_amount_in_dero > deposit THEN GOTO 1000 // damage amount can't be more than deposit amount
100 IF damage_amount_in_dero == "" THEN LET damage = 0 ELSE LET damage = damage_amount_in_dero // default to 0 if damage_amount_in_dero is left blank
110 IF damage > 0 & damage_description == "" THEN GOTO 1000 // a 'damage_description' must be given if the owner decides to withold damage dero
120 LET release = deposit - damage // amount to send back to renter after damages deducted
130 STORE(property_id + "_" + booking_id + "_damage_amount_in_dero", damage_amount_in_dero) // store the damage amount in dero for this particular booking
140 STORE(property_id + "_" + booking_id + "_damage_description", damage_description) // store the description of the damage
150 STORE(property_id + "_" + booking_id + "_damage_renter", renter) // store the dero address of the renter causing the damage
160 SEND_DERO_TO_ADDRESS(renter, release) // release the dero deposit amount back to renter if any
170 IF damage > 0 THEN SEND_DERO_TO_ADDRESS(SIGNER(), damage) // send the damage dero amount back to owner
999 RETURN 0
1000 RETURN 1
End Function