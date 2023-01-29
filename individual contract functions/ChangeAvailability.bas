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
10 IF LOAD("owner") != ADDRESS_STRING(SIGNER()) THEN GOTO 100
20 STORE(property_id + "_bk_avail", calendar_url)
99 RETURN 0
100 RETURN 1
End Function
