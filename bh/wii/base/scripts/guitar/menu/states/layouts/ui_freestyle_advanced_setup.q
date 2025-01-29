0xe02a5559 = 0
0xedcf34b9 = [
	FALSE
	FALSE
	FALSE
	FALSE
]

script ui_create_freestyle_advanced_setup 
	Change \{0xe02a5559 = 0}
	if NOT GotParam \{ds_only}
		freestyle_advanced_setup_user_control_display \{Band}
	else
		freestyle_advanced_setup_user_control_display \{ds_only}
	endif
	CreateScreenElement \{dims = (1280.0, 720.0)
		pos_anchor = [
			left
			top
		]
		Pos = (0.0, 0.0)
		parent = root_window
		id = freestyle_advanced_setup_tree
		Type = descinterface
		desc = 'freestyle_advanced_setup_tree_v2'
		font = fontgrid_text_a1}
	freestyle_advanced_setup_tree :desc_resolvealias \{Name = 0x8db0944c}
	<resolved_id> :desc_resolvealias Name = 0x220750d1
	<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
	freestyle_advanced_setup_tree :desc_resolvealias \{Name = 0x220750d1}
	<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
	if GotParam \{ds_only}
		event_handlers = [
			{pad_up NULL}
			{pad_down NULL}
			{pad_start freestyle_transfer_to_game}
			{pad_back generic_event_back}
		]
	else
		event_handlers = [
			{pad_up NULL}
			{pad_down NULL}
			{pad_start freestyle_transfer_to_game}
			{pad_option freestyle_advanced_setup_transfer_to_indiv}
			{pad_back generic_event_back}
		]
	endif
	freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_menu}
	<resolved_id> :se_setprops {
		event_handlers = <event_handlers>
	}
	freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_option_song_sections}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_option_focus}
			{focus freestyle_advanced_setup_focus_checkbox}
			{unfocus freestyle_option_unfocus}
			{unfocus freestyle_advanced_setup_unfocus_checkbox}
			{pad_choose freestyle_advanced_setup_option_toggle params = {id = <resolved_id> option = song_sections}}
		]
		alpha = 0.5
	}
	<resolved_id> :SetTags toggle = OFF
	if NOT (($freestyle_recording_mode) = overdub)
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_option_endless}
		<resolved_id> :se_setprops {
			event_handlers = [
				{focus freestyle_option_focus}
				{focus freestyle_advanced_setup_focus_checkbox}
				{unfocus freestyle_option_unfocus}
				{unfocus freestyle_advanced_setup_unfocus_checkbox}
				{pad_choose freestyle_advanced_setup_option_toggle params = {id = <resolved_id> option = endless}}
			]
			alpha = 0.5
		}
		<resolved_id> :SetTags toggle = OFF
	else
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_setup_band_option_endless}
		DestroyScreenElement id = <resolved_id>
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_option_endless}
		DestroyScreenElement id = <resolved_id>
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = dark_blue_line1}
		DestroyScreenElement id = <resolved_id>
	endif
	if freestyle_is_instrument_ai \{instrument = guitar}
		guitar_ai = true
	else
		guitar_ai = FALSE
	endif
	if freestyle_is_instrument_ai \{instrument = bass}
		bass_ai = true
	else
		bass_ai = FALSE
	endif
	if freestyle_is_instrument_ai \{instrument = drums}
		drums_ai = true
	else
		drums_ai = FALSE
	endif
	if ((<guitar_ai> = true) && ($freestyle_recording_mode != overdub))
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_option_guitar_ai}
		<resolved_id> :se_setprops {
			event_handlers = [
				{focus freestyle_option_focus}
				{focus freestyle_advanced_setup_focus_checkbox}
				{unfocus freestyle_option_unfocus}
				{unfocus freestyle_advanced_setup_unfocus_checkbox}
				{pad_choose freestyle_advanced_setup_option_toggle params = {id = <resolved_id> option = guitar_ai}}
			]
			alpha = 0.5
		}
		<resolved_id> :SetTags toggle = OFF
	else
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_setup_band_option_guitar_ai}
		DestroyScreenElement id = <resolved_id>
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_option_guitar_ai}
		DestroyScreenElement id = <resolved_id>
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = dark_blue_line2}
		DestroyScreenElement id = <resolved_id>
	endif
	if ((<bass_ai> = true) && ($freestyle_recording_mode != overdub))
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_option_bass_ai}
		<resolved_id> :se_setprops {
			event_handlers = [
				{focus freestyle_option_focus}
				{focus freestyle_advanced_setup_focus_checkbox}
				{unfocus freestyle_option_unfocus}
				{unfocus freestyle_advanced_setup_unfocus_checkbox}
				{pad_choose freestyle_advanced_setup_option_toggle params = {id = <resolved_id> option = bass_ai}}
			]
			alpha = 0.5
		}
		<resolved_id> :SetTags toggle = OFF
	else
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_setup_band_option_bass_ai}
		DestroyScreenElement id = <resolved_id>
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_option_bass_ai}
		DestroyScreenElement id = <resolved_id>
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = dark_blue_line3}
		DestroyScreenElement id = <resolved_id>
	endif
	if ((<drums_ai> = true) && ($freestyle_recording_mode != overdub))
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_option_drums_ai}
		<resolved_id> :se_setprops {
			event_handlers = [
				{focus freestyle_option_focus}
				{focus freestyle_advanced_setup_focus_checkbox}
				{unfocus freestyle_option_unfocus}
				{unfocus freestyle_advanced_setup_unfocus_checkbox}
				{pad_choose freestyle_advanced_setup_option_toggle params = {id = <resolved_id> option = drums_ai}}
			]
			alpha = 0.5
		}
		<resolved_id> :SetTags toggle = OFF
	else
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_setup_band_option_drums_ai}
		DestroyScreenElement id = <resolved_id>
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_option_drums_ai}
		DestroyScreenElement id = <resolved_id>
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = dark_blue_line4}
		DestroyScreenElement id = <resolved_id>
	endif
	0x8e4596ba
	freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_menu}
	LaunchEvent Type = focus target = <resolved_id>
	if NOT GotParam \{ds_only}
		counter = 0
		0xe02a5559 = 0
		begin
		if NOT (($freestyle_player_data [<counter>].controller) = -1)
			formatText checksumName = desc_id 'alias_indiv_%i' i = <counter>
			freestyle_advanced_setup_tree :desc_resolvealias Name = <desc_id>
			desc_id = <resolved_id>
			<desc_id> :SetTags Player = <counter>
			<desc_id> :desc_resolvealias Name = alias_controller_id_container
			freestyle_spawn_controller_lights {
				parent = <resolved_id>
				controller = ($freestyle_player_data [<counter>].controller)
				Player = <counter>
				state = freestyle_advanced_setup
				z_priority = 40
			}
			mii_index = ($freestyle_player_data [<counter>].mii_index)
			mii_database = ($freestyle_player_data [<counter>].mii_database)
			formatText checksumName = mii_face_id 'mii_face_%i' i = <counter>
			if NOT (<mii_database> = None)
				CreateScreenElement {
					id = <mii_face_id>
					Type = miiiconelement
					parent = <resolved_id>
					pos_anchor = [center center]
					just = [center center]
					Pos = (0.0, -50.0)
					z_priority = 40
					mii_expression = Normal
					mii_bgcolor = $freestyle_mii_on_bg
					mii_dims = (128.0, 128.0)
					mii_index = <mii_index>
					mii_database = <mii_database>
				}
			else
				CreateScreenElement {
					id = <mii_face_id>
					Type = SpriteElement
					parent = <resolved_id>
					pos_anchor = [center center]
					just = [center center]
					dims = (128.0, 128.0)
					Pos = (0.0, -50.0)
					z_priority = 40
					texture = freestylemiirandomselected
				}
			endif
			<desc_id> :desc_resolvealias Name = alias_freestyle_advanced_setup_options_sorter
			<resolved_id> :se_setprops {
				exclusive_device = ($freestyle_player_data [<counter>].controller)
			}
			formatText checksumName = handler_id 'auxilliary_pad_back_handler_%i' i = <counter>
			CreateScreenElement {
				id = <handler_id>
				exclusive_device = ($freestyle_player_data [<counter>].controller)
				Type = ContainerElement
				parent = freestyle_advanced_setup_tree
				event_handlers = [
					{pad_back freestyle_advanced_setup_refocus_indiv_setup params = {menu_index = <counter>}}
				]
			}
			<desc_id> :SetTags is_finished = FALSE
			<desc_id> :desc_resolvealias Name = alias_freestyle_toggle_helper_notes
			<resolved_id> :se_setprops {
				exclusive_device = ($freestyle_player_data [<counter>].controller)
				event_handlers = [
					{focus freestyle_option_focus}
					{focus freestyle_advanced_setup_focus_checkbox}
					{unfocus freestyle_option_unfocus}
					{unfocus freestyle_advanced_setup_unfocus_checkbox}
					{pad_choose freestyle_advanced_setup_option_toggle params = {id = <resolved_id> option = gem_track_visible Player = <counter>}}
				]
				alpha = 0.5
			}
			<resolved_id> :SetTags toggle = OFF
			<desc_id> :desc_resolvealias Name = alias_freestyle_toggle_metronome_visual
			<resolved_id> :se_setprops {
				exclusive_device = ($freestyle_player_data [<counter>].controller)
				event_handlers = [
					{focus freestyle_option_focus}
					{focus freestyle_advanced_setup_focus_checkbox}
					{unfocus freestyle_option_unfocus}
					{unfocus freestyle_advanced_setup_unfocus_checkbox}
					{pad_choose freestyle_advanced_setup_option_toggle params = {id = <resolved_id> option = metronome_visual Player = <counter>}}
				]
				alpha = 0.5
			}
			<resolved_id> :SetTags toggle = OFF
			<desc_id> :desc_resolvealias Name = alias_freestyle_toggle_metronome_audio
			<resolved_id> :se_setprops {
				exclusive_device = ($freestyle_player_data [<counter>].controller)
				event_handlers = [
					{focus freestyle_option_focus}
					{focus freestyle_advanced_setup_focus_checkbox}
					{unfocus freestyle_option_unfocus}
					{unfocus freestyle_advanced_setup_unfocus_checkbox}
					{pad_choose freestyle_advanced_setup_option_toggle params = {id = <resolved_id> option = metronome_audio Player = <counter>}}
				]
				alpha = 0.5
			}
			<resolved_id> :SetTags toggle = OFF
			<desc_id> :desc_resolvealias Name = alias_freestyle_toggle_metronome_rumble
			<resolved_id> :se_setprops {
				exclusive_device = ($freestyle_player_data [<counter>].controller)
				event_handlers = [
					{focus freestyle_option_focus}
					{focus freestyle_advanced_setup_focus_checkbox}
					{unfocus freestyle_option_unfocus}
					{unfocus freestyle_advanced_setup_unfocus_checkbox}
					{pad_choose freestyle_advanced_setup_option_toggle params = {id = <resolved_id> option = metronome_rumble Player = <counter>}}
				]
				alpha = 0.5
			}
			<resolved_id> :SetTags toggle = OFF
			<desc_id> :desc_resolvealias Name = alias_freestyle_toggle_beat_lines
			<resolved_id> :se_setprops {
				exclusive_device = ($freestyle_player_data [<counter>].controller)
				event_handlers = [
					{focus freestyle_option_focus}
					{focus freestyle_advanced_setup_focus_checkbox}
					{unfocus freestyle_option_unfocus}
					{unfocus freestyle_advanced_setup_unfocus_checkbox}
					{pad_choose freestyle_advanced_setup_option_toggle params = {id = <resolved_id> option = beat_lines Player = <counter>}}
				]
				alpha = 0.5
			}
			<resolved_id> :SetTags toggle = OFF
			<desc_id> :desc_resolvealias Name = alias_freestyle_toggle_hints
			<resolved_id> :se_setprops {
				exclusive_device = ($freestyle_player_data [<counter>].controller)
				event_handlers = [
					{focus freestyle_option_focus}
					{focus freestyle_advanced_setup_focus_checkbox}
					{unfocus freestyle_option_unfocus}
					{unfocus freestyle_advanced_setup_unfocus_checkbox}
					{pad_choose freestyle_advanced_setup_option_toggle params = {id = <resolved_id> option = hints Player = <counter>}}
				]
				alpha = 0.5
			}
			<resolved_id> :SetTags toggle = OFF
			<desc_id> :desc_resolvealias Name = alias_freestyle_advanced_setup_done
			<resolved_id> :se_setprops {
				exclusive_device = ($freestyle_player_data [<counter>].controller)
				event_handlers = [
					{focus generic_barrel_menu_item_focus}
					{unfocus generic_barrel_menu_item_unfocus}
					{pad_choose freestyle_advanced_setup_done params = {id = <desc_id>}}
				]
			}
			LaunchEvent Type = unfocus target = <resolved_id>
			0x8435a91e Player = <counter> menu_index = <counter>
			Change 0xe02a5559 = (($0xe02a5559) + 1)
		else
			formatText checksumName = desc_id 'alias_indiv_%i' i = <counter>
			freestyle_advanced_setup_tree :desc_resolvealias Name = <desc_id>
			DestroyScreenElement id = <resolved_id>
		endif
		counter = (<counter> + 1)
		repeat ($freestyle_max_players)
	endif
endscript

script freestyle_advanced_setup_focus_checkbox 
	Obj_GetID
	<objID> :desc_resolvealias Name = alias_checkbox_container
	<resolved_id> :obj_spawnscript ui_shakeytime
	<resolved_id> :se_setprops {
		Scale = (1.5, 1.5)
	}
endscript

script freestyle_advanced_setup_unfocus_checkbox 
	Obj_GetID
	<objID> :desc_resolvealias Name = alias_checkbox_container
	<resolved_id> :obj_killallspawnedscripts
	<resolved_id> :se_setprops {
		Pos = (0.0, 0.0)
		alpha = 1
		Scale = (1.0, 1.0)
	}
endscript

script freestyle_advanced_setup_user_control_display 
	clean_up_user_control_helpers
	if GotParam \{Band}
		add_user_control_helper \{text = qs(0x80aa0123)
			button = green
			z = 1000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 1000}
		add_user_control_helper \{text = qs(0x89a88eea)
			button = blue
			z = 1000}
		add_user_control_helper \{text = qs(0xfee2a4f1)
			button = start
			z = 1000}
	elseif GotParam \{individual}
		add_user_control_helper \{text = qs(0x80aa0123)
			button = green
			z = 1000}
	elseif GotParam \{ds_only}
		add_user_control_helper \{text = qs(0xfee2a4f1)
			button = start
			z = 1000}
		add_user_control_helper \{text = qs(0x80aa0123)
			button = green
			z = 1000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 1000}
	endif
endscript

script freestyle_advanced_setup_option_toggle 
	<id> :GetTags toggle
	if (<toggle> = OFF)
		<id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {On}
		<id> :SetTags toggle = On
	elseif (<toggle> = On)
		<id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {OFF}
		<id> :SetTags toggle = OFF
	endif
	if (<toggle> = OFF)
		new_value = true
	else
		new_value = FALSE
	endif
	if (<option> = guitar_ai)
		freestyle_get_instrument_index \{instrument = guitar}
		if (($freestyle_player_data [<index>].auto_play_enabled) = FALSE)
			setstructureparam array_name = freestyle_player_data array_index = <index> param = auto_play_enabled value = true
		elseif (($freestyle_player_data [<index>].auto_play_enabled) = true)
			setstructureparam array_name = freestyle_player_data array_index = <index> param = auto_play_enabled value = FALSE
		endif
	elseif (<option> = bass_ai)
		freestyle_get_instrument_index \{instrument = bass}
		if (($freestyle_player_data [<index>].auto_play_enabled) = FALSE)
			setstructureparam array_name = freestyle_player_data array_index = <index> param = auto_play_enabled value = true
		elseif (($freestyle_player_data [<index>].auto_play_enabled) = true)
			setstructureparam array_name = freestyle_player_data array_index = <index> param = auto_play_enabled value = FALSE
		endif
	elseif (<option> = drums_ai)
		freestyle_get_instrument_index \{instrument = drums}
		if (($freestyle_player_data [<index>].auto_play_enabled) = FALSE)
			setstructureparam array_name = freestyle_player_data array_index = <index> param = auto_play_enabled value = true
		elseif (($freestyle_player_data [<index>].auto_play_enabled) = true)
			setstructureparam array_name = freestyle_player_data array_index = <index> param = auto_play_enabled value = FALSE
		endif
	elseif (<option> = song_sections)
		freestyle_get_instrument_index \{instrument = drums}
		if (($freestyle_song_progression_enabled) = 0)
			Change \{freestyle_song_progression_enabled = 1}
		elseif (($freestyle_song_progression_enabled) = 1)
			Change \{freestyle_song_progression_enabled = 0}
		endif
	elseif ((<option> = metronome_visual)
			|| (<option> = metronome_audio)
			|| (<option> = metronome_rumble)
			|| (<option> = beat_lines)
			|| (<option> = hints)
			|| (<option> = note_quantization)
			|| (<option> = gem_track_visible))
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = <option> value = <new_value>
		printf 'freestyle_player_data: updated player %a  option %b to %c' a = <Player> b = <option> c = <new_value>
	elseif (<option> = endless)
		if (($freestyle_endless_song) = true)
			Change \{freestyle_endless_song = FALSE}
		elseif (($freestyle_endless_song) = FALSE)
			Change \{freestyle_endless_song = true}
		endif
	endif
endscript

script freestyle_advanced_setup_done 
	<id> :SetTags is_finished = true
	<id> :se_setprops {alpha = 0.5}
	<id> :desc_resolvealias Name = alias_freestyle_advanced_setup_options_sorter
	<id> :GetTags Player
	formatText checksumName = handler_id 'auxilliary_pad_back_handler_%i' i = <Player>
	LaunchEvent Type = focus target = <handler_id>
	LaunchEvent Type = unfocus target = <resolved_id>
	freestyle_advanced_setup_progress_to_band_options
endscript

script freestyle_advanced_setup_progress_to_band_options 
	freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_setup_sorter}
	GetScreenElementChildren id = <resolved_id>
	GetArraySize <children>
	if (<array_Size> > 0)
		is_ready = true
		counter = 0
		begin
		(<children> [<counter>]) :GetTags is_finished
		if (<is_finished> = FALSE)
			is_ready = FALSE
		endif
		counter = (<counter> + 1)
		repeat <array_Size>
	endif
	if (<is_ready> = true)
		freestyle_advanced_setup_tree :se_setprops \{0x8e749b3f = 1}
		freestyle_advanced_setup_tree :se_setprops \{0x6acde9e0 = 0}
		freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_menu}
		LaunchEvent Type = focus target = <resolved_id>
		freestyle_advanced_setup_user_control_display \{Band}
		counter = 0
		begin
		(<children> [<counter>]) :GetTags Player
		formatText checksumName = handler_id 'auxilliary_pad_back_handler_%i' i = <Player>
		LaunchEvent Type = unfocus target = <handler_id>
		counter = (<counter> + 1)
		repeat <array_Size>
	endif
endscript

script freestyle_advanced_setup_transfer_to_indiv 
	freestyle_advanced_setup_tree :se_setprops \{0x8e749b3f = 0}
	freestyle_advanced_setup_tree :se_setprops \{0x6acde9e0 = 1}
	freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_menu}
	LaunchEvent Type = unfocus target = <resolved_id>
	freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_setup_sorter}
	GetScreenElementChildren id = <resolved_id>
	GetArraySize <children>
	freestyle_advanced_setup_user_control_display \{individual}
	if (<array_Size> > 0)
		counter = 0
		begin
		(<children> [<counter>]) :SetTags is_finished = FALSE
		(<children> [<counter>]) :se_setprops {alpha = 1}
		(<children> [<counter>]) :desc_resolvealias Name = alias_freestyle_advanced_setup_options_sorter
		LaunchEvent Type = focus target = <resolved_id>
		(<children> [<counter>]) :GetTags Player
		formatText checksumName = handler_id 'auxilliary_pad_back_handler_%i' i = <Player>
		LaunchEvent Type = unfocus target = <handler_id>
		counter = (<counter> + 1)
		repeat <array_Size>
	endif
endscript

script 0x8e4596ba 
	if ($freestyle_song_progression_enabled = 0)
		0xc492232f \{alias = alias_freestyle_advanced_band_setup_option_song_sections
			toggle = OFF}
	elseif ($freestyle_song_progression_enabled = 1)
		0xc492232f \{alias = alias_freestyle_advanced_band_setup_option_song_sections
			toggle = On}
	endif
	if (($freestyle_endless_song) = FALSE)
		0xc492232f \{alias = alias_freestyle_advanced_band_setup_option_endless
			toggle = OFF}
	elseif (($freestyle_endless_song) = true)
		0xc492232f \{alias = alias_freestyle_advanced_band_setup_option_endless
			toggle = On}
	endif
	if freestyle_is_instrument_ai \{instrument = guitar}
		freestyle_find_player_with_instrument \{instrument = guitar}
		if (($freestyle_player_data [<player_with_instrument>].auto_play_enabled) = true)
			0xc492232f \{alias = alias_freestyle_advanced_band_setup_option_guitar_ai
				toggle = On}
		elseif (($freestyle_player_data [<player_with_instrument>].auto_play_enabled) = FALSE)
			0xc492232f \{alias = alias_freestyle_advanced_band_setup_option_guitar_ai
				toggle = OFF}
		endif
	endif
	if freestyle_is_instrument_ai \{instrument = bass}
		freestyle_find_player_with_instrument \{instrument = bass}
		if (($freestyle_player_data [<player_with_instrument>].auto_play_enabled) = true)
			0xc492232f \{alias = alias_freestyle_advanced_band_setup_option_bass_ai
				toggle = On}
		elseif (($freestyle_player_data [<player_with_instrument>].auto_play_enabled) = FALSE)
			0xc492232f \{alias = alias_freestyle_advanced_band_setup_option_bass_ai
				toggle = OFF}
		endif
	endif
	if freestyle_is_instrument_ai \{instrument = drums}
		freestyle_find_player_with_instrument \{instrument = drums}
		if (($freestyle_player_data [<player_with_instrument>].auto_play_enabled) = true)
			0xc492232f \{alias = alias_freestyle_advanced_band_setup_option_drums_ai
				toggle = On}
		elseif (($freestyle_player_data [<player_with_instrument>].auto_play_enabled) = FALSE)
			0xc492232f \{alias = alias_freestyle_advanced_band_setup_option_drums_ai
				toggle = OFF}
		endif
	endif
endscript

script 0x8435a91e 
	formatText checksumName = desc_id 'alias_indiv_%i' i = <menu_index>
	if freestyle_advanced_setup_tree :desc_resolvealias Name = <desc_id>
		desc_id = <resolved_id>
		if NOT <desc_id> :desc_resolvealias Name = alias_freestyle_toggle_helper_notes
			ScriptAssert 'Failed to get resolved_id for %a' a = <desc_id>
		endif
		if (($freestyle_player_data [<Player>].gem_track_visible) = true)
			<resolved_id> :SetTags toggle = On
			<resolved_id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {On}
		else
			<resolved_id> :SetTags toggle = OFF
			<resolved_id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {OFF}
		endif
		<desc_id> :desc_resolvealias Name = alias_freestyle_toggle_metronome_visual
		if (($freestyle_player_data [<Player>].metronome_visual) = true)
			<resolved_id> :SetTags toggle = On
			<resolved_id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {On}
		else
			<resolved_id> :SetTags toggle = OFF
			<resolved_id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {OFF}
		endif
		<desc_id> :desc_resolvealias Name = alias_freestyle_toggle_metronome_audio
		if (($freestyle_player_data [<Player>].metronome_audio) = true)
			<resolved_id> :SetTags toggle = On
			<resolved_id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {On}
		else
			<resolved_id> :SetTags toggle = OFF
			<resolved_id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {OFF}
		endif
		<desc_id> :desc_resolvealias Name = alias_freestyle_toggle_metronome_rumble
		if (($freestyle_player_data [<Player>].metronome_rumble) = true)
			<resolved_id> :SetTags toggle = On
			<resolved_id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {On}
		else
			<resolved_id> :SetTags toggle = OFF
			<resolved_id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {OFF}
		endif
		<desc_id> :desc_resolvealias Name = alias_freestyle_toggle_beat_lines
		if (($freestyle_player_data [<Player>].beat_lines) = true)
			<resolved_id> :SetTags toggle = On
			<resolved_id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {On}
		else
			<resolved_id> :SetTags toggle = OFF
			<resolved_id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {OFF}
		endif
		<desc_id> :desc_resolvealias Name = alias_freestyle_toggle_hints
		if (($freestyle_player_data [<Player>].hints) = true)
			<resolved_id> :SetTags toggle = On
			<resolved_id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {On}
		else
			<resolved_id> :SetTags toggle = OFF
			<resolved_id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {OFF}
		endif
	endif
endscript

script freestyle_advanced_setup_toggle_option 
	Obj_GetID
	if GotParam \{On}
		<objID> :desc_resolvealias Name = alias_check_mark
		<resolved_id> :se_setprops {alpha = 1}
		<objID> :desc_resolvealias Name = alias_x_mark
		<resolved_id> :se_setprops {alpha = 0}
	elseif GotParam \{OFF}
		<objID> :desc_resolvealias Name = alias_check_mark
		<resolved_id> :se_setprops {alpha = 0}
		<objID> :desc_resolvealias Name = alias_x_mark
		<resolved_id> :se_setprops {alpha = 1}
	endif
endscript

script freestyle_advanced_setup_refocus_indiv_setup 
	formatText checksumName = desc_id 'alias_indiv_%i' i = <menu_index>
	if freestyle_advanced_setup_tree :desc_resolvealias Name = <desc_id>
		desc_id = <resolved_id>
		if <desc_id> :desc_resolvealias Name = alias_freestyle_advanced_setup_options_sorter
			LaunchEvent Type = focus target = <resolved_id>
			<desc_id> :SetTags is_finished = FALSE
			<desc_id> :se_setprops {alpha = 1}
			formatText checksumName = handler_id 'auxilliary_pad_back_handler_%i' i = <menu_index>
			LaunchEvent Type = unfocus target = <handler_id>
		endif
	endif
endscript

script freestyle_transfer_to_game 
	if ($freestyle_recording_mode = overdub)
		generic_event_replace \{data = {
				state = uistate_freestyle_game
				clear_previous_stack
			}}
	else
		generic_event_choose \{state = uistate_freestyle_styleselect}
	endif
endscript

script 0xc366ec86 
	freestyle_advanced_setup_tree :se_setprops \{0x8e749b3f = 1}
	freestyle_advanced_setup_tree :se_setprops \{0x6acde9e0 = 0}
	freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_band_setup_menu}
	LaunchEvent Type = focus target = <resolved_id>
	freestyle_advanced_setup_user_control_display \{Band}
	freestyle_advanced_setup_tree :desc_resolvealias \{Name = alias_freestyle_advanced_setup_sorter}
	GetScreenElementChildren id = <resolved_id>
	GetArraySize <children>
	if (<array_Size> > 0)
		counter = 0
		begin
		(<children> [<counter>]) :SetTags is_finished = FALSE
		(<children> [<counter>]) :se_setprops {alpha = 1}
		(<children> [<counter>]) :desc_resolvealias Name = alias_freestyle_advanced_setup_options_sorter
		LaunchEvent Type = unfocus target = <resolved_id>
		(<children> [<counter>]) :GetTags Player
		formatText checksumName = handler_id 'auxilliary_pad_back_handler_%i' i = <Player>
		LaunchEvent Type = unfocus target = <handler_id>
		counter = (<counter> + 1)
		repeat <array_Size>
	endif
endscript

script ui_destroy_freestyle_advanced_setup 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = freestyle_advanced_setup_tree}
endscript

script freestyle_is_instrument_there 
	counter = 0
	begin
	if NOT (($freestyle_player_data [<counter>].controller) = -1)
		if (<instrument> = ($freestyle_player_data [<counter>].instrument))
			return is_there = <counter>
		endif
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
	return \{is_there = -1}
endscript

script freestyle_get_instrument_index 
	counter = 0
	begin
	if (<instrument> = ($freestyle_player_data [<counter>].instrument))
		return index = <counter>
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
	printf \{qs(0xdbccfe91)}
	return \{index = -1}
endscript

script freestyle_option_focus \{alpha = 1}
	Obj_GetID
	<objID> :se_setprops {
		alpha = <alpha>
	}
endscript

script freestyle_option_unfocus \{alpha = 0.5}
	Obj_GetID
	<objID> :se_setprops {
		alpha = <alpha>
	}
endscript

script 0xc492232f 
	RequireParams \{[
			alias
			toggle
		]
		all}
	if freestyle_advanced_setup_tree :desc_resolvealias Name = <alias>
		if ScreenElementExists id = <resolved_id>
			<resolved_id> :SetTags toggle = <toggle>
			<resolved_id> :Obj_SpawnScriptNow freestyle_advanced_setup_toggle_option params = {<toggle>}
		endif
	endif
endscript
