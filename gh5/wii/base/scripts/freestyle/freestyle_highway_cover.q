freestyle_last_cover_tilt = [
	-1
	-1
	-1
]
freestyle_manual_cover_update = FALSE
freestyle_player_roles = [
	-1
	-1
	-1
]

script freestyle_init_highway_cover 
	freestyle_set_player_roles
	counter = 0
	begin
	freestyle_get_player_param Player = <counter> param = has_highway
	if (<has_highway> = true)
		formatText checksumName = highway_cover_id 'freestyle_highway_cover_%i' i = <counter>
		freestyle_set_player_param Player = <counter> param = highway_cover_id value = <highway_cover_id>
		freestyle_pop_next_available_instrument_player
		highway_player = (<Player> + 1)
		formatText checksumName = freestyle_highway_name 'freestyle_highway_containerp%p' p = <highway_player>
		CreateScreenElement {
			dims = (512.0, 512.0)
			parent = <freestyle_highway_name>
			Pos = (0.0, 0.0)
			id = <highway_cover_id>
			Type = descinterface
			desc = 'freestyle_highway_cover'
			z_priority = -1.0
		}
		<highway_cover_id> :SetTags Player = <Player>
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
endscript

script freestyle_update_highway_cover 
	counter = 0
	begin
	if (($freestyle_player_data [<counter>].has_highway) = true)
		highway_cover_id = ($freestyle_player_data [<counter>].highway_cover_id)
		getguitaractivetilt Player = <counter>
		if ((<active_tilt> != $freestyle_last_cover_tilt [<counter>]) || ($freestyle_manual_cover_update = true))
			<highway_cover_id> :desc_resolvealias Name = alias_highway_top_blue
			<resolved_id> :se_setprops {alpha = 0}
			<highway_cover_id> :desc_resolvealias Name = alias_highway_top_green
			<resolved_id> :se_setprops {alpha = 0}
			<highway_cover_id> :desc_resolvealias Name = alias_highway_top_orange
			<resolved_id> :se_setprops {alpha = 0}
			<highway_cover_id> :desc_resolvealias Name = alias_freestyle_highway_glow_blue
			<resolved_id> :se_setprops {alpha = 0}
			<highway_cover_id> :desc_resolvealias Name = alias_freestyle_highway_glow_green
			<resolved_id> :se_setprops {alpha = 0}
			<highway_cover_id> :desc_resolvealias Name = alias_freestyle_highway_glow_orange
			<resolved_id> :se_setprops {alpha = 0}
			if (<active_tilt> = 0)
				<highway_cover_id> :desc_resolvealias Name = alias_highway_top_orange
				<resolved_id> :se_setprops {alpha = 1}
				<highway_cover_id> :desc_resolvealias Name = alias_freestyle_highway_glow_orange
				<resolved_id> :se_setprops {alpha = 1}
			elseif (<active_tilt> = 1)
				<highway_cover_id> :desc_resolvealias Name = alias_highway_top_blue
				<resolved_id> :se_setprops {alpha = 1}
				<highway_cover_id> :desc_resolvealias Name = alias_freestyle_highway_glow_blue
				<resolved_id> :se_setprops {alpha = 1}
			elseif (<active_tilt> = 2)
				<highway_cover_id> :desc_resolvealias Name = alias_highway_top_green
				<resolved_id> :se_setprops {alpha = 1}
				<highway_cover_id> :desc_resolvealias Name = alias_freestyle_highway_glow_green
				<resolved_id> :se_setprops {alpha = 1}
			endif
			SetArrayElement ArrayName = freestyle_last_cover_tilt index = <counter> NewValue = <active_tilt> globalarray
			if ($freestyle_manual_cover_update = true)
				Change \{freestyle_manual_cover_update = FALSE}
			endif
		endif
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
endscript

script freestyle_set_player_roles 
	counter = 0
	begin
	freestyle_get_player_param Player = <counter> param = has_highway
	if (<has_highway> = true)
		if (($freestyle_player_data [<counter>].instrument) = guitar)
			temp_array = ($freestyle_player_roles)
			SetArrayElement {
				ArrayName = temp_array
				index = 0
				NewValue = <counter>
			}
			Change freestyle_player_roles = <temp_array>
		elseif (($freestyle_player_data [<counter>].instrument) = drums)
			temp_array = ($freestyle_player_roles)
			SetArrayElement {
				ArrayName = temp_array
				index = 1
				NewValue = <counter>
			}
			Change freestyle_player_roles = <temp_array>
		elseif (($freestyle_player_data [<counter>].instrument) = bass)
			temp_array = ($freestyle_player_roles)
			SetArrayElement {
				ArrayName = temp_array
				index = 2
				NewValue = <counter>
			}
			Change freestyle_player_roles = <temp_array>
		endif
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
endscript

script freestyle_pop_next_available_instrument_player 
	counter = 0
	Player = -1
	begin
	if NOT (($freestyle_player_roles [<counter>]) = -1)
		Player = ($freestyle_player_roles [<counter>])
		temp_array = ($freestyle_player_roles)
		SetArrayElement {
			ArrayName = temp_array
			index = <counter>
			NewValue = -1
		}
		Change freestyle_player_roles = <temp_array>
		return Player = <Player>
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
	printf \{qs(0x261a235c)}
	return \{Player = -1}
endscript

script freestyle_deinit_highway_cover 
	counter = 0
	begin
	freestyle_get_player_param Player = <counter> param = has_highway
	if (<has_highway> = true)
		formatText checksumName = highway_cover_id 'freestyle_highway_cover_%i' i = <counter>
		DestroyScreenElement id = <highway_cover_id>
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
endscript
