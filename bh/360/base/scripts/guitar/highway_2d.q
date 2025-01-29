highway_lines = 1152
real_highway_lines = 1024

script Set2DHighwaySpeed \{speed = -1.0}
	SetPlayerInfo <player> highway_speed = <speed>
	GetScreenElementProps id = <id> MaterialProps = [
		{name = m_velocityV}
	]
	oldspeed = <matx>
	GetScreenElementProps id = <id> MaterialProps = [
		{name = m_offsetV}
	]
	oldoffset = <matx>
	GetTimeValues
	offset = (<oldspeed> * <songtime> + <oldoffset> - <speed> * <songtime>)
	SetScreenElementProps id = <id> MaterialProps = [
		{name = m_velocityV property = <speed>}
		{name = m_offsetV property = <offset>}
		{name = m_width property = (($highway_pos_table [(<player> -1)]).widthOffsetFactor)}
		{name = m_tiling property = (($highway_pos_table [(<player> -1)]).gHighwayTiling)}
	]
	GetPlayerInfo <player> scroll_time
	GetPlayerInfo <player> gem_offset
	SetPlayerInfo <player> time_offset = (((<scroll_time> - $destroy_time) * 1000.0) + <gem_offset>)
endscript

script set_highway_speed \{player = 1}
	pos_table = ($highway_pos_table [(<player> -1)])
	GetPlayerInfo <player> scroll_time
	highway_speed = (0.0 - ((<pos_table>.gHighwayTiling) / (<scroll_time> - $destroy_time)))
	FormatText checksumname = highway_name 'Highway_2Dp%p' p = <player> AddToStringLookup = true
	Set2DHighwaySpeed speed = <highway_speed> id = <highway_name> player = <player>
endscript

script Set2DHighwayFade \{start = 720.0
		end = 100.0}
	SetScreenElementProps id = <id> MaterialProps = [
		{name = m_startFade property = <start>}
		{name = m_endFade property = <end>}
		{name = m_playerIndex property = <player>}
	]
endscript

script Set2DGemFade 
	SetScreenElementProps id = <id> MaterialProps = [
		{name = m_startFade property = <start>}
		{name = m_endFade property = <end>}
		{name = m_playerIndex property = <player>}
	]
endscript
sidebar_angle = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
sidebar_x = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
sidebar_y = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
highway_pos_table = [
	{
		highway_top_width = 0
	}
	{
		highway_top_width = 0
	}
	{
		highway_top_width = 0
	}
	{
		highway_top_width = 0
	}
	{
		highway_top_width = 0
	}
	{
		highway_top_width = 0
	}
	{
		highway_top_width = 0
	}
	{
		highway_top_width = 0
	}
]

script CreateGuitarTapTrail 
	mat_name = (guitar_tap_mat + <player>)
	tap_trail_id = (guitar_tap_trail_sprite + <player>)
	DestroyMaterial name = <mat_name>
	if ScreenElementExists id = <tap_trail_id>
		DestroyScreenElement id = <tap_trail_id>
	endif
	CreateMaterial {
		name = <mat_name>
		template = Waveform_UI_GuitarTapTrail
		technique = linear
		BlendMode = blend
		AlphaCutoff = 1
		MaterialProps = [
			{name = m_playerIndex FloatProperty = <fplayer>}
			{name = m_sampNoise Texturecrc = -1120914853}
			{name = m_psColors0 VectorProperty = [0.0 0.0 0.0 1.0]}
			{name = m_psColors1 VectorProperty = [1.2 0.0 1.2 0.7]}
			{name = m_psColors2 VectorProperty = [0.0 0.0 0.0 0.0]}
			{name = m_psColors3 VectorProperty = [0.0 0.0 0.0 0.0]}
			{name = m_psColors4 VectorProperty = [0.7 0.4 0.0 1.0]}
			{name = m_psColors5 VectorProperty = [1.0 1.0 0.3 1.0]}
			{name = m_psColors6 VectorProperty = [1.0 0.6 0.2 1.0]}
			{name = m_psColors7 VectorProperty = [1.0 1.0 0.3 1.0]}
			{name = m_noiseScale FloatProperty = 0.8}
			{name = m_noiseBias FloatProperty = 0.0}
			{name = m_noisePower FloatProperty = 0.25}
			{name = m_noise1SpeedX FloatProperty = 0.2}
			{name = m_noise1SpeedY FloatProperty = 0.25}
			{name = m_noise2SpeedX FloatProperty = 0.2}
			{name = m_noise2SpeedY FloatProperty = -0.25}
			{name = m_splineFadeDistance FloatProperty = 5.0}
		]
		texdicts = ($material_texdicts)
	}
	<parent_element> = <parent_id>
	if NOT ScreenElementExists id = <parent_element>
		<parent_element> = root_window
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = <parent_element>
		id = <tap_trail_id>
		material = <mat_name>
		texture = white
		dims = (512.0, 128.0)
		Pos = (0.0, 0.0)
		rgba = [255 255 0 255]
		z_priority = 3.5
	}
endscript

script DestroyGuitarTapTrail 
	mat_name = (guitar_tap_mat + <player>)
	tap_trail_id = (guitar_tap_trail_sprite + <player>)
	DestroyMaterial name = <mat_name>
	if ScreenElementExists id = <tap_trail_id>
		DestroyScreenElement id = <tap_trail_id>
	endif
endscript

script get_highway_struct 
	get_num_non_vocals_players_onscreen
	if (<jam_room_highway> = 0)
		struct = highway_guitar1
	else
		if (<num_non_vocals_players> = 1)
			struct = highway_guitar1
		elseif (<num_non_vocals_players> = 2)
			struct = highway_guitar2
		elseif (<num_non_vocals_players> = 3)
			struct = highway_guitar3
		else
			struct = highway_guitar4
		endif
	endif
	return <...>
endscript

script generate_pos_table 
	get_highway_struct player = <player> jam_room_highway = <jam_room_highway>
	if GotParam \{debug}
		<pos_index> = ((<player> -1) + 4)
	else
		<pos_index> = (<player> -1)
	endif
	SetArrayElement GlobalArray arrayName = highway_pos_table index = <pos_index> newValue = ($<struct>)
	pos_table = ($highway_pos_table [<pos_index>])
	SetAllWhammyValues \{value = 1.0
		player = 1}
	SetAllWhammyValues \{value = 1.0
		player = 2}
	SetAllWhammyValues \{value = 1.0
		player = 3}
	SetAllWhammyValues \{value = 1.0
		player = 4}
	if NOT GotParam \{overrideperspective}
		heightOffsetFactor = (<pos_table>.perspectivefact)
		heightOffsetExp = (<pos_table>.perspectiveexp)
	endif
	RequireParams \{[
			heightOffsetFactor
			heightOffsetExp
		]
		all}
	highway_playline = (<pos_table>.highway_playline)
	startY = (<highway_playline> - (<pos_table>.highway_height))
	rows = $highway_lines
	normal_rows = $real_highway_lines
	height = (<pos_table>.highway_height)
	htx = (0.0 - ((<pos_table>.highway_top_width) / 2.0))
	gts = ((<pos_table>.highway_top_width) / 5.0)
	if NOT PlayerInfoEquals <player> part = Drum
		gsx = (<htx> + (<gts> / 2.0) + (<gts> * 0.0))
		rsx = (<htx> + (<gts> / 2.0) + (<gts> * 1.0))
		ysx = (<htx> + (<gts> / 2.0) + (<gts> * 2.0))
		bsx = (<htx> + (<gts> / 2.0) + (<gts> * 3.0))
		osx = (<htx> + (<gts> / 2.0) + (<gts> * 4.0))
		psx = (<htx> + (<gts> / 2.0) + (<gts> * -1.0))
	else
		if UseFourLaneHighway player = <player>
			gts = ((<pos_table>.highway_top_width) / 4.0)
		endif
		rsx = (<htx> + (<gts> * 0.5))
		ysx = (<rsx> + <gts>)
		bsx = (<ysx> + <gts>)
		if NOT UseFourLaneHighway player = <player>
			osx = (<bsx> + <gts>)
			gsx = (<osx> + <gts>)
		else
			osx = (<bsx> + (10 * <gts>))
			gsx = (<bsx> + <gts>)
		endif
		psx = (<htx> + ((<pos_table>.highway_top_width) * 0.5))
	endif
	hbw = ((<pos_table>.highway_top_width) + (<pos_table>.highway_top_width) * (<pos_table>.widthOffsetFactor))
	hbx = (0.0 - (<hbw> / 2.0))
	gbs = (<hbw> / 5.0)
	if NOT PlayerInfoEquals <player> part = Drum
		gex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 0.0))
		rex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 1.0))
		yex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 2.0))
		bex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 3.0))
		oex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 4.0))
		pex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 2.0))
		pex1 = (<hbx> + (<gbs> / 2.0) + (<gbs> * -0.5))
		pex2 = (<hbx> + (<gbs> / 2.0) + (<gbs> * 4.5))
	else
		if UseFourLaneHighway player = <player>
			gbs = (<hbw> / 4.0)
		endif
		rex = (<hbx> + (<gbs> * 0.5))
		yex = (<rex> + <gbs>)
		bex = (<yex> + <gbs>)
		if NOT UseFourLaneHighway player = <player>
			oex = (<bex> + <gbs>)
			gex = (<oex> + <gbs>)
		else
			oex = (<bex> + (100 * <gbs>))
			gex = (<bex> + <gbs>)
		endif
		pex = (<hbx> + (<hbw> * 0.5))
		pex1 = (<hbx> + (<gbs> * -0.15))
		pex2 = (<gex> + (<gbs> * 0.65000004))
	endif
	Atan2 x = (<pos_table>.highway_height) y = (<gsx> - <gex>)
	ga = <atan>
	Atan2 x = (<pos_table>.highway_height) y = (<rsx> - <rex>)
	ra = <atan>
	Atan2 x = (<pos_table>.highway_height) y = (<ysx> - <yex>)
	ya = <atan>
	Atan2 x = (<pos_table>.highway_height) y = (<bsx> - <bex>)
	ba = <atan>
	Atan2 x = (<pos_table>.highway_height) y = (<osx> - <oex>)
	oa = <atan>
	Atan2 x = (<pos_table>.highway_height) y = (<psx> - <pex>)
	pa = <atan>
	if PlayerInfoEquals <player> part = Drum
		SetButtonData player = <player> array = button_models Color = red angle = <ra> start_x = <rsx> start_y = <startY> end_x = <rex> end_y = <highway_playline> left_start_x = <rsx> left_end_x = <rex> left_angle = <ra>
		SetButtonData player = <player> array = button_models Color = yellow angle = <ya> start_x = <ysx> start_y = <startY> end_x = <yex> end_y = <highway_playline> left_start_x = <ysx> left_end_x = <yex> left_angle = <ya>
		SetButtonData player = <player> array = button_models Color = blue angle = <ba> start_x = <bsx> start_y = <startY> end_x = <bex> end_y = <highway_playline> left_start_x = <bsx> left_end_x = <bex> left_angle = <ba>
		SetButtonData player = <player> array = button_models Color = orange angle = <oa> start_x = <osx> start_y = <startY> end_x = <oex> end_y = <highway_playline> left_start_x = <osx> left_end_x = <oex> left_angle = <oa>
		SetButtonData player = <player> array = button_models Color = green angle = <ga> start_x = <gsx> start_y = <startY> end_x = <gex> end_y = <highway_playline> left_start_x = <gsx> left_end_x = <gex> left_angle = <ga>
		SetButtonData player = <player> array = button_models Color = white angle = <pa> start_x = <psx> start_y = <startY> end_x = <pex> end_y = <highway_playline> left_start_x = <psx> left_end_x = <pex> left_angle = <pa>
		SetButtonData player = <player> array = button_up_models Color = red pos_x = <rex> pos_y = <highway_playline> left_pos_x = <rex>
		SetButtonData player = <player> array = button_up_models Color = yellow pos_x = <yex> pos_y = <highway_playline> left_pos_x = <yex>
		SetButtonData player = <player> array = button_up_models Color = blue pos_x = <bex> pos_y = <highway_playline> left_pos_x = <bex>
		SetButtonData player = <player> array = button_up_models Color = orange pos_x = <oex> pos_y = <highway_playline> left_pos_x = <oex>
		SetButtonData player = <player> array = button_up_models Color = green pos_x = <gex> pos_y = <highway_playline> left_pos_x = <gex>
		SetButtonData player = <player> array = button_up_models Color = white pos_x = <pex> pos_y = <highway_playline> left_pos_x = <pex>
		SetButtonData player = <player> array = button_up_models Color = extra pos_x = <pex1> pos_y = <highway_playline> left_pos_x = <pex2>
	else
		SetButtonData player = <player> array = button_models Color = green angle = <ga> start_x = <gsx> start_y = <startY> end_x = <gex> end_y = <highway_playline> left_start_x = <osx> left_end_x = <oex> left_angle = <oa>
		SetButtonData player = <player> array = button_models Color = red angle = <ra> start_x = <rsx> start_y = <startY> end_x = <rex> end_y = <highway_playline> left_start_x = <bsx> left_end_x = <bex> left_angle = <ba>
		SetButtonData player = <player> array = button_models Color = yellow angle = <ya> start_x = <ysx> start_y = <startY> end_x = <yex> end_y = <highway_playline> left_start_x = <ysx> left_end_x = <yex> left_angle = <ya>
		SetButtonData player = <player> array = button_models Color = blue angle = <ba> start_x = <bsx> start_y = <startY> end_x = <bex> end_y = <highway_playline> left_start_x = <rsx> left_end_x = <rex> left_angle = <ra>
		SetButtonData player = <player> array = button_models Color = orange angle = <oa> start_x = <osx> start_y = <startY> end_x = <oex> end_y = <highway_playline> left_start_x = <gsx> left_end_x = <gex> left_angle = <ga>
		SetButtonData player = <player> array = button_models Color = white angle = <pa> start_x = <psx> start_y = <startY> end_x = <pex> end_y = <highway_playline> left_start_x = <psx> left_end_x = <pex> left_angle = <pa>
		SetButtonData player = <player> array = button_up_models Color = green pos_x = <gex> pos_y = <highway_playline> left_pos_x = <oex>
		SetButtonData player = <player> array = button_up_models Color = red pos_x = <rex> pos_y = <highway_playline> left_pos_x = <bex>
		SetButtonData player = <player> array = button_up_models Color = yellow pos_x = <yex> pos_y = <highway_playline> left_pos_x = <yex>
		SetButtonData player = <player> array = button_up_models Color = blue pos_x = <bex> pos_y = <highway_playline> left_pos_x = <rex>
		SetButtonData player = <player> array = button_up_models Color = orange pos_x = <oex> pos_y = <highway_playline> left_pos_x = <gex>
		SetButtonData player = <player> array = button_up_models Color = white pos_x = <pex> pos_y = <highway_playline> left_pos_x = <pex>
		SetButtonData player = <player> array = button_up_models Color = extra pos_x = <pex1> pos_y = <highway_playline> left_pos_x = <pex2>
	endif
	fe = (<highway_playline> - (<pos_table>.highway_height))
	fs = (<fe> + (<pos_table>.highway_fade))
	SetProjectSpecificSpriteParams HighwayStartFade = <fs> HighwayEndFade = <fe> player = <player>
	stx = (0.0 - ((<pos_table>.highway_top_width) / 2.0))
	sbx = (0.0 - (<hbw> / 2.0))
	Atan2 x = (<pos_table>.highway_height) y = (<stx> - <sbx>)
	vec_x = (<sbx> - <stx>)
	vec_y = (<pos_table>.highway_height)
	SetArrayElement GlobalArray arrayName = sidebar_angle index = <pos_index> newValue = <atan>
	SetArrayElement GlobalArray arrayName = sidebar_x index = <pos_index> newValue = ((<sbx> + (<vec_x> * 0.25)) - (<pos_table>.sidebar_x_offset))
	SetArrayElement GlobalArray arrayName = sidebar_y index = <pos_index> newValue = (<highway_playline> + (<vec_y> * 0.25))
	GeneratePosTable rows = <rows> normal_rows = <normal_rows> startY = <startY> height = <height> heightOffsetFactor = <heightOffsetFactor> heightOffsetExp = <heightOffsetExp> pos_index = <pos_index>
	SetRowHeightTables player = (<pos_index> + 1)
endscript
