
script create_movie_viewport 
	create_jumbotron
	create_bandname_viewport
endscript
jumbotron_viewport_params = {
	viewport = jumbotron_viewport
	textureasset = `tex\zones\metalfest\jg_mf_tvscreen_d.dds`
	style = jumbotron_rendering
	Name = jumbotron_cam
}
current_jumbotron = None

script create_jumbotron 
	printf \{qs(0x646713ed)}
	GetPakManCurrentName \{map = zones}
	jumbotron = jumbotron_viewport_params
	if NOT GlobalExists Name = <jumbotron>
		return
	endif
	AddParams ($<jumbotron>)
	formatText checksumName = texdict 'zones/%s/%t.tex' s = <pakname> t = <pakname>
	formatText checksumName = zone_context '%t' t = <pakname>
	PushAssetContext context = <zone_context>
	if NOT isassetloaded Name = <texdict>
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
	formatText checksumName = cameraparams '%s_cameras_closeups' s = <pakname>
	if NOT GlobalExists Name = <cameraparams>
		formatText checksumName = cameraparams '%s_cameras_singer' s = <pakname>
		if NOT GlobalExists Name = <cameraparams>
			printf \{qs(0x78c7dc47)}
			return
		endif
	endif
	Change current_jumbotron = $<jumbotron>
	printf \{qs(0x998e9bb6)}
	createviewport {
		Priority = 6
		id = <viewport>
		style = <style>
		jiggle_rendering = 2
		use_lod_shader = true
	}
	printf \{qs(0xd1c957d2)}
	Change jumbotron_camera_params = $<cameraparams>
	Change \{jumbotron_camera_index = 0}
	jumbotron_camera_startcallback <...>
	printf \{qs(0xe77df91d)}
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		id = <viewport>
		viewportid = <viewport>
		texture = <textureasset>
		texdict = <texdict>
	}
	SetSearchAllAssetContexts \{OFF}
	printf \{qs(0xd3ab36ed)}
endscript
jumbotron_camera_index = 0
jumbotron_camera_params = None

script jumbotron_camera_startcallback 
	jumbotron = $current_jumbotron
	if (<jumbotron> = None)
		return
	endif
	AddParams (<jumbotron>)
	current_index = ($jumbotron_camera_index)
	GetArraySize ($jumbotron_camera_params)
	current_index = (<current_index> + 1)
	if (<current_index> = <array_Size>)
		current_index = 0
	endif
	Change jumbotron_camera_index = <current_index>
	if ($debug_showcameraname = On)
		CameraCuts_UpdateDebugCameraName
	endif
	force_time = 5
	if StructureContains structure = (($jumbotron_camera_params) [<current_index>]) params
		params = {(($jumbotron_camera_params) [<current_index>].params) force_time = <force_time>}
	else
		params = {CamParams = (($jumbotron_camera_params) [<current_index>]) force_time = <force_time>}
	endif
	PlayIGCCam {
		Name = <Name>
		viewport = <viewport>
		LockTo = World
		controlscript = CameraCuts_StaticCamControl
		(($jumbotron_camera_params) [<current_index>])
		params = <params>
		exitscript = jumbotron_camera_startcallback
	}
endscript

script destroy_jumbotron 
	printf \{qs(0xaff0ac37)}
	jumbotron = $current_jumbotron
	if (<jumbotron> = None)
		return
	endif
	AddParams (<jumbotron>)
	KillCamAnim Name = <Name>
	SetSearchAllAssetContexts
	DestroyViewportTextureOverride id = <viewport>
	SetSearchAllAssetContexts \{OFF}
	DestroyViewport id = <viewport>
	Change \{current_jumbotron = None}
endscript

script destroy_movie_viewport 
	destroy_jumbotron
	destroy_bandname_viewport
endscript
magazine_viewport_props = {
	texture = magazine1_viewport
	viewport = magazine_viewport
	Camera = magazine_camera
	texoverride = magazine_texoverride
	textureasset = magazine1_viewport
	style = magazine_rendering
}

script create_magazine_viewport 
	printf \{qs(0xbf2057a1)}
	destroy_magazine_viewport
	AddParams ($magazine_viewport_props)
	createviewport {
		Priority = 6
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
	SetSearchAllAssetContexts \{OFF}
	GetPakManCurrentName \{map = zones}
	<part> = $current_progression_flag
	switch $current_progression_flag
		case career_band
		PlayIGCCam {
			Name = <Camera>
			viewport = <viewport>
			LockTo = drummer
			Pos = (-2.97686, 0.521859, 4.564908)
			Quat = (-0.078003004, 0.866874, 0.143193)
			FOV = 102.0
			LookAt = drummer
			ScreenOffset = (-0.46714398, 0.784728)
			play_hold = 1
			interrupt_current
		}
		case career_guitar
		PlayIGCCam {
			Name = <Camera>
			viewport = <viewport>
			LockTo = GUITARIST
			LockToBone = bone_chest
			LookAt = GUITARIST
			LookAtBone = bone_head
			Pos = (-0.156578, 1.539315, 0.349303)
			Quat = (0.50972605, 0.56738, -0.38740703)
			FOV = 50.0
			play_hold = 1
			interrupt_current
		}
		case career_bass
		PlayIGCCam {
			Name = <Camera>
			viewport = <viewport>
			LockTo = BASSIST
			LockToBone = bone_chest
			LookAt = BASSIST
			LookAtBone = bone_head
			Pos = (-0.156578, 1.539315, 0.349303)
			Quat = (0.50972605, 0.56738, -0.38740703)
			FOV = 50.0
			play_hold = 1
			interrupt_current
		}
		case career_vocals
		PlayIGCCam {
			Name = <Camera>
			viewport = <viewport>
			LockTo = vocalist
			LockToBone = bone_chest
			LookAt = vocalist
			LookAtBone = bone_head
			Pos = (-0.156578, 1.539315, 0.349303)
			Quat = (0.50972605, 0.56738, -0.38740703)
			FOV = 50.0
			play_hold = 1
			interrupt_current
		}
		case career_drum
		PlayIGCCam {
			Name = <Camera>
			viewport = <viewport>
			LockTo = drummer
			Pos = (-0.198893, 1.620875, 1.059207)
			Quat = (0.053802997, 0.93876696, -0.23057601)
			FOV = 82.0
			LookAt = drummer
			ScreenOffset = (-0.27065602, 1.2902452)
			play_hold = 1
			interrupt_current
		}
		default
		PlayIGCCam {
			Name = <Camera>
			viewport = <viewport>
			LockTo = GUITARIST
			LockToBone = bone_chest
			LookAt = GUITARIST
			LookAtBone = bone_head
			Pos = (-0.156578, 1.539315, 0.349303)
			Quat = (0.50972605, 0.56738, -0.38740703)
			FOV = 50.0
			play_hold = 1
			interrupt_current
		}
	endswitch
	SetViewportProperties \{viewport = magazine_viewport
		Active = FALSE}
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
			BASSIST
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
			GUITARIST
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
			BASSIST
		]
		anims = [
			sb_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			vocalist
			GUITARIST
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
			GUITARIST
			BASSIST
		]
		anims = [
			gb_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			GUITARIST
			drummer
		]
		anims = [
			gd_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			BASSIST
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
			GUITARIST
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
			BASSIST
		]
		anims = [
			sdb_winposes01
		]
	}
	{
		num_players = 3
		band_members = [
			vocalist
			GUITARIST
			BASSIST
		]
		anims = [
			sgb_winposes01
		]
	}
	{
		num_players = 3
		band_members = [
			drummer
			GUITARIST
			BASSIST
		]
		anims = [
			dgb_winposes01
		]
	}
	{
		num_players = 4
		band_members = [
			vocalist
			GUITARIST
			BASSIST
			drummer
		]
		anims = [
			sgbd_winposes01
		]
	}
]

script grab_magazine_viewport \{select_index = -1}
	printf \{qs(0x90aa5f6b)}
	GetArraySize ($magazine_picture_props)
	magazine_size = <array_Size>
	index = 0
	begin
	if ($magazine_picture_props [<index>].num_players = $current_num_players)
		GetArraySize ($magazine_picture_props [<index>].band_members)
		invalid = 0
		member_index = 0
		begin
		found = 0
		Player = 1
		begin
		formatText checksumName = player_status 'player%i_status' i = <Player>
		if ($<player_status>.band_member = ($magazine_picture_props [<index>].band_members [<member_index>]))
			found = 1
		endif
		Player = (<Player> + 1)
		repeat ($current_num_players)
		if (<found> = 0)
			invalid = 1
		endif
		member_index = (<member_index> + 1)
		repeat <array_Size>
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
	AddParams ($magazine_picture_props [<index>])
	GetArraySize <anims>
	GetRandomValue Name = rand_index integer a = 0 b = (<array_Size> - 1)
	anim = (<anims> [<rand_index>])
	printf qs(0xcb15e5e4) i = <anim>
	Hide_Band
	GetArraySize (<band_members>)
	member_index = 0
	begin
	band_member = (<band_members> [<member_index>])
	if GotParam \{no_suffix}
		suffix = ''
	else
		switch <band_member>
			case drummer
			suffix = '_d'
			case BASSIST
			suffix = '_b'
			case vocalist
			suffix = '_s'
			case GUITARIST
			default
			suffix = '_g'
		endswitch
	endif
	if CompositeObjectExists Name = <band_member>
		ExtendCrc <anim> <suffix> out = anim_name
		target_params = {}
		if (<band_member> = drummer)
			target_params = {target = moment_branch}
		endif
		<band_member> :unhide
		<band_member> :GameObj_PlayAnim anim = <anim_name> BlendDuration = 0 <target_params>
		<band_member> :Ragdoll_MarkForReset
		band_movetonode Name = <band_member> node = 'vocalist_start'
	endif
	member_index = (<member_index> + 1)
	repeat <array_Size>
	ExtendCrc <anim> '_c01' out = camera_anim_name
	lock_target = vocalist_mocap_lock_target_01
	<lock_target> :GameObj_PlayAnim anim = <camera_anim_name> BlendDuration = 0
	AddParams ($magazine_viewport_props)
	if (<select_index> != -1)
		if NOT ScreenElementExists \{id = magazine_element}
			CreateScreenElement {
				parent = root_window
				just = [center center]
				Type = SpriteElement
				id = magazine_element
				texture = <texture>
				Pos = (200.0, 200.0)
				dims = (200.0, 200.0)
				alpha = 1
			}
		endif
	endif
	PlayIGCCam {
		Name = <Camera>
		viewport = <viewport>
		LockTo = <lock_target>
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		time = 0
		play_hold = 1
		interrupt_current
	}
	bandmanager_enabled \{OFF}
	if (<select_index> != -1)
		fadetoblack \{On
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
		Active = true}
	UnPauseGame
	Wait \{10
		gameframes}
	PauseGame
	SetViewportProperties \{viewport = magazine_viewport
		Active = FALSE}
	bandmanager_enabled
	Unhide_Band
	if (<select_index> != -1)
		fadetoblack \{OFF
			time = 0}
	endif
endscript

script destroy_magazine_viewport 
	printf \{qs(0x73bd28bb)}
	AddParams ($magazine_viewport_props)
	if ViewportExists id = <viewport>
		DestroyViewport id = <viewport>
		DestroyViewportTextureOverride id = <texoverride>
		KillCamAnim Name = <Camera>
	endif
	if ScreenElementExists \{id = magazine_element}
		DestroyScreenElement \{id = magazine_element}
	endif
endscript
current_bandname_viewport = None
bandname_viewport_params = {
	viewport = bandname_viewport
	textureasset = `tex\zones\z_hotel\rmm_band_name.dds`
	texdicts = [
		'zones/%s/%t.tex'
		'models/venues/recordstore/encore_bandart_skin.tex'
		'models/venues/recordstore/encore_record_skin.tex'
	]
	style = bandname_rendering
	Name = bandname_cam
	window_id = bandname_window
}

script get_bandname_viewport_text 
	Name = qs(0x03ac90f0)
	if ($is_attract_mode = 0)
		bandname_id = band_info
		GetGlobalTags <bandname_id>
	endif
	StringRemoveTrailingWhitespace string = <Name>
	if (<new_string> = qs(0x03ac90f0))
		new_string = qs(0x945d0d09)
	endif
	return band_name_text_string = <new_string>
endscript

script create_bandname_viewport 
	printf \{qs(0xd70bc7ea)}
	GetPakManCurrentName \{map = zones}
	bandname = bandname_viewport_params
	if NOT GlobalExists Name = <bandname>
		return
	endif
	AddParams ($<bandname>)
	Change current_bandname_viewport = $<bandname>
	printf \{qs(0x998e9bb6)}
	createviewport {
		Priority = 6
		id = <viewport>
		style = <style>
		has_ui = true
		has_ui_only = true
		no_resolve_depthstencilbuffer = true
	}
	CreateScreenElement {
		Type = WindowElement
		parent = root_window
		id = <window_id>
		viewport = <viewport>
		dims = (512.0, 128.0)
	}
	get_bandname_viewport_text
	printf qs(0x35322bfb) s = <band_name_text_string>
	CreateScreenElement {
		Type = TextBlockElement
		dims = (480.0, 104.0)
		parent = <window_id>
		id = bandname_textelement
		font = fontgrid_text_a11_b
		Pos = (256.0, 64.0)
		just = [center center]
		internal_just = [center center]
		rgba = [210 210 210 250]
		text = <band_name_text_string>
		z_priority = 1.0
		alpha = 1
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	to	fit`
		scale_mode = proportional
	}
	GetArraySize <texdicts>
	index = 0
	begin
	formatText checksumName = texdict (<texdicts> [<index>]) s = <pakname> t = <pakname> AddToStringLookup = true
	valid = 1
	SetSearchAllAssetContexts
	if NOT isassetloaded Name = <texdict>
		printf 'texdict %s not found for bandname' s = <texdict>
		valid = 0
	endif
	if NOT IsTextureInDictionary dictionary = <texdict> texture = <textureasset>
		printf 'No texture to put Band Name in %s with %t' s = <pakname> t = <texdict>
		valid = 0
	endif
	if (<valid> = 1)
		printf \{qs(0xe77df91d)}
		formatText checksumName = id 'bandnameviewport%i' i = <index>
		CreateViewportTextureOverride {
			id = <id>
			viewportid = <viewport>
			texture = <textureasset>
			texdict = <texdict>
		}
	endif
	SetSearchAllAssetContexts \{OFF}
	index = (<index> + 1)
	repeat <array_Size>
	printf \{qs(0x8e81aa5a)}
endscript

script destroy_bandname_viewport 
	printscriptinfo \{qs(0x6415d050)}
	bandname = $current_bandname_viewport
	if (<bandname> = None)
		return
	endif
	AddParams (<bandname>)
	GetPakManCurrentName \{map = zones}
	SetSearchAllAssetContexts
	GetArraySize <texdicts>
	index = 0
	begin
	formatText checksumName = texdict (<texdicts> [<index>]) s = <pakname> t = <pakname>
	formatText checksumName = id 'bandnameviewport%i' i = <index> AddToStringLookup = true
	printf 'Trying to delete %i' i = <id>
	if isassetloaded Name = <texdict>
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
	repeat <array_Size>
	SetSearchAllAssetContexts \{OFF}
	DestroyViewport id = <viewport>
	if ScreenElementExists id = <window_id>
		DestroyScreenElement id = <window_id>
	endif
	if ScreenElementExists \{id = bandname_textelement}
		DestroyScreenElement \{id = bandname_textelement}
	endif
	Change \{current_bandname_viewport = None}
endscript

script PauseFullScreenMovie 
	if IsMoviePlaying \{textureSlot = 0}
		PauseMovie \{textureSlot = 0}
	endif
endscript

script UnPauseFullScreenMovie 
	if IsMoviePlaying \{textureSlot = 0}
		ResumeMovie \{textureSlot = 0}
	endif
endscript

script PlayMovieAndWait 
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	mark_unsafe_for_shutdown
	if NOT GotParam \{noblack}
		fadetoblack \{On
			time = 0
			alpha = 1.0
			z_priority = -10}
	endif
	printf qs(0x23871deb) s = <movie>
	PlayMovie {textureSlot = 0
		TexturePri = 1000
		no_looping
		no_hold
		<...>}
	Wait \{2
		gameframes}
	CreateScreenElement \{Type = ContainerElement
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
	LaunchEvent \{Type = focus
		target = movie_handler}
	begin
	if NOT IsMoviePlaying \{textureSlot = 0}
		break
	endif
	Wait \{1
		gameframes}
	repeat
	SpawnScriptNow \{endmovie}
	begin
	if NOT ScreenElementExists \{id = movie_handler}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if NOT GotParam \{noblack}
		printf qs(0x27e8073d) s = <movie>
		fadetoblack \{OFF
			time = 0}
	endif
	mark_safe_for_shutdown
endscript

script endmovie 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if IsMoviePlaying \{textureSlot = 0}
		KillMovie \{textureSlot = 0}
	endif
	if ScreenElementExists \{id = movie_handler}
		movie_handler :Die
	endif
endscript
