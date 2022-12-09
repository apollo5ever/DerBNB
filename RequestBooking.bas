' This function stores a booking request.  A property owner must confirm a requested booking
' A request will be unique using a unix timestamp arg passed in
'  That timestamp will be the current time when the booking request is made
'  The value of the start/end variables are the dates the person is requesting the booking
' The 'timestamp_key' value should be set by the UI to be Date.now()

Function RequestBooking(property_id String timestamp_key String) String
10 IF timestamp_key == 0 THEN GOTO 100
20 IF ADDRESS_STRING(SIGNER()) == "" THEN GOTO 100
30 IF EXISTS(property_id + "_request_bk_start_" + timestamp_key ) != 0 THEN GOTO 100
40 STORE(property_id + "_request_booker_" + timestamp_key, SIGNER())
50 STORE(property_id + "_request_bk_start_" + timestamp_key, start_timestamp)
60 STORE(property_id + "_request_bk_end_" + timestamp_key, end_timestamp)
99 RETURN 0
100 RETURN 1
End Function