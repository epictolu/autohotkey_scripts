process_powershell_mnemonic(mnemonic)
{
    if mnemonic = rs ; reverse search
    {
        send {f8}
        return
    }
	if mnemonic = nw ; new window
	{ 
		send !{f4}{LWin}
		sleep 100
		send console{enter}
		return
	}
}
