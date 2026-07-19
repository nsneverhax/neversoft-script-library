
script create_movie_viewport 
	create_jumbotron
	create_bandname_viewport
endscript
jumbotron_viewport_params = {
	viewport = jumbotron_viewport
	textureasset = `tex\zones\Z_Amazon\RMM_Jumbotron.dds`
	style = jumbotron_rendering
	name = jumbotron_cam
}
current_jumbotron = none

script create_jumbotron 
	printf \{qs("\Lcreate_jumbotron")}
	GetPakManCurrentName \{map = zones}
	jumbotron = jumbotron_viewport_params
	if NOT GlobalExists name = <jumbotron>
		return
	endif
	AddParams ($<jumbotron>)
	FormatText checksumname = texdict 'zones/%s/%t.tex' s = <pakname> t = <pakname>
	FormatText checksumname = zone_context '%t' t = <pakname>
	PushAssetContext context = <zone_context>
	if NOT IsAssetLoaded name = <texdict>
		printf \{'Zone texdict not found for jumbotron'}
		PopAssetContext
		return
	endif
	if NOT IsTextureInDictionary dictionary = <texdict> texture = <textureasset>
		printf 'Nowhere to put Jumbotron in %s' s = <pakname>
		PopAssetContext
		return
	endif
	PopAssetContext
	FormatText checksumname = cameraparams '%s_cameras_closeups' s = <pakname>
	if NOT GlobalExists name = <cameraparams>
		FormatText checksumname = cameraparams '%s_cameras_singer' s = <pakname>
		if NOT GlobalExists name = <cameraparams>
			printf \{qs("\LCameras not found")}
			return
		endif
	endif
	change current_jumbotron = $<jumbotron>
	printf \{qs("\LCreating Viewport")}
	CreateViewport {
		priority = 6
		id = <viewport>
		style = <style>
		jiggle_rendering = 2
		use_lod_shader = true
	}
	printf \{qs("\LPlaying IGC Cam")}
	change jumbotron_camera_params = $<cameraparams>
	change \{jumbotron_camera_index = 0}
	jumbotron_camera_startcallback <...>
	printf \{qs("\LMapping rendertarget")}
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		id = <viewport>
		viewportid = <viewport>
		texture = <textureasset>
		texdict = <texdict>
	}
	SetSearchAllAssetContexts \{off}
	printf \{qs("\Lcreate_jumbotron done")}
endscript
jumbotron_camera_index = 0
jumbotron_camera_params = none

script jumbotron_camera_startcallback 
	jumbotron = $current_jumbotron
	if (<jumbotron> = none)
		return
	endif
	AddParams (<jumbotron>)
	current_index = ($jumbotron_camera_index)
	GetArraySize ($jumbotron_camera_params)
	current_index = (<current_index> + 1)
	if (<current_index> = <array_size>)
		current_index = 0
	endif
	change jumbotron_camera_index = <current_index>
	if ($debug_showcameraname = on)
		CameraCuts_UpdateDebugCameraName
	endif
	force_time = 5
	if StructureContains Structure = (($jumbotron_camera_params) [<current_index>]) params
		params = {(($jumbotron_camera_params) [<current_index>].params) force_time = <force_time>}
	else
		params = {CamParams = (($jumbotron_camera_params) [<current_index>]) force_time = <force_time>}
	endif
	PlayIGCCam {
		name = <name>
		viewport = <viewport>
		LockTo = world
		controlscript = CameraCuts_StaticCamControl
		(($jumbotron_camera_params) [<current_index>])
		params = <params>
		exitscript = jumbotron_camera_startcallback
	}
endscript

script destroy_jumbotron 
	printf \{qs("\Ldestroy_jumbotron")}
	jumbotron = $current_jumbotron
	if (<jumbotron> = none)
		return
	endif
	AddParams (<jumbotron>)
	KillCamAnim name = <name>
	SetSearchAllAssetContexts
	DestroyViewportTextureOverride id = <viewport>
	SetSearchAllAssetContexts \{off}
	DestroyViewport id = <viewport>
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
	printf \{qs("\Lcreate_magazine_viewport")}
	destroy_magazine_viewport
	AddParams ($magazine_viewport_props)
	CreateViewport {
		priority = 6
		id = <viewport>
		style = <style>
	}
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		id = <texoverride>
		viewportid = <viewport>
		texture = <textureasset>
		texdict = <texdict>
	}
	SetSearchAllAssetContexts \{off}
	GetPakManCurrentName \{map = zones}
	<part> = $current_progression_flag
	switch $current_progression_flag
		case Career_Band
		PlayIGCCam {
			name = <camera>
			viewport = <viewport>
			LockTo = Drummer
			pos = (-2.97686, 0.521859, 4.564908)
			Quat = (-0.078003004, 0.866874, 0.143193)
			FOV = 102.0
			LookAt = Drummer
			ScreenOffset = (-0.46714398, 0.784728)
			Play_hold = 1
			interrupt_current
		}
		case Career_Guitar
		PlayIGCCam {
			name = <camera>
			viewport = <viewport>
			LockTo = Guitarist
			LockToBone = Bone_Chest
			LookAt = Guitarist
			LookAtBone = Bone_Head
			pos = (-0.156578, 1.539315, 0.349303)
			Quat = (0.50972605, 0.56738, -0.38740703)
			FOV = 50.0
			Play_hold = 1
			interrupt_current
		}
		case Career_Bass
		PlayIGCCam {
			name = <camera>
			viewport = <viewport>
			LockTo = bassist
			LockToBone = Bone_Chest
			LookAt = bassist
			LookAtBone = Bone_Head
			pos = (-0.156578, 1.539315, 0.349303)
			Quat = (0.50972605, 0.56738, -0.38740703)
			FOV = 50.0
			Play_hold = 1
			interrupt_current
		}
		case Career_Vocals
		PlayIGCCam {
			name = <camera>
			viewport = <viewport>
			LockTo = vocalist
			LockToBone = Bone_Chest
			LookAt = vocalist
			LookAtBone = Bone_Head
			pos = (-0.156578, 1.539315, 0.349303)
			Quat = (0.50972605, 0.56738, -0.38740703)
			FOV = 50.0
			Play_hold = 1
			interrupt_current
		}
		case Career_Drum
		PlayIGCCam {
			name = <camera>
			viewport = <viewport>
			LockTo = Drummer
			pos = (-0.198893, 1.620875, 1.059207)
			Quat = (0.053802997, 0.93876696, -0.23057601)
			FOV = 82.0
			LookAt = Drummer
			ScreenOffset = (-0.27065602, 1.2902452)
			Play_hold = 1
			interrupt_current
		}
		default
		PlayIGCCam {
			name = <camera>
			viewport = <viewport>
			LockTo = Guitarist
			LockToBone = Bone_Chest
			LookAt = Guitarist
			LookAtBone = Bone_Head
			pos = (-0.156578, 1.539315, 0.349303)
			Quat = (0.50972605, 0.56738, -0.38740703)
			FOV = 50.0
			Play_hold = 1
			interrupt_current
		}
	endswitch
	SetViewportProperties \{viewport = magazine_viewport
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
			Drummer
		]
		anims = [
			d_winposes01
		]
		no_suffix = 1
	}
	{
		num_players = 1
		band_members = [
			Guitarist
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
			Guitarist
		]
		anims = [
			sg_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			vocalist
			Drummer
		]
		anims = [
			sd_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			Guitarist
			bassist
		]
		anims = [
			gb_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			Guitarist
			Drummer
		]
		anims = [
			gd_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			bassist
			Drummer
		]
		anims = [
			bd_winposes01
		]
	}
	{
		num_players = 3
		band_members = [
			vocalist
			Drummer
			Guitarist
		]
		anims = [
			sdg_winposes01
		]
	}
	{
		num_players = 3
		band_members = [
			vocalist
			Drummer
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
			Guitarist
			bassist
		]
		anims = [
			sgb_winposes01
		]
	}
	{
		num_players = 3
		band_members = [
			Drummer
			Guitarist
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
			Guitarist
			bassist
			Drummer
		]
		anims = [
			sgbd_winposes01
		]
	}
]

script grab_magazine_viewport \{select_index = -1}
	printf \{qs("\Lgrab_magazine_viewport")}
	GetArraySize ($magazine_picture_props)
	magazine_size = <array_size>
	index = 0
	begin
	if ($magazine_picture_props [<index>].num_players = $current_num_players)
		GetArraySize ($magazine_picture_props [<index>].band_members)
		invalid = 0
		member_index = 0
		begin
		found = 0
		player = 1
		begin
		FormatText checksumname = player_status 'player%i_status' i = <player>
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
	printf qs("\LFound Magazine index %i") i = <index>
	if (<select_index> != -1)
		index = <select_index>
		printf qs("\LForcing to Magazine index %i") i = <index>
	endif
	AddParams ($magazine_picture_props [<index>])
	GetArraySize <anims>
	GetRandomValue name = rand_index Integer a = 0 b = (<array_size> - 1)
	Anim = (<anims> [<rand_index>])
	printf qs("\LPlaying Magazine anim %i") i = <Anim>
	hide_band
	GetArraySize (<band_members>)
	member_index = 0
	begin
	band_member = (<band_members> [<member_index>])
	if GotParam \{no_suffix}
		suffix = ''
	else
		switch <band_member>
			case Drummer
			suffix = '_d'
			case bassist
			suffix = '_b'
			case vocalist
			suffix = '_s'
			case Guitarist
			default
			suffix = '_g'
		endswitch
	endif
	if CompositeObjectExists name = <band_member>
		ExtendCRC <Anim> <suffix> out = anim_name
		target_params = {}
		if (<band_member> = Drummer)
			target_params = {target = moment_branch}
		endif
		<band_member> :unhide
		<band_member> :GameObj_PlayAnim Anim = <anim_name> BlendDuration = 0 <target_params>
		<band_member> :ragdoll_markforreset
		Band_MoveToNode name = <band_member> node = 'vocalist_start'
	endif
	member_index = (<member_index> + 1)
	repeat <array_size>
	ExtendCRC <Anim> '_c01' out = camera_anim_name
	lock_target = vocalist_mocap_lock_target_01
	<lock_target> :GameObj_PlayAnim Anim = <camera_anim_name> BlendDuration = 0
	AddParams ($magazine_viewport_props)
	if (<select_index> != -1)
		if NOT ScreenElementExists \{id = magazine_element}
			CreateScreenElement {
				parent = root_window
				just = [center center]
				type = SpriteElement
				id = magazine_element
				texture = <texture>
				pos = (200.0, 200.0)
				dims = (200.0, 200.0)
				alpha = 1
			}
		endif
	endif
	PlayIGCCam {
		name = <camera>
		viewport = <viewport>
		LockTo = <lock_target>
		LockToBone = bone_camera
		pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		time = 0
		Play_hold = 1
		interrupt_current
	}
	BandManager_Enabled \{off}
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
	SetViewportProperties \{viewport = magazine_viewport
		active = true}
	UnPauseGame
	Wait \{10
		gameframes}
	PauseGame
	SetViewportProperties \{viewport = magazine_viewport
		active = false}
	BandManager_Enabled
	unhide_band
	if (<select_index> != -1)
		fadetoblack \{off
			time = 0}
	endif
endscript

script destroy_magazine_viewport 
	printf \{qs("\Ldestroy_magazine_viewport")}
	AddParams ($magazine_viewport_props)
	if ViewportExists id = <viewport>
		DestroyViewport id = <viewport>
		DestroyViewportTextureOverride id = <texoverride>
		KillCamAnim name = <camera>
	endif
	if ScreenElementExists \{id = magazine_element}
		DestroyScreenElement \{id = magazine_element}
	endif
endscript
current_bandname_viewport = none
bandname_viewport_params = {
	viewport = bandname_viewport
	textureasset = `tex\zones\Z_Hotel\RMM_band_name.dds`
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
	name = qs("\L")
	if ($is_attract_mode = 0)
		bandname_id = band_info
		GetGlobalTags <bandname_id>
	endif
	StringRemoveTrailingWhitespace string = <name>
	if (<new_string> = qs("\L"))
		new_string = qs("\LGuitar Hero")
	endif
	return band_name_text_string = <new_string>
endscript

script create_bandname_viewport 
	printf \{qs("\Lcreate_bandname_viewport")}
	GetPakManCurrentName \{map = zones}
	bandname = bandname_viewport_params
	if NOT GlobalExists name = <bandname>
		return
	endif
	AddParams ($<bandname>)
	change current_bandname_viewport = $<bandname>
	printf \{qs("\LCreating Viewport")}
	CreateViewport {
		priority = 6
		id = <viewport>
		style = <style>
		has_ui = true
		has_ui_only = true
		no_resolve_depthstencilbuffer = true
	}
	CreateScreenElement {
		type = WindowElement
		parent = root_window
		id = <window_id>
		viewport = <viewport>
		dims = (512.0, 128.0)
	}
	get_bandname_viewport_text
	printf qs("\LCreating Band Name '%s'") s = <band_name_text_string>
	CreateScreenElement {
		type = TextBlockElement
		dims = (480.0, 104.0)
		parent = <window_id>
		id = bandname_textelement
		font = fontgrid_text_A11_b
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
	GetArraySize <texdicts>
	index = 0
	begin
	FormatText checksumname = texdict (<texdicts> [<index>]) s = <pakname> t = <pakname> AddToStringLookup = true
	valid = 1
	SetSearchAllAssetContexts
	if NOT IsAssetLoaded name = <texdict>
		printf 'texdict %s not found for bandname' s = <texdict>
		valid = 0
	endif
	if NOT IsTextureInDictionary dictionary = <texdict> texture = <textureasset>
		printf 'No texture to put Band Name in %s with %t' s = <pakname> t = <texdict>
		valid = 0
	endif
	if (<valid> = 1)
		printf \{qs("\LMapping rendertarget")}
		FormatText checksumname = id 'bandnameviewport%i' i = <index>
		CreateViewportTextureOverride {
			id = <id>
			viewportid = <viewport>
			texture = <textureasset>
			texdict = <texdict>
		}
	endif
	SetSearchAllAssetContexts \{off}
	index = (<index> + 1)
	repeat <array_size>
	printf \{qs("\Lcreate_bandname done")}
endscript

script destroy_bandname_viewport 
	printscriptinfo \{qs("destroy_bandname_viewport")}
	bandname = $current_bandname_viewport
	if (<bandname> = none)
		return
	endif
	AddParams (<bandname>)
	GetPakManCurrentName \{map = zones}
	SetSearchAllAssetContexts
	GetArraySize <texdicts>
	index = 0
	begin
	FormatText checksumname = texdict (<texdicts> [<index>]) s = <pakname> t = <pakname>
	FormatText checksumname = id 'bandnameviewport%i' i = <index> AddToStringLookup = true
	printf 'Trying to delete %i' i = <id>
	if IsAssetLoaded name = <texdict>
		if IsTextureInDictionary dictionary = <texdict> texture = <textureasset>
			printf 'Succeeded deleting %i' i = <id>
			DestroyViewportTextureOverride id = <id>
		else
			printf '%i - not in texture dictionary' i = <id>
		endif
	else
		printf '%i - Asset not loaded' i = <id>
	endif
	index = (<index> + 1)
	repeat <array_size>
	SetSearchAllAssetContexts \{off}
	DestroyViewport id = <viewport>
	if ScreenElementExists id = <window_id>
		DestroyScreenElement id = <window_id>
	endif
	if ScreenElementExists \{id = bandname_textelement}
		DestroyScreenElement \{id = bandname_textelement}
	endif
	change \{current_bandname_viewport = none}
endscript

script PauseFullScreenMovie 
	if IsMoviePlaying \{TextureSlot = 0}
		PauseMovie \{TextureSlot = 0}
	endif
endscript

script UnPauseFullScreenMovie 
	if IsMoviePlaying \{TextureSlot = 0}
		ResumeMovie \{TextureSlot = 0}
	endif
endscript

script PlayMovieAndWait 
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	OnExitRun \{PlayMovieAndWait_Cleanup}
	SetScriptCannotPause
	mark_unsafe_for_shutdown
	if NOT GotParam \{noblack}
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = -10}
	endif
	printf qs("\LPlaying Movie %s") s = <movie>
	set_bink_heap_state \{state = big}
	PlayMovie {TextureSlot = 0
		TexturePri = 1000
		no_looping
		no_hold
		<...>}
	Wait \{2
		gameframes}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = movie_handler
		event_handlers = [
			{
				pad_start
				EndMovie
				params = {
					Interrupted = 1
				}
			}
			{
				pad_back
				EndMovie
				params = {
					Interrupted = 1
				}
			}
			{
				pad_choose
				BX_start_demo_attract
			}
		]}
	LaunchEvent \{type = focus
		target = movie_handler}
	begin
	if NOT IsMoviePlaying \{TextureSlot = 0}
		break
	endif
	Wait \{1
		gameframes}
	repeat
	KillMovie \{TextureSlot = 0}
	hide_glitch
	WaitForAllMoviesToFinish
	spawnscriptnow \{EndMovie}
	begin
	if NOT ScreenElementExists \{id = movie_handler}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if NOT GotParam \{noblack}
		printf qs("\LFinished Playing Movie %s") s = <movie>
		fadetoblack \{off
			time = 0}
	endif
	mark_safe_for_shutdown
endscript

script PlayMovieAndWait_Cleanup 
	set_bink_heap_state \{state = small}
endscript

script EndMovie 
	hide_glitch
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	if IsMoviePlaying \{TextureSlot = 0}
		KillMovie \{TextureSlot = 0}
	endif
	if ScreenElementExists \{id = movie_handler}
		movie_handler :Die
	endif
	if GotParam \{Interrupted}
		change BX_Attract_Interrupted = <Interrupted>
	endif
endscript
