Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreigezotxxcb6bdl5upmpw7geetcfdh2bbimad6p362hi4qxgktuoui\",\"bafkreibgtl4j2teg45ejqzepi5juae2mwweqilhdfcpagm5vlou6t2co3m\",\"bafkreihezov332afvmm7nvxvgi5gu6gjgiaq5rknvw3iv6mumu3bylm5t4\",\"bafkreibciko4acp3dkiapr6lz7qjbrryu7ie5mfuffdtinzyuwnhheiajm\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
