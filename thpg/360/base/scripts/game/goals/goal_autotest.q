goal_autotest_goals = [
	{
		id = m_classic_slums
		times = 10
	}
]
goal_autotest_zones = [
	z_slums
	z_fdr
	z_love
	z_bell
	z_wp_bridge
	z_museums
	z_monuments
	z_museum_int
	z_bw_bridge
	z_bcity
	z_harbor
	z_lansdowne
	z_pb_bridge
	Z_SECRET
]
goal_autotest_exclude_types = [
	arcade
	track_man
	test_goal
	dummy
	travel
]
goal_autotest_running = 0

script goal_autotest_start 
	change goal_autotest_running = 1
	change game_progress_debug_active = 1
	goal_autotest_log text = 'Started.'
	<zones> = $goal_autotest_zones
	getarraysize <zones>
	<goal_zones_size> = <array_size>
	if (<goal_zones_size> > 0)
		<i> = 0
		begin
		<goal_zone> = (<zones> [<i>])
		printf '-- goals for zone %z' z = <goal_zone>
		GMan_GetGoalsByZone zone = <goal_zone>
		if (<goals_by_zone_size> > 0)
			<j> = 0
			begin
			goal_autotest_goal goal = (<goals_by_zone> [<j>])
			<j> = (<j> + 1)
			repeat <goals_by_zone_size>
		endif
		<i> = (<i> + 1)
		repeat <goal_zones_size>
	endif
	goal_autotest_log text = 'Ended.'
	change game_progress_debug_active = 0
	change goal_autotest_running = 0
endscript

script goal_autotest_goal 
	requireparams [goal] all
	gman_getgoalstring goal = <goal>
	goal_autotest_log text = 'Goal %g' g = <goal_string>
	gman_getgoaltype goal = <goal>
	if arraycontains array = ($goal_autotest_exclude_types) contains = <goal_type>
		goal_autotest_log text = 'Excluding %g, type %t' g = <goal_string> t = <goal_type>
		return
	endif
	goals_menu_select_goal goal_id = <goal> do_pulse = 0
	wait 2 seconds
	gman_activategoal goal = <goal>
	begin
	wait 2 gameframes
	if gman_getactivatedgoalid
		if checksumequals a = <activated_goal_id> b = <goal>
			break
		endif
	endif
	repeat
	goal_trigger_dialog_kill
	wait 2 seconds
	if gman_getgoalstate goal = <goal> states = [goal_activated]
		gman_deactivategoal goal = <goal>
	endif
	wait 1 second
	gman_uninitializegoal goal = <goal>
	wait 1 second
endscript

script goal_autotest_log 
	<text> = ('AUTOTEST: ' + <text>)
	formattext textname = log <text> <...> dontassertforchecksums
	printf <log>
	GenerateUTF16FromASCII string = <log>
	create_console_message text = <utf16string>
endscript
