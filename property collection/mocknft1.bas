Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreihvsxghuzt2aukihhzkqzrrlbswl5gwlfxig7w3pfru5gwdbb7mdm\",\"bafkreihf37nz2zhtid4vfyqd2kgyc6h7pl3wwb6zbmovvwrahq4k5xzbpi\",\"bafkreiddbw3hyrmhta7p6b7tqf2thfvaaywl6hke5ojsaclobywx4jr7c4\",\"bafkreidyiyntf22nw7jrzrn2g6xoigyzhkcjkqw2ztkgbbnb6tkcmu544a\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
