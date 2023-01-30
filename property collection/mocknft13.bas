Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreicj35gx4w4dgxihrm4sqvm5nmm3wh6gtuqjvor5id4mpagq43tv2e\",\"bafkreig4bdoylooj5u3thsobx26bfurax3upqemn3tivb2ucpgn3vs7kom\",\"bafkreierscqxbxouwiewcl5mlang54snbmi5bw45yhqrsyewjeqejmyawe\",\"bafkreiezckva7au5zcudacpisr6iui4ysjxtemx4inrfedd4f476l5im5i\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
