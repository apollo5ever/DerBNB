Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreidnsorxtsawtxrkank4vb7urufoiglytgfdge4dge5ujt2ozkaipm\",\"bafkreigmyb6jx2t6niw44kewnyf2chmfvtle5qnmbublohzqhqk67sl2v4\",\"bafkreih5atfzsddnqeszjdu2mdmi35n4o4vyfyu74vim3b5ne7mknochcm\",\"bafkreihyte5lfpvxgut42dxvdffvfcf5r2odru7bwmoaa3md2lcjalc6me\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
