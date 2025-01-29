
script ui_create_encore_confirmation 
	spawnscriptnow ui_create_encore_confirmation_spawned params = {<...>}
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = song_breakdown_drop_player
			end_game_script = song_breakdown_end_game}
	endif
endscript

script ui_destroy_encore_confirmation 
	destroy_ui_encore_confirmation
endscript

script ui_create_encore_confirmation_spawned 
	soundevent \{event = $current_crowd_encore}
	destroy_ui_encore_confirmation
	if issingleplayergame
		getnewcashfromdetailedstats
		stars = ($player1_status.stars)
		score = ($player1_status.score)
		cash = <new_cash>
	else
		gamemode_getnumplayersshown
		total_cash = 0
		p = 1
		begin
		getplayerinfo <p> is_local_client
		if (<is_local_client> = 1)
			getnewcashfromdetailedstats player = <p>
			total_cash = (<total_cash> + <new_cash>)
		endif
		p = (<p> + 1)
		repeat <num_players_shown>
		score = ($band1_status.score)
		stars = ($band1_status.stars)
		cash = <total_cash>
	endif
	createscreenelement \{type = descinterface
		parent = root_window
		id = encoreinterface
		desc = 'encore'
		encore_master_container_scale = 1.0
		event_handlers = [
			{
				pad_choose
				encore_play
			}
		]}
	if encoreinterface :desc_resolvealias \{name = alias_encore_title}
		encoreinterface :se_getprops
		text_to_morph = <encore_title_text>
		text_to_morph_rgba = <encore_title_rgba>
		text_to_morph_dims = <encore_title_dims>
		text_to_morph_font = <encore_title_font>
		encoreinterface :se_setprops \{encore_title_text = qs(0x03ac90f0)}
		split_text_into_menu {
			text = <text_to_morph>
			dims = <text_to_morph_dims>
			fit_major = `fit content`
			fit_minor = `fit content`
			text_params = {
				z_priority = 525.0
				rgba = <text_to_morph_rgba>
				font = <text_to_morph_font>
				use_shadow = true
				shadow_rgba =
				[
					0 , 0 , 0 , 255
				]
				shadow_offs = (-3.0, -3.0)
			}
			pos_anchor = [center center]
			just = [left top]
			internal_just = [center center]
			parent = <resolved_id>
			spacing_between = -10
			pos = (0.0, -20.0)
		}
		letter_scale = [4.8 3.2 3.7 4.5]
		s = Random (@ 0 @ 1 )
		i = 0
		begin
		text_element = (<text_element_array> [<i>])
		<text_element> :se_setprops internal_scale = (<letter_scale> [<s>])
		s = (<s> + 1)
		if (<s> > 3)
			s = 0
		endif
		i = (<i> + 1)
		repeat <text_element_array_size>
	endif
	if encoreinterface :desc_resolvealias \{name = alias_stars_stack}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			child_index = 0
			begin
			getrandomvalue \{name = rand_rot
				a = 0
				b = 360}
			setscreenelementprops id = (<children> [<child_index>]) rot_angle = <rand_rot>
			child_index = (<child_index> + 1)
			repeat <array_size>
			if (<array_size> > 0)
				if (<stars> < 5)
					destroy_menu menu_id = (<children> [0])
				endif
				if (<stars> < 4)
					destroy_menu menu_id = (<children> [1])
				endif
			endif
		endif
	endif
	casttointeger \{score}
	formattext textname = score_text qs(0x48c6d14c) d = <score> usecommas
	encoreinterface :se_setprops encore_score_text = <score_text>
	formattext textname = cash_text qs(0x447de8d3) d = <cash> usecommas
	encoreinterface :se_setprops encore_money_text = <cash_text>
	mark_encore_started
endscript

script mark_encore_started 
	get_progression_globals ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	setglobaltags <gig_name> params = {started = 1 encore_unlocked = 1} all_active_players = 1
	if ishost
		sendstructure \{callback = mark_encore_started
			data_to_send = {
				none
			}}
	endif
endscript

script destroy_ui_encore_confirmation 
	killspawnedscript \{name = ui_encore_animate_flashbulbs}
	ui_destroy_encore_flashbulbs
	if screenelementexists \{id = encoreinterface}
		encoreinterface :die
	endif
endscript

script ui_encore_animate_flashbulbs 
	spawnscriptlater \{pulsate_helper_pill
		params = {
			id = encoreinterface
		}}
endscript

script ui_destroy_encore_flashbulbs 
	killspawnedscript \{name = pulsate_helper_pill}
endscript
