Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreigvlq7d2sqvjpvid4s7dxxl2gjjrrjhnlnqvk6l5kiec7gp2fw3pq\",\"bafkreiepazcaiklw2p7par5yys2nb4socprsyn2fujhijop6lqemxgrady\",\"bafkreihmbyfblvhsnmapn7wijjkfdxxqruc7bcuiyl3jsahfwjlkpfhsse\",\"bafkreid5jpjyxylcclaiztzgncv3kspbokiubnduhv4gzgryitjqdizxx4\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
