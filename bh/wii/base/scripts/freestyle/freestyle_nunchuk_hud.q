freestyle_nunchuk_hud_pad_pos_red = (-83.0, 13.0)
freestyle_nunchuk_hud_pad_scale_red = 1
freestyle_nunchuk_hud_pad_rot_red = -45
freestyle_nunchuk_hud_pad_pos_yellow = (-59.0, -34.0)
freestyle_nunchuk_hud_pad_scale_yellow = 0.75
freestyle_nunchuk_hud_pad_rot_yellow = -30
freestyle_nunchuk_hud_pad_pos_blue = (0.0, 0.0)
freestyle_nunchuk_hud_pad_scale_blue = 1
freestyle_nunchuk_hud_pad_rot_blue = 0
freestyle_nunchuk_hud_pad_pos_green = (83.0, 13.0)
freestyle_nunchuk_hud_pad_scale_green = 1
freestyle_nunchuk_hud_pad_rot_green = 45
freestyle_nunchuk_hud_pad_pos_orange = (59.0, -34.0)
freestyle_nunchuk_hud_pad_scale_orange = 0.75
freestyle_nunchuk_hud_pad_rot_orange = 30
freestyle_nunchuk_hud_pad_pos_purple = (0.0, 60.0)
freestyle_nunchuk_hud_pad_scale_purple = 0.75
freestyle_nunchuk_hud_pad_rot_purple = 0
freestyle_nunchuk_hud_needs_update = FALSE

script freestyle_init_air_drum_hud 
	if NOT freestyle_is_instrument_ai \{instrument = drums}
		freestyle_find_player_with_instrument \{instrument = drums}
		highway_player = ($freestyle_player_data [<player_with_instrument>].highway_player)
		formatText checksumName = hud_parent 'freestyle_highway_containerp%p' p = <highway_player>
		CreateScreenElement {
			parent = <hud_parent>
			Pos = (0.0, 210.0)
			id = freestyle_nunchuk_hud
			Type = descinterface
			desc = 'freestyle_nunchuk_hud'
			z_priority = 100
		}
		if (($freestyle_player_data [<player_with_instrument>].instrument_handler) = drums_nunchuk)
			if (($freestyle_player_data [<player_with_instrument>].lefty) = true)
				righty_airdrum_visibility = 0
				lefty_airdrum_visibility = 1
				drum_assist_scale = (-1.0, 1.0)
			else
				righty_airdrum_visibility = 1
				lefty_airdrum_visibility = 0
				drum_assist_scale = (1.0, 1.0)
			endif
			nunchuk_assist_visibility = 1
			drumkit_assist_visibility = 0
			Change \{freestyle_nunchuk_hud_needs_update = true}
		else
			if (($freestyle_player_data [<player_with_instrument>].lefty) = true)
				righty_airdrum_visibility = 0
				lefty_airdrum_visibility = 0
				drum_assist_scale = (-1.0, 1.0)
			else
				righty_airdrum_visibility = 0
				lefty_airdrum_visibility = 0
				drum_assist_scale = (1.0, 1.0)
			endif
			nunchuk_assist_visibility = 0
			drumkit_assist_visibility = 1
			Change \{freestyle_nunchuk_hud_needs_update = FALSE}
		endif
		if (($freestyle_player_data [<player_with_instrument>].drum_assist) = true)
			drum_assist_glow_visibility = 1
		else
			drum_assist_glow_visibility = 0
		endif
		freestyle_nunchuk_hud :se_setprops {
			righty_airdrum_visibility = <righty_airdrum_visibility>
			lefty_airdrum_visibility = <lefty_airdrum_visibility>
			drum_assist_glow_visibility = <drum_assist_glow_visibility>
			nunchuk_assist_visibility = <nunchuk_assist_visibility>
			drumkit_assist_visibility = <drumkit_assist_visibility>
			drum_assist_scale = <drum_assist_scale>
		}
		freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_event_handler}
		<resolved_id> :se_setprops {
			event_handlers = [
				{drum_hit freestyle_nunchuk_hit_handler params = {<...>}}
			]
		}
		freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_blue_selected}
		<resolved_id> :SetTags Active = FALSE
		freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_red_selected}
		<resolved_id> :SetTags Active = FALSE
		freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_green_selected}
		<resolved_id> :SetTags Active = FALSE
		freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_yellow_selected}
		<resolved_id> :SetTags Active = FALSE
		freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_orange_selected}
		<resolved_id> :SetTags Active = FALSE
		freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_purple_selected}
		<resolved_id> :SetTags Active = FALSE
	endif
endscript

script freestyle_update_air_drum_hud 
	if ScreenElementExists \{id = freestyle_nunchuk_hud}
		if (($freestyle_nunchuk_hud_needs_update) = true)
			freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_blue_selected}
			<resolved_id> :GetTags Active
			if (<Active> = FALSE)
				<resolved_id> :se_setprops {alpha = 0}
			endif
			freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_red_selected}
			<resolved_id> :GetTags Active
			if (<Active> = FALSE)
				<resolved_id> :se_setprops {alpha = 0}
			endif
			freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_green_selected}
			<resolved_id> :GetTags Active
			if (<Active> = FALSE)
				<resolved_id> :se_setprops {alpha = 0}
			endif
			freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_orange_selected}
			<resolved_id> :GetTags Active
			if (<Active> = FALSE)
				<resolved_id> :se_setprops {alpha = 0}
			endif
			freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_purple_selected}
			<resolved_id> :GetTags Active
			if (<Active> = FALSE)
				<resolved_id> :se_setprops {alpha = 0}
			endif
			freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_yellow_selected}
			<resolved_id> :GetTags Active
			if (<Active> = FALSE)
				<resolved_id> :se_setprops {alpha = 0}
			endif
			freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_controller_combo_holder}
			<resolved_id> :GetTags Active
			if (<Active> = FALSE)
				<resolved_id> :se_setprops {alpha = 0}
			endif
			freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_freestylewiimote}
			<resolved_id> :GetTags Active
			if (<Active> = FALSE)
				<resolved_id> :se_setprops {alpha = 0}
			endif
			freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_freestylewiinunchuk}
			<resolved_id> :GetTags Active
			if (<Active> = FALSE)
				<resolved_id> :se_setprops {alpha = 0}
			endif
			freestyle_nunchuk_hud :GetTags \{remote_color}
			freestyle_nunchuk_hud :GetTags \{nunchuk_color}
			if GotParam \{remote_color}
				if GotParam \{nunchuk_color}
					freestyle_find_player_with_instrument \{instrument = drums}
					highway_player = ($freestyle_player_data [<player_with_instrument>].highway_player)
					find_drum_color_index \{button = red}
					if ((<remote_color> = red) || (<nunchuk_color> = red))
						freestyle_update_single_note button_index = <button_index> highway_player = <highway_player> state = pressed
					else
						freestyle_update_single_note button_index = <button_index> highway_player = <highway_player> state = Released
					endif
					find_drum_color_index \{button = yellow}
					if ((<remote_color> = yellow) || (<nunchuk_color> = yellow))
						freestyle_update_single_note button_index = <button_index> highway_player = <highway_player> state = pressed
					else
						freestyle_update_single_note button_index = <button_index> highway_player = <highway_player> state = Released
					endif
					find_drum_color_index \{button = blue}
					if ((<remote_color> = blue) || (<nunchuk_color> = blue))
						freestyle_update_single_note button_index = <button_index> highway_player = <highway_player> state = pressed
					else
						freestyle_update_single_note button_index = <button_index> highway_player = <highway_player> state = Released
					endif
					find_drum_color_index \{button = green}
					if ((<remote_color> = green) || (<nunchuk_color> = green))
						freestyle_update_single_note button_index = <button_index> highway_player = <highway_player> state = pressed
					else
						freestyle_update_single_note button_index = <button_index> highway_player = <highway_player> state = Released
					endif
					if NOT (<remote_color> = <nunchuk_color>)
						switch <nunchuk_color>
							case blue
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_blue_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_freestylewiinunchuk}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_blue)
								Scale = ($freestyle_nunchuk_hud_pad_scale_blue)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_blue)
							}
							case red
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_red_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_freestylewiinunchuk}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_red)
								Scale = ($freestyle_nunchuk_hud_pad_scale_red)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_red)
							}
							case green
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_green_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_freestylewiinunchuk}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_green)
								Scale = ($freestyle_nunchuk_hud_pad_scale_green)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_green)
							}
							case yellow
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_yellow_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_freestylewiinunchuk}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_yellow)
								Scale = ($freestyle_nunchuk_hud_pad_scale_yellow)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_yellow)
							}
							case orange
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_orange_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_freestylewiinunchuk}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_orange)
								Scale = ($freestyle_nunchuk_hud_pad_scale_orange)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_orange)
							}
						endswitch
						switch <remote_color>
							case green
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_green_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_freestylewiimote}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_green)
								Scale = ($freestyle_nunchuk_hud_pad_scale_green)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_green)
							}
							case yellow
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_yellow_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_freestylewiimote}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_yellow)
								Scale = ($freestyle_nunchuk_hud_pad_scale_yellow)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_yellow)
							}
							case blue
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_blue_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_freestylewiimote}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_blue)
								Scale = ($freestyle_nunchuk_hud_pad_scale_blue)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_blue)
							}
							case red
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_red_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_freestylewiimote}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_red)
								Scale = ($freestyle_nunchuk_hud_pad_scale_red)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_red)
							}
							case orange
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_orange_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_freestylewiimote}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_orange)
								Scale = ($freestyle_nunchuk_hud_pad_scale_orange)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_orange)
							}
						endswitch
					else
						Color = <remote_color>
						switch <Color>
							case red
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_red_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_controller_combo_holder}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_red)
								Scale = ($freestyle_nunchuk_hud_pad_scale_red)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_red)
							}
							case Purple
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_purple_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_controller_combo_holder}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_purple)
								Scale = ($freestyle_nunchuk_hud_pad_scale_purple)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_purple)
							}
							case green
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_green_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_controller_combo_holder}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_green)
								Scale = ($freestyle_nunchuk_hud_pad_scale_green)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_green)
							}
							case blue
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_blue_selected}
							<resolved_id> :GetTags Active
							if (<Active> = FALSE)
								<resolved_id> :se_setprops {alpha = 1}
							endif
							freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_controller_combo_holder}
							<resolved_id> :se_setprops {
								alpha = 1
								Pos = ($freestyle_nunchuk_hud_pad_pos_blue)
								Scale = ($freestyle_nunchuk_hud_pad_scale_blue)
								rot_angle = ($freestyle_nunchuk_hud_pad_rot_blue)
							}
						endswitch
					endif
				endif
			endif
		endif
	endif
endscript

script freestyle_nunchuk_hit_handler 
	switch <button>
		case red
		freestyle_nunchuk_hud :desc_resolvealias \{Name = 0x27a32c67}
		freestyle_nunchuk_hud_animate_hit id = <resolved_id>
		case blue
		freestyle_nunchuk_hud :desc_resolvealias \{Name = 0xddf32120}
		freestyle_nunchuk_hud_animate_hit id = <resolved_id>
		case green
		freestyle_nunchuk_hud :desc_resolvealias \{Name = 0x27b0cb51}
		freestyle_nunchuk_hud_animate_hit id = <resolved_id>
		case yellow
		freestyle_nunchuk_hud :desc_resolvealias \{Name = 0x998dd5c4}
		freestyle_nunchuk_hud_animate_hit id = <resolved_id>
		case orange
		freestyle_nunchuk_hud :desc_resolvealias \{Name = 0x817549a4}
		freestyle_nunchuk_hud_animate_hit id = <resolved_id>
		case Purple
		freestyle_nunchuk_hud :desc_resolvealias \{Name = 0x9ca3df90}
		freestyle_nunchuk_hud_animate_hit id = <resolved_id>
	endswitch
endscript

script freestyle_nunchuk_hud_animate_hit 
	RequireParams \{[
			id
		]
		all}
	<id> :se_setprops alpha = 1.0 Scale = 1.0
	<id> :se_setprops alpha = 0.0 Scale = (1.4, 1.5) time = 0.2
endscript

script freestyle_nunchuk_hud_drum_pads_changed 
	if ScreenElementExists \{id = freestyle_nunchuk_hud}
		freestyle_nunchuk_hud :SetTags nunchuk_color = <nunchuk_pad>
		freestyle_nunchuk_hud :SetTags remote_color = <remote_pad>
	endif
endscript
