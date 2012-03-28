process_outlook_mnemonic(mnemonic)
{
    if mnemonic = af ; attach file
    {
        send !naf
        return
    }
    if mnemonic = s ; send
    {
        send ^s
        return
    }
    if mnemonic = aa ; accept appointment
    {
        send {enter}!hcs
        return
    }
    if mnemonic = na ; new appointment
    {
        send ^+a
        return
    }
    if mnemonic = n ; new message
    {
        send ^n!hy
        return
    }
	if mnemonic = nf ; new folder
	{
		send !on
		return
	}
	if mnemonic = mv ; move
	{
		send !hmvo
		return
	}
    if mnemonic = r ; reply message
    {
        send ^r
        return
    }
	if mnemonic = ra ; replay all
	{
		send ^+r
		return
	}
	if mnemonic = f ; forward message
	{
		send ^f
		return
	}
}
