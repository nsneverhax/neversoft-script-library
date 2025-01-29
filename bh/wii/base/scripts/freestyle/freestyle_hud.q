freestyle_flashy_text_max_dims = (500.0, 100.0)
freestyle_help_text_pos = (640.0, 580.0)
freestyle_help_text_z = 10
freestyle_help_text_body_dims = (400.0, 160.0)
freestyle_help_text_dims = (400.0, 145.0)
freestyle_flashy_text_showing = 0
freestyle_help_text_showing = 0
freestyle_countdown_start_time = 0
freestyle_countdown_length = 0

script freetyle_init_hud 
	CreateScreenElement \{Type = ContainerElement
		id = freestyle_hud
		parent = freestyle_root
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		z_priority = 0}
	CreateScreenElement \{Type = TextBlockElement
		parent = freestyle_hud
		id = hud_flashy_text
		just = [
			center
			center
		]
		internal_just = [
			center
			center
		]
		Pos = (640.0, 200.0)
		dims = $freestyle_flashy_text_max_dims
		font = fontgrid_title_a1
		rgba = [
			145
			215
			235
			250
		]
		z_priority = 35
		fit_width = `scale	each	line	to	fit`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		Hide}
	Change \{freestyle_flashy_text_showing = 0}
endscript

script freestyle_deinit_hud 
	if ScreenElementExists \{id = freestyle_hud}
		DestroyScreenElement \{id = freestyle_hud}
	endif
	freestyle_hud_stop_countdown
	KillSpawnedScript \{Name = freestyle_hud_help_text_script}
	KillSpawnedScript \{Name = freestyle_hud_help_text_fade_out_script}
	KillSpawnedScript \{Name = freestyle_hud_flashy_text_script}
	KillSpawnedScript \{Name = freestyle_hud_generic_fade_in}
	KillSpawnedScript \{Name = freestyle_hud_generic_fade_out}
endscript

script freestyle_hud_hide 
	SetScreenElementProps \{id = freestyle_hud
		Hide}
endscript

script freestyle_hud_show 
	SetScreenElementProps \{id = freestyle_hud
		unhide}
endscript

script freestyle_hud_show_help_text \{Duration = 7.0}
	RequireParams \{[
			Player
			text
		]
		all}
	freestyle_get_player_param Player = <Player> param = help_text_name
	SetScreenElementProps id = <help_text_name> child = text hint_text = <text>
	<help_text_name> :obj_killallspawnedscripts
	<help_text_name> :Obj_SpawnScriptNow freestyle_hud_help_text_script params = {Player = <Player> Duration = <Duration>}
endscript

script freestyle_hud_hide_help_text 
	RequireParams \{[
			Player
		]
		all}
	freestyle_get_player_param Player = <Player> param = help_text_name
	<help_text_name> :obj_killallspawnedscripts
	<help_text_name> :Obj_SpawnScriptNow freestyle_hud_help_text_fade_out_script params = {Player = <Player>}
endscript

script freestyle_hud_help_text_script 
	freestyle_set_player_param Player = <Player> param = help_text_showing value = true
	se_setprops \{unhide
		alpha = 0.0}
	se_setprops \{unhide
		alpha = 0.0}
	se_setprops \{alpha = 1.0
		time = 0.2}
	se_waitprops
	Wait <Duration> Seconds
	freestyle_hud_help_text_fade_out_script <...>
endscript

script freestyle_hud_help_text_fade_out_script 
	se_setprops \{alpha = 0.0
		time = 0.2}
	se_waitprops
	se_setprops \{Hide}
	Wait \{2
		Seconds}
	freestyle_set_player_param Player = <Player> param = help_text_showing value = FALSE
endscript

script freestyle_hud_show_flashy_text \{Duration = 2.0}
	if freestyle_hud_is_countdown_showing
		return
	endif
	if freestyle_hud_is_warning_notifcation_showing
		return
	endif
	KillSpawnedScript \{Name = freestyle_hud_flashy_text_script}
	RunScriptOnScreenElement freestyle_hud_flashy_text_script id = hud_flashy_text params = <...>
endscript

script freestyle_hud_hide_flashy_text 
	KillSpawnedScript \{Name = freestyle_hud_flashy_text_script}
	Change \{freestyle_flashy_text_showing = 0}
	hud_flashy_text :se_setprops \{Hide}
endscript

script freestyle_hud_flashy_text_script 
	Change \{freestyle_flashy_text_showing = 1}
	se_setprops text = <text> fit_width = `expand	dims` dims = (0.0, 0.0) single_line = true
	se_getprops
	if ((<dims> [0]) > ($freestyle_flashy_text_max_dims [0]))
		se_setprops \{fit_width = `scale	each	line	to	fit`
			dims = $freestyle_flashy_text_max_dims
			single_line = FALSE}
	endif
	se_setprops \{unhide
		alpha = 0.0}
	se_setprops \{alpha = 1.0
		time = 0.1}
	se_waitprops
	rotation = 20
	begin
	<rotation> = (<rotation> * -0.7)
	se_setprops rot_angle = <rotation> time = 0.08 motion = ease_out
	se_waitprops
	repeat 24
	se_setprops \{rot_angle = 0
		time = 0.08}
	Wait <Duration> Seconds
	se_setprops \{alpha = 0.0
		time = 0.1}
	se_waitprops
	se_setprops \{Hide}
	Change \{freestyle_flashy_text_showing = 0}
endscript

script freestyle_hud_create_button_prompt \{parent = freestyle_hud
		z_priority = 0}
	CreateScreenElement {
		id = <id>
		parent = <parent>
		Type = descinterface
		desc = 'helper_pill'
		auto_dims = FALSE
		dims = (0.0, 36.0)
		Pos = <Pos>
		helper_button_text = <buttonchar>
		helper_description_text = <text>
		helper_pill_rgba = [0 0 0 255]
		helper_description_rgba = [255 255 255 255]
		z_priority = <z_priority>
	}
	<id> :se_getprops
	<id> :se_setprops {
		helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 32.0))
		dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 32.0))
	}
endscript

script freestyle_hud_start_countdown 
	RequireParams \{[
			length
		]
		all}
	if freestyle_hud_is_warning_notifcation_showing
		return
	endif
	freestyle_hud_hide_flashy_text
	GetStartTime
	Change freestyle_countdown_start_time = <starttime>
	Change freestyle_countdown_length = <length>
	freestyle_hud_stop_countdown
	CreateScreenElement \{Type = ContainerElement
		id = freestyle_countdown
		parent = root_window
		Pos = (640.0, 220.0)
		just = [
			center
			center
		]
		internal_just = [
			center
			center
		]
		z_priority = 50
		alpha = 1}
	CreateScreenElement \{Type = SpriteElement
		parent = freestyle_countdown
		local_id = background
		texture = countdownbg
		just = [
			center
			center
		]
		pos_anchor = [
			center
			center
		]
		Pos = (0.0, 0.0)
		relative_z_priority = 0}
	CreateScreenElement \{Type = TextElement
		parent = freestyle_countdown
		local_id = text
		just = [
			center
			center
		]
		pos_anchor = [
			center
			center
		]
		Pos = (0.0, 8.0)
		font = fontgrid_numeral_a1
		rgba = [
			255
			255
			255
			255
		]
		relative_z_priority = 1}
	CreateScreenElement \{Type = TextBlockElement
		parent = freestyle_countdown
		dims = (145.0, 64.0)
		local_id = text_header
		just = [
			center
			center
		]
		pos_anchor = [
			center
			center
		]
		internal_just = [
			center
			center
		]
		Pos = (0.0, -44.0)
		font = fontgrid_text_a1
		rgba = [
			255
			255
			255
			255
		]
		relative_z_priority = 1
		text = qs(0x861bd015)
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`}
	SpawnScriptNow \{freestyle_hud_update_countdown}
	RunScriptOnScreenElement \{freestyle_hud_generic_fade_in
		id = freestyle_countdown}
endscript

script freestyle_hud_stop_countdown 
	KillSpawnedScript \{Name = freestyle_hud_update_countdown}
	if ScreenElementExists \{id = freestyle_countdown}
		DestroyScreenElement \{id = freestyle_countdown}
	endif
endscript

script freestyle_hud_is_countdown_showing 
	if ScreenElementExists \{id = freestyle_countdown}
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script freestyle_hud_update_countdown 
	begin
	getelapsedtime starttime = ($freestyle_countdown_start_time)
	time_diff = ($freestyle_countdown_length - <ElapsedTime> + 999)
	if (<time_diff> >= 0)
		time_seconds = (<time_diff> / 1000)
		formatText TextName = time_text qs(0x35b12509) a = <time_seconds>
		SetScreenElementProps id = {freestyle_countdown child = text} text = <time_text>
	else
		RunScriptOnScreenElement \{freestyle_hud_generic_fade_out_and_die
			id = freestyle_countdown}
		break
	endif
	Wait \{10
		frames}
	repeat
endscript

script freestyle_hud_generic_fade_in \{fade_time = 0.5}
	se_setprops alpha = 1.0 time = <fade_time>
	se_waitprops
endscript

script freestyle_hud_generic_fade_out \{fade_time = 0.5}
	se_setprops alpha = 0.0 time = <fade_time>
	se_waitprops
endscript

script freestyle_hud_generic_fade_out_and_die \{fade_time = 0.5}
	se_setprops alpha = 0.0 time = <fade_time>
	se_waitprops
	Die
endscript

script freestyle_hud_create_help_text 
	RequireParams \{[
			Player
		]
		all}
	freestyle_get_player_param Player = <Player> param = highway_player
	formatText checksumName = help_text_name 'help_text_p%p' p = <Player>
	formatText checksumName = highway_name 'freestyle_highway_containerp%p' p = <highway_player>
	freestyle_set_player_param Player = <Player> param = help_text_name value = <help_text_name>
	freestyle_set_player_param Player = <Player> param = help_text_showing value = FALSE
	if ScreenElementExists id = <help_text_name>
		DestroyScreenElement id = <help_text_name>
	endif
	CreateScreenElement {
		parent = <highway_name>
		id = <help_text_name>
		Type = descinterface
		desc = 'freestyle_hint_box'
		Pos = (0.0, 220.0)
		alpha = 0
	}
endscript

script freestyle_spawn_solo_indicators 
	GetArraySize \{$freestyle_current_solo_players}
	i = 0
	if (<array_Size> > 0)
		begin
		Player = ($freestyle_current_solo_players [<i>])
		freestyle_get_player_param Player = <Player> param = solo_type
		freestyle_spawn_solo_indicator {
			Player = <Player>
			solo_type = <solo_type>
			soloer_count = <array_Size>
		}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script freestyle_spawn_solo_indicator 
	RequireParams \{[
			Player
			solo_type
			soloer_count
		]
		all}
	freestyle_get_human_player_count
	freestyle_get_highway_index Player = <Player>
	formatText checksumName = text_id 'solo_indicator_%p' p = <Player>
	if (($freestyle_player_data [<Player>].player_type) = human)
		formatText checksumName = script_id 'audio_hud_anim_script_%i' i = <Player>
		KillSpawnedScript id = <script_id>
		SpawnScriptNow freestyle_animate_audio_effects_hud id = <script_id> params = {Player = <Player>}
	endif
	highway_player = (<Player> + 1)
	formatText checksumName = freestyle_highway_name 'freestyle_highway_containerp%p' p = <highway_player>
	instrument = ($freestyle_player_data [<Player>].instrument)
	if (<soloer_count> = 2)
		text = qs(0x2b4ecb30)
	elseif (<soloer_count> = 3)
		text = qs(0x35ea209b)
	else
		switch (<instrument>)
			case guitar
			text = qs(0xb130a8f2)
			case drums
			if (<solo_type> = fill)
				text = qs(0x1ff3c47d)
			else
				text = qs(0x0aae28b8)
			endif
			case bass
			text = qs(0xb410341f)
		endswitch
	endif
	if NOT ScreenElementExists id = <text_id>
		CreateScreenElement {
			Type = TextElement
			parent = <freestyle_highway_name>
			id = <text_id>
			Pos = (640.0, 360.0)
			dims = (200.0, 100.0)
			font = fontgrid_text_a1
			Scale = (0.55, 0.55)
			rgba = [255 255 255 255]
			z_priority = 100
			fit_width = `scale	each	line	if	larger`
			fit_hieght = `scale	down	if	larger`
		}
		formatText checksumName = script_id 'solo_indicator_script_%p' p = <Player>
		<text_id> :obj_spawnscript freestyle_animate_solo_indicator id = <script_id>
	endif
	<text_id> :se_setprops text = <text>
endscript

script freestyle_destroy_solo_indicator 
	RequireParams \{[
			Player
		]
		all}
	formatText checksumName = text_id 'solo_indicator_%p' p = <Player>
	formatText checksumName = script_id 'solo_indicator_script_%p' p = <Player>
	formatText checksumName = anim_script_id 'audio_hud_anim_script_%i' i = <Player>
	KillSpawnedScript id = <anim_script_id>
	KillSpawnedScript id = <script_id>
	if (($freestyle_player_data [<Player>].player_type) = human)
		freestyle_audio_effect_hud_reset_position Player = <Player>
	endif
	DestroyScreenElement id = <text_id>
endscript

script freestyle_update_solo_indicator_tint 
	counter = 0
	begin
	formatText checksumName = text_id 'solo_indicator_%p' p = <counter>
	if ScreenElementExists id = <text_id>
		if NOT (($freestyle_player_data [<counter>].instrument) = drums)
			getguitaractivetilt Player = <counter>
			if (<active_tilt> = 0)
				<text_id> :se_setprops {rgba = [255 128 0 255]}
			elseif (<active_tilt> = 1)
				<text_id> :se_setprops {rgba = [0 255 255 255]}
			elseif (<active_tilt> = 2)
				<text_id> :se_setprops {rgba = [0 255 0 255]}
			endif
		endif
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
endscript

script freestyle_clean_up_solo_indicators 
	counter = 0
	begin
	formatText checksumName = text_id 'solo_indicator_%p' p = <counter>
	if ScreenElementExists id = <text_id>
		formatText checksumName = script_id 'solo_indicator_script_%p' p = <counter>
		KillSpawnedScript id = <script_id>
		DestroyScreenElement id = <text_id>
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
endscript

script freestyle_animate_solo_indicator 
	Obj_GetID
	begin
	if ScreenElementExists id = <objID>
		angle = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ -6 @ -5 @ -4 @ -3 @ -2 @ -1 )
		<objID> :se_setprops {rot_angle = <angle> time = 0.1}
		Wait \{0.1
			Seconds}
	else
		return
	endif
	repeat
endscript

script freestyle_spawn_controller_lights \{Pos = (0.0, 0.0)
		Scale = 1
		spacing = 16
		z_priority = 5
		bg_z_priority = 3.0
		just = [
			left
			top
		]
		pos_anchor = [
			left
			top
		]}
	RequireParams \{[
			parent
			Player
			controller
		]
		all}
	if GotParam \{state}
		switch <state>
			case roadie_battle_lobby
			case freestyle_band_lobby
			Pos = (146.0, 286.0)
			case freestyle_advanced_setup
			just = [center center]
			pos_anchor = [center center]
			Pos = (0.0, 16.0)
			case freestyle_player_intro_hud
			just = [center center]
			pos_anchor = [center center]
			if (($freestyle_player_data [<Player>].mii_database) = randomdb)
				Pos = (0.0, 128.0)
			else
				Pos = (0.0, 160.0)
			endif
		endswitch
	endif
	formatText checksumName = light_id 'controller_lights_%i' i = <Player>
	if ScreenElementExists id = <light_id>
		DestroyScreenElement id = <light_id>
	endif
	spawn_controller_lights {<...> explicit_ids}
	return light_id = <light_id>
endscript

script freestyle_destroy_controller_lights 
	RequireParams \{[
			Player
		]
		all}
	formatText checksumName = light_id 'controller_lights_%i' i = <Player>
	if ScreenElementExists id = <light_id>
		DestroyScreenElement id = <light_id>
	endif
endscript

script freestyle_hud_create_warning_notification 
	RequireParams \{[
			text
			color1
			color2
		]
		all}
	freestyle_hud_hide_flashy_text
	freestyle_hud_stop_countdown
	freestyle_hud_destroy_warning_notifcation
	CreateScreenElement {
		Type = TextBlockElement
		parent = freestyle_hud
		id = hud_warning_text
		just = [center center]
		internal_just = [center center]
		Pos = (640.0, 200.0)
		dims = (600.0, 100.0)
		font = fontgrid_text_a1
		rgba = <color1>
		z_priority = 35
		fit_width = `scale	each	line	to	fit`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		text = <text>
	}
	RunScriptOnScreenElement freestyle_hud_warning_notification_script id = hud_warning_text params = {color1 = <color1> color2 = <color2>}
endscript

script freestyle_hud_destroy_warning_notifcation 
	if ScreenElementExists \{id = hud_warning_text}
		DestroyScreenElement \{id = hud_warning_text}
	endif
endscript

script freestyle_hud_warning_notification_script 
	begin
	se_setprops rgba = <color2> time = 0.5
	se_waitprops
	se_setprops rgba = <color1> time = 0.5
	se_waitprops
	repeat
endscript

script freestyle_hud_is_warning_notifcation_showing 
	if ScreenElementExists \{id = hud_warning_text}
		return \{true}
	else
		return \{FALSE}
	endif
endscript
