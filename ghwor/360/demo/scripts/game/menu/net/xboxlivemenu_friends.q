
script request_gamer_card 
	<ret> = false
	if gotparam \{device_num}
		<controller_index> = <device_num>
	endif
	if gotparam \{controller_index}
		if netsessionfunc func = canviewprofile controller_index = <controller_index>
			if gotparam \{player_xuid}
				netsessionfunc func = showgamercard params = {player_xuid = <player_xuid> controller_index = <controller_index>}
				<ret> = true
			elseif gotparam \{net_id_first}
				if gotparam \{net_id_second}
					array = []
					addarrayelement array = <array> element = <net_id_first>
					addarrayelement array = <array> element = <net_id_second>
					netsessionfunc func = showgamercard params = {player_xuid = <array> controller_index = <controller_index>}
					<ret> = true
				endif
			endif
		endif
	endif
	return <ret>
endscript
