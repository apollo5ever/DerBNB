Function ChangePrice(property_id String, newPrice Uint64) Uint64
10 IF LOAD(property_id+"_owner") != ADDRES_STRING(SIGNER()) THEN GOTO 40
20 STORE(property_id+"_Price", newPrice)
30 RETURN 0
40 RETURN 1
End Function 


' This function simply stores an ipfs url which identifies an off-chain data store
'  that is used by the DerBNB UI to display the days which the owner has deemed the
'  property is available for rent
' Only the owner can update this
' The UI ensures, by retrieving on-chain booking data, that the owner cannot
'  change (remove) the availability on any date where a booking exists on chain

' On-chain booking data will look like the following & will prohibit availability
'  for these dates from being modified in the calendar
' <prop_id>_booker_<counter>: (dero address)
' <prop_id>_bk_start_<counter>:(unix timestamp)
' <prop_id>_bk_end_<counter>:(unix timestamp)
' <prop_id>_bk_last: (integer set by last booking)
' NOTE: <counter> is a unique identifier for that particular booking.

Function ChangeAvailability(property_id String, calendar_url String)
10 IF LOAD(property_id+"_owner") != ADDRESS_STRING(SIGNER()) THEN GOTO 100
20 STORE(property_id + "_bk_avail", calendar_url)
99 RETURN 0
100 RETURN 1
End Function

' This function will need to store the last booking counter so we know how to
'  increment to have a unique suffix for the next booking
'  So needs to load <prop_id>_bk_last, increment by 1, and STORE
'  This SHOULD BE DONE FIRST BEFORE ANYTHING ELSE TO AVOID CONFLICTS, and that value
'  should be held in a DIM so it can be used to create the booking variable names to store
' <prop_id>_booker_<DIM val we just stored>: (dero address)
' <prop_id>_bk_start_<DIM val we just stored>:(unix timestamp)
' <prop_id>_bk_end_<DIM val we just stored>:(unix timestamp)

Function ConfirmBooking(property_id, start_timestamp, end_timestamp)
10 IF LOAD(property_id+"_owner") != ADDRESS_STRING(SIGNER()) THEN GOTO 100
15 DIM booking_id as Uint64
20 IF EXISTS(property_id + "_bk_last") == 0 THEN LET booking_id = 0 ELSE LET booking_id = LOAD(property_id + "_bk_last")
25 booking_id = booking_id + 1
30 STORE(property_id + "_bk_last", booking_id)
40 STORE(property_id + "_booker_" + booking_id, SIGNER())
50 STORE(property_id + "_bk_start_" + booking_id, start_timestamp)
60 STORE(property_id + "_bk_end_" + booking_id, end_timestamp)
99 RETURN 0
100 RETURN 1
End Function

'This function allows renters and owners to rate their interactions with each other

Function RateExperience(String ID, Uint64 Count, Uint64 Renter, Uint64 Owner, Uint64 Property, Uint64 Location, Uint64 Overall) Uint64
10 IF ADRESS_STRING(SIGNER()) == LOAD("booking_"+ID+"_"+Count+"_renter") THEN GOTO 40
20 IF ADRESS_STRING(SIGNER()) == LOAD("booking_"+ID+"_"+Count+"_owner") THEN GOTO 90
30 RETURN 1
40 STORE("booking_"+ID+"_"+Count+"_rating_property",Property)
50 STORE("booking_"+ID+"_"+Count+"_rating_location",Location)
60 STORE("booking_"+ID+"_"+Count+"_rating_owner",Owner)
70 STORE("booking_"+ID+"_"+Count+"_rating_overall",Overall)
80 RETURN 0
90 STORE("booking_"+ID+"_"+Count+"_rating_renter",Renter)
100 RETURN 0
End Function

' This function stores a booking request.  A property owner must confirm a requested booking
' A request will be unique using a unix timestamp arg passed in
'  That timestamp will be the current time when the booking request is made
'  The value of the start/end variables are the dates the person is requesting the booking
' The 'timestamp_key' value should be set by the UI to be Date.now()

Function RequestBooking(property_id String, timestamp_key String) String
10 IF timestamp_key == 0 THEN GOTO 100
20 IF ADDRESS_STRING(SIGNER()) == "" THEN GOTO 100
30 IF EXISTS(property_id + "_request_bk_start_" + timestamp_key ) != 0 THEN GOTO 100
40 STORE(property_id + "_request_booker_" + timestamp_key, SIGNER())
50 STORE(property_id + "_request_bk_start_" + timestamp_key, start_timestamp)
60 STORE(property_id + "_request_bk_end_" + timestamp_key, end_timestamp)
99 RETURN 0
100 RETURN 1
End Function

// this function allows the owner of the property to set the Damage Deposit Amount
// this will need the part that determines what the [nft scid] is going to be

Function SetDamageDepositAmount(property_id String, damage_deposit Uint64) Uint64
10 IF LOAD(property_id+"_owner") != ADDRESS_STRING(SIGNER()) THEN GOTO 40
20 STORE(property_id+"_damage_deposit", damage_deposit)
30 RETURN 0
40 RETURN 1
End Function
