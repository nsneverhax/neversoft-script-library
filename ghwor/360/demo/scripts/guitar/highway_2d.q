highway_lines = 1152
real_highway_lines = 1024

script set2dhighwayspeed \{speed = -1.0}
	setplayerinfo <player> highway_speed = <speed>
	getscreenelementprops id = <id> materialprops = [
		{name = m_velocityv}
	]
	oldspeed = <matx>
	getscreenelementprops id = <id> materialprops = [
		{name = m_offsetv}
	]
	oldoffset = <matx>
	gettimevalues
	offset = (<oldspeed> * <songtime> + <oldoffset> - <speed> * <songtime>)
	setscreenelementprops id = <id> materialprops = [
		{name = m_velocityv property = <speed>}
		{name = m_offsetv property = <offset>}
		{name = m_width property = (($highway_pos_table [(<player> -1)]).widthoffsetfactor)}
		{name = m_tiling property = (($highway_pos_table [(<player> -1)]).ghighwaytiling)}
	]
	getplayerinfo <player> scroll_time
	getplayerinfo <player> gem_offset
	setplayerinfo <player> time_offset = (((<scroll_time> - $destroy_time) * 1000.0) + <gem_offset>)
endscript

script set_highway_speed \{player = 1}
	pos_table = ($highway_pos_table [(<player> -1)])
	getplayerinfo <player> scroll_time
	highway_speed = (0.0 - ((<pos_table>.ghighwaytiling) / (<scroll_time> - $destroy_time)))
	formattext checksumname = highway_name 'Highway_2Dp%p' p = <player> addtostringlookup = true
	set2dhighwayspeed speed = <highway_speed> id = <highway_name> player = <player>
endscript

script set2dhighwayfade \{start = 720.0
		end = 100.0}
	setscreenelementprops id = <id> materialprops = [
		{name = m_startfade property = <start>}
		{name = m_endfade property = <end>}
		{name = m_playerindex property = <player>}
	]
endscript

script set2dgemfade 
	setscreenelementprops id = <id> materialprops = [
		{name = m_startfade property = <start>}
		{name = m_endfade property = <end>}
		{name = m_playerindex property = <player>}
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

script createguitartaptrail 
	mat_name = (guitar_tap_mat + <player>)
	tap_trail_id = (guitar_tap_trail_sprite + <player>)
	destroymaterial name = <mat_name>
	if screenelementexists id = <tap_trail_id>
		destroyscreenelement id = <tap_trail_id>
	endif
	creatematerial {
		name = <mat_name>
		template = waveform_ui_guitartaptrail
		technique = linear
		blendmode = blend
		alphacutoff = 1
		materialprops = [
			{name = m_playerindex floatproperty = <fplayer>}
			{name = m_sampnoise texturecrc = -1120914853}
			{name = m_pscolors0 vectorproperty = [0.0 0.0 0.0 1.0]}
			{name = m_pscolors1 vectorproperty = [1.2 0.0 1.2 0.7]}
			{name = m_pscolors2 vectorproperty = [0.0 0.0 0.0 0.0]}
			{name = m_pscolors3 vectorproperty = [0.0 0.0 0.0 0.0]}
			{name = m_pscolors4 vectorproperty = [0.7 0.4 0.0 1.0]}
			{name = m_pscolors5 vectorproperty = [1.0 1.0 0.3 1.0]}
			{name = m_pscolors6 vectorproperty = [1.0 0.6 0.2 1.0]}
			{name = m_pscolors7 vectorproperty = [1.0 1.0 0.3 1.0]}
			{name = m_noisescale floatproperty = 0.8}
			{name = m_noisebias floatproperty = 0.0}
			{name = m_noisepower floatproperty = 0.25}
			{name = m_noise1speedx floatproperty = 0.2}
			{name = m_noise1speedy floatproperty = 0.25}
			{name = m_noise2speedx floatproperty = 0.2}
			{name = m_noise2speedy floatproperty = -0.25}
			{name = m_splinefadedistance floatproperty = 5.0}
		]
		texdicts = ($material_texdicts)
	}
	<parent_element> = <parent_id>
	if NOT screenelementexists id = <parent_element>
		<parent_element> = root_window
	endif
	createscreenelement {
		type = spriteelement
		parent = <parent_element>
		id = <tap_trail_id>
		material = <mat_name>
		texture = white
		dims = (512.0, 128.0)
		pos = (0.0, 0.0)
		rgba = [255 255 0 255]
		z_priority = 3.5
	}
endscript

script destroyguitartaptrail 
	mat_name = (guitar_tap_mat + <player>)
	tap_trail_id = (guitar_tap_trail_sprite + <player>)
	destroymaterial name = <mat_name>
	if screenelementexists id = <tap_trail_id>
		destroyscreenelement id = <tap_trail_id>
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
	if gotparam \{debug}
		<pos_index> = ((<player> -1) + 4)
	else
		<pos_index> = (<player> -1)
	endif
	setarrayelement globalarray arrayname = highway_pos_table index = <pos_index> newvalue = ($<struct>)
	pos_table = ($highway_pos_table [<pos_index>])
	setallwhammyvalues \{value = 1.0
		player = 1}
	setallwhammyvalues \{value = 1.0
		player = 2}
	setallwhammyvalues \{value = 1.0
		player = 3}
	setallwhammyvalues \{value = 1.0
		player = 4}
	if NOT gotparam \{overrideperspective}
		heightoffsetfactor = (<pos_table>.perspectivefact)
		heightoffsetexp = (<pos_table>.perspectiveexp)
	endif
	requireparams \{[
			heightoffsetfactor
			heightoffsetexp
		]
		all}
	highway_playline = (<pos_table>.highway_playline)
	starty = (<highway_playline> - (<pos_table>.highway_height))
	rows = $highway_lines
	normal_rows = $real_highway_lines
	height = (<pos_table>.highway_height)
	htx = (0.0 - ((<pos_table>.highway_top_width) / 2.0))
	gts = ((<pos_table>.highway_top_width) / 5.0)
	if NOT playerinfoequals <player> part = drum
		gsx = (<htx> + (<gts> / 2.0) + (<gts> * 0.0))
		rsx = (<htx> + (<gts> / 2.0) + (<gts> * 1.0))
		ysx = (<htx> + (<gts> / 2.0) + (<gts> * 2.0))
		bsx = (<htx> + (<gts> / 2.0) + (<gts> * 3.0))
		osx = (<htx> + (<gts> / 2.0) + (<gts> * 4.0))
		psx = (<htx> + (<gts> / 2.0) + (<gts> * 2.0))
	else
		if usefourlanehighway player = <player>
			gts = ((<pos_table>.highway_top_width) / 4.0)
		endif
		rsx = (<htx> + (<gts> * 0.5))
		ysx = (<rsx> + <gts>)
		bsx = (<ysx> + <gts>)
		if NOT usefourlanehighway player = <player>
			osx = (<bsx> + <gts>)
			gsx = (<osx> + <gts>)
		else
			osx = (<bsx> + (10 * <gts>))
			gsx = (<bsx> + <gts>)
		endif
		psx = (<htx> + ((<pos_table>.highway_top_width) * 0.5))
	endif
	hbw = ((<pos_table>.highway_top_width) + (<pos_table>.highway_top_width) * (<pos_table>.widthoffsetfactor))
	hbx = (0.0 - (<hbw> / 2.0))
	gbs = (<hbw> / 5.0)
	if NOT playerinfoequals <player> part = drum
		gex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 0.0))
		rex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 1.0))
		yex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 2.0))
		bex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 3.0))
		oex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 4.0))
		pex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 2.0))
		pex1 = (<hbx> + (<gbs> / 2.0) + (<gbs> * -0.5))
		pex2 = (<hbx> + (<gbs> / 2.0) + (<gbs> * 4.5))
	else
		if usefourlanehighway player = <player>
			gbs = (<hbw> / 4.0)
		endif
		rex = (<hbx> + (<gbs> * 0.5))
		yex = (<rex> + <gbs>)
		bex = (<yex> + <gbs>)
		if NOT usefourlanehighway player = <player>
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
	atan2 x = (<pos_table>.highway_height) y = (<gsx> - <gex>)
	ga = <atan>
	atan2 x = (<pos_table>.highway_height) y = (<rsx> - <rex>)
	ra = <atan>
	atan2 x = (<pos_table>.highway_height) y = (<ysx> - <yex>)
	ya = <atan>
	atan2 x = (<pos_table>.highway_height) y = (<bsx> - <bex>)
	ba = <atan>
	atan2 x = (<pos_table>.highway_height) y = (<osx> - <oex>)
	oa = <atan>
	atan2 x = (<pos_table>.highway_height) y = (<psx> - <pex>)
	pa = <atan>
	if playerinfoequals <player> part = drum
		setbuttondata player = <player> array = button_models color = red angle = <ra> start_x = <rsx> start_y = <starty> end_x = <rex> end_y = <highway_playline> left_start_x = <rsx> left_end_x = <rex> left_angle = <ra>
		setbuttondata player = <player> array = button_models color = yellow angle = <ya> start_x = <ysx> start_y = <starty> end_x = <yex> end_y = <highway_playline> left_start_x = <ysx> left_end_x = <yex> left_angle = <ya>
		setbuttondata player = <player> array = button_models color = blue angle = <ba> start_x = <bsx> start_y = <starty> end_x = <bex> end_y = <highway_playline> left_start_x = <bsx> left_end_x = <bex> left_angle = <ba>
		setbuttondata player = <player> array = button_models color = orange angle = <oa> start_x = <osx> start_y = <starty> end_x = <oex> end_y = <highway_playline> left_start_x = <osx> left_end_x = <oex> left_angle = <oa>
		setbuttondata player = <player> array = button_models color = green angle = <ga> start_x = <gsx> start_y = <starty> end_x = <gex> end_y = <highway_playline> left_start_x = <gsx> left_end_x = <gex> left_angle = <ga>
		setbuttondata player = <player> array = button_models color = white angle = <pa> start_x = <psx> start_y = <starty> end_x = <pex> end_y = <highway_playline> left_start_x = <psx> left_end_x = <pex> left_angle = <pa>
		setbuttondata player = <player> array = button_up_models color = red pos_x = <rex> pos_y = <highway_playline> left_pos_x = <rex>
		setbuttondata player = <player> array = button_up_models color = yellow pos_x = <yex> pos_y = <highway_playline> left_pos_x = <yex>
		setbuttondata player = <player> array = button_up_models color = blue pos_x = <bex> pos_y = <highway_playline> left_pos_x = <bex>
		setbuttondata player = <player> array = button_up_models color = orange pos_x = <oex> pos_y = <highway_playline> left_pos_x = <oex>
		setbuttondata player = <player> array = button_up_models color = green pos_x = <gex> pos_y = <highway_playline> left_pos_x = <gex>
		setbuttondata player = <player> array = button_up_models color = white pos_x = <pex> pos_y = <highway_playline> left_pos_x = <pex>
		setbuttondata player = <player> array = button_up_models color = extra pos_x = <pex1> pos_y = <highway_playline> left_pos_x = <pex2>
	else
		setbuttondata player = <player> array = button_models color = green angle = <ga> start_x = <gsx> start_y = <starty> end_x = <gex> end_y = <highway_playline> left_start_x = <osx> left_end_x = <oex> left_angle = <oa>
		setbuttondata player = <player> array = button_models color = red angle = <ra> start_x = <rsx> start_y = <starty> end_x = <rex> end_y = <highway_playline> left_start_x = <bsx> left_end_x = <bex> left_angle = <ba>
		setbuttondata player = <player> array = button_models color = yellow angle = <ya> start_x = <ysx> start_y = <starty> end_x = <yex> end_y = <highway_playline> left_start_x = <ysx> left_end_x = <yex> left_angle = <ya>
		setbuttondata player = <player> array = button_models color = blue angle = <ba> start_x = <bsx> start_y = <starty> end_x = <bex> end_y = <highway_playline> left_start_x = <rsx> left_end_x = <rex> left_angle = <ra>
		setbuttondata player = <player> array = button_models color = orange angle = <oa> start_x = <osx> start_y = <starty> end_x = <oex> end_y = <highway_playline> left_start_x = <gsx> left_end_x = <gex> left_angle = <ga>
		setbuttondata player = <player> array = button_models color = white angle = <pa> start_x = <psx> start_y = <starty> end_x = <pex> end_y = <highway_playline> left_start_x = <psx> left_end_x = <pex> left_angle = <pa>
		setbuttondata player = <player> array = button_up_models color = green pos_x = <gex> pos_y = <highway_playline> left_pos_x = <oex>
		setbuttondata player = <player> array = button_up_models color = red pos_x = <rex> pos_y = <highway_playline> left_pos_x = <bex>
		setbuttondata player = <player> array = button_up_models color = yellow pos_x = <yex> pos_y = <highway_playline> left_pos_x = <yex>
		setbuttondata player = <player> array = button_up_models color = blue pos_x = <bex> pos_y = <highway_playline> left_pos_x = <rex>
		setbuttondata player = <player> array = button_up_models color = orange pos_x = <oex> pos_y = <highway_playline> left_pos_x = <gex>
		setbuttondata player = <player> array = button_up_models color = white pos_x = <pex> pos_y = <highway_playline> left_pos_x = <pex>
		setbuttondata player = <player> array = button_up_models color = extra pos_x = <pex1> pos_y = <highway_playline> left_pos_x = <pex2>
	endif
	fe = (<highway_playline> - (<pos_table>.highway_height))
	fs = (<fe> + (<pos_table>.highway_fade))
	setprojectspecificspriteparams highwaystartfade = <fs> highwayendfade = <fe> player = <player>
	stx = (0.0 - ((<pos_table>.highway_top_width) / 2.0))
	sbx = (0.0 - (<hbw> / 2.0))
	atan2 x = (<pos_table>.highway_height) y = (<stx> - <sbx>)
	vec_x = (<sbx> - <stx>)
	vec_y = (<pos_table>.highway_height)
	setarrayelement globalarray arrayname = sidebar_angle index = <pos_index> newvalue = <atan>
	setarrayelement globalarray arrayname = sidebar_x index = <pos_index> newvalue = ((<sbx> + (<vec_x> * 0.25)) - (<pos_table>.sidebar_x_offset))
	setarrayelement globalarray arrayname = sidebar_y index = <pos_index> newvalue = (<highway_playline> + (<vec_y> * 0.25))
	generatepostable rows = <rows> normal_rows = <normal_rows> starty = <starty> height = <height> heightoffsetfactor = <heightoffsetfactor> heightoffsetexp = <heightoffsetexp> pos_index = <pos_index>
	setrowheighttables player = (<pos_index> + 1)
endscript
