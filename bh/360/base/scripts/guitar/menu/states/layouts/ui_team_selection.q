
script ui_create_team_selection 
	CreateScreenElement \{parent = root_window
		id = team_selection_id
		type = DescInterface
		desc = 'team_selection'
		z_priority = 0
		event_handlers = [
			{
				pad_back
				generic_event_back
				params = {
					state = UIstate_band_lobby_setup
				}
			}
			{
				pad_choose
				team_selection_continue_to_next_screen
			}
		]}
	team_selection_add_players
	LaunchEvent \{type = focus
		target = team_selection_id}
endscript

script ui_destroy_team_selection 
	if ScreenElementExists \{id = team_selection_id}
		DestroyScreenElement \{id = team_selection_id}
	endif
endscript

script team_selection_add_players 
	if ScreenElementExists \{id = team_selection_id}
		if team_selection_id :Desc_ResolveAlias \{name = alias_team_selection_menu
				param = team_selection_menu_id}
			LaunchEvent type = focus target = <team_selection_menu_id>
			player_idx = 1
			begin
			GetPlayerInfo <player_idx> in_game
			if (<in_game> = 1)
				GetPlayerInfo <player_idx> GamerTag
				name = $<GamerTag>
				StringLength string = <name>
				if (<str_len> = 0)
					FormatText TextName = name qs(0x7bc47761) a = <player_idx>
				endif
				GetPlayerInfo <player_idx> controller
				CreateScreenElement {
					parent = <team_selection_menu_id>
					type = DescInterface
					desc = 'team_selection_player_strip'
					event_handlers = [
						{pad_option team_selection_set_team params = {player = <player_idx>}}
					]
					player_name_text = <name>
					exclusive_device = <controller>
					autoSizeDims = true
				}
				SetPlayerInfo <player_idx> Band = 1
				<id> :Obj_SpawnScript team_selection_set_team_color params = {player = <player_idx>}
				LaunchEvent type = focus target = <id>
			endif
			<player_idx> = (<player_idx> + 1)
			repeat 8
			add_user_control_helper \{text = qs(0x182f0173)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
			add_user_control_helper \{text = qs(0x7c8f861e)
				button = blue
				z = 100000}
		endif
	endif
endscript

script team_selection_set_team 
	GetPlayerInfo <player> Band
	if (<Band> = 8)
		<Band> = 1
	else
		<Band> = (<Band> + 1)
	endif
	SetPlayerInfo <player> Band = <Band>
endscript

script team_selection_set_team_color 
	Obj_GetID
	begin
	GetPlayerInfo <player> Band
	team_selection_get_band_color Band = <Band>
	if <objID> :Desc_ResolveAlias name = alias_player_meter param = hud_player_meter
		<hud_player_meter> :SE_SetProps competitive_stripe_rgba = ($<color_value>)
	endif
	wait \{0.5
		seconds}
	repeat
endscript

script team_selection_get_band_color \{Band = 1}
	FormatText checksumname = color_value 'band_color%d' d = <Band>
	return band_color = ($<color_value>)
endscript

script team_selection_continue_to_next_screen 
	player_idx = 1
	in_game = 0
	band_size = [0 0 0 0 0 0 0 0]
	size = 0
	begin
	<size> = 0
	GetPlayerInfo <player_idx> in_game
	if (<in_game> = 1)
		GetPlayerInfo <player_idx> Band
		SetBandInfo <Band> in_game = 1
		<size> = (<band_size> [(<Band> - 1)])
		SetArrayElement arrayName = band_size index = (<Band> - 1) newValue = (<size> + 1)
	endif
	<player_idx> = (<player_idx> + 1)
	repeat 8
	team_selection_check_for_uniform_band_size band_size = <band_size>
	if (<is_uniform_size> = 1)
		generic_event_choose \{state = uistate_songlist}
	endif
endscript

script team_selection_check_for_uniform_band_size 
	GetArraySize <band_size>
	i = 0
	size = 0
	is_uniform_size = 0
	begin
	if ((<band_size> [<i>]) != 0)
		if (<size> = 0)
			<size> = (<band_size> [<i>])
		else
			if ((<band_size> [<i>]) = <size>)
				<is_uniform_size> = 1
			else
				<is_uniform_size> = 0
				break
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return is_uniform_size = <is_uniform_size>
endscript
