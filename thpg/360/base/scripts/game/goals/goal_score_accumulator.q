
script goal_score_accumulator_create_display 
	if NOT getglobalflag flag = $no_display_hud
		doscreenelementmorph id = score_in_goal_container alpha = 1
		if gman_getactivatedgoalid
			gman_getgoaltype goal = <activated_goal_id>
			if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
				doscreenelementmorph id = {score_in_goal_container child = arcade} alpha = 1
			else
				doscreenelementmorph id = {score_in_goal_container child = normal} alpha = 1
			endif
		endif
		doscreenelementmorph id = score_in_goal_score alpha = 0 time = 0
		doscreenelementmorph id = score_in_accumulator_tool alpha = 1 time = 0
	endif
endscript

script goal_score_accumulator_destroy_display 
	doscreenelementmorph \{id = score_in_goal_container
		alpha = 0}
	doscreenelementmorph \{id = {
			score_in_goal_container
			child = arcade
		}
		alpha = 0}
	doscreenelementmorph \{id = {
			score_in_goal_container
			child = normal
		}
		alpha = 0}
	doscreenelementmorph \{id = score_in_goal_score
		alpha = 1
		time = 0}
	doscreenelementmorph \{id = score_in_accumulator_tool
		alpha = 0
		time = 0}
endscript

script goal_score_accumulator_update_display 
	formattext textname = score_text "%d" d = <score> usecommas
	setscreenelementprops id = score_in_accumulator_tool text = <score_text>
	if insplitscreengame
		panel_hide_score_in_goal
	endif
endscript

script goal_score_accumulator_fade_up 
	doscreenelementmorph \{id = score_in_goal_container
		alpha = 1}
endscript

script goal_score_accumulator_fade_down 
	doscreenelementmorph \{id = score_in_goal_container
		alpha = 0.5}
endscript
