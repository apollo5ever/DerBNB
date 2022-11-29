'This function allows renters and owners to rate their interactions with each other
'I'm proposing the following variables:
'[nft scid]_owner:[dero address string form]
'booking_[scid]_[count]_start:[timestamp]
'booking_[scid]_[count]_end:[timestamp]
'booking_[scid]_[count]_renter:[dero address string]
'booking_[scid]_[count]_owner:[dero address string]
'booking_[scid]_[count]_rating_property:[0-5 stars]
'booking_[scid]_[count]_rating_location:[0-5 stars]
'booking_[scid]_[count]_rating_renter:[0-5 stars]
'booking_[scid]_[count]_rating_owner:[0-5 stars]
'booking_[scid]_[count]_rating_overall:[0-5 stars]

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