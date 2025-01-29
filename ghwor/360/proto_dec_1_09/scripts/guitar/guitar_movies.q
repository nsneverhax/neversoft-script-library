default_ui_visualizer_preset = og_cloud_rays_b
venues_requiring_visualizer = [
	z_epicstage
	0xfe210f9d
	z_demons
	z_punkstage
	z_riothouse
	z_mansionstudio
	z_egypt
	z_festival
	z_modular
	z_finalbattle
	z_credits
	z_cube
	z_visualizer
	z_subway
	0x91d841d7
	0xc7a3be9a
]

script create_movie_viewport 
	create_visualizer
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
	createviewport {
		Priority = 6
		id = <viewport>
		style = <style>
		jiggle_rendering = 2
		use_lod_shader = true
	}
	Change jumbotron_camera_params = $<cameraparams>
	Change \{jumbotron_camera_index = 0}
	jumbotron_camera_startcallback <...>
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		id = <viewport>
		viewportid = <viewport>
		texture = <textureasset>
		texdict = <texdict>
	}
	SetSearchAllAssetContexts \{OFF}
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
		case GUITARIST
		formatText checksumName = cameraparams '%s_cameras_guitarist' s = <pakname>
		case BASSIST
		formatText checksumName = cameraparams '%s_cameras_bassist' s = <pakname>
		case vocalist
		formatText checksumName = cameraparams '%s_cameras_singer' s = <pakname>
		case drummer
		formatText checksumName = cameraparams '%s_cameras_drummer' s = <pakname>
		default
		formatText checksumName = cameraparams '%s_cameras_closeups' s = <pakname>
	endswitch
	if NOT GlobalExists Name = <cameraparams>
		formatText checksumName = cameraparams '%s_cameras_singer' s = <pakname>
		if NOT GlobalExists Name = <cameraparams>
			printf \{qs(0x78c7dc47)}
			return
		endif
	endif
	current_index = ($jumbotron_camera_index)
	GetArraySize ($jumbotron_camera_params)
	current_index = (<current_index> + 1)
	if (<current_index> = <array_Size>)
		current_index = 0
	endif
	Change jumbotron_camera_index = <current_index>
	if ($debug_show_camera_name = 1)
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
	destroy_visualizer
	destroy_jumbotron
	destroy_bandname_viewport
endscript

script create_visualizer_fx 
	if screenFX_FXInstanceExists viewport = <viewport> Name = av_test0
		ScreenFX_ClearFXInstances {viewport = <viewport>}
	endif
	Wait \{1
		gameframe}
	ScreenFX_AddFXInstance {
		viewport = <viewport>
		Name = av_test0
		scefName = av_test0
		Type = audiovisualize
		On = 1
		primitives = $green_line_primitives
	}
endscript
preset_redstreak = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.25)
		Color = [
			104
			64
			224
			255
		]
		BlendMode = blend
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		length = 1.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 100
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.0, -0.95)
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
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.0)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = line
		Color = [
			250
			200
			50
			255
		]
		Pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = log10
				deformscale = 20
			}
		]
	}
	{
		Type = line
		Color = [
			250
			100
			50
			255
		]
		Pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 20
			}
		]
	}
	{
		Type = line
		Color = [
			250
			200
			250
			255
		]
		Pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 0
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.2, 1.2)
		Color = [
			100
			100
			110
			160
		]
		BlendMode = add
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (1.5, 1.0)
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
		`tex\zones\z_visualizer\og_visualizer.dds`
	]
	style = visualizer_rendering
	Name = visualizer_cam
}
current_visualizer = None
current_visualizer_2d = true
use_60fps_visualizer = true

script create_visualizer_screen_element \{z_priority = -500}
	destroy_visualizer_screen_element
	setspecificrendertargetheap \{heap_jam_vram}
	CreateScreenElement {
		parent = root_window
		Type = ViewportElement
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
	setspecificrendertargetheap
endscript

script destroy_visualizer_screen_element 
	if ScreenElementExists \{id = fullscreen_visualizer_viewport}
		DestroyScreenElement \{id = fullscreen_visualizer_viewport}
	endif
endscript

script create_visualizer 
	GetPakManCurrent \{map = zones}
	if NOT ArrayContains array = ($venues_requiring_visualizer) contains = <pak>
		destroy_visualizer
		return
	endif
	Change \{visualizer_events_enabled = true}
	visualizer = visualizer_viewport_params
	if NOT GlobalExists Name = <visualizer>
		return
	endif
	destroy_visualizer_screen_element
	if (<pak> = z_visualizer)
		if ($use_60fps_visualizer = true)
			create_visualizer_screen_element
		endif
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = fx_func 'create_visualizer_fx_2D_%s' s = <pakname>
	if ScriptExists <fx_func>
		<fx_func> viewport = bg_viewport
		Change current_visualizer = $<visualizer>
		Change \{current_visualizer_2d = true}
		return
	endif
	AddParams ($<visualizer>)
	formatText checksumName = texdict 'zones/%s/%t.tex' s = <pakname> t = <pakname>
	formatText checksumName = zone_context '%t' t = <pakname>
	PushAssetContext context = <zone_context>
	if NOT isassetloaded Name = <texdict>
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
	repeat <array_Size>
	if (<found> = 0)
		printf 'Nowhere to put visualizer in %s' s = <pakname>
		PopAssetContext
		return
	endif
	PopAssetContext
	Change current_visualizer = $<visualizer>
	Change \{current_visualizer_2d = FALSE}
	createviewport {
		Priority = 20
		id = <viewport>
		style = <style>
		use_lod_shader = true
		framerate = 60
		framemask = 3
	}
	formatText checksumName = fx_func 'create_visualizer_fx_%s' s = <pakname>
	if ScriptExists <fx_func>
		<fx_func> <...>
	else
		create_visualizer_fx <...>
	endif
	GetPakManCurrent \{map = zones}
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
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		id = <viewport>
		viewportid = <viewport>
		texture = <textureasset>
		texdict = <texdict>
	}
	SetSearchAllAssetContexts \{OFF}
	create_extra_visualizers viewport = <viewport>
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
	if ($current_visualizer_2d = FALSE)
		AddParams (<visualizer>)
		KillCamAnim Name = <Name>
		SetSearchAllAssetContexts
		DestroyViewportTextureOverride id = <viewport>
		destroy_extra_visualizers id = <viewport>
		SetSearchAllAssetContexts \{OFF}
		DestroyViewport id = <viewport>
	else
		viewport = bg_viewport
		if screenFX_FXInstanceExists viewport = <viewport> Name = av_test0
			ScreenFX_ClearFXInstances {viewport = <viewport>}
		endif
	endif
	Change \{current_visualizer = None}
endscript
extra_visualizer_params = {
	textureassets = [
		`tex\zones\z_visualizer\og_visualizer.dds`
		`tex\zones\z_visualizer\og_visualizer.dds`
	]
	texdicts = [
		`models/car_instruments/guitar/schecter/gtr1_sch_tempest.tex`
		`models/venues/egypt/skin_sarcophagus.tex`
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
	if NOT isassetloaded Name = <texdict>
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
		SetSearchAllAssetContexts \{OFF}
	endif
	Change extra_visualizers = ($extra_visualizers + 1)
	index = (<index> + 1)
	repeat <array_Size>
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
	SetSearchAllAssetContexts \{OFF}
	Change extra_visualizers = ($extra_visualizers - 1)
	repeat
endscript
visualizer_current_bank = None
g_current_visualizer_intensity = 1
g_current_visualizer_color = [
	0
	0
	0
	0
]

script select_visualizer_bank 
	Change \{visualizer_current_bank = None}
	playlist_getcurrentsong
	get_song_struct song = <current_song>
	if StructureContains structure = <song_struct> Name = genre
		genre = (<song_struct>.genre)
	else
		genre = rock
	endif
	bank_choices = []
	include_globals = true
	GetPakManCurrentName \{map = zones}
	formatText checksumName = venue_banks '%s_visualizer_banks' s = <pakname> AddToStringLookup = true
	if GlobalExists Name = <venue_banks> Type = structure
		if StructureContains structure = $<venue_banks> Name = include_global_banks
			include_globals = ($<venue_banks>.include_global_banks)
		endif
		if StructureContains structure = $<venue_banks> Name = <genre>
			bank_array = ($<venue_banks>.<genre>)
			GetArraySize <bank_array>
			if (<array_Size> > 0)
				index = 0
				begin
				next_choice = (<bank_array> [<index>])
				if NOT ArrayContains array = <bank_choices> contains = <next_choice>
					AddArrayElement array = <bank_choices> element = <next_choice>
					bank_choices = <array>
				endif
				index = (<index> + 1)
				repeat <array_Size>
			endif
		else
			include_globals = true
		endif
	else
	endif
	if (<include_globals> = true)
		if GlobalExists \{Name = global_visualizer_banks
				Type = structure}
			if StructureContains structure = $global_visualizer_banks Name = <genre>
				bank_array = ($global_visualizer_banks.<genre>)
			else
				bank_array = ($global_visualizer_banks.rock)
			endif
			GetArraySize <bank_array>
			if (<array_Size> > 0)
				index = 0
				begin
				next_choice = (<bank_array> [<index>])
				if NOT ArrayContains array = <bank_choices> contains = <next_choice>
					AddArrayElement array = <bank_choices> element = <next_choice>
					bank_choices = <array>
				endif
				index = (<index> + 1)
				repeat <array_Size>
			endif
		endif
	else
	endif
	GetArraySize <bank_choices>
	if (<array_Size> > 0)
		GetRandomValue Name = index integer a = 0 b = (<array_Size> -1)
		Change visualizer_current_bank = (<bank_choices> [<index>])
	else
		ScriptAssert qs(0x946656bc) a = <genre> b = <pakname>
	endif
endscript

script set_visualizer \{Intensity = 0
		Color = [
			0
			0
			0
			0
		]
		Name = None}
	if (<Intensity> != 0)
		Change \{visualizer_current_bank = intensity_visualizer_bank}
		Change g_current_visualizer_intensity = <Intensity>
	elseif (((<Color> [0]) != 0) || ((<Color> [1]) != 0) || ((<Color> [2]) != 0))
		Change \{visualizer_current_bank = colorswap_visualizer_bank}
		Change g_current_visualizer_color = <Color>
	elseif (<Name> != None)
		Change visualizer_current_bank = <Name>
	endif
	LightShow_PassEvent \{event = visualizerchange}
endscript
visualizer_events_enabled = true

script visualizer_event 
	if ($visualizer_events_enabled = FALSE)
		return
	endif
	if ($visualizer_current_bank = None)
		return
	endif
	GetPakManCurrent \{map = zones}
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
	if NOT ViewportExists id = <viewport>
		printf channel = visualizer qs(0x18bb9e0b) a = <viewport>
		return
	endif
	if NOT GlobalExists \{Name = $visualizer_current_bank
			Type = structure}
		printf \{channel = visualizer
			qs(0xfe945df2)
			a = $visualizer_current_bank}
		return
	endif
	current_bank = $visualizer_current_bank
	i = RandomInteger (-1.0, 1.0)
	begin
	LightShow_GetParams
	prev_bank = <current_bank>
	current_bank = $visualizer_current_bank
	if (<current_bank> = intensity_visualizer_bank)
		Base = Intensity
		formatText \{TextName = intensity_num
			'%i'
			i = $g_current_visualizer_intensity}
		AppendSuffixToChecksum Base = <Base> SuffixString = <intensity_num>
		<av_presets> = ($<current_bank>.<appended_id>)
	elseif (<current_bank> = colorswap_visualizer_bank)
		<struct> = (($<current_bank>.Default) [0])
		<prims> = (<struct>.primitives)
		<prim> = (<prims> [0])
		<prim> = {<prim> Color = $g_current_visualizer_color}
		SetArrayElement ArrayName = prims index = 0 NewValue = <prim>
		<struct> = {<struct> primitives = <prims>}
		<av_presets> = []
		AddArrayElement array = <av_presets> element = <struct>
		<av_presets> = <array>
	else
		<av_presets> = ($<current_bank>.<mood>)
	endif
	if NOT GotParam \{av_presets}
		printf qs(0xc93be3cb) a = <mood> b = $visualizer_current_bank donoresolve
		break
	endif
	GetArraySize <av_presets>
	if (<current_bank> != <prev_bank>)
		<i> = RandomInteger (-1.0, 1.0)
	endif
	<i> = (<i> + 1)
	if (<i> >= <array_Size>)
		<i> = 0
	endif
	if IsArray (<av_presets> [<i>])
		create_avfx {primitives = (<av_presets> [<i>]) viewport = <viewport>}
	else
		create_avfx {Profile = (<av_presets> [<i>]) viewport = <viewport>}
	endif
	LightShow_WaitForNextEvent \{events = [
			snapshotchange
			visualizerchange
		]}
	lightshow_processnotelength length = <length>
	RemoveParameter \{av_presets}
	repeat
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
	getnextplayers
	magazine_size = <array_Size>
	index = 0
	begin
	if ($magazine_picture_props [<index>].num_players = <num_players>)
		GetArraySize ($magazine_picture_props [<index>].band_members)
		invalid = 0
		member_index = 0
		begin
		found = 0
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			getplayerinfo <Player> band_member
			if (<band_member> = ($magazine_picture_props [<index>].band_members [<member_index>]))
				found = 1
			endif
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
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
		<band_member> :obj_teleport
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
	bandmanager_enabled
	Unhide_Band
	if (<select_index> != -1)
		fadetoblack \{OFF
			time = 0}
	endif
endscript

script destroy_magazine_viewport 
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
	textureasset = `tex\zones\z_band_logo\rmm_band_name.dds`
	texdicts = [
		'zones/%s/%t.tex'
		'models/venues/recordstore/encore_bandart_skin.tex'
		'models/venues/recordstore/encore_record_skin.tex'
	]
	style = bandname_rendering
	Name = bandname_cam
	window_id = bandname_window
}
default_bandname_settings = {
	font = fontgrid_text_a1
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
	return band_name_text_string = <new_string>
endscript

script create_bandname_viewport 
	GetPakManCurrentName \{map = zones}
	bandname = bandname_viewport_params
	if NOT GlobalExists Name = <bandname>
		return
	endif
	AddParams ($<bandname>)
	Change current_bandname_viewport = $<bandname>
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
	if (($primary_controller) = -1)
		savegame = 0
	else
		get_savegame_from_controller controller = ($primary_controller)
	endif
	get_bandname_viewport_text savegame = <savegame>
	text_params = ($default_bandname_settings)
	formatText checksumName = zone_params '%s_Band_Name' s = <pakname>
	if GlobalExists Name = <zone_params> Type = structure
		printf qs(0x5ab17156) s = <pakname>
		text_params = ($<zone_params>)
	else
		printf qs(0x3dca7ef6) s = <pakname>
	endif
	CreateScreenElement {
		Type = TextBlockElement
		Pos = (256.0, 64.0)
		dims = (480.0, 104.0)
		parent = <window_id>
		id = bandname_textelement
		text = <band_name_text_string>
		z_priority = 1.0
		<text_params>
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
	SpawnScriptNow bandname_viewport_disabler params = {viewport = <viewport>}
endscript

script bandname_viewport_disabler 
	setscriptcannotpause
	Wait \{2
		gameframes}
	begin
	if RenderingEnabled
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Wait \{10
		gameframes}
	if ViewportExists id = <viewport>
		SetViewportProperties viewport = <viewport> Active = FALSE
	endif
endscript

script destroy_bandname_viewport 
	KillSpawnedScript \{Name = bandname_viewport_disabler}
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
	audio_ui_menu_music_off
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	pushunsafeforshutdown \{context = movie
		Type = checked}
	if NOT GotParam \{noblack}
		fadetoblack \{On
			time = 0
			alpha = 1.0
			z_priority = -10}
	endif
	killallmovies
	destroy_bink_sub_heaps
	printf qs(0x23871deb) s = <movie>
	PlayMovie {
		textureSlot = 0
		TexturePri = 1000
		no_looping
		no_hold
		<...>
	}
	if GotParam \{noskip}
		event_handlers = []
	else
		event_handlers = [
			{pad_start endmovie}
			{pad_choose endmovie}
		]
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = movie_handler
		event_handlers = <event_handlers>
	}
	LaunchEvent \{Type = focus
		target = movie_handler}
	if NOT GotParam \{no_script_wait}
		waitformovie
	endif
endscript

script waitformovie 
	begin
	if ismovieunloaded \{textureSlot = 0}
		break
	endif
	if ($paused_for_hardware = 1)
		break
	endif
	Wait \{1
		gameframes}
	repeat
	endmovie
	begin
	if NOT ScreenElementExists \{id = movie_handler}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	audio_ui_menu_music_on
	if NOT GotParam \{noblack}
		printf qs(0x27e8073d) s = <movie>
		fadetoblack \{OFF
			time = 0}
	endif
	popunsafeforshutdown \{context = movie
		Type = checked}
endscript

script waitformovie_endcredits 
	begin
	if ismovieunloaded \{textureSlot = 0}
		break
	endif
	if ($paused_for_hardware = 1)
		PauseFullScreenMovie
		begin
		if ($paused_for_hardware = 0)
			UnPauseFullScreenMovie
			break
		endif
		Wait \{1
			gameframes}
		repeat
	endif
	Wait \{1
		gameframes}
	repeat
	endmovie
	begin
	if NOT ScreenElementExists \{id = movie_handler}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	audio_ui_menu_music_on
	if NOT GotParam \{noblack}
		printf qs(0x27e8073d) s = <movie>
		fadetoblack \{OFF
			time = 0}
	endif
	popunsafeforshutdown \{context = movie
		Type = checked}
endscript

script endmovie \{slot = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = movie_handler}
		LaunchEvent \{Type = unfocus
			target = movie_handler}
	endif
	finalprintf \{'EndMovie called'}
	if IsMoviePlaying textureSlot = <slot>
		finalprintf \{'EndMovie calling KillMovie'}
		KillMovie textureSlot = <slot> <...>
		finalprintf \{'EndMovie done KillMovie'}
	endif
	if GotParam \{noWait}
		blockforallmovieunloads
	endif
	finalprintf \{'create_bink_sub_heaps calling'}
	create_bink_sub_heaps
	finalprintf \{'create_bink_sub_heaps called'}
	if ScreenElementExists \{id = movie_handler}
		movie_handler :Die
	endif
endscript

script maybe_create_ui_visualizer \{preset = nullchecksum}
	if (<preset> != nullchecksum)
		create_ui_visualizer preset = <preset>
	endif
endscript

script create_ui_visualizer preset = ($default_ui_visualizer_preset)
	create_ui_visualizer_viewport \{visualizer = ui_visualizer_viewport_params
		viewport = ui_visualizer_viewport}
	SpawnScriptNow create_ui_visualizer_fx params = {preset = ($<preset>)}
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
	if NOT GlobalExists Name = <visualizer>
		return
	endif
	AddParams ($<visualizer>)
	if ScreenElementExists id = <viewport>
		return
	endif
	if ViewportExists id = <viewport>
		return
	endif
	textureasset = (<textureassets> [0])
	createviewport {
		Priority = 20
		id = <viewport>
		style = <style>
		use_lod_shader = true
		framerate = 60
		framemask = 3
	}
	SetSearchAllAssetContexts
	if NOT CreateViewportTextureOverride {
			id = <viewport>
			viewportid = <viewport>
			texture = <textureasset>
		}
		ScriptAssert 'CreateViewportTextureOverride failed on %a %b' a = <viewport> b = <textureasset>
	endif
	SetSearchAllAssetContexts \{OFF}
	SetViewportProperties \{viewport = ui_visualizer_viewport
		Active = FALSE}
	return textureasset = <textureasset>
endscript

script create_ui_visualizer_fx 
	RequireParams \{[
			preset
		]
		all}
	AddParams ($ui_visualizer_viewport_params)
	clear_ui_visualizer viewport = <viewport>
	enable_ui_visualizer
	if IsArray <preset>
		create_avui_fx primitives = <preset> viewport = <viewport> id = <effectname>
	else
		create_avui_fx Profile = <preset> viewport = <viewport> id = <effectname>
	endif
endscript

script enable_ui_visualizer 
	if ViewportExists \{id = ui_visualizer_viewport}
		SetViewportProperties \{viewport = ui_visualizer_viewport
			Active = true}
	endif
endscript

script disable_ui_visualizer 
	if ViewportExists \{id = ui_visualizer_viewport}
		SetViewportProperties \{viewport = ui_visualizer_viewport
			Active = FALSE}
	endif
endscript

script destroy_ui_visualizer 
	if ScreenElementExists \{id = ui_vis_test_anchor}
		DestroyScreenElement \{id = ui_vis_test_anchor}
	endif
	if ScreenElementExists \{id = ui_vis_test}
		DestroyScreenElement \{id = ui_vis_test}
	endif
endscript

script clear_ui_visualizer 
	disable_ui_visualizer
	AddParams ($ui_visualizer_viewport_params)
	if ViewportExists id = <viewport>
		ScreenFX_ClearFXInstances viewport = <viewport>
	endif
endscript
