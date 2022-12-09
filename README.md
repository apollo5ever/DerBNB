# DerBNB
Okay Class, this is our big group project. We have until February to complete it. You will be marked on participation. There's also some dero to be won. Here's what needs to be done.

## Contracts
### Overview
- We need a contract to manage bookings. This contract stores information about who owns which properties, and the booking data for those properties
- We need a contract for each of the 20 NFTs which will represent properties listed in the Booking Manager Contract
- If we actually buy that land we need an OAO Contract to manage the land

### Booking Manager Contract
#### Functions
- ListProperty
- RequestBooking
- ConfirmBooking
- CancelBooking
- SetDamageDepositAmount
- ReleaseDamageDeposit
- ChangeAvailability
- RateExperience
- ChangePrice
- SetWhitelist

#### Variables
- [nft scid]_owner:[dero address string form]
- booking_[scid]_[count]_start:[timestamp]
- booking_[scid]_[count]_end:[timestamp]
- booking_[scid]_[count]_renter:[dero address string]
- booking_[scid]_[count]_owner:[dero address string]
- booking_[scid]_[count]_rating_property:[0-5 stars]
- booking_[scid]_[count]_rating_location:[0-5 stars]
- booking_[scid]_[count]_rating_renter:[0-5 stars]
- booking_[scid]_[count]_rating_owner:[0-5 stars]
- booking_[scid]_[count]_rating_overall:[0-5 stars]



## UI
- We need a web interface to display pertinent booking data to users in a lovely manner and to allow them to interact with the contract seamlessly
