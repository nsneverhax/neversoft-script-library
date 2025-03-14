enablegoalpedwarnings = 0
displaygoalpedwarninglocations = 0
displayspawnnodes = 0
ShowObjectBudgetDetails = 1
enablescenewarnings = 0
ai_debug_display_interact = 1
ai_debug_display_spawn = 1
ai_debug_display_agents = 1
ai_debug_display_mission_peds = 0
ai_debug_display_goal_peds = 0
ai_debug_display_ambient_peds = 0
showforcedpedlocations = 0
showgoalpedlocations = 0
showambientpedlocations = 0
test_text0 = "This is test text for the guldern text block thing\\nTesting newline."
test_text1 = "Text Test 1 Testing wrapping Testing wrapping Testing wrapping Testing wrapping Testing wrapping"
test_text2 = "Blah\\nBlah\\nBlah"
ai_debug_indices = [
	{
		command = behavior_getdebugtext
		params = {
			hierarchy = order
		}
	}
	{
		command = behavior_getdebugtext
		params = {
			hierarchy = life
		}
	}
	{
		command = behavior_getdebugtext
		params = {
			hierarchy = reaction
		}
	}
	{
		command = behavior_getdebugtext
		params = {
			hierarchy = animation
		}
	}
	{
		command = behavior_getdebugtext
		params = {
			hierarchy = interact
		}
	}
	{
		command = behavior_getdebugtext
		params = {
			hierarchy = item
		}
	}
]

script hide_ai_debug 
	if screenelementexists \{id = ai_debug_text}
		destroyscreenelement \{id = ai_debug_text}
		killspawnedscript \{name = ai_debug_update}
	endif
endscript

script display_ai_debug 
	if screenelementexists id = ai_debug_text
		destroyscreenelement id = ai_debug_text
		killspawnedscript name = ai_debug_update
	endif
	setscreenelementlock id = player1_panel_container off
	if ($highdefviewer = 1)
		<this_text_scale> = 0.55
	else
		<this_text_scale> = $object_viewer_globalscale
	endif
	createscreenelement {
		id = ai_debug_text
		parent = root_window
		type = textblockelement
		font = text_a1
		scale = <this_text_scale>
		text = ""
		pos = (80.0, 30.0)
		dims = (1600.0, 1200.0)
		just = [left top]
		rgba = [255 255 255 255]
		shadow_offs = (1.0, 1.0)
		internal_just = [left top]
	}
	ai_debug_text :settags index = 0
	ai_debug_text :obj_spawnscriptlater ai_debug_update
endscript

script ai_debug_increment_index 
	if screenelementexists \{id = ai_debug_text}
		ai_debug_text :ai_debug_change_index \{up}
	endif
endscript

script ai_debug_decrement_index 
	if screenelementexists \{id = ai_debug_text}
		ai_debug_text :ai_debug_change_index \{down}
	endif
endscript

script ai_debug_change_index 
	getsingletag index
	getsingletag target
	AI_GetNumDebugScreen
	if gotparam up
		index = (<index> + 1)
		if ((<index> > <num_screens>) || (<index> = <num_screens>))
			index = 0
		endif
		settags index = <index>
	endif
	if gotparam down
		index = (<index> -1)
		if (<index> < 0)
			index = (<num_screens> -1)
		endif
		settags index = <index>
	endif
	if (<num_screens> > 0)
		AI_GetDebugText index = <index>
		setscreenelementprops id = ai_debug_text text = <text>
	else
		setscreenelementprops id = ai_debug_text text = "No debug text to display"
	endif
	doscreenelementmorph id = ai_debug_text alpha = 0
	doscreenelementmorph id = ai_debug_text alpha = 1 time = 0.2
endscript

script ai_debug_update 
	begin
	getsingletag \{index}
	getsingletag \{target}
	AI_GetNumDebugScreen
	if (<num_screens> > 0)
		AI_GetDebugText index = <index>
		setscreenelementprops id = ai_debug_text text = <text>
	else
		setscreenelementprops \{id = ai_debug_text
			text = "No debug text to display"}
	endif
	wait \{1
		gameframe}
	repeat
endscript

script AI_GetDebugText 
	Agent_GetSelected
	<target> = <selected>
	if NOT gotparam target
		return text = "no agent viewed"
	endif
	if NOT compositeobjectexists <target>
		return text = "no agent viewed"
	endif
	if NOT <target> :obj_hascomponent behaviorsystem
		return text = "no agent viewed"
	endif
	func = ($ai_debug_indices [<index>].command)
	params = ($ai_debug_indices [<index>].params)
	if gotparam target
		<target> :<func> <params>
	else
		<func> <params>
	endif
	return text = <text>
endscript

script AI_GetNumDebugScreen 
	getarraysize \{$ai_debug_indices}
	return num_screens = <array_size>
endscript
ai_ped_control_stats_displayed = 0
ai_ped_control_stats_num_lines = 17

script EnablePedStats 
	change \{ai_ped_control_stats_displayed = 1}
	enablepedtext
endscript

script enablepedtext 
	if screenelementexists id = ai_ped_control_stats_anchor
		destroyscreenelement id = ai_ped_control_stats_anchor
	endif
	setscreenelementlock id = root_window off
	createscreenelement {
		type = containerelement
		parent = root_window
		id = ai_ped_control_stats_anchor
		pos = (20.0, 200.0)
		just = [center center]
		internal_just = [left center]
	}
	if ($highdefviewer = 1)
		<scale> = $hi_def_object_viewer_globalscale
	endif
	if ($highdefviewer = 0)
		<scale> = $low_def_object_viewer_globalscale
	endif
	posoffset = ((0.0, 1.0) * 30)
	pos0 = ((30.0, 400.0) - (<posoffset> * ($ai_ped_control_stats_num_lines + 1)))
	default_creation_settings = {type = textelement
		parent = ai_ped_control_stats_anchor
		font = text_a1
		rgba = [60 60 200 255]
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
		just = [left center]
		scale = <scale>
		text = "None"
	}
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text1
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text2
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text3
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text4
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text5
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text6
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text7
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text8
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text9
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text10
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text11
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text12
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text13
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text14
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text15
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text16
		pos = <pos0>
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		<default_creation_settings>
		id = ai_stat_text17
		pos = <pos0>
	}
endscript

script updatepedstats 
	text = "test"
	setscreenelementprops id = ai_stat_text1 text = <text1>
	setscreenelementprops id = ai_stat_text2 text = <text2>
	setscreenelementprops id = ai_stat_text3 text = <text3>
	setscreenelementprops id = ai_stat_text4 text = <text4>
	setscreenelementprops id = ai_stat_text5 text = <text5>
	setscreenelementprops id = ai_stat_text6 text = <text6>
	setscreenelementprops id = ai_stat_text7 text = <text7>
	setscreenelementprops id = ai_stat_text8 text = <text8>
	setscreenelementprops id = ai_stat_text9 text = <text9>
	setscreenelementprops id = ai_stat_text10 text = <text10>
	setscreenelementprops id = ai_stat_text11 text = <text11>
	setscreenelementprops id = ai_stat_text12 text = <text12>
	setscreenelementprops id = ai_stat_text13 text = <text13>
	setscreenelementprops id = ai_stat_text14 text = <text14>
	setscreenelementprops id = ai_stat_text15 text = <text15>
	setscreenelementprops id = ai_stat_text16 text = <text16>
	setscreenelementprops id = ai_stat_text17 text = <text17>
endscript

script DisablePedStats 
	change \{ai_ped_control_stats_displayed = 0}
	disablepedtext
endscript

script disablepedtext 
	if screenelementexists id = ai_stat_text1
		destroyscreenelement id = ai_stat_text1
	endif
	if screenelementexists id = ai_stat_text2
		destroyscreenelement id = ai_stat_text2
	endif
	if screenelementexists id = ai_stat_text3
		destroyscreenelement id = ai_stat_text3
	endif
	if screenelementexists id = ai_stat_text4
		destroyscreenelement id = ai_stat_text4
	endif
	if screenelementexists id = ai_stat_text5
		destroyscreenelement id = ai_stat_text5
	endif
	if screenelementexists id = ai_stat_text6
		destroyscreenelement id = ai_stat_text6
	endif
	if screenelementexists id = ai_stat_text7
		destroyscreenelement id = ai_stat_text7
	endif
	if screenelementexists id = ai_stat_text8
		destroyscreenelement id = ai_stat_text8
	endif
	if screenelementexists id = ai_stat_text9
		destroyscreenelement id = ai_stat_text9
	endif
	if screenelementexists id = ai_stat_text10
		destroyscreenelement id = ai_stat_text10
	endif
	if screenelementexists id = ai_stat_text11
		destroyscreenelement id = ai_stat_text11
	endif
	if screenelementexists id = ai_stat_text12
		destroyscreenelement id = ai_stat_text12
	endif
	if screenelementexists id = ai_stat_text13
		destroyscreenelement id = ai_stat_text13
	endif
	if screenelementexists id = ai_stat_text14
		destroyscreenelement id = ai_stat_text14
	endif
	if screenelementexists id = ai_stat_text15
		destroyscreenelement id = ai_stat_text15
	endif
	if screenelementexists id = ai_stat_text16
		destroyscreenelement id = ai_stat_text16
	endif
endscript

script ViewPed 
	if NOT gotparam ped
		<ped> = player1
	endif
	if NOT gotparam pos
		<pos> = (0.0, 10.0, -5.0)
	endif
	goal_viewport_create {
		goal_string = 'ped_debug_viewport'
		lookat = <ped>
		lookatbone = bone_head
		lockto = <ped>
		locktobone = control_root
		pos = (0.0, 5.0, -5.0)
		quat = (0.0, -1.0, 0.0)
		vport_pos = (515.0, 80.0)
		vport_scale = (0.4 * (9.0, 9.0))
		viewport_style = viewport_element_square
		near_clip = 0.1
		far_clip = 75.0
		fov = 45
		skater_visible = 1
		tags = {ped = <ped>}
	}
endscript
