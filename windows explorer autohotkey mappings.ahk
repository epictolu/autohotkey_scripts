process_windows_explorer_mnemonic(mnemonic)
{
    if mnemonic = gu ; go up
    {
        send !{up}
        return
    }
    if mnemonic = gd ; go down
    {
        send !{down}
        return
    }
    if mnemonic = gb ; go back
    {
        send !{left}
        return
    }
    if mnemonic = gf ; go forward
    {
        send !{right}
        return
    }
    if mnemonic = nf ; new folder
    {
        send !fwf
        return
    }
}
