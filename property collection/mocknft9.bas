Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreiedxsj5w3xgg5ucuzm2s5ajvd3ygwj2jbigexkgsvd2eafltlt7di\",\"bafkreiaxdh4iyrnzei3pl7r7a3rq36jqxf3hxfzbj2konhpdekjzqq7s54\",\"bafkreias5qeht2ofbar65lzpttvswtiyndk5kfjdomacesphrrykmpwbru\",\"bafkreiacgeskxjdfv27i6nvecfi44fzokfaxctf45szdyxt26rtjaiyxfu\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
