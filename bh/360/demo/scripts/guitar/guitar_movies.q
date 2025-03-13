venues_requiring_visualizer = [
	0x53d2aff0
	z_space
	z_cube
	z_easterisland
	z_awardshow
	z_gorge
	z_centralpark
	z_montreux
	z_paris
	z_visualizer
	z_cabo
	z_tokyo
]

script create_movie_viewport 
	0xf2563389
	create_visualizer
	create_jumbotron
	create_bandname_viewport
endscript
jumbotron_viewport_params = {
	viewport = jumbotron_viewport
	textureasset = `tex\zones\metalfest\jg_mf_tvscreen_d.dds`
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
	if NOT gotparam \{pakname}
		return
	endif
	switch ($jumbotron_focus)
		case guitarist
		formattext checksumname = cameraparams '%s_cameras_guitarist' s = <pakname>
		case bassist
		formattext checksumname = cameraparams '%s_cameras_bassist' s = <pakname>
		case vocalist
		formattext checksumname = cameraparams '%s_cameras_singer' s = <pakname>
		case drummer
		formattext checksumname = cameraparams '%s_cameras_drummer' s = <pakname>
		default
		formattext checksumname = cameraparams '%s_cameras_closeups' s = <pakname>
	endswitch
	if NOT globalexists name = <cameraparams>
		formattext checksumname = cameraparams '%s_cameras_singer' s = <pakname>
		if NOT globalexists name = <cameraparams>
			printf \{qs(0x78c7dc47)}
			return
		endif
	endif
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
	destroy_visualizer
	destroy_jumbotron
	destroy_bandname_viewport
endscript

script create_visualizer_fx 
	if screenfx_fxinstanceexists viewport = <viewport> name = av_test0
		screenfx_clearfxinstances {viewport = <viewport>}
	endif
	wait \{1
		gameframe}
	screenfx_addfxinstance {
		viewport = <viewport>
		name = av_test0
		scefname = av_test0
		type = audiovisualize
		on = 1
		primitives = $green_line_primitives
	}
endscript
preset_redstreak = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.25)
		color = [
			104
			64
			224
			255
		]
		blendmode = blend
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		length = 1.0
		angularvel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responsefunc = log10
				deformscale = 100
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.0, -0.95)
		color = [
			244
			74
			184
			255
		]
		blendmode = blend
	}
]
green_line_primitives = [
	{
		type = blendprev
		angularvel = 0.0
		scale = (1.0, 1.0)
		color = [
			250
			250
			250
			255
		]
		blendmode = blend
	}
	{
		type = line
		color = [
			250
			200
			50
			255
		]
		pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = log10
				deformscale = 20
			}
		]
	}
	{
		type = line
		color = [
			250
			100
			50
			255
		]
		pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 20
			}
		]
	}
	{
		type = line
		color = [
			250
			200
			250
			255
		]
		pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 0
			}
		]
	}
	{
		type = blendprev
		angularvel = 0.0
		scale = (-1.2, 1.2)
		color = [
			100
			100
			110
			160
		]
		blendmode = add
	}
	{
		type = blendprev
		angularvel = 0.1
		scale = (1.5, 1.0)
		color = [
			110
			100
			100
			118
		]
		blendmode = sub
	}
]
visualizer_viewport_params = {
	viewport = visualizer_viewport
	textureassets = [
		`tex\zones\z_visualizer\og_visualizer.dds`
	]
	style = visualizer_rendering
	name = visualizer_cam
}
current_visualizer = none
current_visualizer_2d = true
use_60fps_visualizer = true

script create_visualizer_screen_element \{z_priority = -500}
	destroy_visualizer_screen_element
	printf \{qs(0xb017b3a1)}
	setspecificrendertargetheap \{heap_jam_vram}
	createscreenelement {
		parent = root_window
		type = viewportelement
		id = fullscreen_visualizer_viewport
		texture = fullscreen_visualizer
		viewport_priority = 1
		pos = (0.0, 0.0)
		just = [left top]
		dims = (1280.0, 720.0)
		rgba = [255 255 255 255]
		alpha = 1
		style = visualizer_rendering_hires
		color_only
		rect = [0.0 , 0.0 , 1.0 , 1.0]
		width = 1280
		height = 720
		resolve_to_prev_texture_with_alpha
		render_to_texture
		managed
		framerate = 60
		framemask = 3
		resolution = 1.0
		uidims = (1280.0, 720.0)
		z_priority = <z_priority>
	}
	setspecificrendertargetheap
endscript

script destroy_visualizer_screen_element 
	printf \{qs(0x6844cee7)}
	if screenelementexists \{id = fullscreen_visualizer_viewport}
		destroyscreenelement \{id = fullscreen_visualizer_viewport}
	endif
endscript

script create_visualizer 
	printf \{qs(0xce94757f)}
	getpakmancurrent \{map = zones}
	if NOT arraycontains array = ($venues_requiring_visualizer) contains = <pak>
		destroy_visualizer
		return
	endif
	change \{visualizer_events_enabled = true}
	visualizer = visualizer_viewport_params
	if NOT globalexists name = <visualizer>
		return
	endif
	destroy_visualizer_screen_element
	if (<pak> = z_visualizer)
		if ($use_60fps_visualizer = true)
			create_visualizer_screen_element
		endif
	endif
	getpakmancurrentname \{map = zones}
	formattext checksumname = fx_func 'create_visualizer_fx_2D_%s' s = <pakname>
	if scriptexists <fx_func>
		<fx_func> viewport = bg_viewport
		change current_visualizer = $<visualizer>
		change \{current_visualizer_2d = true}
		return
	endif
	printstruct <...>
	addparams ($<visualizer>)
	formattext checksumname = texdict 'zones/%s/%t.tex' s = <pakname> t = <pakname>
	formattext checksumname = zone_context '%t' t = <pakname>
	pushassetcontext context = <zone_context>
	if NOT isassetloaded name = <texdict>
		printf \{'Zone texdict not found for visualizer'}
		popassetcontext
		return
	endif
	found = 0
	getarraysize <textureassets>
	index = 0
	begin
	if istextureindictionary dictionary = <texdict> texture = (<textureassets> [<index>])
		textureasset = (<textureassets> [<index>])
		found = 1
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	if (<found> = 0)
		printf 'Nowhere to put visualizer in %s' s = <pakname>
		popassetcontext
		return
	endif
	popassetcontext
	change current_visualizer = $<visualizer>
	change \{current_visualizer_2d = false}
	printf \{qs(0x998e9bb6)}
	createviewport {
		priority = 20
		id = <viewport>
		style = <style>
		use_lod_shader = true
		framerate = 60
		framemask = 3
	}
	formattext checksumname = fx_func 'create_visualizer_fx_%s' s = <pakname>
	if scriptexists <fx_func>
		<fx_func> <...>
	else
		create_visualizer_fx <...>
	endif
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_visualizer
		if ($use_60fps_visualizer = true)
			viewport = fullscreen_visualizer_viewport
		else
			viewport = bg_viewport
		endif
		default
		viewport = visualizer_viewport
	endswitch
	printf \{qs(0xe77df91d)}
	setsearchallassetcontexts
	createviewporttextureoverride {
		id = <viewport>
		viewportid = <viewport>
		texture = <textureasset>
		texdict = <texdict>
	}
	setsearchallassetcontexts \{off}
	create_extra_visualizers viewport = <viewport>
	printf \{qs(0xabb3099e)}
endscript

script destroy_visualizer 
	printf \{qs(0xee9d3d60)}
	if screenelementexists \{id = fullscreen_visualizer_viewport}
		destroyscreenelement \{id = fullscreen_visualizer_viewport}
	endif
	visualizer = $current_visualizer
	if (<visualizer> = none)
		return
	endif
	if ($current_visualizer_2d = false)
		addparams (<visualizer>)
		killcamanim name = <name>
		setsearchallassetcontexts
		destroyviewporttextureoverride id = <viewport>
		destroy_extra_visualizers id = <viewport>
		setsearchallassetcontexts \{off}
		destroyviewport id = <viewport>
	else
		viewport = bg_viewport
		if screenfx_fxinstanceexists viewport = <viewport> name = av_test0
			screenfx_clearfxinstances {viewport = <viewport>}
		endif
	endif
	change \{current_visualizer = none}
endscript
extra_visualizer_params = {
	textureassets = [
		`tex\zones\z_visualizer\og_visualizer.dds`
	]
	texdicts = [
		`models/car_instruments/guitar/schecter/gtr1_sch_tempest.tex`
	]
}
extra_visualizers = 0

script create_extra_visualizers 
	getarraysize ($extra_visualizer_params.textureassets)
	asset_index = 0
	begin
	switch <asset_index>
		case 0
		pushassetcontext \{context = heap_musician1}
		case 1
		pushassetcontext \{context = heap_musician2}
		case 2
		pushassetcontext \{context = heap_musician3}
		case 3
		pushassetcontext \{context = heap_musician4}
		case 4
		return
	endswitch
	asset_index = (<asset_index> + 1)
	index = 0
	begin
	found = 1
	texdict = ($extra_visualizer_params.texdicts [<index>])
	textureasset = ($extra_visualizer_params.textureassets [<index>])
	if NOT isassetloaded name = <texdict>
		printf 'texdict %s not found for visualizer (this is normal)' s = <texdict>
		found = 0
	else
		if NOT istextureindictionary dictionary = <texdict> texture = <textureasset>
			printf 'texture %s not found for visualizer (this is normal)' s = <texdict>
			found = 0
		endif
	endif
	if (<found> = 1)
		printf \{qs(0xe77df91d)}
		setsearchallassetcontexts
		createviewporttextureoverride {
			id = <viewport>
			viewportid = <viewport>
			texture = <textureasset>
			texdict = <texdict>
		}
		setsearchallassetcontexts \{off}
	endif
	change extra_visualizers = ($extra_visualizers + 1)
	index = (<index> + 1)
	repeat <array_size>
	popassetcontext
	repeat
endscript

script destroy_extra_visualizers 
	begin
	if ($extra_visualizers = 0)
		break
	endif
	setsearchallassetcontexts
	destroyviewporttextureoverride id = <id>
	setsearchallassetcontexts \{off}
	change extra_visualizers = ($extra_visualizers - 1)
	repeat
endscript
visualizer_current_bank = none

script select_visualizer_bank 
	printf \{qs(0xacc307f1)}
	change \{visualizer_current_bank = none}
	gman_songtool_getcurrentsong
	get_song_struct song = <current_song>
	if structurecontains structure = <song_struct> name = genre
		genre = (<song_struct>.genre)
		printf qs(0x08a33eef) a = <genre>
	else
		printf \{qs(0x450314b9)}
		genre = rock
	endif
	bank_choices = []
	include_globals = true
	getpakmancurrentname \{map = zones}
	formattext checksumname = venue_banks '%s_visualizer_banks' s = <pakname> addtostringlookup = true
	if globalexists name = <venue_banks> type = structure
		if structurecontains structure = $<venue_banks> name = include_global_banks
			include_globals = ($<venue_banks>.include_global_banks)
		endif
		if structurecontains structure = $<venue_banks> name = <genre>
			bank_array = ($<venue_banks>.<genre>)
			getarraysize <bank_array>
			if (<array_size> > 0)
				index = 0
				begin
				next_choice = (<bank_array> [<index>])
				if NOT arraycontains array = <bank_choices> contains = <next_choice>
					addarrayelement array = <bank_choices> element = <next_choice>
					bank_choices = <array>
				endif
				index = (<index> + 1)
				repeat <array_size>
			endif
		else
			printf qs(0x31724162) a = <genre>
			include_globals = true
		endif
	else
		printf qs(0xe045104b) a = <pakname>
	endif
	if (<include_globals> = true)
		if globalexists \{name = global_visualizer_banks
				type = structure}
			if structurecontains structure = $global_visualizer_banks name = <genre>
				bank_array = ($global_visualizer_banks.<genre>)
			else
				printf \{channel = marc
					qs(0xa9faa7ae)}
				bank_array = ($global_visualizer_banks.rock)
			endif
			getarraysize <bank_array>
			if (<array_size> > 0)
				index = 0
				begin
				next_choice = (<bank_array> [<index>])
				if NOT arraycontains array = <bank_choices> contains = <next_choice>
					addarrayelement array = <bank_choices> element = <next_choice>
					bank_choices = <array>
				endif
				index = (<index> + 1)
				repeat <array_size>
			endif
		endif
	else
		printf \{qs(0x908bd94d)}
	endif
	printstruct <bank_choices>
	getarraysize <bank_choices>
	if (<array_size> > 0)
		getrandomvalue name = index integer a = 0 b = (<array_size> -1)
		change visualizer_current_bank = (<bank_choices> [<index>])
		printf \{channel = visualizer
			qs(0x62adea7f)
			a = $visualizer_current_bank}
	else
		scriptassert qs(0x946656bc) a = <genre> b = <pakname>
	endif
endscript
visualizer_events_enabled = true

script visualizer_event 
	if ($visualizer_events_enabled = false)
		return
	endif
	if ($visualizer_current_bank = none)
		return
	endif
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_visualizer
		if ($use_60fps_visualizer = true)
			viewport = fullscreen_visualizer_viewport
		else
			viewport = bg_viewport
		endif
		default
		viewport = visualizer_viewport
	endswitch
	if NOT viewportexists id = <viewport>
		printf channel = visualizer qs(0x18bb9e0b) a = <viewport>
		return
	endif
	if NOT globalexists \{name = $visualizer_current_bank
			type = structure}
		printf \{channel = visualizer
			qs(0xfe945df2)
			a = $visualizer_current_bank}
		return
	endif
	lightshow_getparams
	current_bank = $visualizer_current_bank
	av_presets = ($<current_bank>.<mood>)
	if gotparam \{av_presets}
		getarraysize \{av_presets}
		i = RandomInteger (-1.0, 1.0)
		begin
		i = (<i> + 1)
		if (<i> >= <array_size>)
			i = 0
		endif
		<value> = (<av_presets> [<i>])
		if isarray <value>
			create_avfx primitives = <value> viewport = <viewport>
		else
			create_avfx profile = <value> viewport = <viewport>
		endif
		lightshow_waitfornextevent \{events = [
				snapshotchange
			]}
		repeat
	else
		printf qs(0xc93be3cb) a = <mood> b = $visualizer_current_bank donoresolve
	endif
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
	getnextplayers
	magazine_size = <array_size>
	index = 0
	begin
	if ($magazine_picture_props [<index>].num_players = <num_players>)
		getarraysize ($magazine_picture_props [<index>].band_members)
		invalid = 0
		member_index = 0
		begin
		found = 0
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			getplayerinfo <player> band_member
			if (<band_member> = ($magazine_picture_props [<index>].band_members [<member_index>]))
				found = 1
			endif
			getnextplayer player = <player>
			repeat <num_players>
		endif
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
	textureasset = `tex\zones\z_band_logo\rmm_band_name.dds`
	texdicts = [
		'zones/%s/%t.tex'
		'models/venues/recordstore/encore_bandart_skin.tex'
		'models/venues/recordstore/encore_record_skin.tex'
	]
	style = bandname_rendering
	name = bandname_cam
	window_id = bandname_window
}
default_bandname_settings = {
	font = fontgrid_title_a1
	just = [
		center
		center
	]
	internal_just = [
		center
		center
	]
	rgba = [
		210
		210
		210
		255
	]
	alpha = 1
	fit_width = `scale each line if larger`
	fit_height = `scale to fit`
	scale_mode = proportional
}

script get_bandname_viewport_text 
	band_name = qs(0x03ac90f0)
	get_current_band_name savegame = <savegame>
	stringremovetrailingwhitespace string = <band_name>
	if (<new_string> = qs(0x03ac90f0))
		new_string = qs(0x945d0d09)
	endif
	text_alpha = 1.0
	sprite_alpha = 0.0
	0x9b0c099b = circle
	gamemode_gettype
	if (<type> = career)
		gman_songfunc \{func = get_current_song}
		switch (<current_song>)
			case picturetoburn
			case youbelongwithme
			get_song_title song = <current_song>
			new_string = <song_title>
			case dontspeak
			text_alpha = 0.0
			sprite_alpha = 1.0
			0x9b0c099b = 0x02fd4349
		endswitch
	endif
	return {
		band_name_text_string = <new_string>
		0xd81fad93 = <text_alpha>
		0x99b51529 = <sprite_alpha>
		0x2a3326fd = <0x9b0c099b>
	}
endscript

script 0x9239a319 
	addparams ($bandname_viewport_params)
	createviewport {
		priority = 19
		id = <viewport>
		style = <style>
		has_ui = true
		has_ui_only = true
		no_resolve_depthstencilbuffer = true
	}
	setviewportproperties viewport = <viewport> active = false
endscript

script 0x98346b44 
	addparams ($bandname_viewport_params)
	createviewporttextureoverride {
		id = 0x186415bf
		viewportid = <viewport>
		texture = <textureasset>
		texdict = `pak/global_model_tex/global_model_tex.tex`
	}
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
	setviewportproperties viewport = <viewport> active = true
	createscreenelement {
		type = windowelement
		parent = root_window
		id = <window_id>
		viewport = <viewport>
		dims = (512.0, 128.0)
	}
	if (($primary_controller) = -1)
		savegame = 0
	else
		get_savegame_from_controller controller = ($primary_controller)
	endif
	get_bandname_viewport_text savegame = <savegame>
	printf qs(0x35322bfb) s = <band_name_text_string>
	text_params = ($default_bandname_settings)
	formattext checksumname = zone_params '%s_Band_Name' s = <pakname>
	if globalexists name = <zone_params> type = structure
		printf qs(0x5ab17156) s = <pakname>
		text_params = ($<zone_params>)
	else
		printf qs(0x3dca7ef6) s = <pakname>
	endif
	createscreenelement {
		type = textblockelement
		pos = (256.0, 64.0)
		dims = (510.0, 254.0)
		parent = <window_id>
		id = bandname_textelement
		z_priority = 1.0
		<text_params>
		text = <band_name_text_string>
		alpha = <0xd81fad93>
	}
	createscreenelement {
		type = spriteelement
		pos = (256.0, 64.0)
		dims = (128.0, 128.0)
		parent = <window_id>
		id = 0x089414b6
		z_priority = 1.0
		alpha = <0x99b51529>
		texture = <0x2a3326fd>
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
		formattext checksumname = id 'bandnameviewport%i' i = <index>
		printf qs(0xe4efc709) s = <id>
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
	spawnscriptnow bandname_viewport_disabler params = {viewport = <viewport>}
	printf \{qs(0x8e81aa5a)}
endscript

script bandname_viewport_disabler 
	setscriptcannotpause
	wait \{2
		gameframes}
	begin
	if renderingenabled
		break
	endif
	wait \{1
		gameframe}
	repeat
	printf 'Waiting to disable viewport %v' v = <viewport>
	wait \{10
		gameframes}
	printf 'Disabling viewport %v' v = <viewport>
	if viewportexists id = <viewport>
		setviewportproperties viewport = <viewport> active = false
	else
		scriptassert \{qs(0xc30cc5d3)}
	endif
endscript

script destroy_bandname_viewport 
	printscriptinfo \{qs(0x6415d050)}
	killspawnedscript \{name = bandname_viewport_disabler}
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
	setviewportproperties viewport = <viewport> active = false
	if screenelementexists id = <window_id>
		destroyscreenelement id = <window_id>
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
	menu_music_off
	if notcd
		if ($show_movies = 0)
			return
		endif
	endif
	mark_unsafe_for_shutdown
	if NOT gotparam \{noblack}
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = -10}
	endif
	killallmovies
	destroy_bink_sub_heaps
	printf qs(0x23871deb) s = <movie>
	playmovie {
		textureslot = 0
		texturepri = 1000
		no_looping
		no_hold
		<...>
	}
	if gotparam \{noskip}
		event_handlers = []
	else
		event_handlers = [
			{pad_start endmovie}
			{pad_choose endmovie}
		]
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = movie_handler
		event_handlers = <event_handlers>
	}
	launchevent \{type = focus
		target = movie_handler}
	if NOT gotparam \{no_script_wait}
		waitformovie
	endif
endscript

script waitformovie 
	begin
	if ismovieunloaded \{textureslot = 0}
		break
	endif
	if ($paused_for_hardware = 1)
		break
	endif
	wait \{1
		gameframes}
	repeat
	endmovie
	begin
	if NOT screenelementexists \{id = movie_handler}
		break
	endif
	wait \{1
		gameframe}
	repeat
	menu_music_on
	if NOT gotparam \{noblack}
		printf qs(0x27e8073d) s = <movie>
		fadetoblack \{off
			time = 0}
	endif
	mark_safe_for_shutdown
endscript

script waitformovie_endcredits 
	begin
	if ismovieunloaded \{textureslot = 0}
		break
	endif
	if ($paused_for_hardware = 1)
		pausefullscreenmovie
		begin
		if ($paused_for_hardware = 0)
			unpausefullscreenmovie
			break
		endif
		wait \{1
			gameframes}
		repeat
	endif
	wait \{1
		gameframes}
	repeat
	endmovie
	begin
	if NOT screenelementexists \{id = movie_handler}
		break
	endif
	wait \{1
		gameframe}
	repeat
	menu_music_on
	if NOT gotparam \{noblack}
		printf qs(0x27e8073d) s = <movie>
		fadetoblack \{off
			time = 0}
	endif
	mark_safe_for_shutdown
endscript

script endmovie \{slot = 0}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if screenelementexists \{id = movie_handler}
		launchevent \{type = unfocus
			target = movie_handler}
	endif
	finalprintf \{'EndMovie called'}
	if ismovieplaying textureslot = <slot>
		finalprintf \{'EndMovie calling KillMovie'}
		killmovie textureslot = <slot> <...>
		finalprintf \{'EndMovie done KillMovie'}
	endif
	if gotparam \{nowait}
		blockforallmovieunloads
	endif
	finalprintf \{'create_bink_sub_heaps calling'}
	create_bink_sub_heaps
	finalprintf \{'create_bink_sub_heaps called'}
	if screenelementexists \{id = movie_handler}
		movie_handler :die
	endif
endscript
ui_visualizer_viewport_params = {
	textureassets = [
		ui_visualizer
	]
	style = ui_visualizer_rendering
	effectname = ui_visualizer_screeneffect
	viewport = ui_visualizer_viewport
}

script create_ui_visualizer_viewport 
	addparams ($ui_visualizer_viewport_params)
	textureasset = (<textureassets> [0])
	createviewport {
		priority = 20
		id = <viewport>
		style = <style>
		use_lod_shader = true
		framerate = 60
		framemask = 3
	}
	setviewportproperties viewport = <viewport> active = false
endscript

script 0x5227e339 
	addparams ($ui_visualizer_viewport_params)
	textureasset = (<textureassets> [0])
	setsearchallassetcontexts
	createviewporttextureoverride {
		id = <viewport>
		viewportid = <viewport>
		texture = <textureasset>
	}
	setsearchallassetcontexts \{off}
endscript

script create_ui_visualizer_fx 
	requireparams \{[
			preset
		]
		all}
	addparams ($ui_visualizer_viewport_params)
	clear_ui_visualizer
	enable_ui_visualizer
	if isarray ($<preset>)
		create_avui_fx primitives = ($<preset>) viewport = <viewport> id = <effectname>
	else
		create_avui_fx profile = ($<preset>) viewport = <viewport> id = <effectname>
	endif
endscript

script enable_ui_visualizer 
	addparams ($ui_visualizer_viewport_params)
	if viewportexists \{id = ui_visualizer_viewport}
		setviewportproperties \{viewport = ui_visualizer_viewport
			active = true}
	endif
endscript

script disable_ui_visualizer 
	addparams ($ui_visualizer_viewport_params)
	if viewportexists id = <viewport>
		setviewportproperties viewport = <viewport> active = false
	endif
endscript

script clear_ui_visualizer 
	disable_ui_visualizer
	addparams ($ui_visualizer_viewport_params)
	if viewportexists id = <viewport>
		screenfx_clearfxinstances viewport = <viewport>
	endif
endscript
