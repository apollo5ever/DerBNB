Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreih4lhakbiigmoly77bhbvhed35ej4pdwmdyidhjkrqy75jzsve7vy\",\"bafkreifxatxhixpqemwen6m4k3sm3zyq7qva2ik2iiodlmea6ewnxoejgi\",\"bafkreic7dhzyg3ajsbhxovvvxmdfdxhgukqxb4tyetgmojr4vw5p424zee\",\"bafkreier3v6fps3mdyolfjdomteyrgbi5ssjpyy7cja2gghwtddxcvrnze\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
