
script ui_create_tutorial_prompt 
	if GotParam \{continue_to_gigs}
		choose_skip_tutorials
	elseif isrbdrum controller = ($primary_controller)
		choose_skip_tutorials
	else
		GetGlobalTags \{practice}
		player_status = player1_status
		switch ($<player_status>.part)
			case guitar
			if (<has_prompt_guitar_tutorial> = complete)
				choose_skip_tutorials
				return
			else
				SetGlobalTags \{practice
					params = {
						has_prompt_guitar_tutorial = complete
					}}
			endif
			text = qs(0xfcdbf168)
			case bass
			if (<has_prompt_bass_tutorial> = complete)
				choose_skip_tutorials
				return
			else
				SetGlobalTags \{practice
					params = {
						has_prompt_bass_tutorial = complete
					}}
			endif
			text = qs(0x0b9838ef)
			case drum
			if (<has_prompt_drum_tutorial> = complete)
				choose_skip_tutorials
				return
			else
				SetGlobalTags \{practice
					params = {
						has_prompt_drum_tutorial = complete
					}}
			endif
			text = qs(0xbaf2d153)
			case vocals
			if (<has_prompt_vocal_tutorial> = complete)
				choose_skip_tutorials
				return
			else
				SetGlobalTags \{practice
					params = {
						has_prompt_vocal_tutorial = complete
					}}
			endif
			text = qs(0xb3218b2a)
			default
			choose_skip_tutorials
			return
		endswitch
		create_dialog_box {
			heading_text = qs(0x20cd276e)
			body_text = <text>
			options = [
				{
					func = choose_skip_tutorials
					text = qs(0x182f0173)
				}
				{
					func = choose_view_tutorials
					text = qs(0x33764e9f)
				}
			]
			back_button_script = tutorial_prompt_cancel_entry
		}
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000
			all_buttons}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
endscript

script ui_destroy_tutorial_prompt 
	destroy_dialog_box
endscript

script ui_deinit_tutorial_prompt 
	destroy_dialog_box
endscript

script choose_view_tutorials 
	SpawnScriptNow \{choose_view_tutorials_worker}
endscript

script choose_view_tutorials_worker 
	hide_glitch \{num_frames = 3}
	destroy_dialog_box
	menu_music_off
	BG_Crowd_Front_End_Silence
	do_training_loading
	destroy_loading_screen
	StartRendering
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_select_tutorial
			from_career = 1
		}}
endscript

script choose_skip_tutorials 
	if (($player1_status.difficulty) = beginner)
		GetGlobalTags \{practice}
		if GotParam \{has_prompt_easy_tutorial}
			ui_event_wait \{event = menu_replace
				data = {
					state = uistate_tutorial_prompt_easy
					is_popup
				}}
		else
			if pakfilesarecached
			else
			endif
			ui_event_wait \{event = menu_replace
				data = {
					state = uistate_gig_posters
				}}
		endif
	else
		if pakfilesarecached
		else
		endif
		ui_event_wait \{event = menu_replace
			data = {
				state = uistate_gig_posters
			}}
	endif
endscript

script tutorial_prompt_cancel_entry 
	generic_event_back
endscript
