is_ampzilla_battle = 0

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
		CreateScreenElement {
			parent = root_window
			id = hud_root
			Type = descinterface
			desc = ($g_hud_2d_struct_used.desc_interface)
			Pos = (0.0, 0.0)
			z_priority = 0
			alpha = 0
		}
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
		if (<Type> = career || <Type> = quickplay)
			init_upper_container
			hud_attach_star_meter
		else
			if hud_root :desc_resolvealias \{Name = alias_upper_container
					param = upper_group}
				<upper_group> :Die
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
				<zilla_meter> :se_setprops alpha = 1 fill_scale = (1.0, 0.01)
				<zilla_meter> :se_setprops
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
	if ($cheat_focusmode = 1 || $calibrate_lag_enabled = 1)
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
	PlayIGCCam \{id = cs_view_cam_id
		Name = ch_view_cam
		viewport = bg_viewport
		LockTo = World
		Pos = (100000000.0, 100000000.0, 100000000.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
		play_hold = 1
		interrupt_current}
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
			<desired_layout> = hud_standard
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
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> part
		if (<part> = vocals)
			cnt = (<cnt> + 1)
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
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
	if ($current_num_players = 1)
		return
	endif
	if ($game_mode = p2_faceoff)
		return
	endif
	if ($game_mode = freeplay)
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

script 0xf11bb8e9 
	<max_zilla_stars> = 9.0
	if (($is_ampzilla_battle) != 1)
		return
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_hud_meter_star
			param = star_meter}
		printf \{channel = zdebug
			qs(0xccccee13)}
		return
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_final_power_meter
			param = zilla_meter}
		printf \{channel = zdebug
			qs(0x06e05b66)}
		return
	endif
	<zilla_percent> = (<stars> / <max_zilla_stars>)
	<zilla_percent> = (<zilla_percent> * 128.0)
	<dims> = (((1.0, 0.0) * <zilla_percent>) + (0.0, 64.0))
	<zilla_meter> :se_setprops fill_dims = <dims>
endscript
