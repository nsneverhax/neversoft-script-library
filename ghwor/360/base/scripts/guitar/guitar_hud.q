
script setup_band_hud \{force_layout = 0}
	printf \{channel = zdebug
		qs(0x49729532)}
	if (<force_layout> = 0)
		update_hud_layout
	endif
	if StructureContains \{structure = $g_hud_2d_struct_used
			desc_interface}
		CreateScreenElement \{parent = root_window
			id = hud_misc_root
			Type = ContainerElement
			Pos = (0.0, 0.0)
			z_priority = 0
			alpha = 1}
		yield
		CreateScreenElement {
			parent = root_window
			id = hud_root
			Type = descinterface
			desc = ($g_hud_2d_struct_used.desc_interface)
			Pos = (0.0, 0.0)
			z_priority = 0
			alpha = 0
		}
		yield
		if NOT ResolveScreenElementID \{id = {
					hud_root
					child = 0
				}
				param = hud_container}
			RequireParams \{[
					hud_container
				]
				all}
			return
		endif
		gamemode_gettype
		hide_band_death_meter
		init_special_power_hud_elements
		yield
		Change \{is_ampzilla_battle = 0}
		if (<Type> = career || <Type> = quickplay)
			if (<Type> = career)
				if ($current_chapter = quest_chapter_finale)
					quest_hud_setup_final_battle
				endif
			endif
			star_meter_id = zero
			is_qp_power_challenge = 0
			if gman_ispowerscoreenabled
				is_qp_power_challenge = 1
			endif
			x_dim = 0
			if (<Type> = career)
				if hud_root :desc_resolvealias \{Name = alias_hud_meter_star
						param = id}
					<id> :Die
				endif
				if hud_root :desc_resolvealias \{Name = alias_career_star_meter
						param = id}
					<id> :Die
				endif
				if hud_root :desc_resolvealias \{Name = alias_career_star_meter_stripped
						param = id}
					star_meter_id = <id>
					x_dim = 372
					if (($is_ampzilla_battle) = 1)
						<id> :se_setprops demigod_guitar_alpha = 1.0
					else
						<id> :se_setprops demigod_guitar_alpha = 0.0
					endif
					if <id> :desc_resolvealias Name = alias_streak param = streak_id
						<streak_id> :se_setprops alpha = 0.0
					endif
				endif
			elseif (<is_qp_power_challenge> = 1)
				if hud_root :desc_resolvealias \{Name = alias_hud_meter_star
						param = id}
					<id> :Die
				endif
				if hud_root :desc_resolvealias \{Name = alias_career_star_meter_stripped
						param = id}
					<id> :Die
				endif
				if hud_root :desc_resolvealias \{Name = alias_career_star_meter
						param = id}
					star_meter_id = <id>
					x_dim = 359
				endif
			else
				if hud_root :desc_resolvealias \{Name = alias_career_star_meter
						param = id}
					<id> :Die
				endif
				if hud_root :desc_resolvealias \{Name = alias_career_star_meter_stripped
						param = id}
					<id> :Die
				endif
				if hud_root :desc_resolvealias \{Name = alias_hud_meter_star
						param = id}
					star_meter_id = <id>
					x_dim = 306
				endif
			endif
			AssignAlias id = <star_meter_id> alias = hud_star_meter_id
			init_upper_container
			hud_attach_star_meter star_meter_id = <star_meter_id> x_dim = <x_dim>
		else
			if hud_root :desc_resolvealias \{Name = alias_hud_meter_star
					param = star_meter}
				<star_meter> :Die
			endif
			if hud_root :desc_resolvealias \{Name = alias_hud_revive_band_meter
					param = revive_meter}
				<revive_meter> :Die
			endif
			if hud_root :desc_resolvealias \{Name = alias_rp_axel_widget
					param = axel_meter}
				<axel_meter> :Die
			endif
			if hud_root :desc_resolvealias \{Name = alias_career_star_meter
					param = career_star_meter}
				<career_star_meter> :Die
			endif
			if hud_root :desc_resolvealias \{Name = alias_career_star_meter_stripped
					param = career_star_meter_stripped}
				<career_star_meter_stripped> :Die
			endif
		endif
		if ($calibrate_lag_enabled = 1 || $cheat_hudfreemode = 1)
			if hud_root :desc_resolvealias \{Name = alias_upper_container
					param = upper_group}
				<upper_group> :se_setprops Hide
			endif
		endif
		if (<Type> = competitive && (teammodeequals team_mode = two_teams))
			if hud_root :desc_resolvealias \{Name = alias_versus_meter
					param = versus_meter}
				hud_attach_widget_band_versus_meter parent_id = <versus_meter>
			endif
			count_all_players_by_part
			<num_highways> = (<num_guitar> + <num_bass> + <num_drum>)
			if (<num_vocals> > 2 && <num_highways> = 0)
				hud_root :se_setprops \{hud_standard_band_meter_pos = (165.0, 40.0)}
				<versus_meter> :se_setprops Pos = {relative (0.0, 40.0)}
			endif
		elseif hud_root :desc_resolvealias \{Name = alias_versus_meter
				param = versus_meter}
			<versus_meter> :Die
		endif
		if (<Type> = faceoff || <Type> = pro_faceoff)
			if hud_root :desc_resolvealias \{Name = alias_hud_scores_stack
					param = scores_stack}
				<scores_stack> :se_setprops unhide
				hud_attach_scores_stack_widget parent_id = <scores_stack>
			endif
		endif
		if hud_root :desc_resolvealias \{Name = alias_final_power_meter
				param = zilla_meter}
			if (($is_ampzilla_battle) = 1)
				GetScreenElementDims id = <zilla_meter>
				<zilla_meter> :se_setprops alpha = 1 fill_dims = ((0.0, 1.0) * <height>)
			else
				<zilla_meter> :se_setprops alpha = 0
				<zilla_meter> :Die
			endif
		endif
		if ($Cheat_PerformanceMode = 1)
			if NOT (<Type> = freeplay)
				hud_root :se_setprops \{Hide}
			endif
		endif
	endif
	yield
	vocals_get_num_vocalists_onscreen
	if (<num_vocalists_shown> <= 0)
		Change \{sysnotify_ingame_position = topright}
	elseif (<num_vocalists_shown> = 1)
		getnumplayersingame \{on_screen}
		if (<num_players_shown> = 1)
			Change \{sysnotify_ingame_position = topright}
		else
			Change \{sysnotify_ingame_position = centerright}
		endif
	else
		Change \{sysnotify_ingame_position = centerright}
	endif
	setsystemnotificationposition Pos = ($sysnotify_ingame_position)
	if (($cheat_focusmode = 1 && <Type> != career) || $calibrate_lag_enabled = 1)
		hud_create_focus_mode_curtain
	endif
	if ($g_debug_band_moment_starpower = 1)
		hud_root :Obj_SpawnScriptNow \{active_band_moment_starpower}
		Change \{g_debug_band_moment_starpower = 0}
	endif
endscript

script destroy_band_hud 
	detachhudwidget \{all}
	if ScreenElementExists \{id = hud_root}
		DestroyScreenElement \{id = hud_root}
	endif
	if ScreenElementExists \{id = hud_misc_root}
		DestroyScreenElement \{id = hud_misc_root}
	endif
	Change sysnotify_ingame_position = ($sysnotify_menus_position)
	setsystemnotificationposition Pos = ($sysnotify_ingame_position)
endscript

script debug_refresh_hud 
	destroy_band_hud
	setup_band_hud \{force_layout = 1}
	hud_root :se_setprops \{alpha = 1}
endscript

script count_players_by_part 
	RequireParams \{[
			part
		]
		all}
	<Player> = 1
	<players_by_part> = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <Player> part = <part>
			<players_by_part> = (<players_by_part> + 1)
		endif
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
	return players_by_part = <players_by_part>
endscript

script hud_create_focus_mode_curtain 
	CreateScreenElement \{Type = SpriteElement
		parent = hud_misc_root
		texture = white
		rgba = [
			0
			0
			0
			255
		]
		dims = (1280.0, 720.0)
		Pos = (640.0, 360.0)
		z_priority = -9999}
endscript

script count_all_players_by_part 
	count_players_by_part \{part = guitar}
	<num_guitar> = <players_by_part>
	count_players_by_part \{part = drum}
	<num_drum> = <players_by_part>
	count_players_by_part \{part = vocals}
	<num_vocals> = <players_by_part>
	count_players_by_part \{part = bass}
	<num_bass> = <players_by_part>
	return num_guitar = <num_guitar> num_drum = <num_drum> num_vocals = <num_vocals> num_bass = <num_bass>
endscript

script update_hud_layout 
	count_all_players_by_part
	<num_highways> = (<num_guitar> + <num_bass> + <num_drum>)
	getnumplayersingame \{on_screen}
	<solo_highway_mode> = 0
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		if playerinfoequals <Player> solo_highway_mode = 1
			<solo_highway_mode> = 1
			break
		endif
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
	<desired_layout> = hud_standard
	if (<num_players_shown> = 1 && <num_highways> = 1)
		if (<solo_highway_mode> = 1)
			<desired_layout> = hud_standard_1p
		else
			<desired_layout> = hud_standard_1p
		endif
	elseif (<num_vocals> > 0 && <num_highways> = 1)
		<desired_layout> = hud_standard_1g1v
	elseif (<num_vocals> = 1 && <num_highways> = 0)
		if (<solo_highway_mode> = 1)
			<desired_layout> = hud_standard_1v
		else
			<desired_layout> = hud_standard_1v
		endif
	else
		<desired_layout> = hud_standard
	endif
	if GlobalExists Name = <desired_layout>
		Change g_hud_2d_struct_used = $<desired_layout>
	else
		printstruct <...>
		SoftAssert 'Unknown hud layout %s' s = <desired_layout>
		Change \{g_hud_2d_struct_used = $hud_3g1v}
	endif
endscript

script show_hud 
	if ScreenElementExists \{id = hud_root}
		SetScreenElementProps \{id = hud_root
			alpha = 1}
	endif
endscript

script hide_hud 
	if NOT retailbuild
		if ($alternate_viewer_hud_behavior = 1)
			return
		endif
	endif
	if ScreenElementExists \{id = hud_root}
		SetScreenElementProps \{id = hud_root
			alpha = 0}
	endif
endscript

script init_special_power_hud_elements 
	getfirstplayer \{local}
	getplayerinfo <Player> Band
	if hud_root :desc_resolvealias \{Name = alias_rp_axel_widget
			param = axel_widget}
		getbandinfo <Band> max_resurrection_lives
		if (<max_resurrection_lives> > 0)
			hud_update_axel_resurrection_widget Player = <Player> init = 1
		else
			<axel_widget> :se_setprops alpha = 0.0
		endif
	endif
endscript

script resurrection_fx \{ignore_health_change = 0}
	getplayerinfo <Player> Band
	getplayerinfo <Player> part
	if (<part> = vocals)
		SpawnScriptNow create_revival_vocal_highway_glow_ankh01 params = {Player = <Player>}
	else
		if playerinfoequals <Player> is_onscreen = 1
			get_highway_hud_root_id Player = <Player>
			if ScreenElementExists id = <highway_hud_root>
				SpawnScriptNow create_revival_highway_glow_ankh01 params = {Player = <Player>}
			endif
		endif
	endif
	SpawnScriptNow \{resurrection_sound_fx
		params = {
		}}
	if (<ignore_health_change> = 0)
		if ScreenElementExists \{id = hud_root}
			hud_root :Obj_SpawnScriptNow hud_slide_player_rock_meter_needle params = {Player = <Player> start = 0.1 end = 1.0}
		endif
	endif
endscript

script resurrection_sound_fx 
	getfirstplayer \{in_game}
	getplayerinfo <Player> score_attribute_level
	if (<score_attribute_level> > 1)
		audio_play_character_powers_sfx \{character = qs(0x5d2b4ed3)
			lvl = 2}
	else
		audio_play_character_powers_sfx \{character = qs(0x5d2b4ed3)
			lvl = 1}
	endif
endscript

script hud_rock_meter_fx \{Judy = 0}
	if ScreenElementExists \{id = hud_root}
		hud_root :obj_spawnscript hud_slide_player_rock_meter_needle params = {Player = <Player> start = <start> end = <end> wait_for_song_to_start Judy = <Judy>}
	endif
endscript

script hide_rock_needle 
	getplayerinfo <Player> part
	if (<part> != vocals)
		formatText checksumName = rock_meter 'sidebar_left_rock_meterp%p' p = <Player> AddToStringLookup = true
		if ScreenElementExists id = <rock_meter>
			<rock_meter> :se_setprops needle_container_alpha = 0.0
		endif
	endif
endscript

script show_rock_needle 
	getplayerinfo <Player> part
	if (<part> != vocals)
		formatText checksumName = rock_meter 'sidebar_left_rock_meterp%p' p = <Player> AddToStringLookup = true
		if ScreenElementExists id = <rock_meter>
			<rock_meter> :se_setprops needle_container_alpha = 1.0
		endif
	endif
endscript

script hud_slide_player_rock_meter_needle \{Judy = 0}
	OnExitRun turn_off_invincible params = {Player = <Player>}
	<num_frames> = 30
	<delta> = ((<end> - <start>) / <num_frames>)
	<val> = <start>
	if (<Judy> = 1)
		setplayerinfo <Player> current_health = 1.0
	endif
	if GotParam \{wait_for_song_to_start}
		begin
		GetSongTimeMs
		if (200 < <time>)
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	if (<Judy> = 1)
		if (<end> < 1.5)
			audio_play_character_powers_sfx \{character = qs(0x33d6c02a)
				lvl = 1}
		else
			audio_play_character_powers_sfx \{character = qs(0x33d6c02a)
				lvl = 2}
		endif
		printf \{channel = zdebug
			qs(0xd06f9749)}
	endif
	turn_on_invincible Player = <Player>
	begin
	<val> = (<val> + <delta>)
	setplayerinfo <Player> current_health = <val>
	Wait \{1
		gameframe}
	repeat <num_frames>
	turn_off_invincible Player = <Player>
	if (<Judy> = 1)
		printf \{channel = zdebug
			qs(0x2c47e2a8)}
	endif
endscript

script turn_on_invincible 
	setplayerinfo <Player> invincible = 1
endscript

script turn_off_invincible 
	setplayerinfo <Player> invincible = 0
endscript

script hud_update_axel_resurrection_widget \{Player = 1
		init = 0}
	uninitialized = -1
	initialized = 0
	used = 1
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	if hud_root :desc_resolvealias \{Name = alias_rp_axel_widget
			param = axel_widget}
		if <axel_widget> :desc_resolvealias Name = alias_ankh_menu param = axel_menu
			getplayerinfo <Player> Band
			getbandinfo <Band> current_resurrection_lives
			getbandinfo <Band> used_resurrection_lives
			getbandinfo <Band> max_resurrection_lives
			GetScreenElementChildren id = <axel_menu>
			GetArraySize \{children}
			if (<init> = 1)
				array = []
				if (<array_Size> > 0)
					begin
					AddArrayElement array = <array> element = <uninitialized>
					repeat <array_Size>
				endif
				<axel_menu> :se_setprops tags = {ankh_states = <array>}
			endif
			<axel_menu> :GetTags
			array = <ankh_states>
			if (<array_Size> > 0)
				i = 0
				begin
				old_state = (<array> [<i>])
				if (<i> < <used_resurrection_lives>)
					if ScreenElementExists id = (<children> [<i>])
						state = <used>
						if (<state> != <old_state>)
							SetArrayElement ArrayName = array index = <i> NewValue = <used>
							(<children> [<i>]) :obj_spawnscript axel_use_ankh_fx_script params = {}
						else
							SetScreenElementProps id = (<children> [<i>]) x_alpha = 1.0
							SetScreenElementProps id = (<children> [<i>]) star_alpha = 0.0
							SetScreenElementProps id = (<children> [<i>]) ankh_alpha = 1
							SetScreenElementProps id = (<children> [<i>]) ankh_rgba = [255 0 0 255]
						endif
					endif
				elseif (<i> < (<current_resurrection_lives> + <used_resurrection_lives>))
					if ScreenElementExists id = (<children> [<i>])
						state = <initialized>
						if (<state> != <old_state>)
							SetArrayElement ArrayName = array index = <i> NewValue = <initialized>
							(<children> [<i>]) :obj_spawnscript axel_earned_ankh_fx_script params = {}
						else
							SetScreenElementProps id = (<children> [<i>]) ankh_alpha = 1.0
							SetScreenElementProps id = (<children> [<i>]) star_alpha = 1.0
						endif
					endif
				elseif (<i> < <max_resurrection_lives>)
					if ScreenElementExists id = (<children> [<i>])
						SetScreenElementProps id = (<children> [<i>]) ankh_alpha = 0.7
						SetScreenElementProps id = (<children> [<i>]) star_alpha = 0.0
					endif
				else
					if ScreenElementExists id = (<children> [<i>])
						SetScreenElementProps id = (<children> [<i>]) ankh_alpha = 0.0
						SetScreenElementProps id = (<children> [<i>]) star_alpha = 0.0
					endif
				endif
				i = (<i> + 1)
				repeat <array_Size>
				<axel_menu> :SetTags {ankh_states = <array>}
			endif
		endif
	endif
endscript

script axel_use_ankh_fx_script 
	se_setprops \{x_alpha = 1.0}
	se_setprops \{star_alpha = 0.0}
	se_setprops \{ankh_alpha = 1}
	se_setprops \{ankh_rgba = [
			255
			0
			0
			255
		]}
endscript

script axel_earned_ankh_fx_script 
	se_setprops \{ankh_alpha = 1.0}
	se_setprops \{star_alpha = 1.0}
endscript

script hud_update_axel_clear_stars 
	time_delay = ($g_star_meter_fast_update_time)
	time_delay = (<time_delay> / 1000.0)
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	if hud_root :desc_resolvealias \{Name = alias_rp_axel_widget
			param = axel_widget}
		if <axel_widget> :desc_resolvealias Name = alias_ankh_menu param = axel_menu
			GetScreenElementChildren id = <axel_menu>
			GetArraySize \{children}
			if (<array_Size> > 0)
				i = 0
				begin
				if ScreenElementExists id = (<children> [<i>])
					GetScreenElementProps id = (<children> [<i>]) x_alpha = 1.0
					if (<star_alpha> = 1.0)
						(<children> [<i>]) :obj_spawnscript ankh_anim_out_fx params = {}
						Wait <time_delay> Seconds
					endif
				endif
				i = (<i> + 1)
				repeat <array_Size>
			endif
		endif
	endif
endscript

script ankh_anim_out_fx 
	se_setprops \{star_alpha = 0.0}
endscript

script hud_ankh_anim_out 
	se_setprops \{time = 0.1
		alpha = 0.0
		Scale = (3.0, 3.0)
		rgba = [
			255
			255
			255
			0
		]}
	formatText checksumName = name1 'RP_Axel_smoke_Particle%s' s = <number>
	Create2DParticleSystem {
		id = <name1>
		Pos = (0.0, 0.0)
		z_priority = 12.0
		material = mat_particle_smoke01a
		parent = <id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 0]
		start_scale = (1.55, 1.55)
		end_scale = (8.55, 8.55)
		start_angle_spread = 360.0
		min_rotation = -360
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 300
		Emit_Rate = 0.035
		emit_dir = 45.0
		emit_spread = 4.0
		velocity = 2.0
		friction = (0.0, 0.1)
		time = 1.0
	}
	formatText checksumName = name2 'RP_Axel_Dust_Particle%s' s = <number>
	Create2DParticleSystem {
		id = <name2>
		Pos = (0.0, 0.0)
		z_priority = 12.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 0]
		start_scale = (0.055, 0.055)
		end_scale = (0.055, 0.055)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 5000.0
		Emit_Rate = 0.0035
		emit_dir = 0.0
		emit_spread = 4.0
		velocity = 2.0
		friction = (120.0, 3.1)
		time = 0.2
	}
	Wait \{0.25
		Seconds}
	Destroy2DParticleSystem id = <name1> kill_when_empty
	Destroy2DParticleSystem id = <name2> kill_when_empty
	Wait \{5.0
		Seconds}
	Die
endscript

script axel_get_num_resurrections 
	num_resurrections = 0
	getbandinfo <Band> current_resurrection_lives
	getbandinfo <Band> max_resurrection_lives
	if ((<current_resurrection_lives> > <max_resurrection_lives>) || (<current_resurrection_lives> < 0))
		ScriptAssert 'invalid number of resurrections detected, %d, max = %m' d = <current_resurrection_lives> m = <max_resurrection_lives>
	endif
	return num_resurrections = <current_resurrection_lives>
endscript

script split_text_into_array_elements \{text = qs(0x6df5a0fe)
		text_pos = (0.0, 0.0)
		space_between = (0.0, 0.0)
		flags = {
		}}
	StringToCharArray string = <text>
	GetArraySize <char_array>
	if NOT GotParam \{parent}
		parent = root_window
	endif
	if GotParam \{id}
		CreateScreenElement {
			Type = ContainerElement
			parent = <parent>
			Pos = (0.0, 0.0)
			id = <id>
		}
	else
		CreateScreenElement {
			Type = ContainerElement
			parent = <parent>
			Pos = (0.0, 0.0)
		}
	endif
	parent_container = <id>
	fit_scale = 1.0
	if GotParam \{fit_dims}
		CreateScreenElement {
			Type = TextElement
			parent = <parent_container>
			text = <text>
			font = fontgrid_text_a3
			Scale = (<flags>.Scale)
		}
		GetScreenElementDims id = <id>
		StringLength string = <text>
		avg_width = (<width> / <str_len>)
		fit_scale = (<fit_dims>.(1.0, 0.0) / (<str_len> * <avg_width>))
		<space_between> = (<space_between> * <fit_scale>)
		destroy_menu menu_id = <id>
	endif
	if GotParam \{centered}
		half_width = ((<array_Size> - 1) * (<space_between>.(1.0, 0.0)) * 0.5)
		<text_pos> = (<text_pos> - <half_width> * (1.0, 0.0))
	endif
	i = 0
	begin
	CreateScreenElement {
		Type = TextElement
		parent = <parent_container>
		Pos = <text_pos>
		text = (<char_array> [<i>])
		<flags>
		Scale = (<flags>.Scale * <fit_scale>)
		alpha = (<flags>.alpha)
	}
	CreateScreenElement {
		Type = TextElement
		parent = <parent_container>
		text = (<char_array> [<i>])
		<flags>
		z_priority = (<flags>.z_priority - 1)
		rgba = [0 0 0 255]
		just = [center center]
		Pos = <text_pos>
		alpha = (<flags>.alpha)
		Scale = (<flags>.Scale * (1.3, 1.2) * <fit_scale>)
	}
	<text_pos> = (<text_pos> + <space_between>)
	<i> = (<i> + 1)
	repeat <array_Size>
	return container_id = <parent_container>
endscript

script jiggle_text_array_elements \{explode = 0}
	saved_id = <id>
	if NOT ScreenElementExists id = <id>
		return
	endif
	GetScreenElementChildren id = <id>
	GetArraySize \{children}
	i = 0
	begin
	if ScreenElementExists id = (<children> [<i>])
		GetScreenElementProps id = (<children> [<i>])
		(<children> [<i>]) :SetTags Pos = <Pos> Scale = <Scale>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	GetStartTime
	last_time = <starttime>
	begin
	GetStartTime
	if ((<starttime> - <last_time>) >= <wait_time>)
		break
	else
		i = 0
		begin
		if ScreenElementExists id = (<children> [<i>])
			(<children> [<i>]) :GetTags
			GetRandomValue \{a = -10
				b = 10
				Name = rand_x}
			GetRandomValue \{a = -10
				b = -10
				Name = rand_y}
			GetRandomValue \{a = 0
				b = 3
				Name = rand_rot}
			GetRandomValue \{a = 0.7
				b = 1.3
				Name = rand_scale}
			rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
			SetScreenElementProps id = (<children> [<i>]) Pos = (<Pos> + <rand_pos>) rot_angle = <rand_rot> Scale = <rand_scale> relative_scale
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		Wait \{0.075
			Seconds}
		<i> = 0
		begin
		if ScreenElementExists id = (<children> [<i>])
			(<children> [<i>]) :GetTags
			SetScreenElementProps id = (<children> [<i>]) Pos = <Pos> rot_angle = <rand_rot> Scale = <Scale>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	Wait \{1
		gameframe}
	repeat
	if (<explode> = 1)
		<id> = <saved_id>
		explode_text_array_elements <...>
	endif
endscript

script explode_text_array_elements 
	if NOT ScreenElementExists id = <id>
		return
	endif
	if NOT GetScreenElementChildren id = <id>
		return
	endif
	GetArraySize \{children}
	i = 0
	explode_dir = 1
	if (<array_Size> < 2)
		return
	endif
	begin
	if ScreenElementExists id = (<children> [<i>])
		switch (<explode_dir>)
			case 1
			GetRandomValue \{a = -2000
				b = 0
				Name = rand_x}
			GetRandomValue \{a = -2000
				b = -200
				Name = rand_y}
			case 2
			GetRandomValue \{a = 1280
				b = 3280
				Name = rand_x}
			GetRandomValue \{a = -2000
				b = -200
				Name = rand_y}
			case 3
			GetRandomValue \{a = 1280
				b = 3280
				Name = rand_x}
			GetRandomValue \{a = 920
				b = 2720
				Name = rand_y}
			case 4
			GetRandomValue \{a = -2000
				b = 0
				Name = rand_x}
			GetRandomValue \{a = 920
				b = 2720
				Name = rand_y}
		endswitch
		<explode_dir> = (<explode_dir> + 1)
		if (<explode_dir> > 4)
			<explode_dir> = 1
		endif
		GetRandomValue \{a = 0
			b = 180
			Name = rand_rot}
		rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
		SetScreenElementProps id = (<children> [<i>]) Pos = <rand_pos> rot_angle = <rand_rot> time = <time> motion = ease_out
	endif
	<i> = (<i> + 1)
	if ScreenElementExists id = (<children> [<i>])
		SetScreenElementProps id = (<children> [<i>]) Pos = <rand_pos> rot_angle = <rand_rot> time = <time>
	endif
	<i> = (<i> + 1)
	repeat (<array_Size> / 2)
endscript

script init_upper_container 
	<cnt> = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		if (<part> = vocals)
			cnt = (<cnt> + 1)
		endif
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
	if (<cnt> >= 1)
		shift_upper_hud
	else
		shift_upper_hud \{dx = 40}
	endif
endscript

script shift_upper_hud \{dx = 120}
	if NOT ScreenElementExists \{id = hud_root}
		printf \{qs(0xc0fc7d99)
			channel = zdebug}
		return
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_upper_container
			param = upper_group}
		printf \{qs(0x20f5a935)
			channel = zdebug}
		return
	endif
	rel_pos = ((0.0, 1.0) * <dx>)
	<upper_group> :se_setprops Pos = {relative <rel_pos>}
endscript
force_fail_vignette_on = 0

script create_band_failing_vignette 
	if NOT ScreenElementExists \{id = vignette_of_failure}
		CreateScreenElement \{id = vignette_of_failure
			parent = root_window
			Type = descinterface
			desc = 'band_fail_vignette'
			z_priority = 25
			Pos = (0.0, 0.0)
			root_alpha = 0}
		vignette_of_failure :Obj_SpawnScriptNow \{band_failing_vignette_pulse}
	endif
endscript

script band_failing_vignette_on 
	if ($game_mode = p2_faceoff)
		return
	endif
	if ($game_mode = freeplay)
		return
	endif
	if ($game_mode = tutorial)
		return
	endif
	gamemode_gettype
	if (<Type> = competitive)
		return
	endif
	create_band_failing_vignette
	vignette_of_failure :se_setprops \{root_alpha = 1.0
		time = 0.5}
endscript

script band_failing_vignette_pulse 
	begin
	se_setprops \{outline_rgba = [
			128
			0
			0
			255
		]
		time = 0.5}
	se_waitprops
	se_setprops \{outline_rgba = [
			0
			0
			0
			255
		]
		time = 0.5}
	se_waitprops
	repeat
endscript

script band_failing_vignette_off 
	if ($force_fail_vignette_on = 1)
		return
	endif
	create_band_failing_vignette
	vignette_of_failure :se_setprops \{root_alpha = 0.0
		time = 0.5}
endscript

script destroy_band_failing_vignette 
	DestroyScreenElement \{id = vignette_of_failure}
endscript

script star_meter_change_fx \{direction = up}
	if (<direction> = up)
		hud_animate_star_meter_flames
	elseif (<direction> = down)
		hud_animate_star_meter_flames
	endif
endscript

script request_star_meter_star_count_update \{star_count = 0}
	if NOT ScreenElementExists \{id = hud_star_meter_id}
		printf \{channel = zdebug
			qs(0xccccee13)}
		return
	endif
	star_meter = hud_star_meter_id
	GetSongTimeMs
	<star_meter> :SetTags {star_count = <star_count>}
endscript
g_star_meter_fast_update_time = 200.0

script star_meter_star_count_manager 
	se_setprops \{star_meter_num_text = qs(0x00000000)}
	earliest_allowed_star_set_time = 0.0
	min_time_between_star_increments = 675.0
	<curr_star_count> = 0
	<time_of_last_star_set> = 0.0
	played_speedup_anim = 0
	playlist_getcurrentsong
	songfilemanager func = get_song_end_time song_name = <current_song>
	song_end_time = <total_end_time>
	speedup = 0
	begin
	GetSongTimeMs
	if (<time> > 500.0)
		break
	endif
	Wait \{2
		gameframes}
	repeat
	begin
	GetTags
	GetSongTimeMs
	if ((<speedup> = 0) && (<time> > <total_end_time>))
		min_time_between_star_increments = ($g_star_meter_fast_update_time)
		speedup = 1
	endif
	if (<curr_star_count> != <star_count>)
		if ((<time> - <time_of_last_star_set>) > <min_time_between_star_increments>)
			if (<curr_star_count> < <star_count>)
				<curr_star_count> = (<curr_star_count> + 1)
				if (<speedup> = 0)
					star_meter_change_fx \{direction = up}
				elseif (<speedup> = 1 && <played_speedup_anim> = 0)
					star_meter_change_fx \{direction = up}
					<played_speedup_anim> = 1
				endif
			else
				<curr_star_count> = (<curr_star_count> - 1)
				if (<speedup> = 0)
					star_meter_change_fx \{direction = down}
				elseif (<speedup> = 1 && <played_speedup_anim> = 0)
					star_meter_change_fx \{direction = up}
					<played_speedup_anim> = 1
				endif
			endif
			text = qs(0x00000000)
			if (<curr_star_count> != 0)
				formatText TextName = text qs(0x4d4555da) s = <curr_star_count>
			endif
			se_setprops star_meter_num_text = <text>
			<time_of_last_star_set> = <time>
		endif
	endif
	Wait \{3
		gameframes}
	repeat
endscript

script update_casey_notestreak_meter 
	meter_id = None
	getplayerinfo <Player> part
	if (<part> = vocals)
		formatText checksumName = streak_keeper_id 'sidebar_left_streak_keeperp%p' p = <Player>
		if ScreenElementExists id = <streak_keeper_id>
			if NOT <streak_keeper_id> :desc_resolvealias Name = alias_meter param = meter_id
				return
			endif
		endif
	else
		formatText checksumName = left_rock_id 'sidebar_left_rock_meterp%p' p = <Player>
		if ScreenElementExists id = <left_rock_id>
			if NOT <left_rock_id> :desc_resolvealias Name = alias_meter param = meter_id
				return
			endif
		endif
	endif
	if ScreenElementExists id = <meter_id>
		if (<target_value> != 0)
			percent = ((1.0 * <current_value>) / <target_value>)
		else
			percent = 0.0
		endif
		if (<percent> > 1.0)
			<percent> = 1.0
		elseif (<percent> < 0.0)
			<percent> = 0.0
		endif
		if (<part> = vocals)
			Scale = ((0.0, 1.0) + ((1.0, 0.0) * <percent>))
		else
			Scale = ((1.0, 0.0) + ((0.0, 1.0) * <percent>))
		endif
		if (<percent> > 0.0)
			<meter_id> :se_setprops rp_filling_alpha = 1.0
		else
			<meter_id> :se_setprops rp_filling_alpha = 0.0
		endif
		<meter_id> :se_setprops fill_scale = <Scale>
	endif
endscript

script show_casey_notestreak_meter 
	meter_id = None
	getplayerinfo <Player> part
	if (<part> = vocals)
		formatText checksumName = streak_keeper_id 'sidebar_left_streak_keeperp%p' p = <Player>
		if ScreenElementExists id = <streak_keeper_id>
			<streak_keeper_id> :desc_resolvealias Name = alias_meter param = meter_id
		endif
	else
		formatText checksumName = left_rock_id 'sidebar_left_rock_meterp%p' p = <Player>
		if ScreenElementExists id = <left_rock_id>
			<left_rock_id> :desc_resolvealias Name = alias_meter param = meter_id
		endif
	endif
	if ScreenElementExists id = <meter_id>
		if GotParam \{time}
			<meter_id> :se_setprops alpha = 1.0 time = <time>
		else
			<meter_id> :se_setprops alpha = 1.0
		endif
	endif
endscript

script hide_casey_notestreak_meter 
	meter_id = None
	getplayerinfo <Player> part
	if (<part> = vocals)
		formatText checksumName = streak_keeper_id 'sidebar_left_streak_keeperp%p' p = <Player>
		if ScreenElementExists id = <streak_keeper_id>
			<streak_keeper_id> :desc_resolvealias Name = alias_meter param = meter_id
		endif
	else
		formatText checksumName = left_rock_id 'sidebar_left_rock_meterp%p' p = <Player>
		if ScreenElementExists id = <left_rock_id>
			<left_rock_id> :desc_resolvealias Name = alias_meter param = meter_id
		endif
	endif
	if ScreenElementExists id = <meter_id>
		if GotParam \{time}
			<meter_id> :se_setprops alpha = 0.0 time = <time>
		else
			<meter_id> :se_setprops alpha = 0.0
		endif
	endif
endscript

script hide_all_casey_notestreak_meters 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		hide_casey_notestreak_meter Player = <Player> time = 0.9
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
endscript

script reset_streak_keeper_cooldown 
	printf \{channel = zdebug
		qs(0xcc5dc08d)}
	formatText checksumName = streak_keeper_id 'sidebar_left_streak_keeperp%p' p = <Player>
	getplayerinfo <Player> part
	if ScreenElementExists id = <streak_keeper_id>
		if (0 = <protection_index>)
			<streak_keeper_id> :desc_resolvealias Name = alias_lvl1 param = shield_id
		elseif (1 = <protection_index>)
			<streak_keeper_id> :desc_resolvealias Name = alias_lvl2 param = shield_id
		else
			return
		endif
		<shield_id> :obj_spawnscript do_streak_keeper_cooldown_spawned params = {cooldown = <cooldown> miss_note_time = <miss_note_time> Player = <Player>}
		<shield_id> :obj_spawnscript do_bounce_shield_spawned params = {Player = <Player>}
	endif
endscript

script do_bounce_shield_spawned 
	se_setprops \{root_scale = (0.8, 0.8)}
	Wait \{1
		Frame}
	se_setprops \{root_scale = (1.5, 1.5)
		time = 0.1}
	Wait \{0.1
		Second}
	se_setprops \{root_scale = (0.8, 0.8)}
endscript

script do_streak_keeper_cooldown_spawned 
	start_time = <miss_note_time>
	Scale = (1.0, 0.0)
	se_setprops fill_scale = <Scale>
	cooldown = <cooldown>
	curr_time = <start_time>
	begin
	GetSongTimeMs
	last_time = <curr_time>
	curr_time = <time>
	if (($pause_grace_period) = -1.0)
		time_diff = (<curr_time> - <start_time>)
		y_scale = (<time_diff> / <cooldown>)
		if (<y_scale> > 1.0)
			<y_scale> = 1.0
		endif
		Scale = ((1.0, 0.0) + ((0.0, 1.0) * <y_scale>))
		se_setprops fill_scale = <Scale>
	endif
	elapsed_cooldown_time = (<curr_time> - <start_time>)
	if (<elapsed_cooldown_time> >= <cooldown>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script hud_update_rockmeter_judy_hilight_in_scoring \{Player = !i1768515945
		callback = !q1768515945
		script_num = 0}
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0xbcee422e) p = <Player>
		return
	endif
	getplayerinfo <Player> Band
	getplayerinfo <Player> part
	if (<part> != vocals)
		formatText checksumName = desc_id 'sidebar_left_rock_meterp%p' p = <Player>
		if NOT <desc_id> :desc_resolvealias Name = alias_judy_overhealth param = desc_id
			ScriptAssert 'player %p alias_Judy_Overhealth not found' p = <Player>
		endif
	else
		getplayerinfo <Player> combo_meter_id
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_vocals_health_meter param = desc_id
			ScriptAssert 'player %p vocal health meter not found' p = <Player>
		endif
		if NOT <desc_id> :desc_resolvealias Name = alias_judy_overhealth param = desc_id
			ScriptAssert 'player %p alias_Judy_Overhealth not found' p = <Player>
		endif
	endif
	formatText checksumName = script_id 'judy_hud_hilight%p_script%i' p = <Player> i = <script_num>
	<desc_id> :obj_spawnscript <callback> id = <script_id> params = {Player = <Player>}
endscript

script hud_update_rockmeter_judy_hilight_in_scoring_on 
	Obj_GetID
	ResolveScreenElementID id = {<objID> child = lightning_master_cont}
	<resolved_id> :se_setprops alpha = 1.0 time = <time>
	ResolveScreenElementID id = {<objID> child = hilight}
	<time> = 0.1
	<resolved_id> :se_setprops alpha = 1.0 time = <time>
endscript

script hud_update_rockmeter_judy_hilight_in_scoring_off \{Player = !i1768515945}
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0x2f53564b) p = <Player>
		return
	endif
	formatText checksumName = script_id 'judy_hud_hilight%p_script%i' p = <Player> i = 1
	KillSpawnedScript id = <script_id>
	Obj_GetID
	ResolveScreenElementID id = {<objID> child = lightning_master_cont}
	<resolved_id> :se_setprops alpha = 0.0 time = <time>
	ResolveScreenElementID id = {<objID> child = hilight}
	<time> = 0.5
	<resolved_id> :se_setprops alpha = 0.0 time = <time>
endscript

script hud_update_remote_rockmeter_bonus_tank \{Player = !i1768515945
		song_health_percentage = !f1768515945
		activate = !i1768515945}
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0xf7401ac3) p = <Player>
		return
	endif
	getplayerinfo <Player> Band
	getplayerinfo <Player> part
	if (<part> != vocals)
		formatText checksumName = desc_id 'sidebar_left_rock_meterp%p' p = <Player>
		if NOT <desc_id> :desc_resolvealias Name = alias_judy_overhealth param = desc_id
			ScriptAssert 'player %p alias_Judy_Overhealth not found' p = <Player>
		endif
	else
		getplayerinfo <Player> combo_meter_id
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_vocals_health_meter param = desc_id
			ScriptAssert 'player %p vocal health meter not found' p = <Player>
		endif
		if NOT <desc_id> :desc_resolvealias Name = alias_judy_overhealth param = desc_id
			ScriptAssert 'player %p alias_Judy_Overhealth not found' p = <Player>
		endif
	endif
	if (<activate> = 1)
		<desc_id> :obj_spawnscript hud_update_remote_rockmeter_bonus_tank_spawned params = {Player = <Player> song_health_percentage = <song_health_percentage>}
	else
		<desc_id> :Obj_KillSpawnedScript Name = hud_update_remote_rockmeter_bonus_tank_spawned
	endif
endscript

script hud_update_remote_rockmeter_bonus_tank_spawned 
	begin
	hud_update_rockmeter_bonus_stars_judy Player = <Player> song_health_percentage = <song_health_percentage>
	Wait \{0.3
		Seconds}
	repeat
endscript

script hud_update_rockmeter_bonus_stars_judy \{Player = !i1768515945
		song_health_percentage = !f1768515945
		init = 0}
	if ($calibrate_lag_enabled = 1)
		return
	endif
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0x49121ecd) p = <Player>
		return
	endif
	getplayerinfo <Player> Band
	getplayerinfo <Player> part
	if (<part> != vocals)
		formatText checksumName = desc_id 'sidebar_left_rock_meterp%p' p = <Player>
		if NOT <desc_id> :desc_resolvealias Name = alias_judy_overhealth param = desc_id
			ScriptAssert 'player %p alias_Judy_Overhealth not found' p = <Player>
		endif
	else
		getplayerinfo <Player> combo_meter_id
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_vocals_health_meter param = desc_id
			ScriptAssert 'player %p vocal health meter not found' p = <Player>
		endif
		if NOT <desc_id> :desc_resolvealias Name = alias_judy_overhealth param = desc_id
			ScriptAssert 'player %p alias_Judy_Overhealth not found' p = <Player>
		endif
	endif
	ResolveScreenElementID id = {<desc_id> child = fill}
	<desc_id> :se_setprops alpha = 1.0
	if (<init> = 1)
		GetScreenElementDims id = <resolved_id>
		<new_dims> = (<width> * (1.0, 0.0))
		<resolved_id> :se_setprops dims = <new_dims> alpha = 0.0
	elseif (<song_health_percentage> > 0.0)
		getplayerinfo <Player> over_health
		<fill_percent_y> = (<over_health> / <song_health_percentage>)
		if (<fill_percent_y> > 1.0)
			fill_percent_y = 1.0
		endif
		<fill_dims_y> = (<fill_percent_y> * 64.0)
		GetScreenElementDims id = <resolved_id>
		<new_dims> = ((<width> * (1.0, 0.0)) + (<fill_dims_y> * (0.0, 1.0)))
		<resolved_id> :se_setprops dims = <new_dims> alpha = 1.0
	endif
endscript

script hud_update_rockmeter_judy_full {
	}
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0xf7401ac3) p = <Player>
		return
	endif
	getplayerinfo <Player> Band
	getplayerinfo <Player> part
	if (<part> != vocals)
		formatText checksumName = desc_id 'sidebar_left_rock_meterp%p' p = <Player>
		if NOT <desc_id> :desc_resolvealias Name = alias_judy_overhealth param = desc_id
			ScriptAssert 'player %p alias_Judy_Overhealth not found' p = <Player>
		else
			<desc_id> :Obj_SpawnScriptNow starearn01 params = {{parent_id = <desc_id>} {Player = <Player>}}
		endif
	else
		getplayerinfo <Player> combo_meter_id
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_vocals_health_meter param = desc_id
			ScriptAssert 'player %p vocal health meter not found' p = <Player>
		endif
		if NOT <desc_id> :desc_resolvealias Name = alias_judy_overhealth param = desc_id
			ScriptAssert 'player %p alias_Judy_Overhealth not found' p = <Player>
		else
			<desc_id> :Obj_SpawnScriptNow starearn01 params = {{parent_id = <desc_id>} {Player = <Player>}}
		endif
	endif
endscript

script hud_kill_rockmeter_bonus_stars_judy \{Player = !i1768515945}
	Wait \{2.0
		Seconds}
	getnumplayersingame \{on_screen}
	getplayerinfo <Player> Band
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		if (<part> != vocals)
			formatText checksumName = desc_id 'sidebar_left_rock_meterp%p' p = <Player>
			if ScreenElementExists id = <desc_id>
				<desc_id> :desc_resolvealias Name = alias_judy_overhealth param = meter_id
			endif
		else
			getplayerinfo <Player> combo_meter_id
			if ScreenElementExists id = <combo_meter_id>
				if <combo_meter_id> :desc_resolvealias Name = alias_vocals_health_meter param = desc_id
					<desc_id> :desc_resolvealias Name = alias_judy_overhealth param = meter_id
				endif
			endif
		endif
		if GotParam \{meter_id}
			if ScreenElementExists id = <meter_id>
				<meter_id> :se_setprops alpha = 0.0 time = 0.75
				<meter_id> :Obj_KillSpawnedScript Name = hud_update_remote_rockmeter_bonus_tank_spawned
			endif
			RemoveParameter \{meter_id}
		endif
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
endscript

script hud_do_new_female_star_power_fx 
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0xc869d4cd) p = <Player>
		return
	endif
	SoundEvent \{event = audio_star_power_sp_tesla}
	getplayerinfo <Player> part
	getplayerinfo <Player> star_power_per_note_streak
	lvl = 1
	if (<star_power_per_note_streak> > 5)
		lvl = 2
	endif
	if (<part> != vocals)
		if (<lvl> = 1)
			SpawnScriptNow rp_newfemale_lv1_fx params = {Player = <Player>}
		else
			SpawnScriptNow rp_newfemale_lv2_fx params = {Player = <Player>}
		endif
	else
		if (<lvl> = 1)
			SpawnScriptNow rp_newfemale_vocal_lv1_fx params = {Player = <Player>}
		else
			SpawnScriptNow rp_newfemale_vocal_lv2_fx params = {Player = <Player>}
		endif
	endif
endscript

script rp_newfemale_lv1_fx 
	RequireParams \{[
			Player
		]}
	formatText checksumName = right_sp_id 'sidebar_right_sp_meterp%p' p = <Player>
	if NOT ScreenElementExists id = <right_sp_id>
		return
	endif
	<right_sp_id> :desc_resolvealias Name = alias_tesla_needle param = tesla_needle_pos
	<right_sp_id> :desc_resolvealias Name = alias_needle_container param = needle_pos
	<right_sp_id> :se_setprops starpower_fill_rgba = [128 255 128 255]
	<right_sp_id> :se_setprops rp_tesla_spark_alpha = 0.5 time = 0.1
	<right_sp_id> :se_setprops rp_tesla_fx_lv1_alpha = 0.5 time = 0.1
	CreateScreenElement {
		Type = SpriteElement
		parent = <tesla_needle_pos>
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = [center center]
		Pos = (0.0, 0.0)
		z_priority = 11
		rgba = [255 255 255 255]
		blend = add
		texture = sb_tubeglow01
		rot_angle = 0
	}
	se01 = <id>
	Create2DParticleSystem {
		Pos = (0.0, 0.0)
		z_priority = 12
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <needle_pos>
		start_color = [128 255 128 128]
		end_color = [128 255 128 0]
		start_scale = (0.25, 0.25)
		end_scale = (1.25, 1.25)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 3
		emit_radius = 22
		Emit_Rate = 0.005
		emit_dir = 66.0
		emit_spread = 180.0
		velocity = 3.3
		friction = (0.0, 50.0)
		time = 0.21000001
	}
	fx1 = <id>
	Create2DParticleSystem {
		Pos = (20.0, 0.0)
		z_priority = 2.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <needle_pos>
		start_color = [128 255 128 255]
		end_color = [128 255 128 0]
		start_scale = (3.0, 3.0)
		end_scale = (1.0, 1.0)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 30
		emit_start_radius = 0
		emit_radius = 1
		Emit_Rate = 0.035
		emit_dir = 0.0
		emit_spread = 2
		velocity = 0.0
		friction = (0.0, 0.0)
		time = 0.1
	}
	fx2 = <id>
	Wait \{0.1
		Seconds}
	Destroy2DParticleSystem id = <fx1> kill_when_empty
	Destroy2DParticleSystem id = <fx2>
	Wait \{0.25
		Seconds}
	if ScreenElementExists id = <right_sp_id>
		<right_sp_id> :se_setprops rp_tesla_spark_alpha = 0
		<right_sp_id> :se_setprops rp_tesla_fx_lv1_alpha = 0
	endif
	if ScreenElementExists id = <se01>
		<se01> :se_setprops alpha = 0 time = 0.5
	endif
	Wait \{1
		Seconds}
	DestroyScreenElement id = <se01>
endscript

script rp_newfemale_lv2_fx 
	RequireParams \{[
			Player
		]}
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0x6bf7c719) p = <Player>
		return
	endif
	formatText checksumName = right_sp_id 'sidebar_right_sp_meterp%p' p = <Player>
	if ScreenElementExists id = <right_sp_id>
		<right_sp_id> :desc_resolvealias Name = alias_tesla_needle param = tesla_needle_pos
		<right_sp_id> :desc_resolvealias Name = alias_needle_container param = needle_pos
		<right_sp_id> :se_setprops starpower_fill_rgba = [128 255 128 255]
		<right_sp_id> :se_setprops rp_tesla_spark_alpha = 1 time = 0.1
		<right_sp_id> :se_setprops rp_tesla_fx_lv2_alpha = 1 time = 0.1
	endif
	formatText checksumName = fx1 'sidebar_SPFX_Squirtp%p' p = <Player>
	formatText checksumName = fx2 'RP_NewFemale_spark01_Particlep%p' p = <Player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <tesla_needle_pos>
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = [center center]
		Pos = (0.0, 0.0)
		z_priority = 11
		rgba = [255 255 255 255]
		blend = add
		texture = sb_tubeglow01
		rot_angle = 0
	}
	se01 = <id>
	Create2DParticleSystem {
		Pos = (0.0, 0.0)
		z_priority = 12
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <needle_pos>
		start_color = [128 255 128 228]
		end_color = [128 255 128 0]
		start_scale = (0.25, 0.25)
		end_scale = (0.5, 0.5)
		start_angle_spread = 360.0
		min_rotation = 200
		max_rotation = -200
		emit_start_radius = 3
		emit_radius = 22
		Emit_Rate = 0.005
		emit_dir = 66.0
		emit_spread = 180.0
		velocity = 3.3
		friction = (0.0, 60.0)
		time = 0.25
	}
	fx1 = <id>
	Create2DParticleSystem {
		Pos = (20.0, 0.0)
		z_priority = 2.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <needle_pos>
		start_color = [128 255 128 255]
		end_color = [128 255 128 0]
		start_scale = (0.0, 0.0)
		end_scale = (3.0, 3.0)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 30
		emit_start_radius = 0
		emit_radius = 1
		Emit_Rate = 0.01
		emit_dir = 0.0
		emit_spread = 2
		velocity = 0.0
		friction = (0.0, 0.0)
		time = 0.2
	}
	fx2 = <id>
	Wait \{0.1
		Seconds}
	Destroy2DParticleSystem id = <fx2> kill_when_empty
	Wait \{0.25
		Seconds}
	Destroy2DParticleSystem id = <fx1> kill_when_empty
	if ScreenElementExists id = <right_sp_id>
		<right_sp_id> :se_setprops rp_tesla_spark_alpha = 0
		<right_sp_id> :se_setprops rp_tesla_fx_lv2_alpha = 0
	endif
	if ScreenElementExists id = <se01>
		<se01> :se_setprops alpha = 0 time = 0.5
	endif
	Wait \{0.5
		Seconds}
	DestroyScreenElement id = <se01>
endscript

script rp_newfemale_vocal_lv1_fx 
	RequireParams \{[
			Player
		]}
	getplayerinfo <Player> vocals_highway_view
	if ($end_credits = 1 || <vocals_highway_view> = karaoke)
		return
	endif
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0x3366f9ac) p = <Player>
		return
	endif
	getplayerinfo <Player> combo_meter_id
	<combo_meter_id> :desc_resolvealias Name = alias_vocals_star_power_meter param = meter_id
	<meter_id> :desc_resolvealias Name = alias_vocal_starpower_needle param = sp_squirt_vocals_cont
	formatText checksumName = fx1 'Vocals_SPFX_Squirtp%p' p = <Player> AddToStringLookup = true
	Create2DParticleSystem {
		id = <fx1>
		Pos = (0.0, 0.0)
		z_priority = 12
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <sp_squirt_vocals_cont>
		start_color = [128 255 128 255]
		end_color = [0 255 64 0]
		start_scale = (0.25, 0.25)
		end_scale = (1.25, 1.25)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 1
		emit_radius = 1
		Emit_Rate = 0.01
		emit_dir = 0.0
		emit_spread = 270.0
		velocity = 5
		friction = (0.0, 20.0)
		time = 0.55
	}
	<meter_id> :se_setprops rp_telsa_fx_alpha = 1
	<meter_id> :se_setprops vocal_starpower_fill_rgba = [64 255 0 255]
	<meter_id> :se_setprops rp_telsa_fx_lv1_cont_alpha = 1 time = 0.1
	Wait \{0.1
		Seconds}
	Destroy2DParticleSystem id = <fx1> kill_when_empty
	if ScreenElementExists id = <meter_id>
		<meter_id> :se_setprops rp_telsa_fx_lv1_cont_alpha = 0 time = 0.1
		<meter_id> :se_setprops rp_telsa_fx_alpha = 0 time = 0.1
	else
		return
	endif
endscript

script rp_newfemale_vocal_lv2_fx 
	RequireParams \{[
			Player
		]}
	getplayerinfo <Player> vocals_highway_view
	if ($end_credits = 1 || <vocals_highway_view> = karaoke)
		return
	endif
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0x323bdf7d) p = <Player>
		return
	endif
	getplayerinfo <Player> combo_meter_id
	<combo_meter_id> :desc_resolvealias Name = alias_vocals_star_power_meter param = meter_id
	<meter_id> :desc_resolvealias Name = alias_vocal_starpower_needle param = sp_squirt_vocals_cont
	formatText checksumName = fx1 'Vocals_SPFX_Squirtp%p' p = <Player> AddToStringLookup = true
	Create2DParticleSystem {
		id = <fx1>
		Pos = (0.0, 0.0)
		z_priority = 12
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <sp_squirt_vocals_cont>
		start_color = [128 255 128 255]
		end_color = [0 255 64 0]
		start_scale = (0.25, 0.25)
		end_scale = (1.25, 1.25)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 1
		emit_radius = 1
		Emit_Rate = 0.005
		emit_dir = 0.0
		emit_spread = 270.0
		velocity = 5
		friction = (0.0, 20.0)
		time = 0.55
	}
	<meter_id> :se_setprops rp_telsa_fx_alpha = 1
	<meter_id> :se_setprops vocal_starpower_fill_rgba = [64 255 0 255]
	<meter_id> :se_setprops rp_telsa_fx_lv2_cont_alpha = 1 time = 0.1
	Wait \{0.2
		Seconds}
	Destroy2DParticleSystem id = <fx1> kill_when_empty
	if ScreenElementExists id = <meter_id>
		<meter_id> :se_setprops rp_telsa_fx_lv2_cont_alpha = 0 time = 0.2
		<meter_id> :se_setprops rp_telsa_fx_alpha = 0 time = 0.2
	else
		return
	endif
endscript

script hud_launch_johnny_rocker_fx 
	getplayerinfo <Player> min_multiplier
	getplayerinfo <Player> multiplier_speed
	getplayerinfo <Player> part
	do_johnny_fx = 0
	if (<min_multiplier> = 2 && <multiplier_speed> = 2)
		do_johnny_fx = 1
		johnny_lvl = 2
	elseif (<min_multiplier> = 2 && <multiplier_speed> = 1)
		do_johnny_fx = 1
		johnny_lvl = 1
	endif
	if (<do_johnny_fx> = 1)
		<desc_id> :obj_spawnscript hud_launch_johnny_rocker_fx_spawned params = {lvl = <johnny_lvl> id = <desc_id> part = <part> Player = <Player>}
	endif
endscript

script hud_launch_johnny_rocker_fx_spawned 
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0x07ec1e16) p = <Player>
		return
	endif
	if (<part> = vocals)
		if NOT <id> :desc_resolvealias Name = alias_vocals_multiplier param = particle_parent
			ScriptAssert \{'vocals multiplier not found for johnny fx'}
		endif
		<particle_parent> :se_setprops text_alpha = 0.0
	else
		formatText checksumName = combo_meter_id 'sidebar_right_ns_meterp%p' p = <Player>
		if NOT ScreenElementExists id = <combo_meter_id>
			ScriptAssert \{'could not find ns_meter to set up johnny timer'}
		endif
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_johnny_timers param = johnny_timers
			ScriptAssert \{'Could not find johnny timer within ns_meter for Johnny Special power setup'}
		endif
		se_setprops \{combo_multiplier_container_alpha = 0.0}
		if NOT <id> :desc_resolvealias Name = alias_rp_multiplier_fx_cont param = particle_parent
			ScriptAssert \{'Johnny power rocker hud fx have failed'}
		endif
	endif
	begin
	GetSongTimeMs
	if (<time> > 200.0)
		break
	endif
	Wait \{2
		gameframes}
	repeat
	if GotParam \{lvl}
		if (<lvl> = 2)
			audio_play_character_powers_sfx \{character = qs(0x6a66ae57)
				lvl = 2}
		else
			audio_play_character_powers_sfx \{character = qs(0x6a66ae57)
				lvl = 1}
		endif
	endif
	formatText checksumName = name3 'RP_Johnny_Lightning_Particle%s' s = <Player>
	Create2DParticleSystem {
		id = <name3>
		Pos = (0.0, 0.0)
		z_priority = 12.0
		material = mat_particle_lightning_arc01
		parent = <particle_parent>
		start_color = [255 255 255 255]
		end_color = [0 255 0 128]
		start_scale = (0.5, 0.5)
		end_scale = (0.5, 0.5)
		start_angle_spread = 360.0
		min_rotation = -344
		max_rotation = 555
		emit_start_radius = 0
		emit_radius = 0
		Emit_Rate = 0.1
		emit_dir = 0.0
		emit_spread = 0
		velocity = 0.0
		friction = (0.0, 0.0)
		time = 0.15
	}
	Wait \{0.5
		Seconds}
	if (<part> = vocals)
		<particle_parent> :se_setprops text_alpha = 1.0 time = 0.15
	else
		se_setprops \{combo_multiplier_container_alpha = 1.0
			time = 0.15}
	endif
	formatText checksumName = name2 'RP_Johnny_spark_Particle%s' s = <Player>
	Create2DParticleSystem {
		id = <name2>
		Pos = (0.0, 0.0)
		z_priority = 2.1
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <particle_parent>
		start_color = [255 255 255 255]
		end_color = [0 255 0 128]
		start_scale = (0.55, 0.55)
		end_scale = (0.25, 0.25)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 12.0
		Emit_Rate = 0.015
		emit_dir = 0.0
		emit_spread = 200.0
		velocity = 4.0
		friction = (0.0, 12.0)
		time = 0.5
	}
	formatText checksumName = name4 'RP_Johnny_Flash_Particle%s' s = <Player>
	Create2DParticleSystem {
		id = <name4>
		Pos = (0.0, 0.0)
		z_priority = 2.1
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <particle_parent>
		start_color = [255 255 255 255]
		end_color = [0 255 0 0]
		start_scale = (0.255, 0.255)
		end_scale = (8.55, 8.55)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 12.0
		Emit_Rate = 0.015
		emit_dir = 0.0
		emit_spread = 100.0
		velocity = 0.0
		friction = (0.0, 0.0)
		time = 0.1
	}
	formatText checksumName = name1 'RP_Johnny_smoke_Particle%s' s = <Player>
	Create2DParticleSystem {
		id = <name1>
		Pos = (0.0, 0.0)
		z_priority = 2.0
		material = mat_particle_smoke01
		parent = <particle_parent>
		start_color = [255 255 255 200]
		end_color = [64 255 0 0]
		start_scale = (2.0, 2.0)
		end_scale = (4.0, 4.0)
		start_angle_spread = 360.0
		min_rotation = -360
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 120
		Emit_Rate = 0.0035
		emit_dir = 0.0
		emit_spread = 2
		velocity = 2.0
		friction = (0.0, 2.0)
		time = 1.0
	}
	if (<part> != vocals)
		<johnny_timers> :se_setprops pr_johnny_cont_alpha = 1
	endif
	Destroy2DParticleSystem id = <name3> kill_when_empty
	Wait \{0.1
		Seconds}
	Destroy2DParticleSystem id = <name2> kill_when_empty
	Destroy2DParticleSystem id = <name1> kill_when_empty
	Destroy2DParticleSystem id = <name4> kill_when_empty
endscript

script start_johnny_bonus_star_timer \{Player = !i1768515945
		start_time = !f1768515945}
	if ($calibrate_lag_enabled = 1)
		return
	endif
	getplayerinfo <Player> min_multiplier
	if (<min_multiplier> > 1)
		if ScreenElementExists \{id = hud_root}
			hud_root :obj_spawnscript do_johnny_bonus_star_timer_spawned params = {start_time = <start_time> Player = <Player>}
		endif
	endif
endscript

script do_johnny_bonus_star_timer_spawned 
	getplayerinfo <Player> Band
	getplayerinfo <Player> min_multiplier
	getplayerinfo <Player> multiplier_speed
	getplayerinfo <Player> multiplier_accumulated_time
	getplayerinfo <Player> part
	getplayerinfo <Player> is_local_client
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0x2b722210) p = <Player>
		return
	endif
	if (<part> = vocals)
		getplayerinfo <Player> combo_meter_id
		if NOT ScreenElementExists id = <combo_meter_id>
			ScriptAssert \{'could not find ns_meter to set up johnny timer'}
		endif
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_johnny_timers param = johnny_timers
			ScriptAssert \{'Could not find johnny timer within ns_meter for Johnny Special power setup'}
		endif
	else
		formatText checksumName = combo_meter_id 'sidebar_right_ns_meterp%p' p = <Player>
		if NOT ScreenElementExists id = <combo_meter_id>
			ScriptAssert \{'could not find ns_meter to set up johnny timer'}
		endif
	endif
	if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_johnny_timers param = johnny_timers
		ScriptAssert \{'Could not find johnny timer within ns_meter for Johnny Special power setup'}
	endif
	score_attribute_level = 1
	if (<multiplier_speed> >= 2)
		score_attribute_level = 2
	endif
	playlist_getcurrentsong
	songfilemanager func = get_song_end_time song_name = <current_song>
	<percentage_songtime> = (<total_end_time> * ($g_johnny_bonus_song_percent / 100.0))
	<timer_total_time> = <multiplier_accumulated_time>
	begin
	getbandinfo <Band> mult_timer_bonus_stars
	<stars_allowed> = 0
	if (<score_attribute_level> = 1)
		<stars_allowed> = ($g_multiplier_star_bonus_max_1)
	elseif (<score_attribute_level> = 2)
		<stars_allowed> = ($g_multiplier_star_bonus_max_2)
	endif
	if (<mult_timer_bonus_stars> + 1 > <stars_allowed>)
		hide_all_johnny_timers
		break
	endif
	getplayerinfo <Player> multiplier_timer_active
	if (<multiplier_timer_active> != 1)
		<johnny_timers> :se_setprops rp_filling_alpha = 0.0
		break
	endif
	GetSongTimeMs
	<timer_total_time> = ((<time> - <start_time>) + <multiplier_accumulated_time>)
	if (<timer_total_time> > <percentage_songtime>)
		getbandinfo <Band> mult_timer_bonus_stars
		if (<mult_timer_bonus_stars> + 1 <= <stars_allowed>)
			if (<is_local_client> = 1)
				setbandinfo <Band> mult_timer_bonus_stars = (<mult_timer_bonus_stars> + 1)
				spawnscript johnny_starearn01 params = {Player = <Player>}
				awardbandbonusstar Type = mult_timer_bonus_star Player = <Player>
			endif
			GetSongTimeMs
			<start_time> = <time>
			<multiplier_accumulated_time> = 0
			<timer_total_time> = 0
		else
			break
		endif
	endif
	if (<timer_total_time> > <percentage_songtime>)
		<timer_percent> = 1.0
	elseif (<timer_total_time> > 0)
		<timer_percent> = (<timer_total_time> / <percentage_songtime>)
	else
		<timer_percent> = 0
	endif
	getplayerinfo <Player> part
	if (<part> = vocals)
		gauge_scale = ((0.0, 1.0) + ((1.0, 0.0) * <timer_percent>))
		<johnny_timers> :se_setprops fill_scale = <gauge_scale>
		<johnny_timers> :se_setprops rp_filling_alpha = 1.0
	else
		<max_rotation> = 165.0
		rot = (<timer_percent> * <max_rotation>)
		rot = (<max_rotation> - <rot>)
		<johnny_timers> :se_setprops pr_johnny_fill_cont_rot_angle = <rot>
	endif
	begin
	getplayerinfo <Player> multiplier_timer_active out = timer_active
	if (<timer_active> != 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat 20
	repeat
	if (<is_local_client> = 1)
		setplayerinfo <Player> multiplier_accumulated_time = <timer_total_time>
	endif
endscript

script hide_all_johnny_timers 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		if (<part> = vocals)
			getplayerinfo <Player> combo_meter_id
			if NOT ScreenElementExists id = <combo_meter_id>
				ScriptAssert \{'could not find ns_meter to set up johnny timer'}
			endif
			if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_johnny_timers param = johnny_timers
				ScriptAssert \{'Could not find johnny timer within ns_meter for Johnny Special power setup'}
			endif
		else
			formatText checksumName = combo_meter_id 'sidebar_right_ns_meterp%p' p = <Player>
			if NOT ScreenElementExists id = <combo_meter_id>
				ScriptAssert \{'could not find ns_meter to set up johnny timer'}
			endif
		endif
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_johnny_timers param = johnny_timers
			ScriptAssert \{'Could not find johnny timer within ns_meter for Johnny Special power setup'}
		endif
		<johnny_timers> :se_setprops alpha = 0.0 time = 0.1
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
endscript

script hud_launch_lars_rocker_fx 
	getplayerinfo <Player> multiplier_5
	getplayerinfo <Player> multiplier_6
	do_lars_fx = 0
	if (<multiplier_6> > 0)
		do_lars_fx = 1
		lars_lvl = 2
	elseif (<multiplier_5> > 0)
		do_lars_fx = 1
		lars_lvl = 1
	endif
	if (<do_lars_fx> = 1)
		<desc_id> :obj_spawnscript hud_launch_lars_rocker_fx_spawned params = {lvl = <lars_lvl> id = <desc_id> Player = <Player>}
	endif
endscript

script hud_launch_lars_rocker_fx_spawned 
	getplayerinfo <Player> part
	getplayerinfo <Player> combo_meter_id
	if playerinfoequals <Player> is_onscreen = 0
		return
	endif
	if ($cheat_hudfreemode = 1)
		return
	endif
	if (<part> = vocals)
		if NOT <id> :desc_resolvealias Name = alias_vocals_multiplier param = particle_parent
			ScriptAssert \{'vocals multiplier not found for lars fx'}
		endif
		if NOT <id> :desc_resolvealias Name = alias_vocals_multiplier param = multiplier_id
			ScriptAssert \{'vocals multiplier not found for lars fx'}
		endif
	else
		if NOT ScreenElementExists id = <combo_meter_id>
			ScriptAssert \{'could not find ns_meter to set up lars timer'}
		endif
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_multiplier_fx_cont param = particle_parent
			ScriptAssert \{'lars power rocker hud fx have failed'}
		endif
	endif
	formatText checksumName = sparks01 'RP_Lars_spark_Particle%s' s = <Player>
	formatText checksumName = flash01 'RP_Lars_Flash_Particle%s' s = <Player>
	formatText checksumName = big_smoke01 'RP_Lars_smoke_Particle%s' s = <Player>
	begin
	GetSongTimeMs
	if (<time> > 200.0)
		break
	endif
	Wait \{2
		gameframes}
	repeat
	mult_text = qs(0x1c172fb6)
	if (<lvl> > 1)
		mult_text = qs(0x373a7c75)
	endif
	if (<part> = vocals)
		<particle_parent> :se_setprops text_alpha = 0.0
		<particle_parent> :se_setprops fake_text_alpha = 1.0
		<particle_parent> :se_setprops fake_multiplier_number_text = <mult_text>
		<particle_parent> :se_setprops fake_multiplier_number_text2 = <mult_text>
		Wait \{1
			gameframe}
	else
		<combo_meter_id> :se_setprops combo_multiplier_container_alpha = 0.0
		<combo_meter_id> :se_setprops combo_multiplier_container_fake_alpha = 1.0
		<combo_meter_id> :se_setprops multiplier_text_fake_text = <mult_text>
		<combo_meter_id> :se_setprops multiplier_text_overlay_fake_text = <mult_text>
		<combo_meter_id> :se_setprops multiplier_text_fake_rgba = [255 0 0 255]
		Wait \{1
			gameframe}
		if <combo_meter_id> :desc_resolvealias Name = alias_combo_multiplier_container_fake param = fake_mult_cont
			<fake_mult_cont> :obj_spawnscript safe_wait_and_hide params = {id = <fake_mult_cont> fade_time = 0.1 wait_time = 0.7}
		else
			<combo_meter_id> :se_setprops combo_multiplier_container_fake_alpha = 0.0 time = 0.5
		endif
	endif
	if (<lvl> > 1)
		audio_play_character_powers_sfx \{character = qs(0xe26369e9)
			lvl = 1}
	else
		audio_play_character_powers_sfx \{character = qs(0xe26369e9)
			lvl = 2}
	endif
	Destroy2DParticleSystem id = <sparks01>
	Destroy2DParticleSystem id = <big_smoke01>
	Destroy2DParticleSystem id = <flash01>
	Create2DParticleSystem {
		id = <sparks01>
		Pos = (0.0, 0.0)
		z_priority = 2.1
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <particle_parent>
		start_color = [255 128 128 255]
		end_color = [255 0 0 128]
		start_scale = (0.55, 0.55)
		end_scale = (0.25, 0.25)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 12.0
		Emit_Rate = 0.015
		emit_dir = 0.0
		emit_spread = 200.0
		velocity = 4.0
		friction = (0.0, 12.0)
		time = 0.5
	}
	Create2DParticleSystem {
		id = <flash01>
		Pos = (0.0, 0.0)
		z_priority = 2.1
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <particle_parent>
		start_color = [255 255 255 255]
		end_color = [255 0 0 0]
		start_scale = (0.255, 0.255)
		end_scale = (8.55, 8.55)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 12.0
		Emit_Rate = 0.015
		emit_dir = 0.0
		emit_spread = 100.0
		velocity = 0.0
		friction = (0.0, 0.0)
		time = 0.1
	}
	Create2DParticleSystem {
		id = <big_smoke01>
		Pos = (0.0, -10.0)
		z_priority = 2.0
		material = mat_particle_smoke01
		parent = <particle_parent>
		start_color = [255 64 64 200]
		end_color = [255 0 0 0]
		start_scale = (2.0, 2.0)
		end_scale = (4.0, 4.0)
		start_angle_spread = 360.0
		min_rotation = -360
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 120
		Emit_Rate = 0.0035
		emit_dir = 0.0
		emit_spread = 2
		velocity = 2.0
		friction = (0.0, 2.0)
		time = 1.0
	}
	Wait \{0.1
		Seconds}
	Destroy2DParticleSystem id = <sparks01> kill_when_empty
	Destroy2DParticleSystem id = <big_smoke01> kill_when_empty
	Destroy2DParticleSystem id = <flash01> kill_when_empty
	if (<part> = vocals)
		Wait \{0.7
			Second}
		<particle_parent> :se_setprops fake_text_alpha = 0.0 time = 0.2
		Wait \{0.2
			Seconds}
		<particle_parent> :se_setprops text_alpha = 1.0 time = 0.2
	endif
endscript

script hud_lars_rocker_lv2_fx 
	getplayerinfo <Player> part
	if playerinfoequals <Player> is_onscreen = 0
		return
	endif
	if ($cheat_hudfreemode = 1)
		return
	endif
	if (<part> = vocals)
		mat1 = mat_smokedisk_blend
		mat2 = mat_smoke_square01_add
		min_rot = 0
		max_rot = 0
		scale01 = (1.0, 0.6)
		scale02 = (2.0, 1.25)
		friction = (0.0, -0.5)
		Pos = (0.0, 0.0)
		time = 1.0
		start_rgba = [255 0 0 64]
		getplayerinfo <Player> combo_meter_id
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_vocals_multiplier param = particle_parent
			ScriptAssert \{'vocals multiplier not found for lars fx'}
		endif
	else
		formatText checksumName = combo_meter_id 'sidebar_right_ns_meterp%p' p = <Player>
		mat1 = mat_smokedisk_blend
		mat2 = mat_smoke_ring01_add
		min_rot = -344
		max_rot = 555
		scale01 = (1.0, 1.0)
		scale02 = (2.0, 2.0)
		friction = (0.0, -5.0)
		Pos = (0.0, 0.0)
		time = 0.5
		start_rgba = [255 0 0 128]
		if NOT ScreenElementExists id = <combo_meter_id>
			ScriptAssert \{'could not find ns_meter to set up lars timer'}
		endif
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_multiplier_fx_cont param = particle_parent
			ScriptAssert \{'lars power rocker hud fx have failed'}
		endif
	endif
	formatText checksumName = smoke_disk01 'RP_Lars_Smoke_disk_Particle%s' s = <Player>
	formatText checksumName = smoke_ring01 'RP_Lars_Smoke_RING_Particle%s' s = <Player>
	formatText checksumName = lil_smoke01 'RP_Lars_Little_smoke_Particle%s' s = <Player>
	formatText checksumName = lil_spark01 'RP_Lars_Little_spark_Particle%s' s = <Player>
	Destroy2DParticleSystem id = <smoke_disk01>
	Destroy2DParticleSystem id = <smoke_ring01>
	Destroy2DParticleSystem id = <lil_smoke01>
	Destroy2DParticleSystem id = <lil_spark01>
	Create2DParticleSystem {
		id = <smoke_disk01>
		Pos = <Pos>
		z_priority = 1
		material = <mat1>
		parent = <particle_parent>
		start_color = <start_rgba>
		end_color = [255 0 0 0]
		start_scale = (1.0, 1.0)
		end_scale = (1.0, 1.0)
		start_angle_spread = 360.0
		min_rotation = -344
		max_rotation = 555
		emit_start_radius = 0
		emit_radius = 0
		Emit_Rate = 0.4
		emit_dir = 0.0
		emit_spread = 0
		velocity = 0.0
		friction = <friction>
		time = <time>
	}
	Create2DParticleSystem {
		id = <smoke_ring01>
		Pos = <Pos>
		z_priority = 12
		material = <mat2>
		parent = <particle_parent>
		start_color = [255 0 0 255]
		end_color = [255 0 0 0]
		start_scale = <scale02>
		end_scale = <scale02>
		start_angle_spread = 360.0
		min_rotation = <min_rot>
		max_rotation = <max_rot>
		emit_start_radius = 0
		emit_radius = 0
		Emit_Rate = 0.1
		emit_dir = 0.0
		emit_spread = 0
		velocity = 0.0
		friction = <friction>
		time = <time>
	}
	Create2DParticleSystem {
		id = <lil_smoke01>
		Pos = (0.0, -10.0)
		z_priority = 0.06
		material = mat_particle_smoke01
		parent = <particle_parent>
		start_color = [255 64 64 200]
		end_color = [255 0 0 0]
		start_scale = (2.0, 2.0)
		end_scale = (4.0, 4.0)
		start_angle_spread = 360.0
		min_rotation = -360
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 32
		Emit_Rate = 0.07
		emit_dir = 0.0
		emit_spread = 2
		velocity = 1.0
		friction = (0.0, 1.0)
		time = 1.0
	}
	Create2DParticleSystem {
		id = <lil_spark01>
		Pos = (-10.0, -10.0)
		z_priority = 0.03
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <particle_parent>
		start_color = [255 128 128 200]
		end_color = [255 128 128 0]
		start_scale = (0.2, 0.2)
		end_scale = (1.0, 1.0)
		start_angle_spread = 360.0
		min_rotation = -360
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 30
		Emit_Rate = 0.07
		emit_dir = 90
		emit_spread = 2
		velocity = 0.01
		friction = (0.0, -2.5)
		time = 1.0
	}
endscript

script hud_lars_rocker_lv1_fx 
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0xb80a90cf) p = <Player>
		return
	endif
	if ($cheat_hudfreemode = 1)
		return
	endif
	getplayerinfo <Player> part
	if (<part> = vocals)
		getplayerinfo <Player> combo_meter_id
		mat1 = mat_smokedisk_blend
		mat2 = mat_smoke_square01_add
		min_rot = 0
		max_rot = 0
		scale01 = (1.0, 0.6)
		scale02 = (2.0, 1.25)
		friction1 = (0.0, -0.5)
		friction2 = (0.0, 2.0)
		Pos = (0.0, 5.0)
		time1 = 1.0
		time2 = 2.0
		start_rgba = [255 64 64 128]
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_vocals_multiplier param = particle_parent
			ScriptAssert \{'vocals multiplier not found for lars fx'}
		endif
	else
		formatText checksumName = combo_meter_id 'sidebar_right_ns_meterp%p' p = <Player>
		mat1 = mat_smokedisk_blend
		mat2 = mat_smoke_ring01_add
		min_rot = -344
		max_rot = 555
		scale01 = (1.0, 1.0)
		scale02 = (2.0, 2.0)
		friction1 = (0.0, -1.0)
		friction2 = (0.0, 1.0)
		Pos = (0.0, 0.0)
		time1 = 0.5
		time2 = 1.0
		start_rgba = [255 64 64 200]
		if NOT ScreenElementExists id = <combo_meter_id>
			ScriptAssert \{'could not find ns_meter to set up lars timer'}
		endif
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_multiplier_fx_cont param = particle_parent
			ScriptAssert \{'lars power rocker hud fx have failed'}
		endif
	endif
	number = 1
	formatText checksumName = smoke_disk01 'RP_Lars_Smoke_disk_Particle%s' s = <Player>
	formatText checksumName = smoke_ring01 'RP_Lars_Smoke_RING_Particle%s' s = <Player>
	formatText checksumName = lil_smoke01 'RP_Lars_Little_smoke_Particle%s' s = <Player>
	formatText checksumName = lil_spark01 'RP_Lars_Little_spark_Particle%s' s = <Player>
	Destroy2DParticleSystem id = <smoke_disk01>
	Destroy2DParticleSystem id = <smoke_ring01>
	Destroy2DParticleSystem id = <lil_smoke01>
	Destroy2DParticleSystem id = <lil_spark01>
	Create2DParticleSystem {
		id = <smoke_ring01>
		Pos = (0.0, 0.0)
		z_priority = 1
		material = <mat2>
		parent = <particle_parent>
		start_color = [255 0 0 255]
		end_color = [255 0 0 0]
		start_scale = <scale02>
		end_scale = <scale02>
		start_angle_spread = 360.0
		min_rotation = <min_rot>
		max_rotation = <max_rot>
		emit_start_radius = 0
		emit_radius = 0
		Emit_Rate = 0.2
		emit_dir = 0.0
		emit_spread = 0
		velocity = 0.0
		friction = <friction1>
		time = <time1>
	}
	Create2DParticleSystem {
		id = <lil_smoke01>
		Pos = (0.0, -10.0)
		z_priority = 0.06
		material = mat_particle_smoke01
		parent = <particle_parent>
		start_color = <start_rgba>
		end_color = [255 0 0 0]
		start_scale = (2.0, 2.0)
		end_scale = (4.0, 4.0)
		start_angle_spread = 360.0
		min_rotation = -360
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 32
		Emit_Rate = 0.1
		emit_dir = 0.0
		emit_spread = 2
		velocity = 1.0
		friction = <friction2>
		time = <time2>
	}
endscript

script turn_off_hud_lars_rocker_fx 
	getplayerinfo <Player> part
	destroy_lars_particles Player = <Player>
endscript

script destroy_lars_particles 
	formatText checksumName = smoke_disk01 'RP_Lars_Smoke_disk_Particle%s' s = <Player>
	formatText checksumName = smoke_ring01 'RP_Lars_Smoke_RING_Particle%s' s = <Player>
	formatText checksumName = lil_smoke01 'RP_Lars_Little_smoke_Particle%s' s = <Player>
	formatText checksumName = lil_spark01 'RP_Lars_Little_spark_Particle%s' s = <Player>
	Destroy2DParticleSystem id = <smoke_disk01> kill_when_empty
	Destroy2DParticleSystem id = <smoke_ring01> kill_when_empty
	Destroy2DParticleSystem id = <lil_smoke01> kill_when_empty
	Destroy2DParticleSystem id = <lil_spark01> kill_when_empty
endscript

script destroy_all_lars_praticles 
	Player = 1
	begin
	destroy_lars_particles Player = <Player>
	Player = (<Player> + 1)
	repeat 4
endscript

script testnewmale_rp_vocals_fx 
	SpawnScriptNow \{newmale_rp_vocals_fx
		params = {
			Player = 1
		}}
endscript

script newmale_rp_vocals_fx 
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0xf7401ac3) p = <Player>
		return
	endif
	getplayerinfo <Player> combo_meter_id
	if NOT <combo_meter_id> :desc_resolvealias Name = alias_vocals_star_power_meter param = meter_id
		ScriptAssert \{'Could not find vocals combo meter'}
	endif
	<meter_id> :desc_resolvealias Name = alias_rp_meter_glow param = meter_glow
	<meter_id> :desc_resolvealias Name = alias_vspm_needle_container param = master_cont
	getplayerinfo <Player> star_power_gain_multiplier
	if (<star_power_gain_multiplier> = 4.0)
		rp_alphalvl2 = 1
		<meter_glow> :se_setprops Scale = (1.0, 3.0) Pos = (-1.0, 142.0) alpha = 1
	else
		rp_alphalvl2 = 0
		<meter_glow> :se_setprops Scale = (0.5, 3.0) Pos = (-1.0, 72.0) alpha = 1
	endif
	formatText checksumName = ce01 'RP_NewMale_Master_container01_Particlep%p' p = <Player>
	formatText checksumName = pfx01 'RP_NewMale_spark01_Particlep%p' p = <Player>
	formatText checksumName = pfx02 'RP_NewMale_spark02_Particlep%p' p = <Player>
	formatText checksumName = se01 'RP_NewMale_Lightning_SE01p%p' p = <Player>
	formatText checksumName = se02 'RP_NewMale_Lightning_SE02p%p' p = <Player>
	formatText checksumName = se01b 'RP_NewMale_Lightning_SE01bp%p' p = <Player>
	formatText checksumName = se02b 'RP_NewMale_Lightning_SE02bp%p' p = <Player>
	formatText checksumName = se03 'RP_NewMale_Lightning_SE03p%p' p = <Player>
	formatText checksumName = se04 'RP_NewMale_Lightning_SE04p%p' p = <Player>
	formatText checksumName = ce02 'RP_NewMale_Lightning_CE02p%p' p = <Player>
	se_pos01 = (0.0, 0.0)
	rot_angle = 180
	pfx_pos01 = (20.0, 0.0)
	lvl_dims = (200.0, 100.0)
	lvl2_dims = (550.0, 200.0)
	rgba1 = [128 128 255 255]
	rgba2 = [0 128 255 128]
	rgba3 = [255 255 255 255]
	DestroyScreenElement id = <ce01>
	Wait \{1
		Frame}
	CreateScreenElement {
		Type = ContainerElement
		parent = <master_cont>
		id = <ce01>
		dims = (50.0, 50.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = [center center]
		Pos = <se_pos01>
		z_priority = 22
		rot_angle = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <ce01>
		id = <se01>
		dims = <lvl_dims>
		alpha = 1
		Scale = (1.0, 1.0)
		just = [left , bottom]
		pos_anchor = [center , center]
		Pos = (0.0, 0.0)
		z_priority = 22
		rgba = <rgba1>
		material = mat_lightning_arc_anim01
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <ce01>
		id = <se02>
		dims = <lvl_dims>
		alpha = 1
		Scale = (1.0, 1.0)
		just = [left , bottom]
		pos_anchor = [center , center]
		Pos = (0.0, 0.0)
		z_priority = 25
		rgba = <rgba2>
		material = mat_lightning_arc_anim02
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <se01>
		id = <se03>
		dims = <lvl_dims>
		alpha = 1
		Scale = (1.0, 1.0)
		just = [right , bottom]
		pos_anchor = [right , bottom]
		Pos = (0.0, 0.0)
		z_priority = 22
		rgba = <rgba1>
		material = mat_lightning_arc_anim01
		rot_angle = 180
		flip_u = true
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <se01>
		id = <se04>
		dims = <lvl_dims>
		alpha = 1
		Scale = (1.0, 1.0)
		just = [right , bottom]
		pos_anchor = [right , bottom]
		Pos = (0.0, 0.0)
		z_priority = 25
		rgba = <rgba2>
		material = mat_lightning_arc_anim02
		rot_angle = 180
		flip_u = true
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <ce01>
		id = <se01b>
		dims = <lvl2_dims>
		alpha = <rp_alphalvl2>
		Scale = (1.0, 1.0)
		just = [left , bottom]
		pos_anchor = [center , center]
		Pos = (0.0, 0.0)
		z_priority = 22
		rgba = <rgba1>
		material = mat_lightning_arc_anim01
		rot_angle = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <ce01>
		id = <se02b>
		dims = <lvl2_dims>
		alpha = <rp_alphalvl2>
		Scale = (1.0, 1.0)
		just = [left , bottom]
		pos_anchor = [center , center]
		Pos = (0.0, 0.0)
		z_priority = 25
		rgba = [0 0 255 128]
		material = mat_lightning_arc_anim_ob_02
		rot_angle = 0
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = <se02>
		id = <ce02>
		dims = (50.0, 50.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = [left bottom]
		Pos = (0.0, 0.0)
		z_priority = 22
	}
	Create2DParticleSystem {
		id = <pfx01>
		Pos = <pfx_pos01>
		z_priority = 26.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <ce01>
		start_color = <rgba1>
		end_color = <rgba2>
		start_scale = (3.0, 3.0)
		end_scale = (1.0, 1.0)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 30
		emit_start_radius = 0
		emit_radius = 1
		Emit_Rate = 0.015
		emit_dir = -90.0
		emit_spread = 2
		velocity = 3.0
		friction = (0.0, 0.0)
		time = 0.1
	}
	Create2DParticleSystem {
		id = <pfx02>
		Pos = <pfx_pos01>
		z_priority = 26.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <ce01>
		start_color = <rgba1>
		end_color = [64 64 255 0]
		start_scale = (0.5, 0.5)
		end_scale = (2.0, 2.0)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 30
		emit_start_radius = 0
		emit_radius = 1
		Emit_Rate = 0.0055
		emit_dir = 0.0
		emit_spread = 270
		velocity = 12.0
		friction = (0.0, 60.0)
		time = 0.25
	}
	<meter_glow> :se_setprops alpha = 0 time = 2 Seconds
	Wait \{4
		frames}
	Destroy2DParticleSystem id = <pfx02> kill_when_empty
	Wait \{10
		frames}
	Destroy2DParticleSystem id = <pfx01>
	if ScreenElementExists id = <ce01>
		<ce01> :se_setprops alpha = 0 time = 0.1
	endif
	Wait \{0.5
		Seconds}
	DestroyScreenElement id = <ce01>
	Wait \{1.5
		Seconds}
	if ScreenElementExists id = <meter_glow>
		<meter_glow> :se_setprops Scale = (0.0, 0.0) Pos = (0.0, 0.0)
	endif
endscript

script newmale_rp_fx 
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0x5fdd40c0) p = <Player>
		return
	endif
	formatText checksumName = right_sp_id 'sidebar_right_sp_meterp%p' p = <Player>
	<right_sp_id> :desc_resolvealias Name = alias_needle_container param = needle_cont
	if NOT <right_sp_id> :desc_resolvealias Name = alias_rp_meter_glow param = meter_glow
		ScriptAssert \{'Could not find sp meter glow'}
	endif
	printstruct channel = zdebug <...>
	se_pos01 = {(30.0, 30.0) relative}
	rot_angle = 85
	pfx_pos01 = (0.0, 0.0)
	<meter_glow> :se_setprops Scale = <Scale> Pos = <Pos> alpha = 1
	CreateScreenElement {
		Type = ContainerElement
		parent = <needle_cont>
		dims = (50.0, 50.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = [center center]
		Pos = <se_pos01>
		z_priority = 10
		rot_angle = <rot_angle>
	}
	<ce01> = <id>
	Create2DParticleSystem {
		Pos = (12.0, 0.0)
		z_priority = 2.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <ce01>
		start_color = [128 128 255 255]
		end_color = [64 64 255 0]
		start_scale = (3.0, 3.0)
		end_scale = (1.0, 1.0)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 30
		emit_start_radius = 0
		emit_radius = 1
		Emit_Rate = 0.035
		emit_dir = 0.0
		emit_spread = 2
		velocity = 0.0
		friction = (0.0, 0.0)
		time = 0.1
	}
	<pfx01> = <id>
	<meter_glow> :se_setprops alpha = 0 time = 2 Seconds
	Wait \{2
		Seconds}
	if ScreenElementExists id = <meter_glow>
		<meter_glow> :se_setprops Scale = (0.0, 0.0) Pos = (0.0, 0.0)
	endif
	Destroy2DParticleSystem id = <pfx01> kill_when_empty
	DestroyScreenElement id = <ce01>
endscript

script lightning_arc01 
	formatText checksumName = ce01 'Master_Containerp%p' p = <Player>
	formatText checksumName = se01 'Lightning_SE01p%p' p = <Player>
	formatText checksumName = se02 'Lightning_SE02p%p' p = <Player>
	formatText checksumName = pfx01 'Flash_PFX01p%p' p = <Player>
	formatText checksumName = pfx02 'Flash_PFX02p%p' p = <Player>
	formatText checksumName = pfx03 'Sparks_PFX03p%p' p = <Player>
	DestroyScreenElement id = <ce01>
	DestroyScreenElement id = <se01>
	DestroyScreenElement id = <se02>
	Destroy2DParticleSystem id = <pfx01>
	Destroy2DParticleSystem id = <pfx02>
	Destroy2DParticleSystem id = <pfx03>
	Wait \{1
		Frame}
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = <ce01>
		dims = (100.0, 100.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [left bottom]
		pos_anchor = [center center]
		Pos = (100.0, 100.0)
		z_priority = 12
		rot_angle = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <ce01>
		id = <se01>
		dims = (100.0, 100.0)
		alpha = 1
		Scale = (2.0, 1.0)
		just = [left bottom]
		pos_anchor = [center center]
		Pos = (100.0, 100.0)
		z_priority = 12
		rgba = [192 255 255 255]
		material = mat_lightning_arc_anim01
		rot_angle = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <ce01>
		id = <se02>
		dims = (100.0, 100.0)
		alpha = 1
		Scale = (2.0, 1.0)
		just = [left bottom]
		pos_anchor = [center center]
		Pos = (100.0, 100.0)
		z_priority = 11
		rgba = [128 255 255 128]
		material = mat_lightning_arc_anim02
		rot_angle = 0
	}
	Create2DParticleSystem {
		id = <pfx01>
		Pos = (10.0, 0.0)
		z_priority = 12.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <se01>
		start_color = [255 255 255 255]
		end_color = [255 255 255 0]
		start_scale = (1.55, 1.55)
		end_scale = (3.55, 3.55)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 12
		emit_start_radius = 0
		emit_radius = 10
		Emit_Rate = 0.035
		emit_dir = 45.0
		emit_spread = 4.0
		velocity = 0
		friction = (0.0, 0.0)
		time = 0.1
	}
	<se01> :se_setprops Scale = (0.0, 1.0) just = [left bottom] rot_angle = -25
	<se02> :se_setprops Scale = (0.0, 1.0) just = [left bottom] rot_angle = -25
	Wait \{1
		Frame}
	<se01> :se_setprops Scale = (3.0, 1.0) time = 0.05 rot_angle = 0
	<se02> :se_setprops Scale = (3.0, 1.0) time = 0.05 rot_angle = 0
	Wait \{10
		Frame}
	Destroy2DParticleSystem id = <pfx01>
	Create2DParticleSystem {
		id = <pfx02>
		Pos = (5.0, 0.0)
		z_priority = 12.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <se01>
		start_color = [255 255 255 255]
		end_color = [255 255 255 0]
		start_scale = (1.55, 1.55)
		end_scale = (3.55, 3.55)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 12
		emit_start_radius = 0
		emit_radius = 10
		Emit_Rate = 0.035
		emit_dir = 45.0
		emit_spread = 4.0
		velocity = 0
		friction = (0.0, 0.0)
		time = 0.1
	}
	Create2DParticleSystem {
		id = <pfx03>
		Pos = (5.0, 0.0)
		z_priority = 13.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <se01>
		start_color = [255 255 255 255]
		end_color = [0 200 255 0]
		start_scale = (0.5, 0.5)
		end_scale = (0.5, 1.0)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 10
		Emit_Rate = 0.0035
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 8
		friction = (0.01, 32.0)
		time = 0.25
	}
	<se01> :se_setprops just = [right bottom]
	<se02> :se_setprops just = [right bottom]
	Wait \{5
		Frame}
	Destroy2DParticleSystem id = <pfx03> kill_when_empty
	<se01> :se_setprops Scale = (0.0, 1.0) time = 0.051
	<se02> :se_setprops Scale = (0.0, 1.0) time = 0.051
	Wait \{10
		Frame}
	Destroy2DParticleSystem id = <pfx02>
	Wait \{90
		Frame}
	DestroyScreenElement id = <se01>
	DestroyScreenElement id = <se02>
	DestroyScreenElement id = <ce01>
endscript

script create_pandora_rp_fx_lvl2 
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0x30c89f38) p = <Player>
		return
	endif
	SpawnScriptNow \{audio_play_character_powers_sfx
		params = {
			character = qs(0x6545783e)
			lvl = 2
		}}
	formatText checksumName = contl 'sidebar_container_leftp%p' p = <Player>
	formatText checksumName = namel 'Pandora_Left_RPFire01p%p' p = <Player>
	formatText checksumName = contr 'sidebar_container_rightp%p' p = <Player>
	formatText checksumName = namer 'Pandora_Right_RPFire01p%p' p = <Player>
	DestroyScreenElement id = <namer>
	DestroyScreenElement id = <namel>
	Wait \{1
		Frame}
	pos_index = (<Player> - 1)
	pos_table = ($highway_pos_table [<pos_index>])
	height = (<pos_table>.highway_height)
	Pos = ((0.0, -1.4) * <height>)
	pos2 = ((0.0, 0.9) * <height>)
	rgba = [255 64 64 255]
	z_pri = -1
	CreateScreenElement {
		Type = SpriteElement
		id = <namel>
		parent = <contl>
		material = mat_flamin_rail_left
		rgba = <rgba>
		Pos = <Pos>
		Scale = (2.0, 0.0)
		rot_angle = -87
		just = [1.0 , 0.5]
		z_priority = <z_pri>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = <namer>
		parent = <contr>
		material = mat_flamin_rail_right
		rgba = <rgba>
		Pos = <Pos>
		Scale = (2.0, 0.0)
		rot_angle = 87
		just = [-1.0 , 0.5]
		z_priority = <z_pri>
	}
	if ScreenElementExists id = <namer>
		<namer> :se_setprops Scale = (2.0, 2.0) time = 0.1
		<namel> :se_setprops Scale = (2.0, 2.0) time = 0.1
	endif
endscript

script create_pandora_rp_fx_lvl1 
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0x1677ab41) p = <Player>
		return
	endif
	SpawnScriptNow \{audio_play_character_powers_sfx
		params = {
			character = qs(0x6545783e)
			lvl = 1
		}}
	formatText checksumName = contl 'sidebar_container_leftp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = namel 'Pandora_Left_RPFire01p%p' p = <Player> AddToStringLookup = true
	formatText checksumName = contr 'sidebar_container_rightp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = namer 'Pandora_Right_RPFire01p%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namer>
	DestroyScreenElement id = <namel>
	Wait \{1
		Frame}
	pos_index = (<Player> - 1)
	pos_table = ($highway_pos_table [<pos_index>])
	height = (<pos_table>.highway_height)
	Pos = ((0.0, -1.4) * <height>)
	pos2 = ((0.0, 0.9) * <height>)
	rgba = [255 64 64 255]
	z_pri = -1
	CreateScreenElement {
		Type = SpriteElement
		id = <namel>
		parent = <contl>
		material = mat_flamin_rail_left
		rgba = <rgba>
		Pos = <Pos>
		Scale = (2.0, 0.0)
		rot_angle = -87
		just = [1.0 , 0.5]
		z_priority = <z_pri>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = <namer>
		parent = <contr>
		material = mat_flamin_rail_right
		rgba = <rgba>
		Pos = <Pos>
		Scale = (2.0, 0.0)
		rot_angle = 87
		just = [-1.0 , 0.5]
		z_priority = <z_pri>
	}
	if ScreenElementExists id = <namer>
		<namer> :se_setprops Scale = (2.0, 1.0) time = 0.1
		<namel> :se_setprops Scale = (2.0, 1.0) time = 0.1
	endif
endscript

script kill_pandora_rp_fx 
	formatText checksumName = contl 'sidebar_container_leftp%p' p = <Player>
	formatText checksumName = namel 'Pandora_Left_RPFire01p%p' p = <Player>
	formatText checksumName = contr 'sidebar_container_rightp%p' p = <Player>
	formatText checksumName = namer 'Pandora_Right_RPFire01p%p' p = <Player>
	if ScreenElementExists id = <namer>
		<namer> :se_setprops Scale = (2.0, 3.0) alpha = 0 time = 0.1
		<namel> :se_setprops Scale = (2.0, 3.0) alpha = 0 time = 0.1
	endif
	Wait \{0.1
		Second}
	DestroyScreenElement id = <namer>
	DestroyScreenElement id = <namel>
endscript

script create_pandora_vocals_rp_fx_lvl1 
	rgba = [255 128 128 255]
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0x90ac8199) p = <Player>
		return
	endif
	vocalshighway_getid Player = <Player>
	<vocals_highway_id> :desc_resolvealias Name = alias_rush_container_bottom param = bot_rush_cont
	<vocals_highway_id> :desc_resolvealias Name = alias_rush_container_top param = top_rush_cont
	<vocals_highway_id> :desc_resolvealias Name = alias_visible_highway param = visible_highway
	formatText checksumName = namevt1 'Vocals_Top_SPRushp%p' p = <Player>
	Wait \{1
		Frame}
	formatText checksumName = flaming_rail_top 'Vocals_Top_RPflamep%p' p = <Player>
	DestroyScreenElement id = <flaming_rail_top>
	if ScreenElementExists id = <namevt1>
		CreateScreenElement {
			Type = SpriteElement
			id = <flaming_rail_top>
			parent = <namevt1>
			material = mat_flamin_rail_top
			rgba = <rgba>
			Pos = (-100.0, 115.0)
			Scale = (1.5, 0.0)
			rot_angle = 0
			just = [right bottom]
			z_priority = -1
			preserve_local_orientation = true
		}
		<flaming_rail_top> :se_setprops Scale = (1.5, 1.0) time = 0.25
	endif
endscript

script create_pandora_vocals_rp_fx_lvl2 
	rgba = [255 128 128 255]
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0xb613b5e0) p = <Player>
		return
	endif
	vocalshighway_getid Player = <Player>
	if ScreenElementExists id = <vocals_highway_id>
		<vocals_highway_id> :desc_resolvealias Name = alias_rush_container_bottom param = bot_rush_cont
		<vocals_highway_id> :desc_resolvealias Name = alias_rush_container_top param = top_rush_cont
		<vocals_highway_id> :desc_resolvealias Name = alias_visible_highway param = visible_highway
	endif
	formatText checksumName = namevt1 'Vocals_Top_SPRushp%p' p = <Player>
	Wait \{1
		Frame}
	formatText checksumName = flaming_rail_top 'Vocals_Top_RPflamep%p' p = <Player>
	DestroyScreenElement id = <flaming_rail_top>
	if ScreenElementExists id = <namevt1>
		CreateScreenElement {
			Type = SpriteElement
			id = <flaming_rail_top>
			parent = <namevt1>
			material = mat_flamin_rail_top
			rgba = <rgba>
			Pos = (-50.0, 110.0)
			Scale = (1.5, 0.0)
			rot_angle = 0
			just = [right bottom]
			z_priority = -1
			preserve_local_orientation = true
		}
		<flaming_rail_top> :se_setprops Scale = (1.5, 2.0) time = 0.25
	endif
endscript

script kill_pandora_vocals_rp_fx 
	formatText checksumName = contl 'sidebar_container_leftp%p' p = <Player>
	formatText checksumName = namel 'Pandora_Left_RPFire01p%p' p = <Player>
	formatText checksumName = contr 'sidebar_container_rightp%p' p = <Player>
	formatText checksumName = namer 'Pandora_Right_RPFire01p%p' p = <Player>
	if ScreenElementExists id = <namer>
		<namer> :se_setprops Scale = (2.0, 3.0) alpha = 0 time = 0.1
		<namel> :se_setprops Scale = (2.0, 3.0) alpha = 0 time = 0.1
	endif
	Wait \{0.1
		Second}
	DestroyScreenElement id = <namer>
	DestroyScreenElement id = <namel>
endscript

script starearn01 
	se_getprops
	colorin = [255 200 0 255]
	colorout = [0 0 0 255]
	Wait \{1
		Frame}
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent_id>
		alpha = 1
		Pos = (0.0, 0.0)
		Scale = (1.0, 1.0)
		rot_angle = 0
		z_priority = 0
		just = [center , center]
		pos_anchor = [center , center]
		preserve_local_orientation = true
	}
	<rp_cont01> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <rp_cont01>
		texture = band_hud_career_gold_star
		blend = blend
		dims = (100.0, 100.0)
		alpha = 1
		rgba = <colorin>
		Pos = (0.0, 0.0)
		Scale = (1.0, 1.0)
		rot_angle = 0
		just = [center , center]
		pos_anchor = [center , center]
		z_priority = 72
		preserve_local_orientation = true
	}
	<rp_star01> = <id>
	CreateScreenElement {
		Type = TextElement
		parent = <rp_star01>
		blend = blend
		dims = (100.0, 100.0)
		font = fontgrid_numeral_a2
		text = qs(0x22ee76e7)
		alpha = 1
		rgba = <colorin>
		Pos = (0.0, -4.0)
		Scale = (0.9, 0.9)
		rot_angle = 0
		just = [center , center]
		pos_anchor = [center , center]
		z_priority = 73
		preserve_local_orientation = true
	}
	<rp_txt01> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <rp_txt01>
		texture = lil_plus
		blend = blend
		dims = (20.0, 20.0)
		alpha = 1
		rgba = <colorin>
		Pos = (8.0, 30.0)
		Scale = (1.0, 1.0)
		rot_angle = 0
		just = [center , center]
		pos_anchor = [center , center]
		z_priority = 73
	}
	<rp_plus01> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <rp_star01>
		texture = band_hud_career_gold_star
		blend = add
		rgba = [255 255 255 255]
		dims = (100.0, 100.0)
		alpha = 1
		Pos = (0.0, 0.0)
		Scale = (1.0, 1.0)
		rot_angle = 0
		just = [center , center]
		pos_anchor = [center , center]
		z_priority = 74
	}
	<rp_starglow01> = <id>
	SoundEvent \{event = audio_powers_star_electricity_bolt}
	Create2DParticleSystem {
		parent = <rp_star01>
		Pos = (0.0, 0.0)
		z_priority = 76.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		start_color = <colorin>
		end_color = [255 255 255 0]
		start_scale = (0.5, 0.5)
		end_scale = (1.5, 1.5)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 10
		emit_radius = 0.5
		Emit_Rate = 0.005
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 4
		friction = (-3.01, 12.0)
		time = 0.25
	}
	<rp_fx01> = <id>
	Create2DParticleSystem {
		parent = <rp_star01>
		Pos = (0.0, 0.0)
		z_priority = -1.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		start_color = [255 255 255 255]
		end_color = <colorout>
		start_scale = (1.5, 1.5)
		end_scale = (5.5, 0.15)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 10
		emit_radius = 0.5
		Emit_Rate = 0.01
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 4
		friction = (0.0, 0.0)
		time = 0.15
	}
	<rp_fx02> = <id>
	if ScreenElementExists \{id = hud_star_meter_id}
		hud_star_meter_id :desc_resolvealias \{Name = alias_star_earn_fx
			param = star_earn_fx}
		<got_source> = 0
		if ScreenElementExists id = <rp_star01>
			goal_hud_se_get_corner_pos screen_element = <rp_star01> corner = [center center]
			<target_pos> = <corner_pos>
			<got_source> = 1
		endif
		<got_target> = 0
		if ScreenElementExists id = <star_earn_fx>
			goal_hud_se_get_corner_pos screen_element = <star_earn_fx> corner = [center center]
			<source_pos> = <corner_pos>
			<got_target> = 1
		endif
		if (<got_source> = 1 && <got_target> = 1)
			if ($cheat_hudfreemode = 0)
				p2p_lightning_create source_pos = <source_pos> target_pos = <target_pos> rgba = [255 200 128 200]
			endif
		endif
	endif
	<rp_star01> :se_setprops Scale = (0.5, 0.5) alpha = 0
	Wait \{1
		Frame}
	<rp_star01> :se_setprops Scale = (0.75, 0.75) alpha = 1 time = 0.05
	Wait \{0.05
		Seconds}
	Destroy2DParticleSystem id = <rp_fx01> kill_when_empty
	Destroy2DParticleSystem id = <rp_fx02> kill_when_empty
	Wait \{0.25
		Seconds}
	if ScreenElementExists id = <rp_star01>
		<rp_star01> :se_setprops Pos = {(0.0, -20.0) relative} Scale = (2.0, 2.0) alpha = 0 rot_angle = 0 time = 0.1
	endif
	Wait \{2
		Seconds}
	DestroyScreenElement id = <rp_cont01>
endscript

script judy_starearn01 
	getplayerinfo <Player> part
	formatText checksumName = rock_meter 'sidebar_left_rock_meterp%p' p = <Player>
	if ScreenElementExists id = <rock_meter>
		if <rock_meter> :desc_resolvealias Name = alias_judy_overhealth param = desc_id
			<desc_id> :Obj_SpawnScriptNow starearn01 params = {{parent_id = <desc_id>} {Player = <Player>}}
		endif
	endif
endscript

script judy_vocals_starearn01 
	getplayerinfo <Player> part
	formatText checksumName = <rock_meter> 'sidebar_left_rock_meterp%p' p = <Player>
	if ScreenElementExists id = <rock_meter>
		if <rock_meter> :desc_resolvealias Name = alias_judy_overhealth param = desc_id
			<desc_id> :Obj_SpawnScriptNow starearn01 params = {{parent_id = <desc_id>} {Player = <Player>}}
		endif
	endif
endscript

script johnny_starearn01 
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0x6a240f92) p = <Player>
		return
	endif
	getplayerinfo <Player> Band
	getplayerinfo <Player> part
	getplayerinfo <Player> combo_meter_id
	if NOT ScreenElementExists id = <combo_meter_id>
		ScriptAssert \{'could not find combo meter to set up johnny timer'}
	endif
	if (<part> = vocals)
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_johnny_multiplier_star_cont param = desc_id
			ScriptAssert \{'could not find bulb_cont to set up johnny timer'}
		endif
	else
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_multiplier_star_cont param = desc_id
			ScriptAssert \{'Could not find johnny timer within ns_meter for Johnny Special power setup'}
		endif
	endif
	<desc_id> :Obj_SpawnScriptNow starearn01 params = {{parent_id = <desc_id>} {Player = <Player>}}
endscript

script casey_starearn01 
	if playerinfoequals <Player> is_onscreen = 0
		printf qs(0xc06466fc) p = <Player>
		return
	endif
	getplayerinfo <Player> Band
	getplayerinfo <Player> part
	getplayerinfo <Player> combo_meter_id
	if NOT ScreenElementExists id = <combo_meter_id>
		ScriptAssert \{'could not find combo meter to set up johnny timer'}
	endif
	if (<part> = vocals)
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_casey_star_cont param = desc_id
			ScriptAssert \{'could not find  casey star cont to set up casey meter'}
		endif
	else
		formatText checksumName = rock_meter 'sidebar_left_rock_meterp%p' p = <Player>
		if NOT <rock_meter> :desc_resolvealias Name = alias_rp_casey_star_cont param = desc_id
			ScriptAssert \{'Could not find casey timer within ns_meter for casey Special power setup'}
		endif
	endif
	<desc_id> :Obj_SpawnScriptNow starearn01 params = {{parent_id = <desc_id>} {Player = <Player>}}
endscript
