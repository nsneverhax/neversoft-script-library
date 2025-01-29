g_unlock_tracker_data = [
	{
		unlockable_type_text = qs(0xf6c60ab7)
		reward_type = venue
		default_unlocks = 2
	}
	{
		unlockable_type_text = qs(0x98aba524)
		reward_type = character
	}
	{
		unlockable_type_text = qs(0x21b44362)
		reward_type = art_gallery
	}
	{
		unlockable_type_text = qs(0xd7809370)
		reward_type = song
	}
	{
		unlockable_type_text = qs(0xbbd2416b)
		reward_type = cas
		secondary_reward_type = outfit_preset
		extra_condition_script = unlock_tracker_sort_cas
		extra_condition_params = {
			check_array = cas
		}
	}
	{
		unlockable_type_text = qs(0xf4fdf111)
		reward_type = cas
		extra_condition_script = unlock_tracker_sort_cas
		extra_condition_params = {
			check_array = cai
		}
	}
	{
		unlockable_type_text = qs(0x8d1bb899)
		reward_type = cheat
	}
]

script ui_create_unlock_tracker 
	unlocked_all_string = qs(0x232d1eaf)
	Change \{rich_presence_context = presence_leaderboards}
	destroy_friend_feed
	Change \{respond_to_signin_changed = 1}
	uistack_createboundscreenelement {
		parent = root_window
		id = unlock_tracker
		Type = descinterface
		desc = 'unlockables_tracker'
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back unlock_tracker_back}
		]
	}
	if InNetGame
		net_career_setup_ui_stream \{parent = unlock_tracker}
	endif
	if unlock_tracker :desc_resolvealias \{Name = alias_rank_capsule}
		AssignAlias id = <resolved_id> alias = rank_capsule
	else
		ScriptAssert \{qs(0x6ea56e05)}
	endif
	get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
	quickplay_get_overall_awards_progress Player = <player_num>
	quickplay_get_recent_award_points Player = <player_num>
	rank_capsule :Obj_SpawnScriptNow qp_earned_stars_animate_rank_meter params = {
		total_time = 0.0
		Player = <player_num>
		desc_id = unlock_tracker
	}
	rank_capsule :Obj_SpawnScriptNow gamerpic_set_screenelement_texture params = {
		local_id = ($primary_controller)
		local_user_index = ($primary_controller)
		se_prop = gamerpic_texture
		failure_texture = icon_gh6
	}
	quickplay_get_overall_awards_progress
	formatText TextName = star_count_text qs(0xa97ba304) n = <current_award_points_total> usecommas
	unlock_tracker :se_setprops star_count_text = <star_count_text>
	quest_text = qs(0xd2689b8d)
	if quest_progression_check_domination_unlocked savegame = ($primary_controller)
		quest_text = qs(0x21a7d5e5)
	elseif has_completed_forced_career_flow device_num = ($primary_controller)
		quest_text = qs(0x9fde8775)
	endif
	if unlock_tracker :desc_resolvealias \{Name = alias_unlockable_data}
		GetArraySize ($g_unlock_tracker_data)
		unlockable_idx = 0
		begin
		unlockable_data_struct = ($g_unlock_tracker_data [<unlockable_idx>])
		unlock_tracker_get_progress unlockable = <unlockable_data_struct>
		if CD
			formatText TextName = percent_text qs(0xd39dabd6) n = <unlocked_percentage>
		else
			formatText TextName = percent_text qs(0xd39dabd6) n = <unlocked_percentage>
		endif
		if (<career_total> > 0)
			if (<quickplay_total> = 0 || <next_reward_star_requirement> = 0)
				steps_text = <quest_text>
			elseif (<next_reward_star_requirement> > 0)
				if (<career_unlocked> = <career_total>)
					formatText TextName = steps_text qs(0xf5df219d) a = <next_reward_level_requirement>
				else
					formatText TextName = steps_text qs(0xd63ac003) a = <next_reward_level_requirement> b = <quest_text>
				endif
			endif
		elseif (<quickplay_total> > 0)
			if (<career_total> = 0 && <next_reward_star_requirement> > 0)
				formatText TextName = steps_text qs(0xf5df219d) a = <next_reward_level_requirement>
			endif
		else
		endif
		if (<unlocked_percentage> = -1)
			percent_text = qs(0xc4992bba)
			steps_text = qs(0xab510953)
		elseif (<unlocked_percentage> = 100)
			steps_text = <unlocked_all_string>
		endif
		CreateScreenElement {
			parent = <resolved_id>
			Type = descinterface
			desc = 'unlockables_tracker_entry'
			autosizedims = FALSE
			dims = (940.0, 50.0)
			type_text = (<unlockable_data_struct>.unlockable_type_text)
			percentage_text = <percent_text>
			steps_text = <steps_text>
		}
		unlockable_idx = (<unlockable_idx> + 1)
		repeat <array_Size>
	endif
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent \{Type = focus
		target = unlock_tracker}
endscript

script ui_destroy_unlock_tracker 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = unlock_tracker}
		DestroyScreenElement \{id = unlock_tracker}
	endif
endscript

script unlock_tracker_back 
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back \{data = {
			ui_event_back = 1
		}}
endscript

script unlock_tracker_get_progress \{unlockable = 0x69696969}
	type_total = 0
	unlocked_type_total = 0
	next_reward_star_requirement = 0
	career_total = 0
	career_unlocked = 0
	quickplay_total = 0
	quickplay_unlocked = 0
	quickplay_get_overall_awards_progress
	reward_type = (<unlockable>.reward_type)
	GetArraySize ($award_point_progression)
	num_atoms = <array_Size>
	atom_idx = 0
	begin
	rewards_array = ((($award_point_progression) [<atom_idx>]).rewards)
	reward_requirement = (($award_point_progression [<atom_idx>]).award_points)
	GetArraySize (<rewards_array>)
	num_rewards = <array_Size>
	reward_idx = 0
	begin
	reward_struct = (<rewards_array> [<reward_idx>])
	if (<reward_struct>.reward_type = <reward_type> || <reward_struct>.secondary_reward_type = <reward_type>)
		extra_condition_passed = true
		if StructureContains \{structure = unlockable
				extra_condition_script}
			if (<reward_struct>.reward_type = <reward_type>)
				extra_condition_script = (<unlockable>.extra_condition_script)
				if NOT <extra_condition_script> {reward_struct = <reward_struct> (<unlockable>.extra_condition_params)}
					extra_condition_passed = FALSE
				endif
			endif
		endif
		if (<extra_condition_passed> = true)
			type_total = (<type_total> + 1)
			if (<current_award_points_total> >= <reward_requirement>)
				unlocked_type_total = (<unlocked_type_total> + 1)
			elseif (<next_reward_star_requirement> = 0)
				next_reward_star_requirement = <reward_requirement>
				quickplay_find_award_point_level award_points = <reward_requirement>
				next_reward_level_requirement = <award_point_level>
			endif
		endif
	endif
	reward_idx = (<reward_idx> + 1)
	repeat <num_rewards>
	atom_idx = (<atom_idx> + 1)
	repeat <num_atoms>
	quickplay_total = <type_total>
	quickplay_unlocked = <unlocked_type_total>
	unlock_tracker :SetTags {
		type_total = <type_total>
		unlocked_type_total = <unlocked_type_total>
		career_total = <career_total>
		career_unlocked = <career_unlocked>
	}
	getsavegamefromcontroller controller = ($primary_controller)
	for_each_quest_progression_unlock {
		callback = unlock_tracker_career_unlocks_callback
		params = {
			Type = (<unlockable>.reward_type)
			savegame = <savegame>
		}
	}
	if StructureContains \{structure = unlockable
			secondary_reward_type}
		for_each_quest_progression_unlock {
			callback = unlock_tracker_career_unlocks_callback
			params = {
				Type = (<unlockable>.secondary_reward_type)
				savegame = <savegame>
			}
		}
	endif
	unlock_tracker :GetTags
	if StructureContains \{structure = unlockable
			default_unlocks}
		unlocked_type_total = (<unlocked_type_total> - (<unlockable>.default_unlocks))
		type_total = (<type_total> - (<unlockable>.default_unlocks))
	endif
	unlocked_percentage = -1
	if (<type_total> > 0)
		unlocked_percentage = (((<unlocked_type_total> * 1.0) / (<type_total> * 1.0)) * 100)
		CastToInteger \{unlocked_percentage}
	endif
	CastToInteger \{unlocked_type_total}
	CastToInteger \{type_total}
	return {
		unlocked_percentage = <unlocked_percentage>
		next_reward_star_requirement = <next_reward_star_requirement>
		next_reward_level_requirement = <next_reward_level_requirement>
		career_total = <career_total>
		career_unlocked = <career_unlocked>
		quickplay_total = <quickplay_total>
		quickplay_unlocked = <quickplay_unlocked>
		unlocked_type_total = <unlocked_type_total>
		type_total = <type_total>
	}
endscript

script unlock_tracker_career_unlocks_callback \{chapter_global = !q1768515945
		Type = !q1768515945
		savegame = !i1768515945}
	if NOT ScreenElementExists \{id = unlock_tracker}
		return
	endif
	unlock_tracker :GetTags
	chapter_unlocks = (($<chapter_global>).chapter_unlocks)
	GetArraySize <chapter_unlocks> param = num_unlocks
	if (<num_unlocks> < 1)
		return
	endif
	unlock_index = 0
	begin
	unlock_rewards = ((<chapter_unlocks> [<unlock_index>]).rewards)
	GetArraySize <unlock_rewards> param = num_rewards
	if (<num_rewards> > 0)
		reward_index = 0
		begin
		if ((<unlock_rewards> [<reward_index>]).reward_type = <Type>)
			type_total = (<type_total> + 1)
			career_total = (<career_total> + 1)
			if is_reward_unlocked unlock_struct = (<unlock_rewards> [<reward_index>]) savegame = <savegame>
				unlocked_type_total = (<unlocked_type_total> + 1)
				career_unlocked = (<career_unlocked> + 1)
			endif
		endif
		reward_index = (<reward_index> + 1)
		repeat <num_rewards>
	endif
	unlock_index = (<unlock_index> + 1)
	repeat <num_unlocks>
	unlock_tracker :SetTags {type_total = <type_total> unlocked_type_total = <unlocked_type_total> career_total = <career_total> career_unlocked = <career_unlocked>}
endscript

script unlock_tracker_sort_cas \{reward_struct = 0x69696969
		check_array = !q1768515945}
	if (<reward_struct>.reward_type != cas)
		return \{FALSE}
	endif
	cas = [
		cas_body
		cas_full_body
		cas_full_body_acc
		cas_eyes
		cas_female_physique
		cas_female_eyebrows
		cas_female_hair
		cas_female_hat_hair
		cas_female_hat
		cas_female_facial_hair
		cas_female_torso
		cas_female_legs
		cas_female_shoes
		cas_female_acc_left
		cas_female_acc_right
		cas_female_acc_face
		cas_female_acc_ears
		cas_female_age
		cas_male_physique
		cas_male_eyebrows
		cas_male_hair
		cas_male_hat_hair
		cas_male_hat
		cas_male_facial_hair
		cas_male_torso
		cas_male_legs
		cas_male_shoes
		cas_male_acc_left
		cas_male_acc_right
		cas_male_acc_face
		cas_male_acc_ears
		cas_male_age
	]
	cai = [
		cas_full_guitar
		cas_full_bass
		cas_guitar_body
		cas_guitar_neck
		cas_guitar_head
		cas_guitar_pickguards
		cas_guitar_bridges
		cas_guitar_knobs
		cas_guitar_misc
		cas_guitar_pickups
		cas_guitar_strings
		cas_bass_body
		cas_bass_neck
		cas_bass_head
		cas_bass_pickguards
		cas_bass_pickups
		cas_bass_bridges
		cas_bass_knobs
		cas_bass_misc
		cas_bass_strings
		cas_drums
		cas_drums_sticks
		cas_mic
		cas_mic_stand
		cas_band_logo
	]
	first_part = ((<reward_struct>.car_pieces [0]).part)
	GetArraySize (<...>.<check_array>)
	index = 0
	begin
	if (<first_part> = (<...>.<check_array> [<index>]))
		return \{true}
	endif
	index = (<index> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript
