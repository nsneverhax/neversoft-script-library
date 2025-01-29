
script 0x44ee3579 
	GetActiveControllers
	GetArraySize <active_controllers>
	0xfb4a034b = -1
	i = 0
	begin
	if (<active_controllers> [<i>] = 1)
		if CheckForSignIn local controller_index = <i> dont_set_primary
			if ($primary_controller = <i>)
				return \{true}
			elseif (<0xfb4a034b> = -1)
				<0xfb4a034b> = (<i>)
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	if NOT (<0xfb4a034b> = -1)
		Change primary_controller = (<0xfb4a034b>)
		return \{true}
	endif
	return \{FALSE}
endscript

script ui_create_wii_sign_in 
	CreateScreenElement \{parent = root_window
		id = wii_sign_in_menu
		Type = descinterface
		desc = 'wifi_signin'
		player1_text = qs(0x7c104666)
		player2_text = qs(0x573d15a5)
		player3_text = qs(0x4e2624e4)
		player4_text = qs(0x0167b223)
		player1connect_text = qs(0x258c601a)
		player2connect_text = qs(0x258c601a)
		player3connect_text = qs(0x258c601a)
		player4connect_text = qs(0x258c601a)
		player1signin_text = qs(0x00000000)
		player2signin_text = qs(0x00000000)
		player3signin_text = qs(0x00000000)
		player4signin_text = qs(0x00000000)}
	wii_sign_in_get_online_controllers
	<i> = 0
	<num_vocalists> = 0
	<vocalists> = [0 0 0 0]
	begin
	if (<Enabled> [<i>] = 1)
		get_controller_type controller_index = <i>
		if (<controller_type> = vocals)
			<num_vocalists> = (<num_vocalists> + 1)
			SetArrayElement ArrayName = vocalists index = <i> NewValue = 1
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	if (<num_vocalists> > 1)
		<i> = 0
		begin
		if (<vocalists> [<i>] = 1)
			printf qs(0x6867ff53) d = <i>
			SetArrayElement ArrayName = Enabled index = <i> NewValue = 0
		endif
		<i> = (<i> + 1)
		repeat 4
	endif
	last_controller_types = [None None None None]
	active_controllers = [0 0 0 0]
	last_part = [0 0 0 0]
	sign_in_funcs = [wii_sign_in_none_signin wii_sign_in_none_signin wii_sign_in_none_signin wii_sign_in_none_signin]
	wii_sign_in_setup_initial <...>
	printf \{qs(0xfe4d8814)}
	wii_sign_in_menu :se_setprops \{event_handlers = [
			{
				pad_start
				wii_sign_in_commit
			}
			{
				pad_choose
				wii_sign_in_player_choose
			}
			{
				pad_back
				restore_previous_player_bindings_and_leave
			}
			{
				pad_L1
				wii_sign_in_toggle_part
			}
		]}
	original_controllers = [0 0 0 0]
	i = 0
	begin
	getplayerinfo (<i> + 1) controller
	SetArrayElement ArrayName = original_controllers index = <i> NewValue = <controller>
	<i> = (<i> + 1)
	repeat 4
	setplayerinfo \{1
		controller = 0}
	setplayerinfo \{2
		controller = 1}
	setplayerinfo \{3
		controller = 2}
	setplayerinfo \{4
		controller = 3}
	wii_sign_in_menu :SetTags {
		last_active_controllers = <active_controllers>
		last_controller_types = <last_controller_types>
		last_enabled = [0 0 0 0]
		last_part = <last_part>
		original_controllers = <original_controllers>
		vocalist_assigned = -1
		sign_in_funcs = <sign_in_funcs>
	}
	wii_sign_in_refresh_controllers
	<i> = 0
	begin
	if (<Enabled> [<i>] = 1)
		printf qs(0x77faf31e) d = <i>
		wii_sign_in_player_choose device_num = <i>
	endif
	<i> = (<i> + 1)
	repeat 4
	LaunchEvent \{target = wii_sign_in_menu
		Type = focus}
	0xba2ce6e1
	SpawnScriptLater \{wii_sign_in_poll_controllers}
endscript

script 0xba2ce6e1 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x6e1a97ed)
		button = green
		z = 100000}
	GetActiveControllers
	GetArraySize <active_controllers>
	<i> = 0
	begin
	if (<active_controllers> [<i>] = 1)
		if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
			get_controller_type controller_index = <i>
			if (<controller_type> = guitar)
				netoptions :pref_get \{Name = game_modes}
				if NOT (<checksum> = p2_battle)
					add_user_control_helper \{text = qs(0x0d215c11)
						button = 0x99d195c9
						z = 100000
						use_guitar_button = 1}
					break
				endif
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	add_user_control_helper \{text = qs(0x3fc1c076)
		button = start
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script restore_previous_player_bindings_and_leave 
	wii_sign_in_menu :GetSingleTag \{original_controllers}
	setplayerinfo 1 controller = (<original_controllers> [0])
	setplayerinfo 2 controller = (<original_controllers> [1])
	setplayerinfo 3 controller = (<original_controllers> [2])
	setplayerinfo 4 controller = (<original_controllers> [3])
	generic_event_back
endscript

script wii_sign_in_get_online_controllers 
	Enabled = [0 0 0 0]
	i = 0
	begin
	is_controller_online controller_index = <i>
	if (<online> = 1)
		SetArrayElement ArrayName = Enabled index = <i> NewValue = 1
	endif
	<i> = (<i> + 1)
	repeat 4
	return Enabled = <Enabled>
endscript

script ui_destroy_wii_sign_in 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = wii_sign_in_menu}
		DestroyScreenElement \{id = wii_sign_in_menu}
	endif
	0x44ee3579
	KillSpawnedScript \{Name = wii_sign_in_poll_controllers}
endscript

script wii_sign_in_setup_initial 
endscript

script wii_sign_in_player_choose 
	RequireParams \{[
			device_num
		]
		all}
	printf \{qs(0x360e0a28)}
	wii_sign_in_menu :GetSingleTag \{last_enabled}
	wii_sign_in_menu :GetSingleTag \{sign_in_funcs}
	if (<last_enabled> [<device_num>] = 0)
		wii_sign_in_update_player_menu index = <device_num> changetype = choose signin_func = (<sign_in_funcs> [<device_num>]) sign_in = 1
	else
		wii_sign_in_update_player_menu index = <device_num> changetype = choose signin_func = (<sign_in_funcs> [<device_num>]) sign_in = 0
	endif
endscript

script wii_sign_in_commit 
	wii_sign_in_menu :GetTags
	i = 0
	begin
	if (<last_enabled> [<i>] = 1)
		printf qs(0xcf2c273d) s = (<last_controller_types> [<i>])
		NetSessionFunc func = addcontrollers params = {controller = <i>}
		if (<last_controller_types> [<i>] = guitar)
			if (<last_part> [<i>] = 0)
				setplayerinfo (<i> + 1) part = guitar
			else
				setplayerinfo (<i> + 1) part = bass
			endif
		elseif (<last_controller_types> [<i>] = drum)
			printf \{qs(0xd7717ee4)}
			setplayerinfo (<i> + 1) part = drum
		elseif (<last_controller_types> [<i>] = vocals)
			printf \{qs(0xa3667f97)}
			setplayerinfo (<i> + 1) part = vocals
		endif
	else
		printf qs(0x42ebb00d) d = <i>
		NetSessionFunc func = removecontroller params = {controller = <i>}
	endif
	<i> = (<i> + 1)
	repeat 4
	generic_event_back \{data = {
			state = uistate_online
		}}
endscript

script wii_sign_in_update_player_menu 
	RequireParams \{[
			index
			changetype
			signin_func
		]
		all}
	printf \{qs(0x9a4b5fe4)}
	printscriptinfo \{'SCRIPT LOCALS:'}
	Player = (<index> + 1)
	if (<changetype> = connect)
		if (<connected> = 1)
			printf \{qs(0x0177c50b)}
			wii_sign_in_clear_instrument Player = <Player>
			<signin_func> Player = <Player> SignedIn = 0
		else
			printf \{qs(0x12e861f2)}
			wii_sign_in_clear_instrument Player = <Player>
			wii_sign_in_disconnect Player = <Player>
		endif
	elseif (<changetype> = controller)
		printf \{qs(0x5b89e490)}
		wii_sign_in_clear_instrument Player = <Player>
		<signin_func> Player = <Player> SignedIn = 0
	elseif (<changetype> = choose)
		if (<signin_func> = wii_sign_in_none_signin)
			printf \{qs(0x32d23ca4)}
			return
		endif
		printf \{qs(0xe601ecd7)}
		wii_sign_in_menu :GetSingleTag \{last_enabled}
		printstruct <...>
		if (<sign_in> = 1)
			printf qs(0x26fdb752) d = <index>
			SetArrayElement ArrayName = last_enabled index = <index> NewValue = 1
			<signin_func> Player = <Player> SignedIn = 1
		else
			printf qs(0x96914609) d = <index>
			SetArrayElement ArrayName = last_enabled index = <index> NewValue = 0
			<signin_func> Player = <Player> SignedIn = 0
		endif
		wii_sign_in_menu :SetTags last_enabled = <last_enabled>
	endif
	0xba2ce6e1
endscript

script wii_sign_in_poll_controllers 
	begin
	wii_sign_in_refresh_controllers
	Wait \{1
		gameframes}
	repeat
endscript

script wii_sign_in_refresh_controllers 
	GetActiveControllers
	wii_sign_in_menu :GetSingleTag \{last_active_controllers}
	wii_sign_in_menu :GetSingleTag \{last_controller_types}
	wii_sign_in_menu :GetSingleTag \{sign_in_funcs}
	wii_sign_in_menu :GetSingleTag \{last_part}
	i = 0
	should_change = 0
	begin
	if NOT (<active_controllers> [<i>] = <last_active_controllers> [<i>])
		if (<active_controllers> [<i>] = 0)
			SetArrayElement ArrayName = last_controller_types index = <i> NewValue = None
			<controller_type> = None
			wii_sign_in_update_player_menu index = <i> changetype = choose signin_func = (<sign_in_funcs> [<i>]) sign_in = 0
			SetArrayElement ArrayName = sign_in_funcs index = <i> NewValue = wii_sign_in_none_signin
		else
			wii_sign_in_get_controller_type controller_index = <i>
			SetArrayElement ArrayName = last_controller_types index = <i> NewValue = <controller_type>
			wii_sign_in_get_signin_func instrument = <controller_type> part = (<last_part> [<i>])
			SetArrayElement ArrayName = sign_in_funcs index = <i> NewValue = <signin_func>
			if (<controller_type> = controller)
				printf qs(0x2e6fede3) d = <i>
				wii_sign_in_menu :GetSingleTag \{last_enabled}
				wii_sign_in_set_mic_text Player = (<i> + 1)
				SetArrayElement ArrayName = last_enabled index = <i> NewValue = 0
				wii_sign_in_menu :SetTags last_enabled = <last_enabled>
			endif
		endif
		wii_sign_in_update_player_menu index = <i> changetype = connect connected = (<active_controllers> [<i>]) signin_func = (<sign_in_funcs> [<i>])
	endif
	if (<active_controllers> [<i>] = 1)
		wii_sign_in_get_controller_type controller_index = <i>
		if NOT (<last_controller_types> [<i>] = <controller_type>)
			SetArrayElement ArrayName = last_controller_types index = <i> NewValue = <controller_type>
			wii_sign_in_get_signin_func instrument = <controller_type> part = (<last_part> [<i>])
			SetArrayElement ArrayName = sign_in_funcs index = <i> NewValue = <signin_func>
			wii_sign_in_update_player_menu index = <i> changetype = controller data = <controller_type> signin_func = <signin_func>
			if (<controller_type> = controller)
				printf qs(0x2e6fede3) d = <i>
				wii_sign_in_menu :GetSingleTag \{last_enabled}
				wii_sign_in_set_mic_text Player = (<i> + 1)
				SetArrayElement ArrayName = last_enabled index = <i> NewValue = 0
				wii_sign_in_menu :SetTags last_enabled = <last_enabled>
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	wii_sign_in_menu :SetTags last_active_controllers = <active_controllers>
	wii_sign_in_menu :SetTags last_controller_types = <last_controller_types>
	wii_sign_in_menu :SetTags sign_in_funcs = <sign_in_funcs>
endscript

script wii_sign_in_drum_signin \{Player = 1
		SignedIn = 0}
	wiisigningetplayerparams Player = <Player>
	if (<SignedIn> = 1)
		instr_avail = 0
	else
		if wii_sign_in_is_inst_avail instrument = drum controller = (<Player> -1)
			instr_avail = 1
		else
			instr_avail = 0
		endif
	endif
	formatText checksumName = player_off_alpha 'Player%dDrumOff_alpha' d = <Player>
	formatText checksumName = player_on_alpha 'Player%dDrum_alpha' d = <Player>
	prop_struct = {}
	setstructureparam struct_name = prop_struct param = <player_off_alpha> value = 1
	setstructureparam struct_name = prop_struct param = <player_on_alpha> value = 1
	wii_sign_in_menu :se_setprops {
		player1drumavailable_alpha = <instr_avail>
		player2drumavailable_alpha = <instr_avail>
		player3drumavailable_alpha = <instr_avail>
		player4drumavailable_alpha = <instr_avail>
		<prop_struct>
	}
	prop_struct = {}
	if (<SignedIn> = 1)
		setstructureparam struct_name = prop_struct param = <player_off_alpha> value = 0
		wii_sign_in_menu :se_setprops {
			<prop_struct>
		}
	else
		setstructureparam struct_name = prop_struct param = <player_on_alpha> value = 0
		wii_sign_in_menu :se_setprops {
			<prop_struct>
		}
	endif
	wii_sign_in_player_signin Player = <Player> SignedIn = <SignedIn> instrument = drums
endscript

script wii_sign_in_vocal_signin \{Player = 1
		SignedIn = 0}
	printf \{qs(0xe3fac52e)}
	wiisigningetplayerparams Player = <Player>
	if (<SignedIn> = 1)
		instr_avail = 0
		wii_sign_in_menu :SetTags vocalist_assigned = (<Player> -1)
	else
		wii_sign_in_menu :SetTags \{vocalist_assigned = -1}
		if wii_sign_in_is_inst_avail instrument = vocals controller = (<Player> -1)
			instr_avail = 1
		else
			instr_avail = 0
		endif
	endif
	formatText checksumName = player_off_alpha 'Player%dVocalOff_alpha' d = <Player>
	formatText checksumName = player_on_alpha 'Player%dVocal_alpha' d = <Player>
	prop_struct = {}
	setstructureparam struct_name = prop_struct param = <player_off_alpha> value = 1
	setstructureparam struct_name = prop_struct param = <player_on_alpha> value = 1
	wii_sign_in_menu :se_setprops {
		player1vocalavailable_alpha = <instr_avail>
		player2vocalavailable_alpha = <instr_avail>
		player3vocalavailable_alpha = <instr_avail>
		player4vocalavailable_alpha = <instr_avail>
		<prop_struct>
	}
	prop_struct = {}
	if (<SignedIn> = 1)
		setstructureparam struct_name = prop_struct param = <player_off_alpha> value = 0
		wii_sign_in_menu :se_setprops {
			<prop_struct>
		}
	else
		setstructureparam struct_name = prop_struct param = <player_on_alpha> value = 0
		wii_sign_in_menu :se_setprops {
			<prop_struct>
		}
	endif
	wii_sign_in_player_signin Player = <Player> SignedIn = <SignedIn> instrument = controller
endscript

script wii_sign_in_bass_signin \{Player = 1
		SignedIn = 0}
	printf \{qs(0x7ef4ec1d)}
	wiisigningetplayerparams Player = <Player>
	if (<SignedIn> = 1)
		instr_avail = 0
	else
		if wii_sign_in_is_inst_avail instrument = guitar part = 1 controller = (<Player> -1)
			instr_avail = 1
		else
			instr_avail = 0
		endif
	endif
	formatText checksumName = player_off_alpha 'Player%dBassOff_alpha' d = <Player>
	formatText checksumName = player_on_alpha 'Player%dBass_alpha' d = <Player>
	prop_struct = {}
	setstructureparam struct_name = prop_struct param = <player_off_alpha> value = 1
	setstructureparam struct_name = prop_struct param = <player_on_alpha> value = 1
	wii_sign_in_menu :se_setprops {
		player1bassavailable_alpha = <instr_avail>
		player2bassavailable_alpha = <instr_avail>
		player3bassavailable_alpha = <instr_avail>
		player4bassavailable_alpha = <instr_avail>
		<prop_struct>
	}
	prop_struct = {}
	if (<SignedIn> = 1)
		setstructureparam struct_name = prop_struct param = <player_off_alpha> value = 0
		wii_sign_in_menu :se_setprops {
			<prop_struct>
		}
	else
		setstructureparam struct_name = prop_struct param = <player_on_alpha> value = 0
		wii_sign_in_menu :se_setprops {
			<prop_struct>
		}
	endif
	wii_sign_in_player_signin Player = <Player> SignedIn = <SignedIn> instrument = guitar
endscript

script wii_sign_in_guitar_signin \{Player = 1
		SignedIn = 0}
	printf \{qs(0x130e4527)}
	wiisigningetplayerparams Player = <Player>
	if (<SignedIn> = 1)
		instr_avail = 0
	else
		if wii_sign_in_is_inst_avail instrument = guitar part = 0 controller = (<Player> -1)
			instr_avail = 1
		else
			instr_avail = 0
		endif
	endif
	formatText checksumName = player_off_alpha 'Player%dGuitarOff_alpha' d = <Player>
	formatText checksumName = player_on_alpha 'Player%dGuitar_alpha' d = <Player>
	prop_struct = {}
	setstructureparam struct_name = prop_struct param = <player_off_alpha> value = 1
	setstructureparam struct_name = prop_struct param = <player_on_alpha> value = 1
	wii_sign_in_menu :se_setprops {
		player1guitaravailable_alpha = <instr_avail>
		player2guitaravailable_alpha = <instr_avail>
		player3guitaravailable_alpha = <instr_avail>
		player4guitaravailable_alpha = <instr_avail>
		<prop_struct>
	}
	prop_struct = {}
	if (<SignedIn> = 1)
		setstructureparam struct_name = prop_struct param = <player_off_alpha> value = 0
		wii_sign_in_menu :se_setprops {
			<prop_struct>
		}
	else
		setstructureparam struct_name = prop_struct param = <player_on_alpha> value = 0
		wii_sign_in_menu :se_setprops {
			<prop_struct>
		}
	endif
	wii_sign_in_player_signin Player = <Player> SignedIn = <SignedIn> instrument = guitar
endscript

script wii_sign_in_is_inst_avail 
	RequireParams \{[
			instrument
			part
			controller
		]}
	wii_sign_in_menu :GetSingleTag \{last_enabled}
	wii_sign_in_menu :GetSingleTag \{last_controller_types}
	wii_sign_in_menu :GetSingleTag \{last_part}
	i = 0
	begin
	if NOT (<i> = <controller>)
		if (<instrument> = <last_controller_types> [<i>])
			if (<last_enabled> [<i>] = 1)
				if (<instrument> = guitar)
					if (<part> = <last_part> [<i>])
						return \{FALSE}
					endif
				else
					return \{FALSE}
				endif
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	return \{true}
endscript

script wii_sign_in_clear_instrument \{Player = 1}
	printf qs(0x00f2b610) d = <Player>
	if (<Player> = 1)
		wii_sign_in_menu :se_setprops \{player1drum_alpha = 0
			player1vocal_alpha = 0
			player1bass_alpha = 0
			player1guitar_alpha = 0
			player1drumoff_alpha = 0
			player1vocaloff_alpha = 0
			player1bassoff_alpha = 0
			player1guitaroff_alpha = 0}
	elseif (<Player> = 2)
		wii_sign_in_menu :se_setprops \{player2drum_alpha = 0
			player2vocal_alpha = 0
			player2bass_alpha = 0
			player2guitar_alpha = 0
			player2drumoff_alpha = 0
			player2vocaloff_alpha = 0
			player2bassoff_alpha = 0
			player2guitaroff_alpha = 0}
	elseif (<Player> = 3)
		wii_sign_in_menu :se_setprops \{player3drum_alpha = 0
			player3vocal_alpha = 0
			player3bass_alpha = 0
			player3guitar_alpha = 0
			player3drumoff_alpha = 0
			player3vocaloff_alpha = 0
			player3bassoff_alpha = 0
			player3guitaroff_alpha = 0}
	elseif (<Player> = 4)
		wii_sign_in_menu :se_setprops \{player4drum_alpha = 0
			player4vocal_alpha = 0
			player4bass_alpha = 0
			player4guitar_alpha = 0
			player4drumoff_alpha = 0
			player4vocaloff_alpha = 0
			player4bassoff_alpha = 0
			player4guitaroff_alpha = 0}
	endif
endscript

script wii_sign_in_reset_text \{Player = 1}
	printf \{qs(0x26480ebc)}
	if (<Player> = 1)
		wii_sign_in_menu :se_setprops \{player1connect_text = qs(0x258c601a)
			player1signin_text = qs(0x00000000)}
	elseif (<Player> = 2)
		wii_sign_in_menu :se_setprops \{player2connect_text = qs(0x258c601a)
			player2signin_text = qs(0x00000000)}
	elseif (<Player> = 3)
		wii_sign_in_menu :se_setprops \{player3connect_text = qs(0x258c601a)
			player3signin_text = qs(0x00000000)}
	elseif (<Player> = 4)
		wii_sign_in_menu :se_setprops \{player4connect_text = qs(0x258c601a)
			player4signin_text = qs(0x00000000)}
	endif
endscript

script wii_sign_in_set_mic_text \{Player = 1}
	printf \{qs(0x26480ebc)}
	if (<Player> = 1)
		wii_sign_in_menu :se_setprops \{player1connect_text = qs(0x99ee318b)
			player1signin_text = qs(0x00000000)}
	elseif (<Player> = 2)
		wii_sign_in_menu :se_setprops \{player2connect_text = qs(0x99ee318b)
			player2signin_text = qs(0x00000000)}
	elseif (<Player> = 3)
		wii_sign_in_menu :se_setprops \{player3connect_text = qs(0x99ee318b)
			player3signin_text = qs(0x00000000)}
	elseif (<Player> = 4)
		wii_sign_in_menu :se_setprops \{player4connect_text = qs(0x99ee318b)
			player4signin_text = qs(0x00000000)}
	endif
endscript

script wii_sign_in_disconnect \{Player = 1}
	printf \{qs(0x364e5779)}
	wii_sign_in_clear_instrument Player = <Player>
	wii_sign_in_reset_text Player = <Player>
endscript

script wii_sign_in_toggle_part 
	wii_sign_in_menu :GetTags
	if NOT (<last_controller_types> [<device_num>] = guitar)
		return
	endif
	resignin = 0
	if (<last_enabled> [<device_num>] = 1)
		<resignin> = 1
		wii_sign_in_player_choose device_num = <device_num>
	endif
	if (<last_part> [<device_num>] = 0)
		netoptions :pref_get \{Name = game_modes}
		if NOT (<checksum> = p2_battle)
			SetArrayElement ArrayName = last_part index = <device_num> NewValue = 1
		endif
	else
		SetArrayElement ArrayName = last_part index = <device_num> NewValue = 0
	endif
	wii_sign_in_get_signin_func instrument = (<last_controller_types> [<device_num>]) part = (<last_part> [<device_num>])
	SetArrayElement ArrayName = sign_in_funcs index = <device_num> NewValue = <signin_func>
	SetArrayElement ArrayName = last_enabled index = <device_num> NewValue = 0
	wii_sign_in_menu :SetTags {
		last_part = <last_part>
		sign_in_funcs = <sign_in_funcs>
		last_enabled = <last_enabled>
	}
	wii_sign_in_update_player_menu index = <device_num> changetype = controller signin_func = <signin_func>
	if (<resignin> = 1)
		wii_sign_in_player_choose device_num = <device_num>
	endif
endscript

script wii_sign_in_player_signin \{Player = 1
		SignedIn = 1
		instrument = guitar}
	printf \{qs(0x4966b476)}
	if (<SignedIn> = 1)
		switch <instrument>
			case guitar
			signin_text = qs(0x7ba6497d)
			case drums
			signin_text = qs(0x00b30232)
			case controller
			signin_text = qs(0x354ba224)
		endswitch
	else
		switch <instrument>
			case guitar
			signin_text = qs(0x59301dac)
			case drums
			signin_text = qs(0xe815baca)
			case controller
			signin_text = qs(0x5298caaa)
		endswitch
	endif
	if (<Player> = 1)
		wii_sign_in_menu :se_setprops {
			player1connect_text = qs(0x00000000)
			player1signin_text = <signin_text>
		}
	elseif (<Player> = 2)
		wii_sign_in_menu :se_setprops {
			player2connect_text = qs(0x00000000)
			player2signin_text = <signin_text>
		}
	elseif (<Player> = 3)
		wii_sign_in_menu :se_setprops {
			player3connect_text = qs(0x00000000)
			player3signin_text = <signin_text>
		}
	elseif (<Player> = 4)
		wii_sign_in_menu :se_setprops {
			player4connect_text = qs(0x00000000)
			player4signin_text = <signin_text>
		}
	endif
endscript

script wiisigningetplayerparams \{Player = 1}
	printf \{qs(0xe5356893)}
	<player1> = 0
	<player2> = 0
	<player3> = 0
	<player4> = 0
	if (<Player> = 1)
		<player1> = 1
	elseif (<Player> = 2)
		<player2> = 1
	elseif (<Player> = 3)
		<player3> = 1
	elseif (<Player> = 4)
		<player4> = 1
	endif
	return player1 = <player1> player2 = <player2> player3 = <player3> player4 = <player4>
endscript

script wii_sign_in_none_signin 
	printf \{qs(0x17324e9a)}
endscript

script wii_sign_in_get_controller_type 
	RequireParams \{[
			controller_index
		]}
	get_controller_type controller_index = <controller_index>
	switch <controller_type>
		case vocals
		wii_sign_in_menu :GetSingleTag \{vocalist_assigned}
		if NOT (<vocalist_assigned> = -1)
			if NOT (<vocalist_assigned> = <controller_index>)
				<controller_type> = controller
			endif
		endif
	endswitch
	return controller_type = <controller_type>
endscript

script wii_sign_in_get_signin_func 
	printf \{qs(0xedab4605)}
	RequireParams \{[
			instrument
			part
		]
		all}
	func = wii_sign_in_none_signin
	switch <instrument>
		case guitar
		if (<part> = 0)
			<func> = wii_sign_in_guitar_signin
		else
			<func> = wii_sign_in_bass_signin
		endif
		case drum
		<func> = wii_sign_in_drum_signin
		case vocals
		<func> = wii_sign_in_vocal_signin
	endswitch
	return signin_func = <func>
endscript
