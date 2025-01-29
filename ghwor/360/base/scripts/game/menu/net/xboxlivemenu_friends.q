
script request_gamer_card 
	<ret> = FALSE
	if GotParam \{device_num}
		<controller_index> = <device_num>
	endif
	if GotParam \{controller_index}
		if NetSessionFunc func = canviewprofile controller_index = <controller_index>
			if GotParam \{player_xuid}
				NetSessionFunc func = showGamerCard params = {player_xuid = <player_xuid> controller_index = <controller_index>}
				<ret> = true
			elseif GotParam \{net_id_first}
				if GotParam \{net_id_second}
					array = []
					AddArrayElement array = <array> element = <net_id_first>
					AddArrayElement array = <array> element = <net_id_second>
					NetSessionFunc func = showGamerCard params = {player_xuid = <array> controller_index = <controller_index>}
					<ret> = true
				endif
			endif
		endif
	endif
	return <ret>
endscript
