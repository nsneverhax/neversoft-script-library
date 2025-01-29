
script freestyle_tutorial_snare_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_snare_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_snare_interactive_hit_handler 
	RequireParams \{[
			button
		]
		all}
	if ScreenElementExists \{id = goal_counter}
		if (($freestyle_player_data [0].lefty) = FALSE)
			if (<button> = red)
				freestyle_tutorial_goal_counter_increment
			endif
		else
			if (<button> = green)
				freestyle_tutorial_goal_counter_increment
			endif
		endif
	endif
endscript

script freestyle_tutorial_hihat_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_hihat_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_hihat_interactive_hit_handler 
	RequireParams \{[
			button
		]
		all}
	if ScreenElementExists \{id = goal_counter}
		if (($freestyle_player_data [0].lefty) = FALSE)
			if (<button> = yellow)
				freestyle_tutorial_goal_counter_increment
			endif
		else
			if (<button> = orange)
				freestyle_tutorial_goal_counter_increment
			endif
		endif
	endif
endscript

script freestyle_tutorial_crash_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_crash_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_crash_interactive_hit_handler 
	RequireParams \{[
			button
		]
		all}
	if ScreenElementExists \{id = goal_counter}
		if (($freestyle_player_data [0].lefty) = FALSE)
			if (<button> = orange)
				freestyle_tutorial_goal_counter_increment
			endif
		else
			if (<button> = yellow)
				freestyle_tutorial_goal_counter_increment
			endif
		endif
	endif
endscript

script freestyle_tutorial_bassdrum_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_bassdrum_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_bassdrum_interactive_hit_handler 
	RequireParams \{[
			button
		]
		all}
	if ScreenElementExists \{id = goal_counter}
		if (<button> = Purple)
			freestyle_tutorial_goal_counter_increment
		endif
	endif
endscript

script freestyle_tutorial_hightom_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_hightom_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_hightom_interactive_hit_handler 
	RequireParams \{[
			button
		]
		all}
	if ScreenElementExists \{id = goal_counter}
		if (<button> = blue)
			freestyle_tutorial_goal_counter_increment
		endif
	endif
endscript

script freestyle_tutorial_lowtom_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_lowtom_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_lowtom_interactive_hit_handler 
	RequireParams \{[
			button
		]
		all}
	if ScreenElementExists \{id = goal_counter}
		if (($freestyle_player_data [0].lefty) = FALSE)
			if (<button> = green)
				freestyle_tutorial_goal_counter_increment
			endif
		else
			if (<button> = red)
				freestyle_tutorial_goal_counter_increment
			endif
		endif
	endif
endscript

script freestyle_tutorial_crash_bass_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_crash_bass_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_crash_bass_interactive_hit_handler 
	RequireParams \{[
			button
		]
		all}
	if ScreenElementExists \{id = freestyle_nunchuk_hud}
		freestyle_nunchuk_hud :GetTags \{nunchuk_color}
		freestyle_nunchuk_hud :GetTags \{remote_color}
		if GotParam \{nunchuk_color}
			if GotParam \{remote_color}
				if ((<nunchuk_color> = blue) && (<remote_color> = green))
					if ScreenElementExists \{id = goal_counter}
						if ((<button> = orange) || (<button> = Purple))
							freestyle_tutorial_goal_counter_increment
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script freestyle_tutorial_snare_roll_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_snare_roll_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_snare_roll_interactive_hit_handler 
	RequireParams \{[
			button
		]
		all}
	if ScreenElementExists \{id = freestyle_nunchuk_hud}
		freestyle_nunchuk_hud :GetTags \{nunchuk_color}
		freestyle_nunchuk_hud :GetTags \{remote_color}
		if (($freestyle_player_data [0].lefty) = FALSE)
			Color = red
		else
			Color = green
		endif
		if GotParam \{nunchuk_color}
			if GotParam \{remote_color}
				if ((<nunchuk_color> = <Color>) && (<remote_color> = <Color>))
					if ScreenElementExists \{id = goal_counter}
						if (<button> = <Color>)
							freestyle_tutorial_goal_counter_increment
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script freestyle_tutorial_bass_roll_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_bass_roll_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_bass_roll_interactive_hit_handler 
	RequireParams \{[
			button
		]
		all}
	if ScreenElementExists \{id = freestyle_nunchuk_hud}
		freestyle_nunchuk_hud :GetTags \{nunchuk_color}
		freestyle_nunchuk_hud :GetTags \{remote_color}
		if GotParam \{nunchuk_color}
			if GotParam \{remote_color}
				if ((<nunchuk_color> = Purple) && (<remote_color> = Purple))
					if ScreenElementExists \{id = goal_counter}
						if (<button> = Purple)
							freestyle_tutorial_goal_counter_increment
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script freestyle_tutorial_hightom_roll_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_hightom_roll_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_hightom_roll_interactive_hit_handler 
	RequireParams \{[
			button
		]
		all}
	if ScreenElementExists \{id = freestyle_nunchuk_hud}
		freestyle_nunchuk_hud :GetTags \{nunchuk_color}
		freestyle_nunchuk_hud :GetTags \{remote_color}
		if GotParam \{nunchuk_color}
			if GotParam \{remote_color}
				if ((<nunchuk_color> = blue) && (<remote_color> = blue))
					if ScreenElementExists \{id = goal_counter}
						if (<button> = blue)
							freestyle_tutorial_goal_counter_increment
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script freestyle_tutorial_lowtom_roll_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_lowtom_roll_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_lowtom_roll_interactive_hit_handler 
	RequireParams \{[
			button
		]
		all}
	if ScreenElementExists \{id = freestyle_nunchuk_hud}
		freestyle_nunchuk_hud :GetTags \{nunchuk_color}
		freestyle_nunchuk_hud :GetTags \{remote_color}
		if (($freestyle_player_data [0].lefty) = FALSE)
			Color = green
		else
			Color = red
		endif
		if GotParam \{nunchuk_color}
			if GotParam \{remote_color}
				if ((<nunchuk_color> = <Color>) && (<remote_color> = <Color>))
					if ScreenElementExists \{id = goal_counter}
						if (<button> = <Color>)
							freestyle_tutorial_goal_counter_increment
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script freestyle_tutorial_drum_pad_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 6}
	goal_counter :SetTags \{hits = [
		]}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_drum_pad_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_drum_pad_interactive_hit_handler 
	RequireParams \{[
			button
		]
		all}
	if ScreenElementExists \{id = goal_counter}
		goal_counter :GetTags \{hits}
		GetArraySize <hits>
		temp = [NULL]
		SetArrayElement ArrayName = temp index = 0 NewValue = <button>
		if (<array_Size> = 0)
			hits = (<hits> + <temp>)
			goal_counter :SetTags hits = <hits>
			freestyle_tutorial_goal_counter_increment
		else
			counter = 0
			is_valid = true
			begin
			if ((<hits> [<counter>]) = <button>)
				is_valid = FALSE
			endif
			counter = (<counter> + 1)
			repeat <array_Size>
			if (<is_valid> = true)
				hits = (<hits> + <temp>)
				goal_counter :SetTags hits = <hits>
				freestyle_tutorial_goal_counter_increment
			endif
		endif
	endif
endscript

script freestyle_tutorial_drum_helper_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 3}
	freestyle_tutorial_spawn_card \{card = drum_helper_interactive}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_drum_helper_interactive_deinit 
	if ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_goal_counter_kill
	endif
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_drum_helper_interactive_toggle 
	if ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_goal_counter_increment
	endif
endscript

script freestyle_tutorial_drum_card_system_interactive_init 
	SpawnScriptNow \{freestyle_tutorial_spawn_timer}
	freestyle_toggle_drum_assist \{Player = 0}
	freestyle_tutorial_spawn_card \{card = drums_play_informative}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_drum_card_system_interactive_deinit 
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_no_button_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 4}
	goal_counter :SetTags \{hits = [
		]}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_no_button_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_no_button_interactive_hit_handler 
	if ScreenElementExists \{id = freestyle_nunchuk_hud}
		freestyle_nunchuk_hud :GetTags \{nunchuk_color}
		freestyle_nunchuk_hud :GetTags \{remote_color}
		if GotParam \{nunchuk_color}
			if GotParam \{remote_color}
				if ((<nunchuk_color> = red) && (<remote_color> = yellow))
					if ScreenElementExists \{id = goal_counter}
						goal_counter :GetTags \{hits}
						GetArraySize <hits>
						temp = [NULL]
						SetArrayElement ArrayName = temp index = 0 NewValue = <button>
						if (<array_Size> = 0)
							hits = (<hits> + <temp>)
							goal_counter :SetTags hits = <hits>
							freestyle_tutorial_goal_counter_increment
						else
							counter = 0
							is_valid = true
							begin
							if ((<hits> [<counter>]) = <button>)
								is_valid = FALSE
							endif
							counter = (<counter> + 1)
							repeat <array_Size>
							if (<is_valid> = true)
								hits = (<hits> + <temp>)
								goal_counter :SetTags hits = <hits>
								freestyle_tutorial_goal_counter_increment
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script freestyle_tutorial_z_button_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 4}
	goal_counter :SetTags \{hits = [
		]}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_z_button_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_z_button_interactive_hit_handler 
	if ScreenElementExists \{id = freestyle_nunchuk_hud}
		freestyle_nunchuk_hud :GetTags \{nunchuk_color}
		freestyle_nunchuk_hud :GetTags \{remote_color}
		if GotParam \{nunchuk_color}
			if GotParam \{remote_color}
				if ((<nunchuk_color> = blue) && (<remote_color> = green))
					if ScreenElementExists \{id = goal_counter}
						goal_counter :GetTags \{hits}
						GetArraySize <hits>
						temp = [NULL]
						SetArrayElement ArrayName = temp index = 0 NewValue = <button>
						if (<array_Size> = 0)
							hits = (<hits> + <temp>)
							goal_counter :SetTags hits = <hits>
							freestyle_tutorial_goal_counter_increment
						else
							counter = 0
							is_valid = true
							begin
							if ((<hits> [<counter>]) = <button>)
								is_valid = FALSE
							endif
							counter = (<counter> + 1)
							repeat <array_Size>
							if (<is_valid> = true)
								hits = (<hits> + <temp>)
								goal_counter :SetTags hits = <hits>
								freestyle_tutorial_goal_counter_increment
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script freestyle_tutorial_drum_roll_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 4}
	goal_counter :SetTags \{hits = [
		]}
	goal_counter :SetTags \{last_played_button = 0}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_drum_roll_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_drum_roll_interactive_hit_handler 
	if ScreenElementExists \{id = freestyle_nunchuk_hud}
		freestyle_nunchuk_hud :GetTags \{nunchuk_color}
		freestyle_nunchuk_hud :GetTags \{remote_color}
		if GotParam \{nunchuk_color}
			if GotParam \{remote_color}
				if ScreenElementExists \{id = goal_counter}
					if (<nunchuk_color> = <remote_color>)
						goal_counter :GetTags \{last_played_button}
						if (<last_played_button> = <button>)
							goal_counter :GetTags \{hits}
							GetArraySize <hits>
							temp = [NULL]
							SetArrayElement ArrayName = temp index = 0 NewValue = <button>
							if (<array_Size> = 0)
								hits = (<hits> + <temp>)
								goal_counter :SetTags hits = <hits>
								freestyle_tutorial_goal_counter_increment
							else
								counter = 0
								is_valid = true
								begin
								if ((<hits> [<counter>]) = <button>)
									is_valid = FALSE
								endif
								counter = (<counter> + 1)
								repeat <array_Size>
								if (<is_valid> = true)
									hits = (<hits> + <temp>)
									goal_counter :SetTags hits = <hits>
									freestyle_tutorial_goal_counter_increment
								endif
							endif
						else
							goal_counter :SetTags last_played_button = <button>
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script freestyle_tutorial_drum_solo_interactive_init 
	freestyle_spawn_solo_section_now \{Player = 0
		length_in_beats = 51}
	getmetronomelengthofbeat
	length_ms = (51 * <length_of_beat>)
	length_s = (<length_ms> / 1000)
	SpawnScriptNow freestyle_tutorial_spawn_timer params = {time = <length_s>}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_drum_solo_interactive_deinit 
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_drum_solo_interactive_hit_handler 
	if ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_goal_counter_increment
	endif
endscript
