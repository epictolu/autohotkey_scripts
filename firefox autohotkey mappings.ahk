process_firefox_mnemonic(mnemonic)
{
	if mnemonic = s ; search
	{
		send ogoogle{space}
		return
	}
	if mnemonic = gb ; go back
	{
		send ^o
			return
	}
	if mnemonic = gf ; go forward
	{
		send ^i
			return
	}
	if mnemonic = r ; refresh
	{
		send {f5}
		return
	}
}
