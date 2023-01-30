Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreifn6dqimlxlhz5pfhroat2zkiskjgmtrxxign52e3ojttkfu5x5nu\",\"bafkreiheshn5vnm6qcon3x4lmudxojd2ylckv3ypws43qknadzedb56stq\",\"bafkreigugqgogvowzphcgh54rxlu3wpn2ejbx2o427cbshqfs7z4treywu\",\"bafkreihtwwpmfgkiacirymfwruhfzqy4tlpe5izzpe5ad6yxmm2zrclu3e\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
