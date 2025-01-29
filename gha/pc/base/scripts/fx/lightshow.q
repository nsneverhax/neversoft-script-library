lightshow_enabled = 1
lightvolume_flarecutoff_low = 0.2
lightvolume_flarecutoff_high = 0.35000002
lightvolume_flarematerialcrc = flarematerial_flarematerial
lightvolume_flaresaturate = 0.6
lightvolume_follow = {
	allowedradius = {
		amplitude = 0.2
		center = 1.0
		periodbase = 0.0065
		periodmultiples = [
			1
			3
			4
			7
		]
	}
	driftlerpmap = [
		(0.0, 0.4)
		(0.2, 0.7)
	]
}
lightshow_spotlightoverrides = {
	fade_time = 0.5
	snapshot_names_to_search = [
		solo01
	]
	default_params = {
		startradius = 0.3
		endradius = 1.5
		innerradius = 0.0
		range = 7.36
		volumedensity = 0.6442
		projectorcolorred = 170.0
		projectorcolorgreen = 170.0
		projectorcolorblue = 170.0
		volumecolorred = 255.0
		volumecolorgreen = 255.0
		volumecolorblue = 255.0
	}
}
lightshow_defaultblendtime = 0.15
lightshow_coloroverrideblend = 0.4
lightshow_offset_ms = 100
lightshow_housingmodels = [
	{
		model = 'LightHousings\\GO_NoHousing01\\GO_NoHousing01.mdl'
		clonesrc = ls_go_nohousing01
	}
	{
		model = 'LightHousings\\GO_NoHousing01_Flare01\\GO_NoHousing01_Flare01.mdl'
		clonesrc = ls_go_nohousing01_flare01
	}
	{
		model = 'LightHousings\\GO_NoHousing01_SmallFlare01\\GO_NoHousing01_SmallFlare01.mdl'
		clonesrc = ls_go_nohousing01_smallflare01
	}
	{
		model = 'LightHousings\\GO_BarnHousing01\\GO_BarnHousing01.mdl'
		clonesrc = ls_go_barnhousing01
	}
	{
		model = 'LightHousings\\GO_LightHousing01\\GO_LightHousing01.mdl'
		clonesrc = ls_go_lighthousing01
	}
	{
		model = 'LightHousings\\GO_LightHousing01_SmallFlare01\\GO_LightHousing01_SmallFlare01.mdl'
		clonesrc = ls_go_lighthousing01_smallflare01
	}
	{
		model = 'LightHousings\\GO_LightHousing02\\GO_LightHousing02.mdl'
		clonesrc = ls_go_lighthousing02
	}
	{
		model = 'LightHousings\\GO_LightHousing02_SmallFlare01\\GO_LightHousing02_SmallFlare01.mdl'
		clonesrc = ls_go_lighthousing02_smallflare01
	}
	{
		model = 'LightHousings\\GO_LightHousing02_Small01\\GO_LightHousing02_Small01.mdl'
		clonesrc = ls_go_lighthousing02_small01
	}
	{
		model = 'LightHousings\\GO_TankHousing01\\GO_TankHousing01.mdl'
		clonesrc = ls_go_tankhousing01
	}
]

script lightshow_createpermmodels 
	getarraysize \{$lightshow_housingmodels}
	<i> = 0
	begin
	<desc> = ($lightshow_housingmodels [<i>])
	<model> = (<desc>.model)
	<pos> = ((-100.0, 300.0) + <i> * (0.0, 10.0))
	<src> = (<desc>.clonesrc)
	createcompositeobject {
		components = [
			{
				component = model
				model = <model>
			}
		]
		params = {
			pos = <pos>
			name = <src>
		}
	}
	<src> :hide
	<src> :obj_forceupdate
	<src> :suspend
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script ls_alloff 
	killspawnedscript \{id = lightshow}
endscript

script ls_setupvenuelights 
endscript

script ls_resetvenuelights 
	ls_alloff
	ls_killfx
	getpakmancurrent \{map = zones}
endscript

script ls_killfx 
endscript
lightshow_coloroverrides = {
	red = (255.0, 0.0, 0.0)
	blue = (20.0, 132.0, 247.0)
	yellow = (252.0, 227.0, 61.0)
	white = (255.0, 255.0, 255.0)
	magenta = (240.0, 79.0, 255.0)
	green = (66.0, 228.0, 97.0)
	purple = (162.0, 80.0, 232.0)
	orange = (248.0, 142.0, 56.0)
}
lightshow_coloroverrideexcludelights = [
	z_hof_gfx_l_band_ambient01
	z_hof_gfx_l_band_guitarist_spot01
	z_hof_gfx_l_band_up_direct01
	z_hof_gfx_l_crowd_ambient01
	z_hof_gfx_l_stage_ambient01
	z_hof_gfx_l_stage_up_direct01
	z_maxskc_gfx_l_ambient01
	z_maxskc_gfx_l_band_ambient01
	z_maxskc_gfx_l_band_guitarist_spot01
	z_maxskc_gfx_l_band_up_direct01
	z_maxskc_gfx_l_crowd_ambient01
	z_maxskc_gfx_l_stage_dancer_omni01
	z_maxskc_gfx_l_stage_up_direct01
	z_maxskc_gfx_vc_arcade_omni01
	z_maxskc_gfx_vc_bathroom_omni01
	z_maxskc_gfx_vc_bathroom_omni02
	z_maxskc_gfx_vc_corner_omni01
	z_maxskc_gfx_vc_exit_omni01
	z_maxskc_gfx_vc_exit_omni02
	z_maxskc_gfx_vc_fill_omni01
	z_maxskc_gfx_vc_neon_omni01
	z_maxskc_gfx_vc_periph_back_direct01
	z_maxskc_gfx_vc_periph_back_direct02
	z_nine_lives_gfx_l_band_ambient01
	z_nine_lives_gfx_l_band_guitarist_spot01
	z_nine_lives_gfx_l_band_up_direct01
	z_nine_lives_gfx_l_crowd_ambient01
	z_nine_lives_gfx_l_neonsigns_ambient01
	z_nine_lives_gfx_l_periph_ambient01
	z_nine_lives_gfx_l_periph_up_direct01
	z_nine_lives_gfx_l_stage_ambient01
	z_nine_lives_gfx_l_stage_up_direct01
	z_nine_lives_gfx_vc_flames_omni01
	z_nine_lives_gfx_vc_flames_omni02
	z_nine_lives_gfx_vc_flames_omni03
	z_nine_lives_gfx_vc_flames_omni04
	z_nipmuc_gfx_l_band_back_direct01
	z_nipmuc_gfx_l_band_center_direct01
	z_nipmuc_gfx_l_stage_back_direct01
	z_nipmuc_gfx_l_stage_center_direct01
	z_nipmuc_gfx_trg_flare_back01
	z_nipmuc_gfx_trg_flare_center01
	z_nipmuc_gfx_trg_flare_chimney01
	z_nipmuc_gfx_trg_flare_chimney02
	z_nipmuc_gfx_trg_flare_chimney03
	z_nipmuc_gfx_vc_viewer_ambient01
	z_nipmuc_gfx_vc_viewer_center_direct01
	z_nipmuc_gfx_vc_viewer_left_direct01
	z_nipmuc_gfx_vc_viewer_left_direct02
	z_nipmuc_gfx_vc_viewer_right_direct01
	z_nipmuc_gfx_vc_viewer_right_direct02
	z_nipmuc_gfx_vc_viewer_up_direct01
]
lightshow_statenodeflags = [
	ls_perf_poor
	ls_perf_medium
	ls_perf_good
	ls_perf_poor_medium
	ls_perf_medium_good
	ls_perf_poor_medium_good
	ls_perf_poor_noblackout
	ls_perf_medium_noblackout
	ls_perf_good_noblackout
	ls_perf_poor_medium_noblackout
	ls_perf_medium_good_noblackout
	ls_perf_poor_medium_good_noblackout
	ls_perf_poor_blackout
	ls_perf_medium_blackout
	ls_perf_good_blackout
	ls_perf_poor_medium_blackout
	ls_perf_medium_good_blackout
	ls_perf_poor_medium_good_blackout
	ls_mood_blackout
	ls_mood_flare
	ls_mood_strobe
	ls_mood_special
]
lightshow_statenodeflagmapping = {
	performance = {
		poor = [
			{
				ls_perf_poor
				1
			}
			{
				ls_perf_poor_medium
				1
			}
			{
				ls_perf_poor_medium_good
				1
			}
			{
				ls_perf_poor_noblackout
				1
			}
			{
				ls_perf_poor_medium_noblackout
				1
			}
			{
				ls_perf_poor_medium_good_noblackout
				1
			}
			{
				ls_perf_poor_blackout
				1
			}
			{
				ls_perf_poor_medium_blackout
				1
			}
			{
				ls_perf_poor_medium_good_blackout
				1
			}
		]
		medium = [
			{
				ls_perf_poor_medium
				1
			}
			{
				ls_perf_medium
				1
			}
			{
				ls_perf_medium_good
				1
			}
			{
				ls_perf_poor_medium_good
				1
			}
			{
				ls_perf_poor_medium_noblackout
				1
			}
			{
				ls_perf_medium_noblackout
				1
			}
			{
				ls_perf_medium_good_noblackout
				1
			}
			{
				ls_perf_poor_medium_good_noblackout
				1
			}
			{
				ls_perf_poor_medium_blackout
				1
			}
			{
				ls_perf_medium_blackout
				1
			}
			{
				ls_perf_medium_good_blackout
				1
			}
			{
				ls_perf_poor_medium_good_blackout
				1
			}
		]
		good = [
			{
				ls_perf_medium_good
				1
			}
			{
				ls_perf_good
				1
			}
			{
				ls_perf_poor_medium_good
				1
			}
			{
				ls_perf_medium_good_noblackout
				1
			}
			{
				ls_perf_good_noblackout
				1
			}
			{
				ls_perf_poor_medium_good_noblackout
				1
			}
			{
				ls_perf_medium_good_blackout
				1
			}
			{
				ls_perf_good_blackout
				1
			}
			{
				ls_perf_poor_medium_good_blackout
				1
			}
		]
	}
	mood = {
		blackout = [
			{
				ls_mood_blackout
				1
			}
			{
				ls_perf_poor_blackout
				0
			}
			{
				ls_perf_medium_blackout
				0
			}
			{
				ls_perf_good_blackout
				0
			}
			{
				ls_perf_poor_medium_blackout
				0
			}
			{
				ls_perf_medium_good_blackout
				0
			}
			{
				ls_perf_poor_medium_good_blackout
				0
			}
		]
		flare = [
			{
				ls_mood_flare
				1
			}
			{
				ls_perf_poor_blackout
				0
			}
			{
				ls_perf_medium_blackout
				0
			}
			{
				ls_perf_good_blackout
				0
			}
			{
				ls_perf_poor_medium_blackout
				0
			}
			{
				ls_perf_medium_good_blackout
				0
			}
			{
				ls_perf_poor_medium_good_blackout
				0
			}
		]
		strobe = [
			{
				ls_mood_strobe
				1
			}
		]
	}
}
lightshow_notemapping = [
	{
		midinote = 76
		scr = lightshow_setparams
		params = {
			mood = intro
		}
	}
	{
		midinote = 75
		scr = lightshow_setparams
		params = {
			mood = verse
		}
	}
	{
		midinote = 74
		scr = lightshow_setparams
		params = {
			mood = chorus
		}
	}
	{
		midinote = 73
		scr = lightshow_setparams
		params = {
			mood = solo
		}
	}
	{
		midinote = 72
		scr = lightshow_setparams
		params = {
			mood = blackout
		}
	}
	{
		midinote = 71
		scr = lightshow_setparams
		params = {
			mood = flare
		}
	}
	{
		midinote = 70
		scr = lightshow_setparams
		params = {
			mood = strobe
		}
	}
	{
		midinote = 69
		scr = lightshow_overridecolor
		params = {
			color = green
		}
	}
	{
		midinote = 68
		scr = lightshow_overridecolor
		params = {
			color = red
		}
	}
	{
		midinote = 67
		scr = lightshow_overridecolor
		params = {
			color = blue
		}
	}
	{
		midinote = 66
		scr = lightshow_overridecolor
		params = {
			color = yellow
		}
	}
	{
		midinote = 65
		scr = lightshow_overridecolor
		params = {
			color = white
		}
	}
	{
		midinote = 64
		scr = lightshow_overridecolor
		params = {
			color = magenta
		}
	}
	{
		midinote = 63
		scr = lightshow_overridecolor
		params = {
			off
		}
	}
	{
		midinote = 62
		scr = lightshow_overridecolor
		params = {
			color = orange
		}
	}
	{
		midinote = 61
		scr = lightshow_overridecolor
		params = {
			color = purple
		}
	}
	{
		midinote = 60
		event = strobetoggle
		params = {
			usesnapshotpositions = false
		}
	}
	{
		midinote = 58
		event = snapshotchange
		params = {
			usesnapshotpositions = true
		}
	}
	{
		midinote = 57
		event = snapshotchange
		params = {
			usesnapshotpositions = false
		}
	}
	{
		midinote = 56
		scr = lightshow_pyroevent
		params = {
		}
	}
	{
		midinote = 53
		scr = lightshow_settime
		params = {
			time = 1.0
		}
	}
	{
		midinote = 52
		scr = lightshow_settime
		params = {
			time = 0.9
		}
	}
	{
		midinote = 51
		scr = lightshow_settime
		params = {
			time = 0.8
		}
	}
	{
		midinote = 50
		scr = lightshow_settime
		params = {
			time = 0.7
		}
	}
	{
		midinote = 49
		scr = lightshow_settime
		params = {
			time = 0.6
		}
	}
	{
		midinote = 48
		scr = lightshow_settime
		params = {
			time = 0.5
		}
	}
	{
		midinote = 47
		scr = lightshow_settime
		params = {
			time = 0.4
		}
	}
	{
		midinote = 46
		scr = lightshow_settime
		params = {
			time = 0.3
		}
	}
	{
		midinote = 45
		scr = lightshow_settime
		params = {
			time = 0.25
		}
	}
	{
		midinote = 44
		scr = lightshow_settime
		params = {
			time = 0.2
		}
	}
	{
		midinote = 43
		scr = lightshow_settime
		params = {
			time = 0.15
		}
	}
	{
		midinote = 42
		scr = lightshow_settime
		params = {
			time = 0.1
		}
	}
	{
		midinote = 41
		scr = lightshow_settime
		params = {
			time = 0.05
		}
	}
	{
		midinote = 40
		scr = lightshow_settime
		params = {
			time = 0.0
		}
	}
	{
		midinote = 39
		scr = lightshow_settime
		params = {
			`default`
		}
	}
]
lightshow_sharedprocessors = [
	{
		name = poor_generic
		screnter = lightshow_poor_enter
		screvent = lightshow_poor_event
		screxit = lightshow_poor_exit
	}
	{
		name = intro_generic
		screnter = lightshow_genericmood_enter
		screvent = lightshow_genericmood_event
		screxit = lightshow_genericmood_exit
	}
	{
		name = verse_generic
		screnter = lightshow_genericmood_enter
		screvent = lightshow_genericmood_event
		screxit = lightshow_genericmood_exit
	}
	{
		name = chorus_generic
		screnter = lightshow_genericmood_enter
		screvent = lightshow_genericmood_event
		screxit = lightshow_genericmood_exit
	}
	{
		name = solo_generic
		screnter = lightshow_genericmood_enter
		screvent = lightshow_genericmood_event
		screxit = lightshow_genericmood_exit
	}
	{
		name = fail_generic
		screnter = lightshow_genericmood_enter
		screvent = lightshow_genericmood_event
		screxit = lightshow_genericmood_exit
	}
	{
		name = win_generic
		screnter = lightshow_genericmood_enter
		screvent = lightshow_genericmood_event
		screxit = lightshow_genericmood_exit
	}
	{
		name = blackout_generic
		screnter = lightshow_blackout_enter
		screvent = lightshow_blackout_event
		screxit = lightshow_blackout_exit
	}
	{
		name = flare_generic
		screnter = lightshow_flare_enter
		screvent = lightshow_flare_event
		screxit = lightshow_flare_exit
	}
	{
		name = strobe_generic
		screnter = lightshow_strobe_enter
		screvent = lightshow_strobe_event
		screxit = lightshow_strobe_exit
	}
]

script lightshow_iterator 
	printf "LightShow Iterator started with time %d" d = <time_offset>
	lightshow_setactive \{active = false}
	if ($lightshow_enabled = 0)
		printf \{"LIGHTSHOW DISABLED: By script variable"}
		return
	endif
	get_song_prefix song = <song_name>
	formattext checksumname = event_array '%s_lightshow_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		printf \{"LIGHTSHOW DISABLED: No midi events found for this song"}
		return
	endif
	if NOT lightshow_initeventmappings <...>
		return
	endif
	array_entry = 0
	fretbar_count = 0
	getarraysize $<event_array>
	getsongtimems time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
		array_size = (<array_size> - <array_entry>)
		if NOT (<array_size> = 0)
			begin
			timemarkerreached_setparams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> arrayofarrays
			begin
			lightshow_update
			if timemarkerreached
				getsongtimems time_offset = <time_offset>
				break
			endif
			wait \{1
				gameframe}
			repeat
			timemarkerreached_clearparams
			if lightshow_beginprocessblock {time = ($<event_array> [<array_entry>] [0])
					note = ($<event_array> [<array_entry>] [1])
					length = ($<event_array> [<array_entry>] [2])}
				switch <process_mode>
					case event
					lightshow_passevent
					case scr
					<eventscr> <eventparams>
				endswitch
				lightshow_endprocessblock
			endif
			<array_entry> = (<array_entry> + 1)
			repeat <array_size>
		endif
	endif
endscript

script lightshow_pyroevent 
	if lightshow_getpyroscript
		lightshow_getparams
		<pyro_script> performance = <performance>
	else
		printf \{"pyro!"}
	endif
endscript

script lightshow_poor_enter 
	lightshow_cyclenextsnapshot \{usesnapshotpositions = true
		save = true}
endscript

script lightshow_poor_exit 
endscript

script lightshow_poor_event 
	begin
	lightshow_waitfornextevent \{events = [
			snapshotchange
		]}
	repeat
endscript

script lightshow_genericmood_enter 
	lightshow_cyclenextsnapshot \{usesnapshotpositions = true
		save = true}
endscript

script lightshow_genericmood_exit 
endscript

script lightshow_genericmood_event 
	begin
	lightshow_waitfornextevent \{events = [
			snapshotchange
		]}
	lightshow_cyclenextsnapshot usesnapshotpositions = <usesnapshotpositions> save = true
	repeat
endscript

script lightshow_blackout_enter 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_training
		case z_viewer
		lightshow_appendsnapshotparams \{intensity = 0.25
			specularintensity = 0.25}
	endswitch
	lightshow_cyclenextsnapshot \{save = false
		usesnapshotpositions = true}
endscript

script lightshow_blackout_event 
endscript

script lightshow_blackout_exit 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_training
		case z_viewer
		lightshow_appendsnapshotparams \{clear}
	endswitch
endscript

script lightshow_flare_enter 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_training
		case z_viewer
		lightshow_appendsnapshotparams \{intensity = 0.25
			specularintensity = 0.25}
	endswitch
	lightshow_cyclenextsnapshot \{save = false
		usesnapshotpositions = true}
endscript

script lightshow_flare_event 
endscript

script lightshow_flare_exit 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_training
		case z_viewer
		lightshow_appendsnapshotparams \{clear}
	endswitch
endscript

script lightshow_strobe_enter 
	lightshow_settime \{enable = false}
endscript

script lightshow_strobe_event 
	lightshow_getparams
	<original_snapshot> = <previous_snapshot>
	begin
	lightshow_cyclenextsnapshot \{usesnapshotpositions = false
		save = false}
	lightshow_waitfornextevent \{events = [
			strobetoggle
		]}
	lightshow_appendsnapshotparams \{intensity = 1.0}
	if gotparam \{original_snapshot}
		lightshow_playsnapshot name = <original_snapshot> save = false usesnapshotpositions = false
	else
		lightshow_cyclenextsnapshot \{usesnapshotpositions = false
			save = true}
	endif
	lightshow_waitfornextevent \{events = [
			strobetoggle
		]}
	repeat
endscript

script lightshow_strobe_exit 
	lightshow_appendsnapshotparams \{clear}
	lightshow_settime \{enable = true}
endscript

script lightshow_addnodeflags 
	getarraysize \{$lightshow_statenodeflags}
	<i> = 0
	begin
	createnodeflag ($lightshow_statenodeflags [<i>])
	<i> = (<i> + 1)
	repeat <array_size>
	createnodeflag \{ls_always}
	createnodeflag \{ls_3_5_pre}
	createnodeflag \{ls_3_5_post}
	createnodeflag \{ls_encore_pre}
	createnodeflag \{ls_encore_post}
	createnodeflag \{ls_spotlight_guitarist}
	createnodeflag \{ls_spotlight_bassist}
	createnodeflag \{ls_perry_mic}
endscript

script lightshow_initeventmappings 
	lightshow_appendsnapshotparams \{clear}
	lightshow_overridecolor \{off}
	lightshow_settime \{`default`
		enable = true}
	changenodeflag \{ls_spotlight_guitarist
		1}
	if ($current_num_players = 1)
		changenodeflag \{ls_spotlight_bassist
			0}
	else
		changenodeflag \{ls_spotlight_bassist
			1}
	endif
	getpakmancurrentname \{map = zones}
	formattext checksumname = event_struct '%s_lightshow_mapping' s = <pakname> addtostringlookup
	formattext checksumname = snapshot_struct '%s_snapshots' s = <pakname> addtostringlookup
	formattext checksumname = processors_struct '%s_lightshow_processors' s = <pakname> addtostringlookup
	if NOT globalexists name = <event_struct> type = structure
		printf \{"LIGHTSHOW DISABLED: No event mapping found for this venue"}
		printstruct <...>
		return \{false}
	endif
	if NOT globalexists name = <snapshot_struct> type = structure
		printf \{"LIGHTSHOW DISABLED: No snapshots found for this venue"}
		printstruct <...>
		return \{false}
	endif
	if globalexists name = <processors_struct> type = array
		printf \{"LIGHTSHOW: Adding venue processor definitions"}
		lightshow_setprocessors venue = $<processors_struct>
	endif
	lightshow_setmapping ($<event_struct>)
	lightshow_setactive \{active = true}
	lightshow_setparams {
		performance = medium
		mood = intro
		venuesnapshots = $<snapshot_struct>
	}
	lightshow_refreshspotlightoverrideparams
	if NOT ($debug_forcescore = off)
		crowdincrease \{player_status = player1_status}
	endif
	return \{true}
endscript

script lightshow_shutdown 
	printf \{"LightShow_Shutdown starting"}
	lightshow_setactive \{active = false}
	lightshow_setprocessors \{clear}
	lightshow_setmapping \{clear}
	killspawnedscript \{name = lightshow_iterator}
	killspawnedscript \{id = lightshow}
	killspawnedscript \{id = screenflash}
	printf \{"LightShow_Shutdown finished"}
endscript

script kill_lightshow_fx 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_wikker
		destroyparticlesbygroupid \{groupid = z_wikker_fx}
		deleteteslaeffectobject \{name = z_wikker_teslafx11}
		deleteteslaeffectobject \{name = z_wikker_teslafx12}
		deleteteslaeffectobject \{name = z_wikker_teslafx13}
		deleteteslaeffectobject \{name = z_wikker_teslafx21}
		deleteteslaeffectobject \{name = z_wikker_teslafx22}
		deleteteslaeffectobject \{name = z_wikker_teslafx23}
		deleteteslaeffectobject \{name = z_wikker_encore_teslafx1}
		deleteteslaeffectobject \{name = z_wikker_encore_teslafx2}
		deleteteslaeffectobject \{name = z_wikker_encore_teslafx3}
	endswitch
endscript

script lightshow_waitandenablespotlights 
	requireparams \{[
			enable
			time
		]
		all}
	printf "LightShow - spotlight toggle %s" s = <enable>
	wait <time> seconds
	lightshow_enablespotlights <enable>
endscript

script venue_pulseonevents \{amount = 1.12
		time = 0.1}
	if gotparam \{delay}
		requireparams \{[
				events
			]
			all}
		obj_enablescaling
		obj_getscaling
		<start_scale> = <scaling>
		<end_scale> = (<scaling> * <amount>)
		begin
		block anytypes = <events>
		wait <delay> seconds
		obj_applyscaling scale = <end_scale>
		wait \{1
			gameframes}
		obj_morphscaling target_scale = <start_scale> blend_duration = <time>
		repeat
	else
		addpulseevent events = <events> amount = <amount> time = <time>
	endif
endscript

script venue_pulsegreen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
		]}
endscript

script venue_pulsered 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_red
		]}
endscript

script venue_pulseyellow 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_yellow
		]}
endscript

script venue_pulseblue 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_blue
		]}
endscript

script venue_pulseorange 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_orange
		]}
endscript

script venue_pulseopen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
endscript

script venue_pulsedrumleft 
	setspawninstancelimits \{max = 2
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			drumkick_left
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script venue_pulsedrumright 
	setspawninstancelimits \{max = 2
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			drumkick_right
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script venue_pulsedrumboth 
	setspawninstancelimits \{max = 4
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			drumkick_left
			drumkick_right
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script venue_pulseany 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
			hitnote_red
			hitnote_yellow
			hitnote_blue
			hitnote_orange
		]}
endscript

script venue_pulsegreenred 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
			hitnote_red
		]}
endscript

script venue_pulsegreenyellow 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
			hitnote_yellow
		]}
endscript

script venue_pulsegreenblue 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
			hitnote_blue
		]}
endscript

script venue_pulsegreenorange 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
			hitnote_orange
		]}
endscript

script venue_pulsegreenopen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_green
		]}
endscript

script venue_pulseredyellow 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_red
			hitnote_yellow
		]}
endscript

script venue_pulseredblue 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_red
			hitnote_blue
		]}
endscript

script venue_pulseredorange 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_red
			hitnote_orange
		]}
endscript

script venue_pulseredopen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_red
		]}
endscript

script venue_pulseyellowblue 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_yellow
			hitnote_blue
		]}
endscript

script venue_pulseyelloworange 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_yellow
			hitnote_orange
		]}
endscript

script venue_pulseyellowopen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_yellow
		]}
endscript

script venue_pulseblueorange 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_blue
			hitnote_orange
		]}
endscript

script venue_pulseblueopen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_blue
		]}
endscript

script venue_pulseorangeopen 
	setspawninstancelimits \{max = 8
		management = ignore_spawn_request}
	venue_pulseonevents \{events = [
			hitnote_orange
		]}
endscript
