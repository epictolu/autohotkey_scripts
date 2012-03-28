process_visual_studio_mnemonic(mnemonic)
{
	if mnemonic = c ; close
	{
		send !fc
		return
	}
	if mnemonic = bp ; break point
	{
		send {f9}
		return
	}
	if mnemonic = d ; debug
	{
		send !ds
		return
	}
	if mnemonic = sd ; stop debugging
	{
		send !de
		return
	}
	if mnemonic = af ; add folder
	{
		send !pd
		return
	}
	if mnemonic = ai ; add item
	{
		send !pw
		return
	}
	if mnemonic = ap ; add project
	{
		send !fdn
		return
	}
	if mnemonic = ar ; add reference
	{
		send !pr
		return
	}
	if mnemonic = se ; solution explorer
	{
		send !^l
		return
	}
	if mnemonic = b ; build
	{
		send !br
		return
	}
	if mnemonic = pd ; page down
	{
		send ^{PgDn}
		return
	}
	if mnemonic = pu ; page up
	{
		send ^{PgUp}
		return
	}
	if mnemonic = o ; open
	{
		send !fop
		return
	}
}
