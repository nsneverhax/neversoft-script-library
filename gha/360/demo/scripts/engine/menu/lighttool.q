
script run_windows_light_tool_commands 
	getarraysize <commands>
	i = 0
	if (<array_size> > 0)
		begin
		(<commands> [<i>].scriptname) (<commands> [<i>].params)
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script global_fx_unlock_and_set_temp_tod 
	tod_manager_apply_perm_light_settings <...>
endscript
screenfx_instances_state = 1
screenfx_instances_default_state = [
	{
		name = null
	}
]

script toggle_screenfx_instances 
	if gotparam \{on}
		change \{screenfx_instances_state = 1}
	else
		if gotparam \{off}
			change \{screenfx_instances_state = 0}
		else
			if ($screenfx_instances_state = 1)
				change \{screenfx_instances_state = 0}
			else
				change \{screenfx_instances_state = 1}
			endif
		endif
	endif
	screenfx_getactivescreenfxinstances \{viewport = 0}
	if NOT isarray <curscreenfx>
		return
	endif
	getarraysize <curscreenfx>
	i = 0
	begin
	screenfx_updatefxinstanceparams {
		viewport = 0
		name = (<curscreenfx> [<i>].name)
		time = 0
		on = ($screenfx_instances_state)
	}
	i = (<i> + 1)
	repeat <array_size>
	save_current_screen_fx_setup
endscript

script start_viewer_screen_fx 
	printf \{"--- start_viewer_screen_fx"}
	screenfx_clearfxinstances \{viewport = 0}
	good_saved_screenfx_settings
	if (<is_good> = 0)
		printf \{"returned"}
		return
	endif
	printstruct ($screenfx_instances_default_state)
	temp = ($screenfx_instances_default_state)
	begin
	if getnextarrayelement <temp>
		screenfx_addfxinstance {
			viewport = 0
			<element>
		}
	else
		break
	endif
	repeat
endscript

script save_current_screen_fx_setup 
	printf \{"--- save_current_screen_fx_setup"}
	getpakmancurrent \{map = zones}
	if (<pak> = z_viewer)
		wait \{1
			second}
		screenfx_getactivescreenfxinstances \{viewport = 0}
		printstruct <...>
		change screenfx_instances_default_state = (<curscreenfx>)
	endif
endscript

script good_saved_screenfx_settings 
	printf \{"--- good_saved_screenfx_settings"}
	if NOT isarray ($screenfx_instances_default_state)
		printf \{"not array"}
		return \{is_good = 0}
	else
		if checksumequals a = (($screenfx_instances_default_state) [0].name) b = null
			printf \{"null"}
			return \{is_good = 0}
		endif
	endif
	return \{is_good = 1}
endscript

script applylightcolorchange 
	if iscreated <lightchecksum>
		<lightchecksum> :light_setparams <...> r = <red> g = <green> b = <blue>
	endif
endscript

script applylightintensitychange 
	if iscreated <lightchecksum>
		<lightchecksum> :light_setparams <...>
	endif
endscript

script applylightspecularintensitychange 
	if iscreated <lightchecksum>
		<lightchecksum> :light_setparams <...>
	endif
endscript

script applylightfarattenendchange 
endscript

script applylightfarattenstartchange 
endscript

script updatelighttransform 
	if iscreated <lightchecksum>
		setlightflag name = <lightchecksum> flag = dynamic
		movelight name = <lightchecksum> pos = <pos>
		clearlightflag name = <lightchecksum> flag = dynamic
		compactintervals
	endif
endscript

script applygroupintensitychange 
	setlightgroupintensity name = <groupchecksum> i = <intensity>
endscript

script applysnapshottolight 
	if gotparam \{lightchecksum}
		if iscreated <lightchecksum>
			<lightchecksum> :light_setparams <...>
		endif
	elseif gotparam \{housingchecksum}
		if iscreated <housingchecksum>
			if <housingchecksum> :obj_hascomponent positionmorph
				<housingchecksum> :pm_setparams <...>
			endif
			<housingchecksum> :lightvolume_setparams <...>
		endif
	endif
endscript

script updatehousingtransform 
	if iscreated <housingchecksum>
		if <housingchecksum> :obj_hascomponent positionmorph
			<housingchecksum> :pm_setparams <...>
		endif
	endif
endscript

script applyhousingstartradiuschange 
	if iscreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams <...>
	endif
endscript

script applyhousingendradiuschange 
	if iscreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams <...>
	endif
endscript

script applyhousinginnerradiuschange 
	if iscreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams <...>
	endif
endscript

script applyhousingrangechange 
	if iscreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams <...>
	endif
endscript

script applyhousingvolumedensitychange 
	if iscreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams <...>
	endif
endscript

script applyvolumecolorchange 
	if iscreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams {
			volumecolorred = <red>
			volumecolorgreen = <green>
			volumecolorblue = <blue>
		}
	endif
endscript

script applyprojectorcolorchange 
	if iscreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams {
			projectorcolorred = <red>
			projectorcolorgreen = <green>
			projectorcolorblue = <blue>
		}
	endif
endscript
