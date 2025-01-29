
script check_to_hide_element 
	begin
	if NOT (ScreenElementExists id = <elementtohide>)
		break
	else
		if NOT (ScreenElementExists id = friendslistinterface)
			<elementtohide> :se_setprops alpha = 0.0 time = 0.1
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript
