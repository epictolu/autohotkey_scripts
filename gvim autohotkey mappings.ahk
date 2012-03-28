process_gvim_mnemonic(mnemonic)
{
	if mnemonic = nf ; new folder
	{
		send {esc}:silent :{!} mkdir{space}
		return
	}
    if mnemonic = gi ; implementation
    {
        send ^]
        return
    }
	if mnemonic = sp ; split 
	{
		send {esc}:sp{enter}
        send gg^w{down}gg
		return
	}
    if mnemonic = gt ; type
    {
		send :tag{space}
        return
    }
    if mnemonic = lt ; list tabs
    {
        send :tselect{enter}
        return
    }
    if mnemonic = qf ; quick fix 
    {
        send :copen{enter}
        return
    }
    if mnemonic = cqf ; close quick fix
    {
        send :cclose{enter}
        return
    }
    if mnemonic = g ; go (used in quick fix context)
    {
        send {enter}:cclose{enter}
        return
    }
    if mnemonic = uw ; upper window
    {
        send {esc}^w{up}
        return
    }
    if mnemonic = lw ; lower window
    {
        send {esc}^w{down}
        return
    }
    if mnemonic = rw ; right window
    {
        send {esc}^w{right}
        return
    }
    if mnemonic = lw ; left window
    {
        send {esc}^w{left}
        return
    }
    if mnemonic = cf ; change filetype
    {
        send :set ffs=dos | :e {enter}
        return
    }
    if mnemonic = no ; next occurrance
    {
        send +8
        return
    }
    if mnemonic = po ; previous occurrance
    {
        send +3
        return
    }
	if mnemonic = b ; braces
	{
		send {esc}a{{}{enter}{}}{esc}+o
		return
	}
	if mnemonic = s ; save
	{
		send {esc}:w{enter}
		return
	}
	if mnemonic = oh ; open here
	{
		send {esc}:e{space}`%:p:h\
        return
	}
    if mnemonic = o ; open
    {
		send {esc}:e{space}
		return
    }
	if mnemonic = stm ; show tag matches
	{
		send :ts{enter}
		return
	}
	if mnemonic = pfc ; paste from console
	{
		send {esc}{enter}py$upa
		return
	}
	if mnemonic = e ; explore
	{
		send {esc}:NERDTree{enter}
		return
	}
	if mnemonic = f ; find
	{
		send /
		return
	}
	if mnemonic = r ; replace
	{
		send :`%s/
		return
	}
	if mnemonic = ns ; no spaces
	{
		send {esc}:enter string ->{space}
		input, string_to_replace, V, {enter},
			if exit_sequence_exists_in(string_to_replace)
				return
			stringreplace, string_to_replace, string_to_replace, %a_space%, _, all
			send {esc}a%string_to_replace%
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
	if mnemonic = rf ; recent files
	{
		send {esc}:b{space}
		return
	}
	if mnemonic = ar ; add reference
	{
		send {esc}ggOusing{space}
		input, temp, V, `;,
			if exit_sequence_exists_in(temp)
				return
		send {esc}^oa
		return
	}
    if mnemonic = fu ; find usages
    {
        send {esc}:search string ->{space}
        Input, search_string, V, {enter}, 
			if exit_sequence_exists_in(search_string)
				return
            send {esc}:vimgrep /%search_string%/**\*.cs{enter}
            send :copen{enter}
        return
    }
}
