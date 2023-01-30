Function Initialize() Uint64
10 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
20 STORE("metadata","{\"photos\":[\"bafkreihsdhfwhq5uxlllvpua54cgwmpv3qrhw73udcnqadegl2uroe7mby\",\"bafkreib65cnnvbn2ijnf5vqvxjsn3vc7zsubcrzohbzhiiwutpljzcziwq\",\"bafkreih4kaahgvfryuvvj4zn5z56wddhzp3hzuo7pf46mitbygfc7nmj3a\",\"bafkreigstoxjyexeyykmenvcnk3qswvdbeqfqmsvtt7wittdxtia7rise4\"]}")
30 RETURN 0
End Function

Function UpdateMetadata(metadata String) Uint64
10 IF ASSETVALUE(SCID()) != 1 THEN GOTO 100
20 STORE("metadata",metadata)
30 SEND_ASSET_TO_ADDRESS(SIGNER(),1,SCID())
99 RETURN 0
100 RETURN 0
End Function
