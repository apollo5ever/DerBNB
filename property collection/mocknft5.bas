Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreigqecm2xzyxh3l3tbgh2qcohz4cgi5dgvuaktyg66leao3blw6nwi\",\"bafkreifvmqzvvuxhmz3ul6pbqslvma5xh4jhmam7tccvrrhqodeqelvlxm\",\"bafkreid7dtafxmip6k4taroxbzz4xlzopzscbarjokt6lyarsfessomwge\",\"bafkreicwsizgcequdrmetu72fveiezh7yqrcbi5bcwhwr3yphn6vrlitky\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
