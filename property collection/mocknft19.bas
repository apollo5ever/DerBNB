Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreiagrbtktq6476sgfbthjr463y4x7kmrzm5fv36pjohkftnu7peeby\",\"bafkreifvi6nausfn7fubeyxttesuega7m6ucxoamg6ybp5guraacptuwfq\",\"bafkreiak7vdyfeuyu5vvodmskqzj2vp3rzveoltmwrsfa5rfmvonqj3bxu\",\"bafkreibao7oyvfpcriekodtjrgytqvvimrfhvzpnn5gapi5x46ywwcblae\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
