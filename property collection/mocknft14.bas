Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreiarfwjkgn7j6yednn26onrqj5mnlxxnkxeoewkyutjc5kdo54cyc4\",\"bafkreiazgjbrradt25s4pytc27s7puq3y3wsido4f4pv3sshyjhv4gbgqu\",\"bafkreib7mykofj4cbzrsnx7tfmxghestxdonqtoyxcwdkthkgswgfap3su\",\"bafkreicnwq7r7cqc2ceudwbtxomqhip3eehs75ptuv5ag2szi5flersu6a\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
