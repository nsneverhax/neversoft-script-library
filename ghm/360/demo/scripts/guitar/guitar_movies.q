
script create_movie_viewport 
	create_jumbotron
	create_bandname_viewport
endscript
jumbotron_viewport_params = {
	viewport = jumbotron_viewport
	textureasset = `tex\zones\z_justice\rmm_jumbotron.dds`
	style = jumbotron_rendering
	name = jumbotron_cam
}
current_jumbotron = none

script create_jumbotron 
	printf \{qs(0x646713ed)}
	getpakmancurrentname \{map = zones}
	jumbotron = jumbotron_viewport_params
	if NOT globalexists name = <jumbotron>
		return
	endif
	addparams ($<jumbotron>)
	formattext checksumname = texdict 'zones/%s/%t.tex' s = <pakname> t = <pakname>
	formattext checksumname = zone_context '%t' t = <pakname>
	pushassetcontext context = <zone_context>
	if NOT isassetloaded name = <texdict>
		printf \{'Zone texdict not found for jumbotron'}
		popassetcontext
		return
	endif
	if NOT istextureindictionary dictionary = <texdict> texture = <textureasset>
		printf 'Nowhere to put Jumbotron in %s' s = <pakname>
		popassetcontext
		return
	endif
	popassetcontext
	formattext checksumname = cameraparams '%s_cameras_closeups' s = <pakname>
	if NOT globalexists name = <cameraparams>
		formattext checksumname = cameraparams '%s_cameras_singer' s = <pakname>
		if NOT globalexists name = <cameraparams>
			printf \{qs(0x78c7dc47)}
			return
		endif
	endif
	change current_jumbotron = $<jumbotron>
	printf \{qs(0x998e9bb6)}
	createviewport {
		priority = 6
		id = <viewport>
		style = <style>
		jiggle_rendering = 2
		use_lod_shader = true
	}
	printf \{qs(0xd1c957d2)}
	change jumbotron_camera_params = $<cameraparams>
	change \{jumbotron_camera_index = 0}
	jumbotron_camera_startcallback <...>
	printf \{qs(0xe77df91d)}
	setsearchallassetcontexts
	createviewporttextureoverride {
		id = <viewport>
		viewportid = <viewport>
		texture = <textureasset>
		texdict = <texdict>
	}
	setsearchallassetcontexts \{off}
	printf \{qs(0xd3ab36ed)}
endscript
jumbotron_camera_index = 0
jumbotron_camera_params = none

script jumbotron_camera_startcallback 
	jumbotron = $current_jumbotron
	if (<jumbotron> = none)
		return
	endif
	addparams (<jumbotron>)
	current_index = ($jumbotron_camera_index)
	getarraysize ($jumbotron_camera_params)
	current_index = (<current_index> + 1)
	if (<current_index> = <array_size>)
		current_index = 0
	endif
	change jumbotron_camera_index = <current_index>
	if ($debug_showcameraname = on)
		cameracuts_updatedebugcameraname
	endif
	force_time = 5
	if structurecontains structure = (($jumbotron_camera_params) [<current_index>]) params
		params = {(($jumbotron_camera_params) [<current_index>].params) force_time = <force_time>}
	else
		params = {camparams = (($jumbotron_camera_params) [<current_index>]) force_time = <force_time>}
	endif
	playigccam {
		name = <name>
		viewport = <viewport>
		lockto = world
		controlscript = cameracuts_staticcamcontrol
		(($jumbotron_camera_params) [<current_index>])
		params = <params>
		exitscript = jumbotron_camera_startcallback
	}
endscript

script destroy_jumbotron 
	printf \{qs(0xaff0ac37)}
	jumbotron = $current_jumbotron
	if (<jumbotron> = none)
		return
	endif
	addparams (<jumbotron>)
	killcamanim name = <name>
	setsearchallassetcontexts
	destroyviewporttextureoverride id = <viewport>
	setsearchallassetcontexts \{off}
	destroyviewport id = <viewport>
	change \{current_jumbotron = none}
endscript

script destroy_movie_viewport 
	destroy_jumbotron
	destroy_bandname_viewport
endscript
magazine_viewport_props = {
	texture = magazine1_viewport
	viewport = magazine_viewport
	camera = magazine_camera
	texoverride = magazine_texoverride
	textureasset = magazine1_viewport
	style = magazine_rendering
}

script create_magazine_viewport 
	printf \{qs(0xbf2057a1)}
	destroy_magazine_viewport
	addparams ($magazine_viewport_props)
	createviewport {
		priority = 6
		id = <viewport>
		style = <style>
	}
	setsearchallassetcontexts
	createviewporttextureoverride {
		id = <texoverride>
		viewportid = <viewport>
		texture = <textureasset>
		texdict = <texdict>
	}
	setsearchallassetcontexts \{off}
	getpakmancurrentname \{map = zones}
	<part> = $current_progression_flag
	switch $current_progression_flag
		case career_band
		playigccam {
			name = <camera>
			viewport = <viewport>
			lockto = drummer
			pos = (-2.97686, 0.521859, 4.564908)
			quat = (-0.078003004, 0.866874, 0.143193)
			fov = 102.0
			lookat = drummer
			screenoffset = (-0.46714398, 0.784728)
			play_hold = 1
			interrupt_current
		}
		case career_guitar
		playigccam {
			name = <camera>
			viewport = <viewport>
			lockto = guitarist
			locktobone = bone_chest
			lookat = guitarist
			lookatbone = bone_head
			pos = (-0.156578, 1.539315, 0.349303)
			quat = (0.50972605, 0.56738, -0.38740703)
			fov = 50.0
			play_hold = 1
			interrupt_current
		}
		case career_bass
		playigccam {
			name = <camera>
			viewport = <viewport>
			lockto = bassist
			locktobone = bone_chest
			lookat = bassist
			lookatbone = bone_head
			pos = (-0.156578, 1.539315, 0.349303)
			quat = (0.50972605, 0.56738, -0.38740703)
			fov = 50.0
			play_hold = 1
			interrupt_current
		}
		case career_vocals
		playigccam {
			name = <camera>
			viewport = <viewport>
			lockto = vocalist
			locktobone = bone_chest
			lookat = vocalist
			lookatbone = bone_head
			pos = (-0.156578, 1.539315, 0.349303)
			quat = (0.50972605, 0.56738, -0.38740703)
			fov = 50.0
			play_hold = 1
			interrupt_current
		}
		case career_drum
		playigccam {
			name = <camera>
			viewport = <viewport>
			lockto = drummer
			pos = (-0.198893, 1.620875, 1.059207)
			quat = (0.053802997, 0.93876696, -0.23057601)
			fov = 82.0
			lookat = drummer
			screenoffset = (-0.27065602, 1.2902452)
			play_hold = 1
			interrupt_current
		}
		default
		playigccam {
			name = <camera>
			viewport = <viewport>
			lockto = guitarist
			locktobone = bone_chest
			lookat = guitarist
			lookatbone = bone_head
			pos = (-0.156578, 1.539315, 0.349303)
			quat = (0.50972605, 0.56738, -0.38740703)
			fov = 50.0
			play_hold = 1
			interrupt_current
		}
	endswitch
	setviewportproperties \{viewport = magazine_viewport
		active = false}
endscript
magazine_picture_props = [
	{
		num_players = 1
		band_members = [
			vocalist
		]
		anims = [
			s_winposes01
		]
		no_suffix = 1
	}
	{
		num_players = 1
		band_members = [
			bassist
		]
		anims = [
			b_winposes01
		]
		no_suffix = 1
	}
	{
		num_players = 1
		band_members = [
			drummer
		]
		anims = [
			d_winposes01
		]
		no_suffix = 1
	}
	{
		num_players = 1
		band_members = [
			guitarist
		]
		anims = [
			g_winposes01
		]
		no_suffix = 1
	}
	{
		num_players = 2
		band_members = [
			vocalist
			bassist
		]
		anims = [
			sb_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			vocalist
			guitarist
		]
		anims = [
			sg_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			vocalist
			drummer
		]
		anims = [
			sd_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			guitarist
			bassist
		]
		anims = [
			gb_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			guitarist
			drummer
		]
		anims = [
			gd_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			bassist
			drummer
		]
		anims = [
			bd_winposes01
		]
	}
	{
		num_players = 3
		band_members = [
			vocalist
			drummer
			guitarist
		]
		anims = [
			sdg_winposes01
		]
	}
	{
		num_players = 3
		band_members = [
			vocalist
			drummer
			bassist
		]
		anims = [
			sdb_winposes01
		]
	}
	{
		num_players = 3
		band_members = [
			vocalist
			guitarist
			bassist
		]
		anims = [
			sgb_winposes01
		]
	}
	{
		num_players = 3
		band_members = [
			drummer
			guitarist
			bassist
		]
		anims = [
			dgb_winposes01
		]
	}
	{
		num_players = 4
		band_members = [
			vocalist
			guitarist
			bassist
			drummer
		]
		anims = [
			sgbd_winposes01
		]
	}
]

script grab_magazine_viewport \{select_index = -1}
	printf \{qs(0x90aa5f6b)}
	getarraysize ($magazine_picture_props)
	magazine_size = <array_size>
	index = 0
	begin
	if ($magazine_picture_props [<index>].num_players = $current_num_players)
		getarraysize ($magazine_picture_props [<index>].band_members)
		invalid = 0
		member_index = 0
		begin
		found = 0
		player = 1
		begin
		formattext checksumname = player_status 'player%i_status' i = <player>
		if ($<player_status>.band_member = ($magazine_picture_props [<index>].band_members [<member_index>]))
			found = 1
		endif
		player = (<player> + 1)
		repeat ($current_num_players)
		if (<found> = 0)
			invalid = 1
		endif
		member_index = (<member_index> + 1)
		repeat <array_size>
		if (<invalid> = 0)
			break
		endif
	endif
	index = (<index> + 1)
	repeat <magazine_size>
	if (<index> >= <magazine_size>)
		index = 3
	endif
	printf qs(0x547efd22) i = <index>
	if (<select_index> != -1)
		index = <select_index>
		printf qs(0xf294df10) i = <index>
	endif
	addparams ($magazine_picture_props [<index>])
	getarraysize <anims>
	getrandomvalue name = rand_index integer a = 0 b = (<array_size> - 1)
	anim = (<anims> [<rand_index>])
	printf qs(0xcb15e5e4) i = <anim>
	hide_band
	getarraysize (<band_members>)
	member_index = 0
	begin
	band_member = (<band_members> [<member_index>])
	if gotparam \{no_suffix}
		suffix = ''
	else
		switch <band_member>
			case drummer
			suffix = '_d'
			case bassist
			suffix = '_b'
			case vocalist
			suffix = '_s'
			case guitarist
			default
			suffix = '_g'
		endswitch
	endif
	if compositeobjectexists name = <band_member>
		extendcrc <anim> <suffix> out = anim_name
		target_params = {}
		if (<band_member> = drummer)
			target_params = {target = moment_branch}
		endif
		<band_member> :unhide
		<band_member> :gameobj_playanim anim = <anim_name> blendduration = 0 <target_params>
		<band_member> :ragdoll_markforreset
		band_movetonode name = <band_member> node = 'vocalist_start'
	endif
	member_index = (<member_index> + 1)
	repeat <array_size>
	extendcrc <anim> '_c01' out = camera_anim_name
	lock_target = vocalist_mocap_lock_target_01
	<lock_target> :gameobj_playanim anim = <camera_anim_name> blendduration = 0
	addparams ($magazine_viewport_props)
	if (<select_index> != -1)
		if NOT screenelementexists \{id = magazine_element}
			createscreenelement {
				parent = root_window
				just = [center center]
				type = spriteelement
				id = magazine_element
				texture = <texture>
				pos = (200.0, 200.0)
				dims = (200.0, 200.0)
				alpha = 1
			}
		endif
	endif
	playigccam {
		name = <camera>
		viewport = <viewport>
		lockto = <lock_target>
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		time = 0
		play_hold = 1
		interrupt_current
	}
	bandmanager_enabled \{off}
	if (<select_index> != -1)
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = 1000
			texture = white
			rgba = [
				0
				0
				0
				255
			]}
	endif
	setviewportproperties \{viewport = magazine_viewport
		active = true}
	unpausegame
	wait \{10
		gameframes}
	pausegame
	setviewportproperties \{viewport = magazine_viewport
		active = false}
	bandmanager_enabled
	unhide_band
	if (<select_index> != -1)
		fadetoblack \{off
			time = 0}
	endif
endscript

script destroy_magazine_viewport 
	printf \{qs(0x73bd28bb)}
	addparams ($magazine_viewport_props)
	if viewportexists id = <viewport>
		destroyviewport id = <viewport>
		destroyviewporttextureoverride id = <texoverride>
		killcamanim name = <camera>
	endif
	if screenelementexists \{id = magazine_element}
		destroyscreenelement \{id = magazine_element}
	endif
endscript
current_bandname_viewport = none
bandname_viewport_params = {
	viewport = bandname_viewport
	textureasset = `tex\zones\z_hotel\rmm_band_name.dds`
	texdicts = [
		'zones/%s/%t.tex'
		'models/venues/recordstore/encore_bandart_skin.tex'
		'models/venues/recordstore/encore_record_skin.tex'
	]
	style = bandname_rendering
	name = bandname_cam
	window_id = bandname_window
}

script get_bandname_viewport_text 
	name = qs(0x03ac90f0)
	if ($is_attract_mode = 0)
		bandname_id = band_info
		getglobaltags <bandname_id>
	endif
	stringremovetrailingwhitespace string = <name>
	if (<new_string> = qs(0x03ac90f0))
		new_string = qs(0x945d0d09)
	endif
	return band_name_text_string = <new_string>
endscript

script create_bandname_viewport 
	printf \{qs(0xd70bc7ea)}
	getpakmancurrentname \{map = zones}
	bandname = bandname_viewport_params
	if NOT globalexists name = <bandname>
		return
	endif
	addparams ($<bandname>)
	change current_bandname_viewport = $<bandname>
	printf \{qs(0x998e9bb6)}
	createviewport {
		priority = 6
		id = <viewport>
		style = <style>
		has_ui = true
		has_ui_only = true
		no_resolve_depthstencilbuffer = true
	}
	createscreenelement {
		type = windowelement
		parent = root_window
		id = <window_id>
		viewport = <viewport>
		dims = (512.0, 128.0)
	}
	get_bandname_viewport_text
	printf qs(0x35322bfb) s = <band_name_text_string>
	createscreenelement {
		type = textblockelement
		dims = (480.0, 104.0)
		parent = <window_id>
		id = bandname_textelement
		font = fontgrid_text_a11_b
		pos = (256.0, 64.0)
		just = [center center]
		internal_just = [center center]
		rgba = [210 210 210 250]
		text = <band_name_text_string>
		z_priority = 1.0
		alpha = 1
		fit_width = `scale each line if larger`
		fit_height = `scale to fit`
		scale_mode = proportional
	}
	getarraysize <texdicts>
	index = 0
	begin
	formattext checksumname = texdict (<texdicts> [<index>]) s = <pakname> t = <pakname> addtostringlookup = true
	valid = 1
	setsearchallassetcontexts
	if NOT isassetloaded name = <texdict>
		printf 'texdict %s not found for bandname' s = <texdict>
		valid = 0
	endif
	if NOT istextureindictionary dictionary = <texdict> texture = <textureasset>
		printf 'No texture to put Band Name in %s with %t' s = <pakname> t = <texdict>
		valid = 0
	endif
	if (<valid> = 1)
		printf \{qs(0xe77df91d)}
		formattext checksumname = id 'bandnameviewport%i' i = <index>
		createviewporttextureoverride {
			id = <id>
			viewportid = <viewport>
			texture = <textureasset>
			texdict = <texdict>
		}
	endif
	setsearchallassetcontexts \{off}
	index = (<index> + 1)
	repeat <array_size>
	printf \{qs(0x8e81aa5a)}
endscript

script destroy_bandname_viewport 
	printscriptinfo \{qs(0x6415d050)}
	bandname = $current_bandname_viewport
	if (<bandname> = none)
		return
	endif
	addparams (<bandname>)
	getpakmancurrentname \{map = zones}
	setsearchallassetcontexts
	getarraysize <texdicts>
	index = 0
	begin
	formattext checksumname = texdict (<texdicts> [<index>]) s = <pakname> t = <pakname>
	formattext checksumname = id 'bandnameviewport%i' i = <index> addtostringlookup = true
	printf 'Trying to delete %i' i = <id>
	if isassetloaded name = <texdict>
		if istextureindictionary dictionary = <texdict> texture = <textureasset>
			printf 'Succeeded deleting %i' i = <id>
			destroyviewporttextureoverride id = <id>
		else
			printf '%i - not in texture dictionary' i = <id>
		endif
	else
		printf '%i - Asset not loaded' i = <id>
	endif
	index = (<index> + 1)
	repeat <array_size>
	setsearchallassetcontexts \{off}
	destroyviewport id = <viewport>
	if screenelementexists id = <window_id>
		destroyscreenelement id = <window_id>
	endif
	if screenelementexists \{id = bandname_textelement}
		destroyscreenelement \{id = bandname_textelement}
	endif
	change \{current_bandname_viewport = none}
endscript

script pausefullscreenmovie 
	if ismovieplaying \{textureslot = 0}
		pausemovie \{textureslot = 0}
	endif
endscript

script unpausefullscreenmovie 
	if ismovieplaying \{textureslot = 0}
		resumemovie \{textureslot = 0}
	endif
endscript

script playmovieandwait 
	if notcd
		if ($show_movies = 0)
			return
		endif
	endif
	onexitrun \{playmovieandwait_cleanup}
	setscriptcannotpause
	mark_unsafe_for_shutdown
	if NOT gotparam \{noblack}
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = -10}
	endif
	printf qs(0x23871deb) s = <movie>
	set_bink_heap_state \{state = big}
	playmovie {textureslot = 0
		texturepri = 1000
		no_looping
		no_hold
		<...>}
	wait \{2
		gameframes}
	createscreenelement \{type = containerelement
		parent = root_window
		id = movie_handler
		event_handlers = [
			{
				pad_start
				endmovie
			}
			{
				pad_choose
				endmovie
			}
		]}
	launchevent \{type = focus
		target = movie_handler}
	begin
	if NOT ismovieplaying \{textureslot = 0}
		break
	endif
	wait \{1
		gameframes}
	repeat
	killmovie \{textureslot = 0}
	hide_glitch
	waitforallmoviestofinish
	spawnscriptnow \{endmovie}
	begin
	if NOT screenelementexists \{id = movie_handler}
		break
	endif
	wait \{1
		gameframe}
	repeat
	if NOT gotparam \{noblack}
		printf qs(0x27e8073d) s = <movie>
		fadetoblack \{off
			time = 0}
	endif
	mark_safe_for_shutdown
endscript

script playmovieandwait_cleanup 
	set_bink_heap_state \{state = small}
endscript

script endmovie 
	hide_glitch
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if ismovieplaying \{textureslot = 0}
		killmovie \{textureslot = 0}
	endif
	if screenelementexists \{id = movie_handler}
		movie_handler :die
	endif
endscript
