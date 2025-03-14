milestone_ui = {
	MainScreen = {
		create = ui_show_accolade
		destroy = ui_destroy_accolade
	}
	SponsorSelection = {
		create = ui_progression_choose_sponsor
		destroy = ui_progression_choose_sponsor_destroy
	}
	AwardSponsorItems = {
		create = ui_progression_AwardSponsorItems
		destroy = ui_progression_AwardSponsorItems_destroy
	}
	AwardSignatureSponsorItems = {
		create = ui_progression_AwardSignatureSponsorItems
		destroy = ui_progression_AwardSignatureSponsorItems_destroy
	}
}
skate9_milestones = [
	milestone_am
	milestone_pro
	milestone_shoes
	milestone_deck
	milestone_shoes_sig
	milestone_start_team
	milestone_built_team
	milestone_beat_all
]
milestone_none_percent = 0
milestone_half_am_percent = 5
milestone_am_percent = 10
milestone_half_pro_percent = 15
milestone_pro_percent = 20
milestone_shoes_percent = 25
milestone_deck_percent = 28
milestone_shoes_sig_percent = 31
milestone_start_team_percent = 35
milestone_built_team_percent = 40
milestone_beat_all = 100
milestone_ui_info = {
	milestone_none = {
		title = ""
	}
	pseudo_milestone_intro = {
		title = "Intro"
	}
	pseudo_milestone_training = {
		title = "Training"
	}
	milestone_am = {
		title = "Get Sponsored"
	}
	milestone_pro = {
		title = "Join a Team"
	}
	milestone_shoes = {
		title = "Get a Shoe Sponsor"
	}
	milestone_deck = {
		title = "Get a Signature Deck"
	}
	milestone_shoes_sig = {
		title = "Get Signature Shoes"
	}
	milestone_start_team = {
		title = "Start Your Own Team"
	}
	milestone_built_team = {
		title = "TEAM BUILT"
	}
	milestone_beat_all = {
		title = "Story Done - Try for 100%"
	}
}
milestone_am_effects = [
	{
		type = MainScreen
		params = {
			title = "you've got Sponsored!"
			next_title = "Join a TEAM!"
			milestone_flag = $MILESTONE_GOT_UI_AM
		}
	}
	{
		type = SponsorSelection
		params = {
			select = Clothing_Accessories
		}
	}
	{
		type = AwardSponsorItems
		params = {
			cas_type = Clothing_Accessories
		}
	}
]
milestone_pro_effects = [
	{
		type = MainScreen
		params = {
			title = "you've joined a Team!"
			next_title = "get a Shoe Sponsor!"
			milestone_flag = $MILESTONE_GOT_UI_PRO
		}
	}
	{
		type = SponsorSelection
		params = {
			select = deck
		}
	}
	{
		type = AwardSponsorItems
		params = {
			cas_type = deck
		}
	}
]
milestone_shoes_effects = [
	{
		type = MainScreen
		params = {
			title = "Shoe Sponsor!"
			next_title = "get a Signature DECK!"
			milestone_flag = $MILESTONE_GOT_UI_SHOE
		}
	}
	{
		type = SponsorSelection
		params = {
			select = Shoe
		}
	}
	{
		type = AwardSponsorItems
		params = {
			cas_type = Shoe
		}
	}
]
milestone_deck_effects = [
	{
		type = MainScreen
		params = {
			title = "you got a DECK!"
			next_title = "get Signature SHOES!"
			milestone_flag = $MILESTONE_GOT_UI_DECK
		}
	}
	{
		type = AwardSignatureSponsorItems
		params = {
			cas_type = deck
		}
	}
]
milestone_shoes_sig_effects = [
	{
		type = MainScreen
		params = {
			title = "you got SHOES!"
			next_title = "start a TEAM!"
			milestone_flag = $MILESTONE_GOT_UI_SIG
		}
	}
	{
		type = AwardSignatureSponsorItems
		params = {
			cas_type = Shoe
		}
	}
]
milestone_start_team_effects = [
	{
		type = MainScreen
		params = {
			title = "you started a TEAM!"
			next_title = "build your TEAM!"
			milestone_flag = $MILESTONE_GOT_UI_TEAM
		}
	}
]
milestone_built_team_effects = [
	{
		type = MainScreen
		params = {
			title = "you built your TEAM!"
			next_title = "Film your TEAM VIDEO!"
		}
	}
]
milestone_beat_all_effects = [
	{
		type = MainScreen
		params = {
			title = "you did EVERYTHING!!!"
		}
	}
]
milestone_screens_active = 0

script display_milestone 
	requireparams [effects atom] all
	printf '-- display_milestone: atom %a' a = <atom>
	if ($game_progress_debug_active = 1)
		return
	endif
	if ($milestone_screens_active = 1)
		softassert 'tried to show a milestone while another was already active!'
		return
	else
		begin
		if IsScreenClear
			break
		endif
		wait 2 gameframes
		repeat
		change milestone_screens_active = 1
	endif
	ui_change_state state = uistate_gameplay
	goal_presentation_hold_skater
	hide_all_hud_items
	getarraysize <effects>
	if (<array_size> > 0)
		<i> = 0
		begin
		display_milestone_effect effect = (<effects> [<i>])
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	kill_milestone_display
endscript

script kill_milestone_display 
	printf \{'-- kill_milestone_display'}
	fadetoblack \{off
		alpha = 1
		time = 0.2}
	show_all_hud_items
	goal_presentation_unhold_skater
	change \{milestone_screens_active = 0}
endscript

script display_milestone_effect 
	printf '-- display_milestone_effect'
	<create_script> = ($milestone_ui.(<effect>.type).create)
	if scriptexists <create_script>
		printf '-- display_milestone_effect: running %s' s = <create_script>
		<create_script> (<effect>.params)
	else
		softassert "-- display_milestone_effect: WARNING: script %s doesn't exist" s = <create_script>
	endif
	fadetoblack on alpha = 1 time = 0
endscript

script get_milestone_progress 
	careerfunc func = getgoalpoints params = {type = total}
	<goal_points_factor> = (<goal_points_factor> + 0.005)
	<goal_points_percent> = (<goal_points_factor> * 100.0)
	casttointeger goal_points_percent
	getarraysize $skate9_milestones
	<num_milestones> = <array_size>
	<last_milestone_idx> = (<num_milestones> - 1)
	<milestone_idx> = 0
	<current_milestone_idx> = -1
	if (<goal_points_percent> < $milestone_am_percent)
		<current_milestone_idx> = -1
	elseif (<goal_points_percent> >= $milestone_built_team_percent)
		<current_milestone_idx> = <last_milestone_idx>
	else
		begin
		<milestone> = ($skate9_milestones [<milestone_idx>])
		extendcrc <milestone> '_percent' out = milestone_percent
		if (<milestone_idx> < <last_milestone_idx>)
			extendcrc ($skate9_milestones [(<milestone_idx> + 1)]) '_percent' out = next_milestone_percent
			if ((<goal_points_percent> >= $<milestone_percent>) && (<goal_points_percent> < $<next_milestone_percent>))
				<current_milestone_idx> = <milestone_idx>
				break
			endif
		else
			softassert 'milestone not found'
			return
		endif
		<milestone_idx> = (<milestone_idx> + 1)
		repeat <num_milestones>
	endif
	if (<current_milestone_idx> > -1)
		<current_milestone> = ($skate9_milestones [<current_milestone_idx>])
	else
		<current_milestone> = milestone_none
	endif
	if (<current_milestone_idx> < <last_milestone_idx>)
		<next_milestone_idx> = (<current_milestone_idx> + 1)
		<next_milestone> = ($skate9_milestones [<next_milestone_idx>])
		extendcrc <current_milestone> '_percent' out = current_milestone_percent
		extendcrc <next_milestone> '_percent' out = next_milestone_percent
		<curr_pct> = ($<current_milestone_percent>)
		<next_pct> = ($<next_milestone_percent>)
		linearmap {
			result = progress_to_next_milestone
			from = 0.0
			to = 1.0
			basedon = (<goal_points_percent> * 1.0)
			lowerbound = (<curr_pct> * 1.0)
			upperbound = (<next_pct> * 1.0)
		}
	endif
	if checksumequals a = <current_milestone> b = milestone_none
		get_num_goals_won_in_array goals = [m_c1_ntt m_h1_bigpush2 m_r1_buildkick2]
		<intro_goals_won> = <goals_won>
		<intro_goals> = <num_goals>
		if (<intro_goals_won> < <intro_goals>)
			current_milestone = pseudo_milestone_intro
			next_milestone = pseudo_milestone_training
			progress_to_next_milestone = (1.0 * <intro_goals_won> / <intro_goals>)
		else
			get_num_goals_won_in_array goals = [m_training_qp2rail m_training_revman m_training_grind m_training_manual m_line_slums]
			if (<goals_won> < <num_goals>)
				<training_goals_won> = <goals_won>
				<training_goals> = <num_goals>
				current_milestone = pseudo_milestone_training
				next_milestone = milestone_am
				progress_to_next_milestone = (1.0 * <training_goals_won> / <training_goals>)
			endif
		endif
	endif
	return {
		current_milestone = <current_milestone>
		next_milestone = <next_milestone>
		progress_to_next_milestone = <progress_to_next_milestone>
	}
endscript

script get_num_goals_won_in_array 
	getarraysize <goals>
	<i> = 0
	<goals_won> = 0
	begin
	if gman_haswongoal goal = (<goals> [<i>])
		<goals_won> = (<goals_won> + 1)
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return goals_won = <goals_won> num_goals = <array_size>
endscript

script get_milestone_ui_info 
	requireparams \{[
			milestone
		]
		all}
	return milestone_ui_info = ($milestone_ui_info.<milestone>)
endscript

script get_milestone_icon 
	get_milestone_progress
	switch <current_milestone>
		case pseudo_milestone_intro
		case pseudo_milestone_training
		case milestone_none
		case milestone_am
		return \{milestone_icon = am}
		case milestone_pro
		case milestone_deck_percent
		case milestone_shoes_percent
		return \{milestone_icon = pro}
		case milestone_start_team_percent
		case milestone_built_team_percent
		case milestone_beat_all_percent
		default
		return \{milestone_icon = team}
	endswitch
endscript

script change_fdr_tags 
	changenodeflag \{nodeflag_z_fdr_h2_incomplete
		0}
	changenodeflag \{nodeflag_z_fdr_h2_complete
		1}
endscript
