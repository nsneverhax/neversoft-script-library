
script ui_aidebug_create 
	do_actual_pause debug_mode = true
	make_cas_menu {
		scrolling
		no_bg
		title = "AI DEBUG"
		pad_back_script = ui_change_state
		pad_back_params = {state = uistate_gameplay}
		title_pos = (444.0, 82.0)
		title_bg_pos = (412.0, 52.0)
		desired_width = 730
		scroll_bar_offset = (545.0, 0.0)
		pos = (500.0, 120.0)
		mask_pos = (455.0, 100.0)
	}
	add_cas_menu_item text = "DEBUG NEAREST AGENT" pad_choose_script = ui_aidebug_create_agent_nearest
	add_cas_menu_item text = "CREATE TESTPED" pad_choose_script = RecreatePed
	add_cas_menu_item text = "CREATE SKATER TESTPED" pad_choose_script = RecreatePed pad_choose_params = {profile = $Profile_Test_Skater}
	ui_aidebug_get_toggle global = $enablegoalpedwarnings
	add_cas_menu_item text = "GOAL PED WARNINGS" toggle = <toggle> toggle_script = ui_aidebug_toggle_goalpedwarnings
	ui_aidebug_get_toggle global = $ai_ped_control_stats_displayed
	add_cas_menu_item text = "TOGGLE PED STATS" toggle = <toggle> toggle_script = ui_aidebug_toggle_pedstats
	ui_aidebug_get_toggle global = $ai_debug_display_spawn
	add_cas_menu_item text = "SHOW SPAWN NODES" toggle = <toggle> toggle_script = ui_aidebug_toggle_display_spawn
	ui_aidebug_get_toggle global = $ai_debug_display_interact
	add_cas_menu_item text = "SHOW INTERACT NODES" toggle = <toggle> toggle_script = ui_aidebug_toggle_display_interact
	ui_aidebug_get_toggle global = $ai_debug_display_mission_peds
	add_cas_menu_item text = "SHOW MISSION PEDS" toggle = <toggle> toggle_script = ui_aidebug_toggle_display_mission_peds
	ui_aidebug_get_toggle global = $ai_debug_display_goal_peds
	add_cas_menu_item text = "SHOW GOAL PEDS" toggle = <toggle> toggle_script = ui_aidebug_toggle_display_goal_peds
	ui_aidebug_get_toggle global = $ai_debug_display_ambient_peds
	add_cas_menu_item text = "SHOW AMBIENT PEDS" toggle = <toggle> toggle_script = ui_aidebug_toggle_display_ambient_peds
	add_cas_menu_item text = "DONE" pad_choose_script = ui_change_state pad_choose_params = {state = uistate_gameplay}
	cas_menu_finish
endscript

script ui_aidebug_get_toggle 
	if (<global> = 1)
		return \{toggle = on}
	else
		return \{toggle = off}
	endif
endscript

script ui_aidebug_toggle_display_spawn 
	if ($ai_debug_display_spawn = 1)
		change \{ai_debug_display_spawn = 0}
	else
		change \{ai_debug_display_spawn = 1}
	endif
endscript

script ui_aidebug_toggle_display_interact 
	if ($ai_debug_display_interact = 1)
		change \{ai_debug_display_interact = 0}
	else
		change \{ai_debug_display_interact = 1}
	endif
endscript

script ui_aidebug_toggle_display_mission_peds 
	if ($ai_debug_display_mission_peds = 1)
		change \{ai_debug_display_mission_peds = 0}
	else
		change \{ai_debug_display_mission_peds = 1}
	endif
endscript

script ui_aidebug_toggle_display_goal_peds 
	if ($ai_debug_display_goal_peds = 1)
		change \{ai_debug_display_goal_peds = 0}
	else
		change \{ai_debug_display_goal_peds = 1}
	endif
endscript

script ui_aidebug_toggle_display_ambient_peds 
	if ($ai_debug_display_ambient_peds = 1)
		change \{ai_debug_display_ambient_peds = 0}
	else
		change \{ai_debug_display_ambient_peds = 1}
	endif
endscript

script ui_aidebug_stub 
	printf \{"This doesn't actually do anything"}
endscript

script ui_aidebug_toggle_goalpedwarnings 
	if ($enablegoalpedwarnings = 1)
		change \{enablegoalpedwarnings = 0}
		change \{displaygoalpedwarninglocations = 0}
	else
		change \{enablegoalpedwarnings = 1}
		change \{displaygoalpedwarninglocations = 1}
	endif
endscript

script ui_aidebug_toggle_pedstats 
	if ($ai_ped_control_stats_displayed = 1)
		DisablePedStats
	else
		EnablePedStats
	endif
endscript

script ui_aidebug_destroy 
	do_actual_unpause
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
endscript

script ui_aidebug_create_interactionnode 
	do_actual_pause debug_mode = true
	make_cas_menu {
		scrolling
		no_bg
		title = "INTERACTION DEBUG"
		pad_back_script = ui_change_state
		pad_back_params = {state = uistate_gameplay}
		title_pos = (444.0, 82.0)
		title_bg_pos = (412.0, 52.0)
		desired_width = 730
		scroll_bar_offset = (545.0, 0.0)
		pos = (500.0, 100.0)
		mask_pos = (455.0, 80.0)
	}
	add_cas_menu_item text = "USE NODE" pad_choose_script = ui_aidebug_use_node
	add_cas_menu_item text = "DONE" pad_choose_script = ui_change_state pad_choose_params = {state = uistate_gameplay}
	cas_menu_finish
endscript

script ui_aidebug_use_node 
	RecreatePed
	TestPed :ai_giveorder \{name = Bv_Agent_Life}
	TestPed :interact_forceusenode name = ($ai_viewer_selected_obj)
endscript

script ui_aidebug_create_spawnnode 
	do_actual_pause debug_mode = true
	make_cas_menu {
		scrolling
		no_bg
		title = "SPAWN NODE DEBUG"
		pad_back_script = ui_change_state
		pad_back_params = {state = uistate_gameplay}
		title_pos = (444.0, 82.0)
		title_bg_pos = (412.0, 52.0)
		desired_width = 730
		scroll_bar_offset = (545.0, 0.0)
		pos = (500.0, 100.0)
		mask_pos = (455.0, 80.0)
	}
	add_cas_menu_item text = "CREATE TESTPED AT NODE" pad_choose_script = ui_aidebug_create_testped_at_node pad_choose_params = {profile = $Profile_Test}
	add_cas_menu_item text = "CREATE SKATER TESTPED AT NODE" pad_choose_script = ui_aidebug_create_testped_at_node pad_choose_params = {profile = $Profile_Test_Skater}
	add_cas_menu_item text = "DONE" pad_choose_script = ui_change_state pad_choose_params = {state = uistate_gameplay}
	cas_menu_finish
endscript

script ui_aidebug_create_testped_at_node 
	if ($ai_viewer_selected_obj = null)
		softassert "No object selected or object is not a spawn node"
		return
	endif
	if (compositeobjectexists TestPed)
		TestPed :die
	endif
	spawn_node_name = ($ai_viewer_selected_obj)
	new_ped = {
		name = TestPed
		priority = $coim_priority_permanent
		ped_type = mission
		spawn_node_name = ($ai_viewer_selected_obj)
	}
	SpawnAmbientObject <new_ped>
endscript

script ui_aidebug_create_agent 
	<obj_id> = ($ai_viewer_selected_obj)
	if NOT gotparam obj_id
		return
	endif
	do_actual_pause debug_mode = true
	formattext textname = title dontassertforchecksums "AGENT DEBUG: %a" a = ($ai_viewer_selected_obj)
	make_cas_menu {
		scrolling
		no_bg
		title = <title>
		pad_back_script = ui_change_state
		pad_back_params = {state = uistate_gameplay}
		title_pos = (424.0, 82.0)
		title_bg_pos = (412.0, 52.0)
		desired_width = 730
		scroll_bar_offset = (545.0, 0.0)
		pos = (500.0, 100.0)
		mask_pos = (455.0, 80.0)
	}
	<display_eventcache_toggle> = off
	<display_navigation_toggle> = off
	<display_interests_toggle> = off
	if ($toggle_nav_view_mode = 0)
		<display_hierarchies_toggle> = off
	else
		<display_hierarchies_toggle> = on
	endif
	<obj_id> :gettags
	add_cas_menu_item text = "DISPLAY HIERARCHIES" toggle = <display_hierarchies_toggle> toggle_script = ui_aidebug_display_hierarchies
	add_cas_menu_item text = "DISPLAY EVENTCACHE" toggle = <display_eventcache_toggle> toggle_script = ui_aidebug_toggle_display_eventcache
	add_cas_menu_item text = "DISPLAY NAVIGATION" toggle = <display_navigation_toggle> toggle_script = ui_aidebug_toggle_navigation
	add_cas_menu_item text = "DISPLAY INTERESTS" toggle = <display_interests_toggle> toggle_script = ui_aidebug_toggle_interests
	add_cas_menu_item text = "PRINT AREAS" pad_choose_script = ui_aidebug_print_areas
	add_cas_menu_item text = "PRINT INTERESTS" pad_choose_script = ui_aidebug_print_interests
	add_cas_menu_item text = "PRINT INVENTORY" pad_choose_script = ui_aidebug_print_inventory
	add_cas_menu_item text = "PRINT REPLACEMENTS" pad_choose_script = ui_aidebug_print_replacements
	add_cas_menu_item text = "PRINT MOVEMENT DESCRIPTION"
	add_cas_menu_item text = "BACK TO AI DEBUG" pad_choose_script = ui_change_state pad_choose_params = {state = UIstate_AIDebug}
	add_cas_menu_item text = "DONE" pad_choose_script = ui_change_state pad_choose_params = {state = uistate_gameplay}
	cas_menu_finish
endscript

script ui_aidebug_create_agent_nearest 
	if GetNearestAgent
		change ai_viewer_selected_obj = <nearest_agent>
		change \{ai_viewer_selected_obj_type = agent}
		ui_change_state \{state = UIstate_AIDebug_Agent}
	endif
endscript

script ui_aidebug_print_interests 
	if ($ai_viewer_selected_obj = null)
		softassert \{"No valid object selected"}
		return
	endif
	($ai_viewer_selected_obj) :agent_printinterests
endscript

script ui_aidebug_print_areas 
	if ($ai_viewer_selected_obj = null)
		softassert \{"No valid object selected"}
		return
	endif
	($ai_viewer_selected_obj) :agent_printareas
endscript

script ui_aidebug_print_replacements 
	if ($ai_viewer_selected_obj = null)
		softassert \{"No valid object selected"}
		return
	endif
	($ai_viewer_selected_obj) :behavior_printreplacement
endscript

script ui_aidebug_print_inventory 
	if ($ai_viewer_selected_obj = null)
		softassert \{"No valid object selected"}
		return
	endif
	($ai_viewer_selected_obj) :inventory_printitems
endscript

script ui_aidebug_display_hierarchies 
	change toggle_nav_view_mode = ($toggle_nav_view_mode + 1)
	change default_obj_viewer_display = 0
	if ($toggle_nav_view_mode = 2)
		change toggle_nav_view_mode = 0
	endif
	if ($ai_viewer_selected_obj = null)
		softassert "No valid object selected"
		return
	endif
	<viewed> = ($ai_viewer_selected_obj)
	Agent_SetSelected name = <viewed>
	if <viewed> :obj_hascomponent behaviorsystem
		<viewed> :behavior_printallhierarchies
		<viewed> :locator_gettraveler
		printstruct <...>
	endif
	switch $toggle_nav_view_mode
		case 0
		change default_obj_viewer_display = 1
		if <viewed> :obj_hascomponent navigation
			<viewed> :navigation_display off
		endif
		hide_ai_debug
		create_console_message text = "cleared ai displays" time = 1
		case 1
		change default_obj_viewer_display = 0
		display_ai_debug
		if <viewed> :obj_hascomponent navigation
			<viewed> :navigation_display
		endif
		create_console_message text = "nav display on" time = 5
	endswitch
endscript

script ui_aidebug_display_spawnnodes 
	change displayspawnnodes = ($displayspawnnodes + 1)
	if ($displayspawnnodes = 2)
		change \{displayspawnnodes = 0}
	endif
endscript

script ui_aidebug_toggle_display_eventcache 
	($ai_viewer_selected_obj) :getsingletag display_eventcache_toggle
	if NOT gotparam \{display_eventcache_toggle}
		<display_eventcache_toggle> = off
	endif
	if (<display_eventcache_toggle> = on)
		<display_eventcache_toggle> = off
	else
		<display_eventcache_toggle> = on
	endif
	($ai_viewer_selected_obj) :settags display_eventcache_toggle = <display_eventcache_toggle>
	($ai_viewer_selected_obj) :eventcache_display <display_eventcache_toggle>
endscript

script ui_aidebug_toggle_navigation 
	($ai_viewer_selected_obj) :getsingletag display_navigation_toggle
	if NOT gotparam \{display_navigation_toggle}
		<display_navigation_toggle> = off
	endif
	if (<display_navigation_toggle> = on)
		<display_navigation_toggle> = off
	else
		<display_navigation_toggle> = on
	endif
	($ai_viewer_selected_obj) :settags display_navigation_toggle = <display_navigation_toggle>
	($ai_viewer_selected_obj) :navigation_display <display_navigation_toggle>
endscript

script ui_aidebug_toggle_interests 
	($ai_viewer_selected_obj) :getsingletag display_interests_toggle
	if NOT gotparam \{display_interests_toggle}
		<display_interests_toggle> = off
	endif
	if (<display_interests_toggle> = on)
		<display_interests_toggle> = off
	else
		<display_interests_toggle> = on
	endif
	($ai_viewer_selected_obj) :settags display_interests_toggle = <display_interests_toggle>
	($ai_viewer_selected_obj) :agent_displayinterests <display_interests_toggle>
endscript
