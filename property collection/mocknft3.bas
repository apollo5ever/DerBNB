Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreih4lhakbiigmoly77bhbvhed35ej4pdwmdyidhjkrqy75jzsve7vy\",\"bafkreiez4gj4nxfhyu4dkydctvfhlwaaexg35o73kavl46zhweomqlgwx4\",\"bafkreifg57hzbhzha4sbxe5h2km3xydxm3ay2weezmbh6wlsh3c6rm3c64\",\"bafkreielkykoeidng62evdo4qx2vksvqniakw5h3u3u2gijxwusuuns76a\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
