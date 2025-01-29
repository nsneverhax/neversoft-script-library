venues_requiring_visualizer = [
	Z_Mall
	Z_Space
	Z_Cube
	Z_EasterIsland
	Z_AwardShow
	Z_Gorge
	Z_CentralPark
	Z_Montreux
	Z_Paris
	Z_Visualizer
	Z_Cabo
	Z_Tokyo
]

script create_movie_viewport 
	WaitForDeadViewportCleanup
	create_visualizer
	create_jumbotron
	create_bandname_viewport
endscript
jumbotron_viewport_params = {
	viewport = jumbotron_viewport
	textureasset = `tex\zones\Metalfest\JG_MF_TVScreen_D.dds`
	style = jumbotron_rendering
	name = jumbotron_cam
}
current_jumbotron = None

script create_jumbotron 
	printf \{qs(0x646713ed)}
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
			printf \{qs(0x78c7dc47)}
			return
		endif
	endif
	Change current_jumbotron = $<jumbotron>
	printf \{qs(0x998e9bb6)}
	CreateViewport {
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
	SetSearchAllAssetContexts \{off}
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
	if NOT GotParam \{pakname}
		return
	endif
	switch ($jumbotron_focus)
		case Guitarist
		FormatText checksumname = cameraparams '%s_cameras_guitarist' s = <pakname>
		case Bassist
		FormatText checksumname = cameraparams '%s_cameras_bassist' s = <pakname>
		case Vocalist
		FormatText checksumname = cameraparams '%s_cameras_singer' s = <pakname>
		case Drummer
		FormatText checksumname = cameraparams '%s_cameras_drummer' s = <pakname>
		default
		FormatText checksumname = cameraparams '%s_cameras_closeups' s = <pakname>
	endswitch
	if NOT GlobalExists name = <cameraparams>
		FormatText checksumname = cameraparams '%s_cameras_singer' s = <pakname>
		if NOT GlobalExists name = <cameraparams>
			printf \{qs(0x78c7dc47)}
			return
		endif
	endif
	current_index = ($jumbotron_camera_index)
	GetArraySize ($jumbotron_camera_params)
	current_index = (<current_index> + 1)
	if (<current_index> = <array_size>)
		current_index = 0
	endif
	Change jumbotron_camera_index = <current_index>
	if ($debug_showcameraname = on)
		CameraCuts_UpdateDebugCameraName
	endif
	force_time = 5
	if StructureContains structure = (($jumbotron_camera_params) [<current_index>]) params
		params = {(($jumbotron_camera_params) [<current_index>].params) force_time = <force_time>}
	else
		params = {CamParams = (($jumbotron_camera_params) [<current_index>]) force_time = <force_time>}
	endif
	PlayIGCCam {
		name = <name>
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
	KillCamAnim name = <name>
	SetSearchAllAssetContexts
	DestroyViewportTextureOverride id = <viewport>
	SetSearchAllAssetContexts \{off}
	DestroyViewport id = <viewport>
	Change \{current_jumbotron = None}
endscript

script destroy_movie_viewport 
	destroy_visualizer
	destroy_jumbotron
	destroy_bandname_viewport
endscript

script create_visualizer_fx 
	if ScreenFX_FXInstanceExists viewport = <viewport> name = AV_Test0
		ScreenFX_ClearFXInstances {viewport = <viewport>}
	endif
	wait \{1
		gameframe}
	ScreenFX_AddFXInstance {
		viewport = <viewport>
		name = AV_Test0
		scefName = AV_Test0
		type = AudioVisualize
		on = 1
		primitives = $green_line_primitives
	}
endscript
preset_redstreak = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.25)
		Color = [
			104
			64
			224
			255
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		length = 1.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 100
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.0, -0.95)
		Color = [
			244
			74
			184
			255
		]
		BlendMode = blend
	}
]
green_line_primitives = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.0)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = line
		Color = [
			250
			200
			50
			255
		]
		Pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = log10
				DeformScale = 20
			}
		]
	}
	{
		type = line
		Color = [
			250
			100
			50
			255
		]
		Pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = sinLog10
				DeformScale = 20
			}
		]
	}
	{
		type = line
		Color = [
			250
			200
			250
			255
		]
		Pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = sinLog10
				DeformScale = 0
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.2, 1.2)
		Color = [
			100
			100
			110
			160
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (1.5, 1.0)
		Color = [
			110
			100
			100
			118
		]
		BlendMode = sub
	}
]
visualizer_viewport_params = {
	viewport = visualizer_viewport
	textureassets = [
		`tex\zones\Z_visualizer\OG_visualizer.dds`
	]
	style = visualizer_rendering
	name = visualizer_cam
}
current_visualizer = None
current_visualizer_2D = true
use_60fps_visualizer = true

script create_visualizer_screen_element \{z_priority = -500}
	destroy_visualizer_screen_element
	printf \{qs(0xb017b3a1)}
	SetSpecificRenderTargetHeap \{heap_jam_vram}
	CreateScreenElement {
		parent = root_window
		type = viewportelement
		id = fullscreen_visualizer_viewport
		texture = fullscreen_visualizer
		viewport_priority = 1
		Pos = (0.0, 0.0)
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
	SetSpecificRenderTargetHeap
endscript

script destroy_visualizer_screen_element 
	printf \{qs(0x6844cee7)}
	if ScreenElementExists \{id = fullscreen_visualizer_viewport}
		DestroyScreenElement \{id = fullscreen_visualizer_viewport}
	endif
endscript

script create_visualizer 
	printf \{qs(0xce94757f)}
	GetPakManCurrent \{map = zones}
	if NOT ArrayContains array = ($venues_requiring_visualizer) contains = <pak>
		destroy_visualizer
		return
	endif
	Change \{visualizer_events_enabled = true}
	visualizer = visualizer_viewport_params
	if NOT GlobalExists name = <visualizer>
		return
	endif
	destroy_visualizer_screen_element
	if (<pak> = Z_Visualizer)
		if ($use_60fps_visualizer = true)
			create_visualizer_screen_element
		endif
	endif
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = fx_func 'create_visualizer_fx_2D_%s' s = <pakname>
	if ScriptExists <fx_func>
		<fx_func> viewport = bg_viewport
		Change current_visualizer = $<visualizer>
		Change \{current_visualizer_2D = true}
		return
	endif
	printstruct <...>
	AddParams ($<visualizer>)
	FormatText checksumname = texdict 'zones/%s/%t.tex' s = <pakname> t = <pakname>
	FormatText checksumname = zone_context '%t' t = <pakname>
	PushAssetContext context = <zone_context>
	if NOT IsAssetLoaded name = <texdict>
		printf \{'Zone texdict not found for visualizer'}
		PopAssetContext
		return
	endif
	found = 0
	GetArraySize <textureassets>
	index = 0
	begin
	if IsTextureInDictionary dictionary = <texdict> texture = (<textureassets> [<index>])
		textureasset = (<textureassets> [<index>])
		found = 1
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	if (<found> = 0)
		printf 'Nowhere to put visualizer in %s' s = <pakname>
		PopAssetContext
		return
	endif
	PopAssetContext
	Change current_visualizer = $<visualizer>
	Change \{current_visualizer_2D = false}
	printf \{qs(0x998e9bb6)}
	CreateViewport {
		Priority = 20
		id = <viewport>
		style = <style>
		use_lod_shader = true
		framerate = 60
		framemask = 3
	}
	FormatText checksumname = fx_func 'create_visualizer_fx_%s' s = <pakname>
	if ScriptExists <fx_func>
		<fx_func> <...>
	else
		create_visualizer_fx <...>
	endif
	GetPakManCurrent \{map = zones}
	switch <pak>
		case Z_Visualizer
		if ($use_60fps_visualizer = true)
			viewport = fullscreen_visualizer_viewport
		else
			viewport = bg_viewport
		endif
		default
		viewport = visualizer_viewport
	endswitch
	printf \{qs(0xe77df91d)}
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		id = <viewport>
		viewportid = <viewport>
		texture = <textureasset>
		texdict = <texdict>
	}
	SetSearchAllAssetContexts \{off}
	create_extra_visualizers viewport = <viewport>
	printf \{qs(0xabb3099e)}
endscript

script destroy_visualizer 
	printf \{qs(0xee9d3d60)}
	if ScreenElementExists \{id = fullscreen_visualizer_viewport}
		DestroyScreenElement \{id = fullscreen_visualizer_viewport}
	endif
	visualizer = $current_visualizer
	if (<visualizer> = None)
		return
	endif
	if ($current_visualizer_2D = false)
		AddParams (<visualizer>)
		KillCamAnim name = <name>
		SetSearchAllAssetContexts
		DestroyViewportTextureOverride id = <viewport>
		destroy_extra_visualizers id = <viewport>
		SetSearchAllAssetContexts \{off}
		DestroyViewport id = <viewport>
	else
		viewport = bg_viewport
		if ScreenFX_FXInstanceExists viewport = <viewport> name = AV_Test0
			ScreenFX_ClearFXInstances {viewport = <viewport>}
		endif
	endif
	Change \{current_visualizer = None}
endscript
extra_visualizer_params = {
	textureassets = [
		`tex\zones\Z_visualizer\OG_visualizer.dds`
	]
	texdicts = [
		`models/car_instruments/guitar/schecter/gtr1_sch_tempest.tex`
	]
}
extra_visualizers = 0

script create_extra_visualizers 
	GetArraySize ($extra_visualizer_params.textureassets)
	asset_index = 0
	begin
	switch <asset_index>
		case 0
		PushAssetContext \{context = heap_musician1}
		case 1
		PushAssetContext \{context = heap_musician2}
		case 2
		PushAssetContext \{context = heap_musician3}
		case 3
		PushAssetContext \{context = heap_musician4}
		case 4
		return
	endswitch
	asset_index = (<asset_index> + 1)
	index = 0
	begin
	found = 1
	texdict = ($extra_visualizer_params.texdicts [<index>])
	textureasset = ($extra_visualizer_params.textureassets [<index>])
	if NOT IsAssetLoaded name = <texdict>
		printf 'texdict %s not found for visualizer (this is normal)' s = <texdict>
		found = 0
	else
		if NOT IsTextureInDictionary dictionary = <texdict> texture = <textureasset>
			printf 'texture %s not found for visualizer (this is normal)' s = <texdict>
			found = 0
		endif
	endif
	if (<found> = 1)
		printf \{qs(0xe77df91d)}
		SetSearchAllAssetContexts
		CreateViewportTextureOverride {
			id = <viewport>
			viewportid = <viewport>
			texture = <textureasset>
			texdict = <texdict>
		}
		SetSearchAllAssetContexts \{off}
	endif
	Change extra_visualizers = ($extra_visualizers + 1)
	index = (<index> + 1)
	repeat <array_size>
	PopAssetContext
	repeat
endscript

script destroy_extra_visualizers 
	begin
	if ($extra_visualizers = 0)
		break
	endif
	SetSearchAllAssetContexts
	DestroyViewportTextureOverride id = <id>
	SetSearchAllAssetContexts \{off}
	Change extra_visualizers = ($extra_visualizers - 1)
	repeat
endscript
Visualizer_Current_Bank = None

script Select_Visualizer_Bank 
	printf \{qs(0xacc307f1)}
	Change \{Visualizer_Current_Bank = None}
	GMan_SongTool_GetCurrentSong
	get_song_struct song = <current_song>
	if StructureContains structure = <song_struct> name = genre
		genre = (<song_struct>.genre)
		printf qs(0x08a33eef) a = <genre>
	else
		printf \{qs(0x450314b9)}
		genre = rock
	endif
	bank_choices = []
	include_globals = true
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = venue_banks '%s_visualizer_banks' s = <pakname> AddToStringLookup = true
	if GlobalExists name = <venue_banks> type = structure
		if StructureContains structure = $<venue_banks> name = include_global_banks
			include_globals = ($<venue_banks>.include_global_banks)
		endif
		if StructureContains structure = $<venue_banks> name = <genre>
			bank_array = ($<venue_banks>.<genre>)
			GetArraySize <bank_array>
			if (<array_size> > 0)
				index = 0
				begin
				next_choice = (<bank_array> [<index>])
				if NOT ArrayContains array = <bank_choices> contains = <next_choice>
					AddArrayElement array = <bank_choices> element = <next_choice>
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
		if GlobalExists \{name = Global_Visualizer_Banks
				type = structure}
			if StructureContains structure = $Global_Visualizer_Banks name = <genre>
				bank_array = ($Global_Visualizer_Banks.<genre>)
			else
				printf \{channel = marc
					qs(0xa9faa7ae)}
				bank_array = ($Global_Visualizer_Banks.rock)
			endif
			GetArraySize <bank_array>
			if (<array_size> > 0)
				index = 0
				begin
				next_choice = (<bank_array> [<index>])
				if NOT ArrayContains array = <bank_choices> contains = <next_choice>
					AddArrayElement array = <bank_choices> element = <next_choice>
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
	GetArraySize <bank_choices>
	if (<array_size> > 0)
		GetRandomValue name = index integer a = 0 b = (<array_size> -1)
		Change Visualizer_Current_Bank = (<bank_choices> [<index>])
		printf \{channel = visualizer
			qs(0x62adea7f)
			a = $Visualizer_Current_Bank}
	else
		ScriptAssert qs(0x946656bc) a = <genre> b = <pakname>
	endif
endscript
visualizer_events_enabled = true

script Visualizer_Event 
	if ($visualizer_events_enabled = false)
		return
	endif
	if ($Visualizer_Current_Bank = None)
		return
	endif
	GetPakManCurrent \{map = zones}
	switch <pak>
		case Z_Visualizer
		if ($use_60fps_visualizer = true)
			viewport = fullscreen_visualizer_viewport
		else
			viewport = bg_viewport
		endif
		default
		viewport = visualizer_viewport
	endswitch
	if NOT ViewportExists id = <viewport>
		printf channel = visualizer qs(0x18bb9e0b) a = <viewport>
		return
	endif
	if NOT GlobalExists \{name = $Visualizer_Current_Bank
			type = structure}
		printf \{channel = visualizer
			qs(0xfe945df2)
			a = $Visualizer_Current_Bank}
		return
	endif
	LightShow_GetParams
	current_bank = $Visualizer_Current_Bank
	av_presets = ($<current_bank>.<mood>)
	if GotParam \{av_presets}
		GetArraySize \{av_presets}
		i = RandomInteger (-1.0, 1.0)
		begin
		i = (<i> + 1)
		if (<i> >= <array_size>)
			i = 0
		endif
		<value> = (<av_presets> [<i>])
		if IsArray <value>
			Create_AVFX primitives = <value> viewport = <viewport>
		else
			Create_AVFX Profile = <value> viewport = <viewport>
		endif
		LightShow_WaitForNextEvent \{events = [
				snapshotchange
			]}
		repeat
	else
		printf qs(0xc93be3cb) a = <mood> b = $Visualizer_Current_Bank DoNoResolve
	endif
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
endscript
magazine_picture_props = [
	{
		num_players = 1
		band_members = [
			Vocalist
		]
		Anims = [
			s_winposes01
		]
		no_suffix = 1
	}
	{
		num_players = 1
		band_members = [
			Bassist
		]
		Anims = [
			b_winposes01
		]
		no_suffix = 1
	}
	{
		num_players = 1
		band_members = [
			Drummer
		]
		Anims = [
			d_winposes01
		]
		no_suffix = 1
	}
	{
		num_players = 1
		band_members = [
			Guitarist
		]
		Anims = [
			g_winposes01
		]
		no_suffix = 1
	}
	{
		num_players = 2
		band_members = [
			Vocalist
			Bassist
		]
		Anims = [
			sb_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			Vocalist
			Guitarist
		]
		Anims = [
			sg_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			Vocalist
			Drummer
		]
		Anims = [
			sd_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			Guitarist
			Bassist
		]
		Anims = [
			gb_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			Guitarist
			Drummer
		]
		Anims = [
			gd_winposes01
		]
	}
	{
		num_players = 2
		band_members = [
			Bassist
			Drummer
		]
		Anims = [
			bd_winposes01
		]
	}
	{
		num_players = 3
		band_members = [
			Vocalist
			Drummer
			Guitarist
		]
		Anims = [
			sdg_winposes01
		]
	}
	{
		num_players = 3
		band_members = [
			Vocalist
			Drummer
			Bassist
		]
		Anims = [
			sdb_winposes01
		]
	}
	{
		num_players = 3
		band_members = [
			Vocalist
			Guitarist
			Bassist
		]
		Anims = [
			sgb_winposes01
		]
	}
	{
		num_players = 3
		band_members = [
			Drummer
			Guitarist
			Bassist
		]
		Anims = [
			dgb_winposes01
		]
	}
	{
		num_players = 4
		band_members = [
			Vocalist
			Guitarist
			Bassist
			Drummer
		]
		Anims = [
			sgbd_winposes01
		]
	}
]

script grab_magazine_viewport \{select_index = -1}
	printf \{qs(0x90aa5f6b)}
	GetArraySize ($magazine_picture_props)
	GetNextPlayers
	magazine_size = <array_size>
	index = 0
	begin
	if ($magazine_picture_props [<index>].num_players = <num_players>)
		GetArraySize ($magazine_picture_props [<index>].band_members)
		invalid = 0
		member_index = 0
		begin
		found = 0
		GetNumPlayersInGame
		if (<num_players> > 0)
			GetFirstPlayer
			begin
			GetPlayerInfo <player> band_member
			if (<band_member> = ($magazine_picture_props [<index>].band_members [<member_index>]))
				found = 1
			endif
			GetNextPlayer player = <player>
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
	AddParams ($magazine_picture_props [<index>])
	GetArraySize <Anims>
	GetRandomValue name = rand_index integer a = 0 b = (<array_size> - 1)
	anim = (<Anims> [<rand_index>])
	printf qs(0xcb15e5e4) i = <anim>
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
			case Bassist
			suffix = '_b'
			case Vocalist
			suffix = '_s'
			case Guitarist
			default
			suffix = '_g'
		endswitch
	endif
	if CompositeObjectExists name = <band_member>
		ExtendCrc <anim> <suffix> out = anim_name
		target_params = {}
		if (<band_member> = Drummer)
			target_params = {target = moment_branch}
		endif
		<band_member> :unhide
		<band_member> :GameObj_PlayAnim anim = <anim_name> BlendDuration = 0 <target_params>
		<band_member> :Ragdoll_MarkForReset
		Band_MoveToNode name = <band_member> node = 'vocalist_start'
	endif
	member_index = (<member_index> + 1)
	repeat <array_size>
	ExtendCrc <anim> '_c01' out = camera_anim_name
	lock_target = vocalist_mocap_lock_target_01
	<lock_target> :GameObj_PlayAnim anim = <camera_anim_name> BlendDuration = 0
	AddParams ($magazine_viewport_props)
	if (<select_index> != -1)
		if NOT ScreenElementExists \{id = magazine_element}
			CreateScreenElement {
				parent = root_window
				just = [center center]
				type = SpriteElement
				id = magazine_element
				texture = <texture>
				Pos = (200.0, 200.0)
				dims = (200.0, 200.0)
				alpha = 1
			}
		endif
	endif
	PlayIGCCam {
		name = <Camera>
		viewport = <viewport>
		LockTo = <lock_target>
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
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
	UnpauseGame
	wait \{10
		gameframes}
	PauseGame
	BandManager_Enabled
	unhide_band
	if (<select_index> != -1)
		fadetoblack \{off
			time = 0}
	endif
endscript

script destroy_magazine_viewport 
	printf \{qs(0x73bd28bb)}
	AddParams ($magazine_viewport_props)
	if ViewportExists id = <viewport>
		DestroyViewport id = <viewport>
		DestroyViewportTextureOverride id = <texoverride>
		KillCamAnim name = <Camera>
	endif
	if ScreenElementExists \{id = magazine_element}
		DestroyScreenElement \{id = magazine_element}
	endif
endscript
current_bandname_viewport = None
bandname_viewport_params = {
	viewport = bandname_viewport
	textureasset = `tex\zones\Z_Band_Logo\RMM_band_name.dds`
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
	fit_width = `scale	each	line	if	larger`
	fit_height = `scale	to	fit`
	scale_mode = proportional
}

script get_bandname_viewport_text 
	band_name = qs(0x03ac90f0)
	get_current_band_name savegame = <savegame>
	StringRemoveTrailingWhitespace string = <band_name>
	if (<new_string> = qs(0x03ac90f0))
		new_string = qs(0x945d0d09)
	endif
	text_alpha = 1.0
	sprite_alpha = 0.0
	sprite_texture = circle
	GameMode_GetType
	if (<type> = career)
		GMan_SongFunc \{func = get_current_song}
		switch (<current_song>)
			case PictureToBurn
			case YouBelongWithMe
			get_song_title song = <current_song>
			new_string = <song_title>
			case DontSpeak
			text_alpha = 0.0
			sprite_alpha = 1.0
			sprite_texture = `tex\zones\z_Awardshow\RMM_Dont_Speak_logo.dds`
		endswitch
	endif
	return {
		band_name_text_string = <new_string>
		band_name_text_alpha = <text_alpha>
		band_name_sprite_alpha = <sprite_alpha>
		band_name_sprite_texture = <sprite_texture>
	}
endscript

script create_perm_bandname_viewport 
	AddParams ($bandname_viewport_params)
	CreateViewport {
		Priority = 19
		id = <viewport>
		style = <style>
		has_ui = true
		has_ui_only = true
		no_resolve_depthstencilbuffer = true
	}
	SetViewportProperties viewport = <viewport> active = false
endscript

script create_perm_bandname_viewport_texture_override 
	AddParams ($bandname_viewport_params)
	CreateViewportTextureOverride {
		id = perm_bandname_visualizer_map
		viewportid = <viewport>
		texture = <textureasset>
		texdict = `pak/global_model_tex/global_model_tex.tex`
	}
endscript

script create_bandname_viewport 
	printf \{qs(0xd70bc7ea)}
	GetPakManCurrentName \{map = zones}
	bandname = bandname_viewport_params
	if NOT GlobalExists name = <bandname>
		return
	endif
	AddParams ($<bandname>)
	Change current_bandname_viewport = $<bandname>
	SetViewportProperties viewport = <viewport> active = true
	CreateScreenElement {
		type = WindowElement
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
	FormatText checksumname = zone_params '%s_Band_Name' s = <pakname>
	if GlobalExists name = <zone_params> type = structure
		printf qs(0x5ab17156) s = <pakname>
		text_params = ($<zone_params>)
	else
		printf qs(0x3dca7ef6) s = <pakname>
	endif
	CreateScreenElement {
		type = TextBlockElement
		Pos = (256.0, 64.0)
		dims = (510.0, 254.0)
		parent = <window_id>
		id = bandname_textelement
		z_priority = 1.0
		<text_params>
		text = <band_name_text_string>
		alpha = <band_name_text_alpha>
	}
	CreateScreenElement {
		type = SpriteElement
		Pos = (256.0, 64.0)
		dims = (128.0, 128.0)
		parent = <window_id>
		id = bandname_spriteelement
		z_priority = 1.0
		alpha = <band_name_sprite_alpha>
		texture = <band_name_sprite_texture>
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
		FormatText checksumname = id 'bandnameviewport%i' i = <index>
		printf qs(0xe4efc709) s = <id>
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
	spawnscriptnow bandname_viewport_disabler params = {viewport = <viewport>}
	printf \{qs(0x8e81aa5a)}
endscript

script bandname_viewport_disabler 
	SetScriptCannotPause
	wait \{2
		gameframes}
	begin
	if RenderingEnabled
		break
	endif
	wait \{1
		gameframe}
	repeat
	printf 'Waiting to disable viewport %v' v = <viewport>
	wait \{10
		gameframes}
	printf 'Disabling viewport %v' v = <viewport>
	if ViewportExists id = <viewport>
		SetViewportProperties viewport = <viewport> active = false
	else
		ScriptAssert \{qs(0xc30cc5d3)}
	endif
endscript

script destroy_bandname_viewport 
	printscriptinfo \{qs(0x6415d050)}
	killspawnedscript \{name = bandname_viewport_disabler}
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
	SetViewportProperties viewport = <viewport> active = false
	if ScreenElementExists id = <window_id>
		DestroyScreenElement id = <window_id>
	endif
	Change \{current_bandname_viewport = None}
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
	Menu_Music_Off
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	mark_unsafe_for_shutdown
	if NOT GotParam \{noblack}
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = -10}
	endif
	KillAllMovies
	destroy_bink_sub_heaps
	printf qs(0x23871deb) s = <movie>
	PlayMovie {
		TextureSlot = 0
		TexturePri = 1000
		no_looping
		no_hold
		<...>
	}
	if GotParam \{noskip}
		event_handlers = []
	else
		event_handlers = [
			{pad_start EndMovie}
			{pad_choose EndMovie}
		]
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = root_window
		id = movie_handler
		event_handlers = <event_handlers>
	}
	LaunchEvent \{type = focus
		target = movie_handler}
	if NOT GotParam \{no_script_wait}
		WaitForMovie
	endif
endscript

script WaitForMovie 
	begin
	if IsMovieUnloaded \{TextureSlot = 0}
		break
	endif
	if ($paused_for_hardware = 1)
		break
	endif
	wait \{1
		gameframes}
	repeat
	EndMovie
	begin
	if NOT ScreenElementExists \{id = movie_handler}
		break
	endif
	wait \{1
		gameframe}
	repeat
	menu_music_on
	if NOT GotParam \{noblack}
		printf qs(0x27e8073d) s = <movie>
		fadetoblack \{off
			time = 0}
	endif
	mark_safe_for_shutdown
endscript

script WaitForMovie_EndCredits 
	begin
	if IsMovieUnloaded \{TextureSlot = 0}
		break
	endif
	if ($paused_for_hardware = 1)
		PauseFullScreenMovie
		begin
		if ($paused_for_hardware = 0)
			UnPauseFullScreenMovie
			break
		endif
		wait \{1
			gameframes}
		repeat
	endif
	wait \{1
		gameframes}
	repeat
	EndMovie
	begin
	if NOT ScreenElementExists \{id = movie_handler}
		break
	endif
	wait \{1
		gameframe}
	repeat
	menu_music_on
	if NOT GotParam \{noblack}
		printf qs(0x27e8073d) s = <movie>
		fadetoblack \{off
			time = 0}
	endif
	mark_safe_for_shutdown
endscript

script EndMovie \{Slot = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = movie_handler}
		LaunchEvent \{type = unfocus
			target = movie_handler}
	endif
	FinalPrintf \{'EndMovie called'}
	if IsMoviePlaying TextureSlot = <Slot>
		FinalPrintf \{'EndMovie calling KillMovie'}
		KillMovie TextureSlot = <Slot> <...>
		FinalPrintf \{'EndMovie done KillMovie'}
	endif
	if GotParam \{nowait}
		BlockForAllMovieUnloads
	endif
	FinalPrintf \{'create_bink_sub_heaps calling'}
	create_bink_sub_heaps
	FinalPrintf \{'create_bink_sub_heaps called'}
	if ScreenElementExists \{id = movie_handler}
		movie_handler :Die
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
	AddParams ($ui_visualizer_viewport_params)
	textureasset = (<textureassets> [0])
	CreateViewport {
		Priority = 20
		id = <viewport>
		style = <style>
		use_lod_shader = true
		framerate = 60
		framemask = 3
	}
	SetViewportProperties viewport = <viewport> active = false
endscript

script create_ui_visualizer_viewport_texture_override 
	AddParams ($ui_visualizer_viewport_params)
	textureasset = (<textureassets> [0])
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		id = <viewport>
		viewportid = <viewport>
		texture = <textureasset>
	}
	SetSearchAllAssetContexts \{off}
endscript

script create_ui_visualizer_fx 
	RequireParams \{[
			preset
		]
		all}
	AddParams ($ui_visualizer_viewport_params)
	clear_ui_visualizer
	enable_ui_visualizer
	if IsArray ($<preset>)
		Create_AVUI_FX primitives = ($<preset>) viewport = <viewport> id = <effectname>
	else
		Create_AVUI_FX Profile = ($<preset>) viewport = <viewport> id = <effectname>
	endif
endscript

script enable_ui_visualizer 
	AddParams ($ui_visualizer_viewport_params)
	if ViewportExists \{id = ui_visualizer_viewport}
		SetViewportProperties \{viewport = ui_visualizer_viewport
			active = true}
	endif
endscript

script disable_ui_visualizer 
	AddParams ($ui_visualizer_viewport_params)
	if ViewportExists id = <viewport>
		SetViewportProperties viewport = <viewport> active = false
	endif
endscript

script clear_ui_visualizer 
	disable_ui_visualizer
	AddParams ($ui_visualizer_viewport_params)
	if ViewportExists id = <viewport>
		ScreenFX_ClearFXInstances viewport = <viewport>
	endif
endscript
