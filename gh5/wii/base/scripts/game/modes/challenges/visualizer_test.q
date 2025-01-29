visualizer_test_info = {
	Name = 'visualizer_test'
	goal_type = challenge
	data = {
		passed_song = 0
		passed_txt = qs(0x00000000)
	}
	constants = {
	}
	checkpoints = [
		{
			Name = 'main'
			next_checkpoint = post_game
			tools = [
				{
					Name = 'viz'
					Type = vis_control
					rule_met = vis_test_rule_met
					rules = [
						{
							id = run_00
							preset = og_redwaves
						}
						{
							id = run_10
							preset = og_purplestar
						}
						{
							id = run_25
							preset = og_bluelines
						}
						{
							id = run_50
							preset = og_energina
						}
					]
				}
				{
					Name = 'watcher'
					Type = var_watcher
					output_tool = viz
					var_updated = viz_test_var_updated
					vars = [
						{
							id = run_00
							Player = 1
							var = current_run
							Type = int
							target_value = 1
							compare_type = equals
						}
						{
							id = run_10
							Player = 1
							var = current_run
							Type = int
							target_value = 10
							compare_type = equals
						}
						{
							id = run_25
							Player = 1
							var = current_run
							Type = int
							target_value = 25
							compare_type = equals
						}
						{
							id = run_50
							Player = 1
							var = current_run
							Type = int
							target_value = 50
							compare_type = equals
						}
					]
				}
			]
		}
		{
			Name = 'post_game'
			next_checkpoint = main
			tools = [
			]
		}
	]
}

script visualizer_test_main_enter 
endscript

script visualizer_test_main_exit 
	ScreenFX_ClearFXInstances \{viewport = bg_viewport}
endscript

script vis_test_rule_met 
	stars
	stars
	printf \{qs(0x3bcaabb9)}
	dump
	stars
	stars
	ScreenFX_ClearFXInstances \{viewport = bg_viewport}
	ScreenFX_AddFXInstance {
		viewport = bg_viewport
		Name = avfx01
		scefName = avfx01
		Type = audiovisualize
		On = 1
		primitives = $<preset>
	}
endscript

script start_visualizer_test 
	if NOT gman_goalexists \{goal = visualizer_test}
		gman_addgoal \{goal_info = $visualizer_test_info}
	endif
	if NOT gman_goalisinitialized \{goal = visualizer_test}
		gman_initializegoal \{goal = visualizer_test}
		begin
		if gman_goalisinitialized \{goal = visualizer_test}
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	if NOT GMan_GoalIsActive \{goal = visualizer_test}
		gman_activategoal \{goal = visualizer_test}
	endif
endscript
