Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreif4ekj5ziwzw3k4ksabvy5ffyxd4wxmtz5sir622vcvwmiprfvb4a\",\"bafkreihxhfzre4ufv62j7xz2ivwmaiwuhpnlfgxwmrtvzwvtkinwnnzsjy\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
