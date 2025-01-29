highway_lines = 1152
real_highway_lines = 1024
gHighwayStartFade = 400.0
gHighwayEndFade = 1000.0

script Set2DHighwaySpeed \{speed = -1.0}
	Change structurename = <player_status> highway_speed = <speed>
	SetScreenElementProps id = <id> highway_speed = <speed>
endscript

script Set2DHighwayFade \{start = 720.0
		end = 100.0}
	SetScreenElementProps id = <id> MaterialProps = [
		{Name = m_startFade property = <start>}
		{Name = m_endFade property = <end>}
		{Name = m_playerIndex property = <Player>}
	]
endscript

script Set2DGemFade 
	SetScreenElementProps id = <id> MaterialProps = [
		{Name = m_startFade property = <start>}
		{Name = m_endFade property = <end>}
		{Name = m_playerIndex property = <Player>}
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
guitartaptrailcontrolpointcount = [
	0
	0
	0
	0
]
guitartaptrailcontrolpoints = [
	[
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
	]
	[
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
	]
	[
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
	]
	[
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
		0.0
	]
]

script createguitartaptrail 
	mat_name = (guitar_tap_mat + <Player>)
	tap_trail_id = (guitar_tap_trail_sprite + <Player>)
	destroymaterial Name = <mat_name>
	if ScreenElementExists id = <tap_trail_id>
		DestroyScreenElement id = <tap_trail_id>
	endif
	creatematerial {
		Name = <mat_name>
		template = waveform_ui_guitartaptrail
		technique = Default
		BlendMode = blend
		AlphaCutoff = 1
		MaterialProps = [
			{Name = m_playerIndex floatproperty = <fplayer>}
			{Name = m_sampnoise texturecrc = -1120914853}
			{Name = m_pscolors0 vectorproperty = [0.0 0.0 0.0 0.95]}
			{Name = m_pscolors1 vectorproperty = [1.25 0.0 1.25 0.55]}
			{Name = m_pscolors2 vectorproperty = [0.0 0.0 0.0 0.0]}
			{Name = m_pscolors3 vectorproperty = [0.0 0.0 0.0 0.0]}
			{Name = m_pscolors4 vectorproperty = [0.7 0.4 0.0 1.0]}
			{Name = m_pscolors5 vectorproperty = [1.0 1.0 0.3 1.0]}
			{Name = m_pscolors6 vectorproperty = [1.0 0.6 0.2 1.0]}
			{Name = m_pscolors7 vectorproperty = [1.0 1.0 0.3 1.0]}
			{Name = m_noisescale floatproperty = 0.8}
			{Name = m_noisebias floatproperty = 0.0}
			{Name = m_noisepower floatproperty = 0.25}
			{Name = m_noise1speedx floatproperty = 0.2}
			{Name = m_noise1speedy floatproperty = 0.25}
			{Name = m_noise2speedx floatproperty = 0.2}
			{Name = m_noise2speedy floatproperty = -0.25}
			{Name = m_splinefadedistance floatproperty = 5.0}
		]
	}
	<parent_element> = <parent_id>
	if NOT ScreenElementExists id = <parent_element>
		<parent_element> = root_window
	endif
	CreateScreenElement {
		Type = SpriteElement
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

script destroyguitartaptrail 
	mat_name = (guitar_tap_mat + <Player>)
	tap_trail_id = (guitar_tap_trail_sprite + <Player>)
	destroymaterial Name = <mat_name>
	if ScreenElementExists id = <tap_trail_id>
		DestroyScreenElement id = <tap_trail_id>
	endif
endscript

script get_highway_struct 
	get_num_non_vocals_players_onscreen
	if (<num_non_vocals_players> = 1 && $end_credits = 0)
		struct = highway_guitar1
	elseif (<num_non_vocals_players> = 2 || $end_credits = 1)
		struct = highway_guitar2
	elseif (<num_non_vocals_players> = 3)
		struct = highway_guitar3
	else
		ScriptAssert 'num_non_vocals_players=%s player=%p' s = <num_non_vocals_players> p = <Player>
	endif
	return <...>
endscript

script generate_pos_table 
	get_highway_struct Player = <Player>
	if GotParam \{debug}
		<pos_index> = ((<Player> -1) + 4)
	else
		<pos_index> = (<Player> -1)
	endif
	SetArrayElement globalarray ArrayName = highway_pos_table index = <pos_index> NewValue = ($<struct>)
	pos_table = ($highway_pos_table [<pos_index>])
	SetAllWhammyValues \{value = 1.0
		Player = 1}
	SetAllWhammyValues \{value = 1.0
		Player = 2}
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
	htx = (640.0 - ((<pos_table>.highway_top_width) / 2.0))
	gts = ((<pos_table>.highway_top_width) / 5.0)
	if NOT playerinfoequals <Player> part = drum
		gsx = (<htx> + (<gts> / 2.0) + (<gts> * 0.0))
		rsx = (<htx> + (<gts> / 2.0) + (<gts> * 1.0))
		ysx = (<htx> + (<gts> / 2.0) + (<gts> * 2.0))
		bsx = (<htx> + (<gts> / 2.0) + (<gts> * 3.0))
		osx = (<htx> + (<gts> / 2.0) + (<gts> * 4.0))
		psx = (<htx> + (<gts> / 2.0) + (<gts> * -1.0))
	else
		if usefourlanehighway Player = <Player>
			gts = ((<pos_table>.highway_top_width) / 4.0)
		endif
		rsx = (<htx> + (<gts> * 0.5))
		ysx = (<rsx> + <gts>)
		bsx = (<ysx> + <gts>)
		if NOT usefourlanehighway Player = <Player>
			osx = (<bsx> + <gts>)
			gsx = (<osx> + <gts>)
		else
			osx = (<bsx> + (10 * <gts>))
			gsx = (<bsx> + <gts>)
		endif
		psx = (<htx> + ((<pos_table>.highway_top_width) * 0.5))
	endif
	hbw = ((<pos_table>.highway_top_width) + ((<pos_table>.highway_top_width) * (<pos_table>.widthOffsetFactor)))
	hbx = (640.0 - (<hbw> / 2.0))
	gbs = (<hbw> / 5.0)
	if NOT playerinfoequals <Player> part = drum
		gex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 0.0))
		rex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 1.0))
		yex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 2.0))
		bex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 3.0))
		oex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 4.0))
		pex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 2.0))
		pex1 = (<hbx> + (<gbs> / 2.0) + (<gbs> * -0.5))
		pex2 = (<hbx> + (<gbs> / 2.0) + (<gbs> * 4.5))
	else
		if usefourlanehighway Player = <Player>
			gbs = (<hbw> / 4.0)
		endif
		rex = (<hbx> + (<gbs> * 0.5))
		yex = (<rex> + <gbs>)
		bex = (<yex> + <gbs>)
		if NOT usefourlanehighway Player = <Player>
			oex = (<bex> + <gbs>)
			gex = (<oex> + <gbs>)
		else
			oex = (<bex> + (10 * <gbs>))
			gex = (<bex> + <gbs>)
		endif
		pex = (<hbx> + (<hbw> * 0.5))
		pex1 = (<hbx> + (<gbs> * -0.15))
		pex2 = (<gex> + (<gbs> * 0.65000004))
	endif
	Atan2 X = (<pos_table>.highway_height) y = (<gsx> - <gex>)
	ga = <atan>
	Atan2 X = (<pos_table>.highway_height) y = (<rsx> - <rex>)
	ra = <atan>
	Atan2 X = (<pos_table>.highway_height) y = (<ysx> - <yex>)
	ya = <atan>
	Atan2 X = (<pos_table>.highway_height) y = (<bsx> - <bex>)
	ba = <atan>
	Atan2 X = (<pos_table>.highway_height) y = (<osx> - <oex>)
	oa = <atan>
	Atan2 X = (<pos_table>.highway_height) y = (<psx> - <pex>)
	pa = <atan>
	if playerinfoequals <Player> part = drum
		SetButtonData Player = <Player> array = button_models Color = red angle = <ra> start_x = <rsx> start_y = <startY> end_x = <rex> end_y = <highway_playline> left_start_x = <rsx> left_end_x = <rex> left_angle = <ra>
		SetButtonData Player = <Player> array = button_models Color = yellow angle = <ya> start_x = <ysx> start_y = <startY> end_x = <yex> end_y = <highway_playline> left_start_x = <ysx> left_end_x = <yex> left_angle = <ya>
		SetButtonData Player = <Player> array = button_models Color = blue angle = <ba> start_x = <bsx> start_y = <startY> end_x = <bex> end_y = <highway_playline> left_start_x = <bsx> left_end_x = <bex> left_angle = <ba>
		SetButtonData Player = <Player> array = button_models Color = orange angle = <oa> start_x = <osx> start_y = <startY> end_x = <oex> end_y = <highway_playline> left_start_x = <osx> left_end_x = <oex> left_angle = <oa>
		SetButtonData Player = <Player> array = button_models Color = green angle = <ga> start_x = <gsx> start_y = <startY> end_x = <gex> end_y = <highway_playline> left_start_x = <gsx> left_end_x = <gex> left_angle = <ga>
		SetButtonData Player = <Player> array = button_models Color = white angle = <pa> start_x = <psx> start_y = <startY> end_x = <pex> end_y = <highway_playline> left_start_x = <psx> left_end_x = <pex> left_angle = <pa>
		SetButtonData Player = <Player> array = button_up_models Color = red pos_x = <rex> pos_y = <highway_playline> left_pos_x = <rex>
		SetButtonData Player = <Player> array = button_up_models Color = yellow pos_x = <yex> pos_y = <highway_playline> left_pos_x = <yex>
		SetButtonData Player = <Player> array = button_up_models Color = blue pos_x = <bex> pos_y = <highway_playline> left_pos_x = <bex>
		SetButtonData Player = <Player> array = button_up_models Color = orange pos_x = <oex> pos_y = <highway_playline> left_pos_x = <oex>
		SetButtonData Player = <Player> array = button_up_models Color = green pos_x = <gex> pos_y = <highway_playline> left_pos_x = <gex>
		SetButtonData Player = <Player> array = button_up_models Color = white pos_x = <pex> pos_y = <highway_playline> left_pos_x = <pex>
		SetButtonData Player = <Player> array = button_up_models Color = extra pos_x = <pex1> pos_y = <highway_playline> left_pos_x = <pex2>
	else
		SetButtonData Player = <Player> array = button_models Color = green angle = <ga> start_x = <gsx> start_y = <startY> end_x = <gex> end_y = <highway_playline> left_start_x = <osx> left_end_x = <oex> left_angle = <oa>
		SetButtonData Player = <Player> array = button_models Color = red angle = <ra> start_x = <rsx> start_y = <startY> end_x = <rex> end_y = <highway_playline> left_start_x = <bsx> left_end_x = <bex> left_angle = <ba>
		SetButtonData Player = <Player> array = button_models Color = yellow angle = <ya> start_x = <ysx> start_y = <startY> end_x = <yex> end_y = <highway_playline> left_start_x = <ysx> left_end_x = <yex> left_angle = <ya>
		SetButtonData Player = <Player> array = button_models Color = blue angle = <ba> start_x = <bsx> start_y = <startY> end_x = <bex> end_y = <highway_playline> left_start_x = <rsx> left_end_x = <rex> left_angle = <ra>
		SetButtonData Player = <Player> array = button_models Color = orange angle = <oa> start_x = <osx> start_y = <startY> end_x = <oex> end_y = <highway_playline> left_start_x = <gsx> left_end_x = <gex> left_angle = <ga>
		SetButtonData Player = <Player> array = button_models Color = white angle = <pa> start_x = <psx> start_y = <startY> end_x = <pex> end_y = <highway_playline> left_start_x = <psx> left_end_x = <pex> left_angle = <pa>
		SetButtonData Player = <Player> array = button_up_models Color = green pos_x = <gex> pos_y = <highway_playline> left_pos_x = <oex>
		SetButtonData Player = <Player> array = button_up_models Color = red pos_x = <rex> pos_y = <highway_playline> left_pos_x = <bex>
		SetButtonData Player = <Player> array = button_up_models Color = yellow pos_x = <yex> pos_y = <highway_playline> left_pos_x = <yex>
		SetButtonData Player = <Player> array = button_up_models Color = blue pos_x = <bex> pos_y = <highway_playline> left_pos_x = <rex>
		SetButtonData Player = <Player> array = button_up_models Color = orange pos_x = <oex> pos_y = <highway_playline> left_pos_x = <gex>
		SetButtonData Player = <Player> array = button_up_models Color = white pos_x = <pex> pos_y = <highway_playline> left_pos_x = <pex>
		SetButtonData Player = <Player> array = button_up_models Color = extra pos_x = <pex1> pos_y = <highway_playline> left_pos_x = <pex2>
	endif
	fe = (<highway_playline> - (<pos_table>.highway_height))
	fs = (<fe> + (<pos_table>.highway_fade))
	Change gHighwayStartFade = <fs>
	Change gHighwayEndFade = <fe>
	stx = (640.0 - ((<pos_table>.highway_top_width) / 2.0))
	sbx = (640.0 - (<hbw> / 2.0))
	Atan2 X = (<pos_table>.highway_height) y = (<stx> - <sbx>)
	vec_x = (<sbx> - <stx>)
	vec_y = (<pos_table>.highway_height)
	SetArrayElement globalarray ArrayName = sidebar_angle index = <pos_index> NewValue = <atan>
	SetArrayElement globalarray ArrayName = sidebar_x index = <pos_index> NewValue = ((<sbx> + (<vec_x> * 0.25)) - (<pos_table>.sidebar_x_offset))
	SetArrayElement globalarray ArrayName = sidebar_y index = <pos_index> NewValue = (<highway_playline> + (<vec_y> * 0.25))
	generatepostable rows = <rows> normal_rows = <normal_rows> startY = <startY> height = <height> heightOffsetFactor = <heightOffsetFactor> heightOffsetExp = <heightOffsetExp> pos_index = <pos_index>
	SetRowHeightTables Player = (<pos_index> + 1)
endscript
