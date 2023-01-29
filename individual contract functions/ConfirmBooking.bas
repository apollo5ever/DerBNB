' This function will need to store the last booking counter so we know how to
'  increment to have a unique suffix for the next booking
'  So needs to load <prop_id>_bk_last, increment by 1, and STORE
'  This SHOULD BE DONE FIRST BEFORE ANYTHING ELSE TO AVOID CONFLICTS, and that value
'  should be held in a DIM so it can be used to create the booking variable names to store
' <prop_id>_booker_<DIM val we just stored>: (dero address)
' <prop_id>_bk_start_<DIM val we just stored>:(unix timestamp)
' <prop_id>_bk_end_<DIM val we just stored>:(unix timestamp)

Function ConfirmBooking(property_id, start_timestamp, end_timestamp)
10 DIM booking_id as Uint64
20 IF EXISTS(property_id + "_bk_last") == 0 THEN LET booking_id = 0 ELSE LET booking_id = LOAD(property_id + "_bk_last")
25 booking_id = booking_id + 1
30 STORE(property_id + "_bk_last", booking_id)
40 STORE(property_id + "_booker_" + booking_id, SIGNER())
50 STORE(property_id + "_bk_start_" + booking_id, start_timestamp)
60 STORE(property_id + "_bk_end_" + booking_id, end_timestamp)
99 RETURN 0
End Function