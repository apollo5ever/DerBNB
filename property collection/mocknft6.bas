Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreiayx2aouugy5aoq7glqaz7vysdrttl2gv2tllkqxwdlf74d57fljm\",\"bafkreid5xti4ypg465wg23j5mo3acsnyxqxohxxtcdu6ewnwfgqfjy4rbq\",\"bafkreifru4v3ku2rduohe6q7mmhqp55k2n5qtx2fblesdiu67a4aqd54xa\",\"bafkreidtvguvwwrsucnmlaf4bxtgex7lixvs4cdgx7b7bzlny6bw4twdhi\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
