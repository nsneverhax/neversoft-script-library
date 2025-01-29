coin_message_active = 0
coin_message_alpha = 255
coin_message_dalpha = 1
coin_message_flash_interval = 3
coin_message_flash_counter = 0
coin_message_flash_alpha = 1.0
coin_message_flash_delta = 0.025
coin_message_flash_min_alpha = 0.1
coin_message_dir = 1
coin_start_ok = 1
coin_display_enabled = 0
use_guitar_for_coin = 1
coin_message_attract_pos = (630.0, 683.0)
coin_message_attract_credits_to_start_offset = (0.0, 28.0)
coin_message_attract_scale = 1.5
coin_message_attract_credits_to_start_scale = 0.5
coin_message_state = 0
coin_message_last_state = 0
coin_message_substate = 0
coin_message_last_substate = 0
vol_button_increment = 3.0
min_vol_allowed = -33.0
max_vol_allowed = 24.0
volume_adjustment = 0.0
is_test_mode = 0
test_options_hack_enabled = 1
debug_start_status = 0
debug_start_check_count = 0
debug_start_check_interval = 10
debug_start_check_max_count = 100
debug_start_check_enable = 0
rt_no_die_early = 1
no_die_early_time_beginner = 240000
no_die_early_time_easy = 120000
no_die_early_time_medium = 90000
no_die_early_time_hard = 60000
no_die_early_time_expert = 30000
arcade_not_ok_to_accept_start_switches = 0
arcade_use_mating = 0
arcade_in_game = 0
arcade_in_menu = 0
in_multiplayer_wait_screen = 0
in_continue_screen = 0
coin_handling_enabled = 0
can_have_attract_audio = 1
lamp_start1_flashing = 0
lamp_start2_flashing = 0
lamp_debug_active = 0
time_debug_active = 0
arcade_version_major_ver_num = 0
arcade_version_minor_ver_num = 4
arcade_version_aux_ver_num = 4
arcade_version_desc = "ASI Show"
arcade_version_date = "3/09/09"
arcade_version_time = "13:00"

script create_test_image 
	CreateScreenElement \{Type = ContainerElement
		id = debug_thread_start_container
		parent = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = TextElement
		parent = debug_thread_start_container
		font = text_a4
		Scale = 0.5
		rgba = [
			240
			0
			0
			255
		]
		text = "0"
		id = debug_thread_status
		Pos = (10.0, 702.0)
		just = [
			center
			center
		]
		rot_angle = 0
		z_priority = 10001}
endscript

script create_coin_message 
	CreateScreenElement \{Type = ContainerElement
		id = coin_status_message_container
		parent = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = TextElement
		parent = coin_status_message_container
		font = text_a5
		Scale = $coin_message_attract_scale
		rgba = [
			240
			235
			240
			255
		]
		text = "INSERT COINS"
		id = coin_status_text
		Pos = $coin_message_attract_pos
		just = [
			center
			center
		]
		rot_angle = 0
		z_priority = 10001}
	coin_status_text :SetProps \{Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	CreateScreenElement \{Type = TextElement
		parent = coin_status_message_container
		font = text_a5
		Scale = $coin_message_attract_scale
		rgba = [
			240
			235
			240
			255
		]
		text = "INSERT COINS"
		id = coin_instr_text
		Pos = $coin_message_attract_pos
		just = [
			center
			center
		]
		rot_angle = 0
		z_priority = 10001}
	coin_instr_text :SetProps \{Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	coin_instr_text :SetProps \{Hide}
	CreateScreenElement {
		Type = TextElement
		parent = coin_status_message_container
		font = text_a5
		Scale = $coin_message_attract_credits_to_start_scale
		rgba = [240 235 0 255]
		id = coin_status_credits_to_start_text
		Pos = ($coin_message_attract_pos + $coin_message_attract_credits_to_start_offset)
		just = [center center]
		rot_angle = 0
		z_priority = 10001
	}
	coin_status_credits_to_start_text :SetProps \{Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba
		[
			255
			255
			255
			255
		]}
	CreateScreenElement {
		Type = TextElement
		parent = coin_status_message_container
		font = text_a5
		Scale = $coin_message_attract_credits_to_start_scale
		rgba = [240 235 0 255]
		id = coin_status_credits_to_continue_text
		Pos = ($coin_message_attract_pos + $coin_message_attract_credits_to_start_offset)
		just = [center center]
		rot_angle = 0
		z_priority = 10001
	}
	coin_status_credits_to_continue_text :SetProps \{Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba
		[
			255
			255
			255
			255
		]}
	coin_status_credits_to_continue_text :SetProps \{Hide}
	CreateScreenElement {
		Type = TextElement
		parent = coin_status_message_container
		font = text_a5
		Scale = $coin_message_attract_credits_to_start_scale
		rgba = [240 235 0 255]
		id = coin_status_bonus_credits_text
		Pos = ($coin_message_attract_pos + $coin_message_attract_credits_to_start_offset)
		just = [center center]
		rot_angle = 0
		z_priority = 10001
	}
	coin_status_bonus_credits_text :SetProps \{Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba
		[
			255
			255
			255
			255
		]}
	coin_status_bonus_credits_text :SetProps \{Hide}
	GetGlobalTags \{arcade_audits}
	GetGlobalTags \{arcade_adjustments}
	printf "coin message init value%a" a = <arcade_credits_for_standard>
	if (<arcade_credits_for_standard> = 0)
		formatText \{TextName = coins_per_credit
			"FREEPLAY"}
	else
		if (<arcade_credits_per_coin> > 1)
			if (<arcade_credits_for_standard> = 1)
				formatText TextName = coins_per_credit "%d CREDIT TO START - %e CREDITS PER COIN" d = <arcade_credits_for_standard> e = <arcade_credits_per_coin>
			else
				formatText TextName = coins_per_credit "%d CREDITS TO START - %e CREDITS PER COIN" d = <arcade_credits_for_standard> e = <arcade_credits_per_coin>
			endif
		else
			if (<arcade_credits_for_standard> = 1)
				formatText TextName = coins_per_credit "%d CREDIT TO START" d = <arcade_credits_for_standard>
			else
				formatText TextName = coins_per_credit "%d CREDITS TO START" d = <arcade_credits_for_standard>
			endif
		endif
	endif
	coin_status_credits_to_start_text :SetProps text = <coins_per_credit>
	if (<arcade_credits_for_continue> = 0)
		formatText \{TextName = coins_per_continue
			"FREEPLAY"}
	else
		if (<arcade_credits_per_coin> > 1)
			if (<arcade_credits_for_continue> = 1)
				formatText TextName = coins_per_continue "%d CREDIT TO CONTINUE - %e CREDITS PER COIN" d = <arcade_credits_for_continue> e = <arcade_credits_per_coin>
			else
				formatText TextName = coins_per_continue "%d CREDITS TO CONTINUE - %e CREDITS PER COIN" d = <arcade_credits_for_continue> e = <arcade_credits_per_coin>
			endif
		else
			if (<arcade_credits_for_continue> = 1)
				formatText TextName = coins_per_continue "%d CREDIT TO CONTINUE" d = <arcade_credits_for_continue>
			else
				formatText TextName = coins_per_continue "%d CREDITS TO CONTINUE" d = <arcade_credits_for_continue>
			endif
		endif
	endif
	coin_status_credits_to_continue_text :SetProps text = <coins_per_continue>
	if (<arcade_credits_for_bonus> > 0)
		if (<arcade_credits_for_bonus> > 1)
			if (<arcade_num_bonus_credits> > 1)
				formatText TextName = bonus_credit_text "INSERT %a CREDITS FOR %b BONUS CREDITS" a = <arcade_credits_for_bonus> b = <arcade_num_bonus_credits>
			else
				formatText TextName = bonus_credit_text "INSERT %a CREDITS FOR %b BONUS CREDIT" a = <arcade_credits_for_bonus> b = <arcade_num_bonus_credits>
			endif
		else
			if (<arcade_num_bonus_credits> > 1)
				formatText TextName = bonus_credit_text "INSERT %a CREDIT FOR %b BONUS CREDITS" a = <arcade_credits_for_bonus> b = <arcade_num_bonus_credits>
			else
				formatText TextName = bonus_credit_text "INSERT %a CREDIT FOR %b BONUS CREDIT" a = <arcade_credits_for_bonus> b = <arcade_num_bonus_credits>
			endif
		endif
	else
		formatText \{TextName = bonus_credit_text
			"BONUS CREDITS DISABLED"}
	endif
	coin_status_bonus_credits_text :SetProps text = <bonus_credit_text>
	printf \{"create_coin_message: coin_display_enabled = %d"
		d = coin_display_enabled}
endscript

script destroy_coin_message 
endscript

script update_coin_state 
	GetGlobalTags \{arcade_audits}
	if (<arcade_freeplay> = 1)
		Change \{coin_message_state = 2}
	else
		if (<arcade_num_credits_in> > 0)
			Change \{coin_message_state = 1}
		else
			Change \{coin_message_state = 0}
		endif
	endif
endscript
lamp_num_coins_in = 0
lamp_coins_for_credit = 0

script change_coin_message 
	update_coin_state
	GetGlobalTags \{arcade_audits}
	GetGlobalTags \{arcade_adjustments}
	if ($in_continue_screen = 0)
		if (<arcade_num_credits_in> = 0)
			if (<arcade_credits_for_standard> = 0)
				coin_status_text :SetProps \{text = "PRESS START"}
			else
				coin_status_text :SetProps \{text = "INSERT COINS"}
			endif
		else
			if (<arcade_num_credits_in> = 1)
				formatText TextName = num_credits "%d CREDIT" d = <arcade_num_credits_in>
			else
				formatText TextName = num_credits "%d CREDITS" d = <arcade_num_credits_in>
			endif
			coin_status_text :SetProps text = <num_credits>
		endif
		if (<arcade_num_credits_in> < <arcade_credits_for_standard>)
			coin_instr_text :SetProps \{text = "INSERT COINS"}
		else
			coin_instr_text :SetProps \{text = "PRESS START"}
		endif
	else
		if (<arcade_num_credits_in> = 0)
			if (<arcade_credits_for_continue> = 0)
				coin_status_text :SetProps \{text = "PRESS START"}
			else
				coin_status_text :SetProps \{text = "INSERT COINS"}
			endif
		else
			if (<arcade_num_credits_in> = 1)
				formatText TextName = num_credits "%d CREDIT" d = <arcade_num_credits_in>
			else
				formatText TextName = num_credits "%d CREDITS" d = <arcade_num_credits_in>
			endif
			coin_status_text :SetProps text = <num_credits>
		endif
		if (<arcade_num_credits_in> < <arcade_credits_for_continue>)
			coin_instr_text :SetProps \{text = "INSERT COINS"}
		else
			coin_instr_text :SetProps \{text = "PRESS START"}
		endif
	endif
endscript

script update_coin_message 
	begin
	if ($coin_display_enabled = 1)
		GetGlobalTags \{arcade_adjustments}
		if (<arcade_credits_for_standard> = 0)
			formatText \{TextName = coins_per_credit
				"FREEPLAY"}
		else
			if (<arcade_credits_per_coin> > 1)
				if (<arcade_credits_for_standard> = 1)
					formatText TextName = coins_per_credit "%d CREDIT TO START - %e CREDITS PER COIN" d = <arcade_credits_for_standard> e = <arcade_credits_per_coin>
				else
					formatText TextName = coins_per_credit "%d CREDITS TO START - %e CREDITS PER COIN" d = <arcade_credits_for_standard> e = <arcade_credits_per_coin>
				endif
			else
				if (<arcade_credits_for_standard> = 1)
					formatText TextName = coins_per_credit "%d CREDIT TO START" d = <arcade_credits_for_standard>
				else
					formatText TextName = coins_per_credit "%d CREDITS TO START" d = <arcade_credits_for_standard>
				endif
			endif
		endif
		coin_status_credits_to_start_text :SetProps text = <coins_per_credit>
		if (<arcade_credits_for_continue> = 0)
			formatText \{TextName = coins_per_continue
				"FREEPLAY"}
		else
			if (<arcade_credits_per_coin> > 1)
				if (<arcade_credits_for_continue> = 1)
					formatText TextName = coins_per_continue "%d CREDIT TO CONTINUE - %e CREDITS PER COIN" d = <arcade_credits_for_continue> e = <arcade_credits_per_coin>
				else
					formatText TextName = coins_per_continue "%d CREDITS TO CONTINUE - %e CREDITS PER COIN" d = <arcade_credits_for_continue> e = <arcade_credits_per_coin>
				endif
			else
				if (<arcade_credits_for_continue> = 1)
					formatText TextName = coins_per_continue "%d CREDIT TO CONTINUE" d = <arcade_credits_for_continue>
				else
					formatText TextName = coins_per_continue "%d CREDITS TO CONTINUE" d = <arcade_credits_for_continue>
				endif
			endif
		endif
		coin_status_credits_to_continue_text :SetProps text = <coins_per_continue>
		if (<arcade_credits_for_bonus> > 0)
			if (<arcade_credits_for_bonus> > 1)
				if (<arcade_num_bonus_credits> > 1)
					formatText TextName = bonus_credit_text "INSERT %a CREDITS FOR %b BONUS CREDITS" a = <arcade_credits_for_bonus> b = <arcade_num_bonus_credits>
				else
					formatText TextName = bonus_credit_text "INSERT %a CREDITS FOR %b BONUS CREDIT" a = <arcade_credits_for_bonus> b = <arcade_num_bonus_credits>
				endif
			else
				if (<arcade_num_bonus_credits> > 1)
					formatText TextName = bonus_credit_text "INSERT %a CREDIT FOR %b BONUS CREDITS" a = <arcade_credits_for_bonus> b = <arcade_num_bonus_credits>
				else
					formatText TextName = bonus_credit_text "INSERT %a CREDIT FOR %b BONUS CREDIT" a = <arcade_credits_for_bonus> b = <arcade_num_bonus_credits>
				endif
			endif
		else
			formatText \{TextName = bonus_credit_text
				"BONUS CREDITS DISABLED"}
		endif
		coin_status_bonus_credits_text :SetProps text = <bonus_credit_text>
		change_coin_message
		SetScreenElementProps \{id = coin_status_message_container
			alpha = $coin_message_flash_alpha}
		Change coin_message_flash_alpha = ($coin_message_flash_alpha + ($coin_message_dir * $coin_message_flash_delta))
		if (coin_message_flash_alpha > 1.0)
			Change \{coin_message_flash_alpha = 1.0}
			Change \{coin_message_dir = -1}
		endif
		if (coin_message_flash_alpha < coin_message_flash_min_alpha)
			Change \{coin_message_flash_alpha = $coin_message_flash_min_alpha}
			Change \{coin_message_dir = 1}
			if ($coin_message_active = 0)
				Change \{coin_message_active = 1}
				coin_status_text :SetProps \{Hide}
				coin_instr_text :SetProps \{unhide}
				if (<arcade_credits_for_bonus> > 0)
					coin_status_credits_to_start_text :SetProps \{Hide}
					coin_status_credits_to_continue_text :SetProps \{Hide}
					coin_status_bonus_credits_text :SetProps \{unhide}
				else
					if ($in_continue_screen = 0)
						coin_status_credits_to_start_text :SetProps \{unhide}
						coin_status_credits_to_continue_text :SetProps \{Hide}
					else
						coin_status_credits_to_start_text :SetProps \{Hide}
						coin_status_credits_to_continue_text :SetProps \{unhide}
					endif
					coin_status_bonus_credits_text :SetProps \{Hide}
				endif
			elseif ($coin_message_active = 1)
				Change \{coin_message_active = 0}
				coin_status_text :SetProps \{unhide}
				coin_instr_text :SetProps \{Hide}
				if ($in_continue_screen = 0)
					coin_status_credits_to_start_text :SetProps \{unhide}
					coin_status_credits_to_continue_text :SetProps \{Hide}
				else
					coin_status_credits_to_start_text :SetProps \{Hide}
					coin_status_credits_to_continue_text :SetProps \{unhide}
				endif
				coin_status_bonus_credits_text :SetProps \{Hide}
			endif
		endif
		Wait \{1
			gameframe}
	else
		Wait \{1
			Second}
	endif
	repeat
endscript

script remove_credit \{continue = 0}
	GetGlobalTags \{arcade_audits}
	GetGlobalTags \{arcade_adjustments}
	if (<continue> = 0)
		<arcade_num_credits_in> = (<arcade_num_credits_in> - <arcade_credits_for_standard>)
	else
		<arcade_num_credits_in> = (<arcade_num_credits_in> - <arcade_credits_for_continue>)
	endif
	<arcade_total_plays> = (<arcade_total_plays> + 1)
	SetGlobalTags arcade_audits params = {arcade_num_credits_in = <arcade_num_credits_in> , arcade_total_plays = <arcade_total_plays>}
	SoundEvent \{event = ui_sfx_select}
	printf "remove_credit: arcade_num_credits_in=%d" d = <arcade_num_credits_in>
	change_coin_message
endscript

script enable_coin_display 
	Change \{coin_display_enabled = 1}
	change_coin_message
	coin_status_message_container :DoMorph \{alpha = 1
		time = 0}
endscript

script disable_coin_display 
	Change \{coin_display_enabled = 0}
	coin_status_message_container :DoMorph \{alpha = 0
		time = 0}
	Change \{coin_message_dir = -1}
endscript
leave_attract_skip_fade = 0
bonus_credit_counter = 0

script watch_for_switches 
	printf \{"watch_for_switches: spawn"}
	begin
	if ($in_switch_test_menu = 0)
		GetGlobalTags \{arcade_audits}
		GetGlobalTags \{arcade_adjustments}
		CheckCoinWaitingCount
		if (<anything_waiting> = 1)
			printf "COIN_SCR: Coins - 1:%d 2:%e B:%f" d = <coin1_waiting> e = <coin2_waiting> f = <bill_waiting>
			if (<coin1_waiting> > 0)
				<arcade_num_credits_in> = (<arcade_num_credits_in> + (<coin1_waiting> * <arcade_credits_per_coin>))
				<arcade_total_coins> = (<arcade_total_coins> + <coin1_waiting>)
				<arcade_total_credits> = (<arcade_total_credits> + (<coin1_waiting> * <arcade_credits_per_coin>))
				printf "COIN_SCR: %d Coin1 received" d = <coin1_waiting>
				SoundEvent \{event = Cash_Sound}
				CoinMeterInc meter = 0 clicks = <coin1_waiting>
				donglecreditadd coins = <coin1_waiting>
				old_bonus_counter = $bonus_credit_counter
				Change bonus_credit_counter = ($bonus_credit_counter + (<coin1_waiting> * <arcade_credits_per_coin>))
				begin
				printf "COIN_SCR: old bonus = %a new bonus = %b for bonus = %c" a = <old_bonus_counter> b = $bonus_credit_counter c = <arcade_credits_for_bonus>
				if ((<old_bonus_counter> < <arcade_credits_for_bonus>) && ($bonus_credit_counter >= <arcade_credits_for_bonus>))
					printf "COIN_SCR: adding %a bonus credits" a = <arcade_num_bonus_credits>
					<arcade_num_credits_in> = (<arcade_num_credits_in> + <arcade_num_bonus_credits>)
					Change bonus_credit_counter = ($bonus_credit_counter - <arcade_credits_for_bonus>)
					<arcade_total_bonus_credits> = (<arcade_total_bonus_credits> + <arcade_num_bonus_credits>)
				else
					break
				endif
				repeat
			endif
			if (<coin2_waiting> > 0)
				<arcade_num_credits_in> = (<arcade_num_credits_in> + (<coin2_waiting> * <arcade_credits_per_coin>))
				<arcade_total_coins> = (<arcade_total_coins> + <coin2_waiting>)
				<arcade_total_credits> = (<arcade_total_credits> + (<coin2_waiting> * <arcade_credits_per_coin>))
				printf "COIN_SCR: %d Coin2 received" d = <coin2_waiting>
				SoundEvent \{event = Cash_Sound}
				CoinMeterInc meter = 0 clicks = <coin2_waiting>
				donglecreditadd coins = <coin2_waiting>
				old_bonus_counter = $bonus_credit_counter
				Change bonus_credit_counter = ($bonus_credit_counter + (<coin2_waiting> * <arcade_credits_per_coin>))
				begin
				printf "COIN_SCR: old bonus = %a new bonus = %b for bonus = %c" a = <old_bonus_counter> b = $bonus_credit_counter c = <arcade_credits_for_bonus>
				if (<old_bonus_counter> < <arcade_credits_for_bonus> && $bonus_credit_counter >= <arcade_credits_for_bonus>)
					printf "COIN_SCR: adding %a bonus credits" a = <arcade_num_bonus_credits>
					<arcade_num_credits_in> = (<arcade_num_credits_in> + <arcade_num_bonus_credits>)
					Change bonus_credit_counter = ($bonus_credit_counter - <arcade_credits_for_bonus>)
					<arcade_total_bonus_credits> = (<arcade_total_bonus_credits> + <arcade_num_bonus_credits>)
				else
					break
				endif
				repeat
			endif
			if (<bill_waiting> > 0)
				<arcade_num_credits_in> = (<arcade_num_credits_in> + (<bill_waiting> * <arcade_credits_per_coin>))
				<arcade_total_credits> = (<arcade_total_credits> + (<bill_waiting> * <arcade_credits_per_coin>))
				<arcade_num_bills> = (<arcade_num_bills> + <bill_waiting>)
				printf "COIN_SCR: %d bill received" d = <bill_waiting>
				SoundEvent \{event = Cash_Sound}
				CoinMeterInc meter = 0 clicks = <bill_waiting>
				donglecreditadd coins = <bill_waiting>
				old_bonus_counter = $bonus_credit_counter
				Change bonus_credit_counter = ($bonus_credit_counter + (<bill_waiting> * <arcade_credits_per_coin>))
				begin
				printf "COIN_SCR: old bonus = %a new bonus = %b for bonus = %c" a = <old_bonus_counter> b = $bonus_credit_counter c = <arcade_credits_for_bonus>
				if (<old_bonus_counter> < <arcade_credits_for_bonus> && $bonus_credit_counter >= <arcade_credits_for_bonus>)
					printf "COIN_SCR: adding %a bonus credits" a = <arcade_num_bonus_credits>
					<arcade_num_credits_in> = (<arcade_num_credits_in> + <arcade_num_bonus_credits>)
					Change bonus_credit_counter = ($bonus_credit_counter - <arcade_credits_for_bonus>)
					<arcade_total_bonus_credits> = (<arcade_total_bonus_credits> + <arcade_num_bonus_credits>)
				else
					break
				endif
				repeat
			endif
			if (<service_waiting> > 0)
				if ($is_test_mode = 1)
					LaunchEvent \{Type = pad_back}
				else
					<arcade_num_credits_in> = (<arcade_num_credits_in> + <service_waiting>)
					<arcade_service_credits> = (<arcade_service_credits> + <service_waiting>)
					printf "COIN_SCR: %d service received" d = <service_waiting>
					SoundEvent \{event = Cash_Sound}
				endif
			endif
			ClearCoinWaitingCount
			printf "COIN_SCR: arcade_num_credits_in = %d" d = <arcade_num_credits_in>
			SetGlobalTags arcade_audits params = {arcade_total_coins = <arcade_total_coins> , arcade_total_credits = <arcade_total_credits> , arcade_total_bonus_credits = <arcade_total_bonus_credits> , arcade_num_credits_in = <arcade_num_credits_in> , arcade_num_bills = <arcade_num_bills> , arcade_service_credits = <arcade_service_credits>}
			Change \{coin_message_flash_alpha = 1.0}
			Change \{coin_message_active = 0}
			coin_status_text :SetProps \{unhide}
			coin_instr_text :SetProps \{Hide}
			if ($in_continue_screen = 0)
				coin_status_credits_to_start_text :SetProps \{unhide}
				coin_status_credits_to_continue_text :SetProps \{Hide}
			else
				coin_status_credits_to_start_text :SetProps \{Hide}
				coin_status_credits_to_continue_text :SetProps \{unhide}
			endif
			coin_status_bonus_credits_text :SetProps \{Hide}
		endif
		Change lamp_num_coins_in = <arcade_num_credits_in>
		if ($in_continue_screen = 0)
			Change lamp_coins_for_credit = <arcade_credits_for_standard>
		else
			Change lamp_coins_for_credit = <arcade_credits_for_continue>
		endif
	endif
	if ($test_options_hack_enabled = 1)
		CheckTestWaitingCount
		if ($is_attract_mode = 1)




















































































			ClearTestWaitingCount
			printf \{"attract: %a | game: %b | test: %c | load: %d"
				a = $is_attract_mode
				b = $arcade_in_game
				c = $is_test_mode
				d = $is_changing_levels}
			if ($attract_guitar_start_p1 = 1 && $attract_guitar_orange_p1 = 1 && $attract_guitar_blue_p1 = 1)
				wait_for_safe_shutdown
				Change \{leave_attract_skip_fade = 1}
				KillSpawnedScript \{Name = attract_timer_to_next_mode}
				SpawnScriptNow \{ui_flow_manager_respond_to_action
					params = {
						action = exit_attract_mode
					}}
			else
				if ($attract_guitar_start_p2 = 1 && $attract_guitar_blue_p1 = 1 && $attract_guitar_blue_p2 = 1)
					wait_for_safe_shutdown
					Change \{leave_attract_skip_fade = 1}
					KillSpawnedScript \{Name = attract_timer_to_next_mode}
					SpawnScriptNow \{ui_flow_manager_respond_to_action
						params = {
							action = temp_options
						}}




























































































































































				endif
				printf \{"is_attract_mode=%d, is_test_mode=%e"
					d = $is_attract_mode
					e = $is_test_mode}
			endif
		endif
	endif
	if ($in_switch_test_menu = 0)
		CheckVolumeWaitingCount
		if (<anything_waiting> = 1)
			GetGlobalTags \{arcade_hardware_adjustments}
			if ($is_attract_mode = 1)
				temp_master_volume = <master_attract_volume>
			else
				temp_master_volume = <master_game_volume>
			endif
			printf "Master vol now %d" d = <temp_master_volume>
			if (<vol_up_waiting> > 0)
				if ($is_test_mode = 1)
					LaunchEvent \{Type = pad_up}
				else
					<temp_master_volume> = (<temp_master_volume> + $vol_button_increment)
					if (<temp_master_volume> > $max_vol_allowed)
						<temp_master_volume> = $max_vol_allowed
					endif
					if (<arcade_attract_audio_on> = 1 || $is_attract_mode = 0)
						SoundBussUnlock \{Master}
						if ($is_attract_mode = 0)
							printf "Setting game volume up to %d + %e" d = <temp_master_volume> e = $volume_adjustment
							setsoundbussparams {Master = {vol = (<temp_master_volume> + $volume_adjustment)}}
						else
							printf "Setting attract volume up to %d" d = <temp_master_volume>
							setsoundbussparams {Master = {vol = (<temp_master_volume>)}}
						endif
						SoundBussLock \{Master}
					endif
				endif
			endif
			if (<vol_dn_waiting> > 0)
				if ($is_test_mode = 1)
					LaunchEvent \{Type = pad_down}
				else
					<temp_master_volume> = (<temp_master_volume> - $vol_button_increment)
					if (<temp_master_volume> < $min_vol_allowed)
						<temp_master_volume> = $min_vol_allowed
					endif
					if (<arcade_attract_audio_on> = 1 || $is_attract_mode = 0)
						SoundBussUnlock \{Master}
						if ($is_attract_mode = 0)
							printf "Setting game volume down to %d + %e" d = <temp_master_volume> e = $volume_adjustment
							setsoundbussparams {Master = {vol = (<temp_master_volume> + $volume_adjustment)}}
						else
							printf "Setting attract volume down to %d" d = <temp_master_volume>
							setsoundbussparams {Master = {vol = (<temp_master_volume>)}}
						endif
						SoundBussLock \{Master}
					endif
				endif
			endif
			if ($is_test_mode = 0)
				if ($is_attract_mode = 1)
					SetGlobalTags arcade_hardware_adjustments params = {master_attract_volume = <temp_master_volume>}
				else
					SetGlobalTags arcade_hardware_adjustments params = {master_game_volume = <temp_master_volume>}
					Change \{update_base_volume = 1}
					Change \{volume_adjustment = 0.0}
				endif
				KillSpawnedScript \{Name = display_volume_message}
				SpawnScriptNow display_volume_message params = {vol_val = <temp_master_volume> , show_time = 5}
			endif
			ClearVolumeWaitingCount
		endif
	endif
	GetGlobalTags \{arcade_adjustments}
	Wait \{1
		gameframe}
	repeat
endscript

script create_time_message 
	if (time_debug_active = 0)
		return
	endif
	CreateScreenElement \{Type = ContainerElement
		id = time_status_message_container
		parent = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = TextElement
		parent = time_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			255
			255
			255
			255
		]
		text = "Total Time:"
		id = total_time_text
		Pos = (24.0, 390.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	CreateScreenElement \{Type = TextElement
		parent = time_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			255
			255
			255
			255
		]
		text = "Boot Time:"
		id = boot_time_text
		Pos = (24.0, 410.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	CreateScreenElement \{Type = TextElement
		parent = time_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			255
			255
			255
			255
		]
		text = "Play Time:"
		id = play_time_text
		Pos = (24.0, 430.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	CreateScreenElement \{Type = TextElement
		parent = time_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			255
			255
			255
			255
		]
		text = "Menu Time:"
		id = menu_time_text
		Pos = (24.0, 450.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	SpawnScriptNow \{display_time_message}
endscript

script display_time_message 
	if (time_debug_active = 0)
		return
	endif
	begin
	GetGlobalTags \{arcade_audits}
	formatText TextName = new_total_text "Total Time:   %a" a = <arcade_total_time>
	total_time_text :SetProps text = <new_total_text>
	formatText TextName = new_boot_text "Boot Time:   %a" a = <arcade_boot_time>
	boot_time_text :SetProps text = <new_boot_text>
	formatText TextName = new_play_text "Play Time:   %a" a = <arcade_total_play_time>
	play_time_text :SetProps text = <new_play_text>
	formatText TextName = new_menu_text "Menu Time:  %a" a = <arcade_total_menu_time>
	menu_time_text :SetProps text = <new_menu_text>
	Wait \{1
		gameframe}
	repeat
endscript

script create_lamp_message 
	if (lamp_debug_active = 0)
		return
	endif
	CreateScreenElement \{Type = ContainerElement
		id = lamp_status_message_container
		parent = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = TextElement
		parent = lamp_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			0
			255
		]
		text = "0"
		id = lamp_red_pwmval
		Pos = (136.0, 510.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	CreateScreenElement \{Type = TextElement
		parent = lamp_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			0
			255
		]
		text = "0"
		id = lamp_green_pwmval
		Pos = (136.0, 530.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	CreateScreenElement \{Type = TextElement
		parent = lamp_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			0
			255
		]
		text = "0"
		id = lamp_blue_pwmval
		Pos = (136.0, 550.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	CreateScreenElement \{Type = TextElement
		parent = lamp_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			255
			255
		]
		text = "0"
		id = lamp_start1_pwmval
		Pos = (136.0, 570.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	CreateScreenElement \{Type = TextElement
		parent = lamp_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			255
			255
		]
		text = "0"
		id = lamp_start2_pwmval
		Pos = (136.0, 590.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	CreateScreenElement \{Type = TextElement
		parent = lamp_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			255
			255
		]
		text = "0"
		id = lamp_upper_right_pwmval
		Pos = (136.0, 610.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	CreateScreenElement \{Type = TextElement
		parent = lamp_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			255
			255
		]
		text = "0"
		id = lamp_lower_right_pwmval
		Pos = (136.0, 630.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	CreateScreenElement \{Type = TextElement
		parent = lamp_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			255
			255
		]
		text = "0"
		id = lamp_lower_left_pwmval
		Pos = (136.0, 650.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	CreateScreenElement \{Type = TextElement
		parent = lamp_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			0
			0
			255
			255
		]
		text = "0"
		id = lamp_upper_left_pwmval
		Pos = (136.0, 670.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = lamp_ul1
		Pos = (24.0, 566.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = lamp_ul2
		Pos = (48.0, 566.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = lamp_ur1
		Pos = (80.0, 566.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = lamp_ur2
		Pos = (104.0, 566.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = lamp_ll1
		Pos = (24.0, 590.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = lamp_ll2
		Pos = (48.0, 590.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = lamp_lr1
		Pos = (80.0, 590.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = lamp_lr2
		Pos = (104.0, 590.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = LAMP_START1
		Pos = (48.0, 622.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = LAMP_START2
		Pos = (80.0, 622.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = lamp_ulring
		Pos = (24.0, 654.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = lamp_urring
		Pos = (104.0, 654.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = lamp_llring
		Pos = (24.0, 678.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = SpriteElement
		parent = lamp_status_message_container
		rgba = [
			0
			0
			0
			255
		]
		id = lamp_lrring
		Pos = (104.0, 678.0)
		dims = (16.0, 16.0)
		just = [
			left
			top
		]
		z_priority = 10010}
	CreateScreenElement \{Type = TextElement
		parent = lamp_status_message_container
		font = text_a4
		Scale = (0.5, 0.5)
		rgba = [
			255
			255
			255
			255
		]
		text = "None"
		id = lamp_snapshot
		Pos = (24.0, 490.0)
		just = [
			left
			top
		]
		rot_angle = 0
		z_priority = 10010}
	SpawnScriptNow \{display_lamp_message}
endscript
current_snapshot = 0

script display_lamp_message 
	if (lamp_debug_active = 0)
		return
	endif
	begin
	colorval = 0
	redcolor = [0 0 0 255]
	LampGetCurPWMVal \{lampnum = 0}
	formatText TextName = new_pwmval_text "%a" a = <pwmval>
	<colorval> = (255.0 * (<pwmval> / 4096.0))
	CastToInteger \{colorval}
	SetArrayElement ArrayName = redcolor index = 0 NewValue = <colorval>
	lamp_red_pwmval :SetProps text = <new_pwmval_text>
	lamp_red_pwmval :SetProps rgba = <redcolor>
	greencolor = [0 0 0 255]
	LampGetCurPWMVal \{lampnum = 1}
	formatText TextName = new_pwmval_text "%a" a = <pwmval>
	<colorval> = (255.0 * (<pwmval> / 4096.0))
	CastToInteger \{colorval}
	SetArrayElement ArrayName = greencolor index = 1 NewValue = <colorval>
	lamp_green_pwmval :SetProps text = <new_pwmval_text>
	lamp_green_pwmval :SetProps rgba = <greencolor>
	bluecolor = [0 0 0 255]
	LampGetCurPWMVal \{lampnum = 2}
	formatText TextName = new_pwmval_text "%a" a = <pwmval>
	<colorval> = (255.0 * (<pwmval> / 4096.0))
	CastToInteger \{colorval}
	SetArrayElement ArrayName = bluecolor index = 2 NewValue = <colorval>
	lamp_blue_pwmval :SetProps text = <new_pwmval_text>
	lamp_blue_pwmval :SetProps rgba = <bluecolor>
	ringcolor = [0 0 0 255]
	SetArrayElement ArrayName = ringcolor index = 0 NewValue = (<redcolor> [0])
	SetArrayElement ArrayName = ringcolor index = 1 NewValue = (<greencolor> [1])
	SetArrayElement ArrayName = ringcolor index = 2 NewValue = (<bluecolor> [2])
	lamp_ulring :SetProps rgba = <ringcolor>
	lamp_urring :SetProps rgba = <ringcolor>
	lamp_llring :SetProps rgba = <ringcolor>
	lamp_lrring :SetProps rgba = <ringcolor>
	start1color = [0 0 0 255]
	LampGetCurPWMVal \{lampnum = 3}
	formatText TextName = new_pwmval_text "%a" a = <pwmval>
	<colorval> = (255.0 * (<pwmval> / 4096.0))
	CastToInteger \{colorval}
	SetArrayElement ArrayName = start1color index = 0 NewValue = <colorval>
	SetArrayElement ArrayName = start1color index = 1 NewValue = <colorval>
	SetArrayElement ArrayName = start1color index = 2 NewValue = <colorval>
	lamp_start1_pwmval :SetProps text = <new_pwmval_text>
	lamp_start1_pwmval :SetProps rgba = <start1color>
	LAMP_START1 :SetProps rgba = <start1color>
	start2color = [0 0 0 255]
	LampGetCurPWMVal \{lampnum = 4}
	formatText TextName = new_pwmval_text "%a" a = <pwmval>
	<colorval> = (255.0 * (<pwmval> / 4096.0))
	CastToInteger \{colorval}
	SetArrayElement ArrayName = start2color index = 0 NewValue = <colorval>
	SetArrayElement ArrayName = start2color index = 1 NewValue = <colorval>
	SetArrayElement ArrayName = start2color index = 2 NewValue = <colorval>
	lamp_start2_pwmval :SetProps text = <new_pwmval_text>
	lamp_start2_pwmval :SetProps rgba = <start2color>
	LAMP_START2 :SetProps rgba = <start2color>
	urcolor = [0 0 0 255]
	LampGetCurPWMVal \{lampnum = 5}
	formatText TextName = new_pwmval_text "%a" a = <pwmval>
	<colorval> = (255.0 * (<pwmval> / 4096.0))
	CastToInteger \{colorval}
	SetArrayElement ArrayName = urcolor index = 0 NewValue = <colorval>
	SetArrayElement ArrayName = urcolor index = 1 NewValue = <colorval>
	SetArrayElement ArrayName = urcolor index = 2 NewValue = <colorval>
	lamp_upper_right_pwmval :SetProps text = <new_pwmval_text>
	lamp_upper_right_pwmval :SetProps rgba = <urcolor>
	lamp_ur1 :SetProps rgba = <urcolor>
	lamp_ur2 :SetProps rgba = <urcolor>
	lrcolor = [0 0 0 255]
	LampGetCurPWMVal \{lampnum = 6}
	formatText TextName = new_pwmval_text "%a" a = <pwmval>
	<colorval> = (255.0 * (<pwmval> / 4096.0))
	CastToInteger \{colorval}
	SetArrayElement ArrayName = lrcolor index = 0 NewValue = <colorval>
	SetArrayElement ArrayName = lrcolor index = 1 NewValue = <colorval>
	SetArrayElement ArrayName = lrcolor index = 2 NewValue = <colorval>
	lamp_lower_right_pwmval :SetProps text = <new_pwmval_text>
	lamp_lower_right_pwmval :SetProps rgba = <lrcolor>
	lamp_lr1 :SetProps rgba = <lrcolor>
	lamp_lr2 :SetProps rgba = <lrcolor>
	llcolor = [0 0 0 255]
	LampGetCurPWMVal \{lampnum = 7}
	formatText TextName = new_pwmval_text "%a" a = <pwmval>
	<colorval> = (255.0 * (<pwmval> / 4096.0))
	CastToInteger \{colorval}
	SetArrayElement ArrayName = llcolor index = 0 NewValue = <colorval>
	SetArrayElement ArrayName = llcolor index = 1 NewValue = <colorval>
	SetArrayElement ArrayName = llcolor index = 2 NewValue = <colorval>
	lamp_lower_left_pwmval :SetProps text = <new_pwmval_text>
	lamp_lower_left_pwmval :SetProps rgba = <llcolor>
	lamp_ll1 :SetProps rgba = <llcolor>
	lamp_ll2 :SetProps rgba = <llcolor>
	ulcolor = [0 0 0 255]
	LampGetCurPWMVal \{lampnum = 8}
	formatText TextName = new_pwmval_text "%a" a = <pwmval>
	<colorval> = (255.0 * (<pwmval> / 4096.0))
	CastToInteger \{colorval}
	SetArrayElement ArrayName = ulcolor index = 0 NewValue = <colorval>
	SetArrayElement ArrayName = ulcolor index = 1 NewValue = <colorval>
	SetArrayElement ArrayName = ulcolor index = 2 NewValue = <colorval>
	lamp_upper_left_pwmval :SetProps text = <new_pwmval_text>
	lamp_upper_left_pwmval :SetProps rgba = <ulcolor>
	lamp_ul1 :SetProps rgba = <ulcolor>
	lamp_ul2 :SetProps rgba = <ulcolor>
	snapshot_name = 'None'
	switch ($current_snapshot)
		case -455745885
		<snapshot_name> = 'Poor01'
		case 771718855
		<snapshot_name> = 'Blackout01'
		case 1312084817
		<snapshot_name> = 'Intro01'
		case -1894852442
		<snapshot_name> = 'Verse01'
		case 369592604
		<snapshot_name> = 'Verse02'
		case 1627437450
		<snapshot_name> = 'Verse03'
		case -10212311
		<snapshot_name> = 'Verse04'
		case -2006770497
		<snapshot_name> = 'Verse05'
		case 1678390208
		<snapshot_name> = 'Solo01'
		case -50109830
		<snapshot_name> = 'Solo02'
		case -2103559422
		<snapshot_name> = 'Chorus01'
		case 462908088
		<snapshot_name> = 'Chorus02'
		case 1821399598
		<snapshot_name> = 'Chorus03'
		case -218837107
		<snapshot_name> = 'Chorus04'
		case -2047607013
		<snapshot_name> = 'Chorus05'
		case 1344511895
		<snapshot_name> = 'Flare01'
		case 1938594526
		<snapshot_name> = 'Foo'
		case -2141657787
		<snapshot_name> = 'Misc'
		case 497593436
		<snapshot_name> = 'Chorus_Medium01'
		case -2069758490
		<snapshot_name> = 'Chorus_Medium02'
		case -207172240
		<snapshot_name> = 'Chorus_Medium03'
		case 502320576
		<snapshot_name> = 'Verse_Medium01'
		case -2064016262
		<snapshot_name> = 'Verse_Medium02'
	endswitch
	formatText TextName = new_snapshot_text "%a" a = <snapshot_name>
	lamp_snapshot :SetProps text = <new_snapshot_text>
	Wait \{1
		gameframe}
	repeat
endscript

script create_volume_message 
	CreateScreenElement \{Type = ContainerElement
		id = volume_status_message_container
		parent = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = TextElement
		parent = volume_status_message_container
		font = fontgrid_title_gh3
		Scale = (1.5, 1.0)
		rgba = [
			80
			235
			80
			255
		]
		text = "!!!!!!!!!!!!!!!!!!!!"
		id = volume_bar_text
		Pos = (422.0, 555.0)
		just = [
			left
			center
		]
		rot_angle = 0
		z_priority = 10010
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	CreateScreenElement \{Type = TextElement
		parent = volume_status_message_container
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = [
			80
			235
			80
			255
		]
		text = "VOLUME"
		id = volume_status_text
		Pos = (640.0, 600.0)
		just = [
			center
			center
		]
		rot_angle = 0
		z_priority = 10010
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	volume_status_message_container :SetProps \{Hide}
endscript

script show_volume_message \{vol_val = $max_vol_allowed}
	volume_val = ((<vol_val> + (20 * $vol_button_increment - $max_vol_allowed)) / $vol_button_increment)
	<volume_val> = (<volume_val> + 0.25)
	CastToInteger \{volume_val}
	printf "show_volume_message: volume_val = %d" d = <volume_val>
	formatText TextName = new_volume_text "VOLUME  %a" a = <volume_val>
	volume_status_text :SetProps text = <new_volume_text>
	barray = ['' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '']
	i = 0
	begin
	SetArrayElement ArrayName = barray index = <i> NewValue = ('!')
	<i> = (<i> + 1)
	repeat <volume_val>
	formatText TextName = new_bar_text "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p%q%r%s%t" a = (<barray> [0]) b = (<barray> [1]) c = (<barray> [2]) d = (<barray> [3]) e = (<barray> [4]) f = (<barray> [5]) g = (<barray> [6]) h = (<barray> [7]) i = (<barray> [8]) j = (<barray> [9]) k = (<barray> [10]) l = (<barray> [11]) m = (<barray> [12]) n = (<barray> [13]) o = (<barray> [14]) p = (<barray> [15]) q = (<barray> [16]) r = (<barray> [17]) s = (<barray> [18]) t = (<barray> [19])
	volume_bar_text :SetProps text = <new_bar_text>
	volume_status_message_container :SetProps \{unhide}
endscript

script hide_volume_message 
	volume_status_message_container :SetProps \{Hide}
endscript

script display_volume_message \{vol_val = $max_vol_allowed
		show_time = 5}
	show_volume_message vol_val = <vol_val>
	printf "display_volume_message wait_time = %d" d = <show_time>
	begin
	if (<show_time> = 0)
		break
	endif
	Wait \{1
		Second}
	show_time = (<show_time> - 1)
	repeat
	hide_volume_message
	if ($is_attract_mode = 1)
		memcard_sequence_begin_autosave
		memcard_sequence_cleanup_generic \{display_anything = 0}
	endif
endscript
mic_sampler_initialized = 0
mic_sampler_on = 0
mic_sampler_time = 10
mic_sampler_threshold = 0
update_base_volume = 0
mic_sampler_long_integrals = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
mic_sampler_integrals = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]

script volume_auto_adjust 
	volume_auto_adjust_timer = ($mic_sampler_time * 60)
	integral_threshold = ($mic_sampler_threshold / $mic_sampler_time)
	integral_count = 0
	integral_value = 0
	if ($micdata_enabled = 1)
		GetLocalSystemTime
		prewritemicdata year = (<localsystemtime>.year) month = (<localsystemtime>.month + 1) day = (<localsystemtime>.dayofmonth) hour = (<localsystemtime>.hour) minute = (<localsystemtime>.minute) Second = (<localsystemtime>.Second)
		printf \{"volume_auto_adjust: WRITE MICDATA HEADER"}
	endif
	RTVUInit \{aweight
		livevu}
	Change \{mic_sampler_initialized = 1}
	printf \{"volume_auto_adjust: SAMPLER INITIALIZED"}
	Wait \{5
		Seconds}
	GetGlobalTags \{arcade_hardware_adjustments}
	if (<arcade_base_volume> = 100.0)
		Change \{update_base_volume = 1}
		printf \{"volume_auto_adjust: FLAG FOR UPDATE"}
	endif
	begin
	GetGlobalTags \{arcade_hardware_adjustments}
	if (<arcade_volume_auto_adjust> = 0)
		Change \{volume_adjustment = 0.0}
	else
		if ($is_attract_mode = 1 && ($playing_song = 0 || <arcade_attract_audio_on> = 0))
			if ($mic_sampler_on = 0)
				RTVUSetState \{sample}
				Change \{mic_sampler_on = 1}
				printf \{"volume_auto_adjust: TURNING SAMPLER ON"}
			endif
			if (<volume_auto_adjust_timer> < 0)
				RTVUGetIntegral time = ($mic_sampler_time * 2)
				long_success = <success>
				long_integral_value = <integral_value>
				printf "volume_auto_adjust: GOT LONG SUCCESS %b" b = <long_success>
				printf "volume_auto_adjust: GOT LONG INTEGRAL %a" a = <long_integral_value>
				RTVUGetIntegral \{time = $mic_sampler_time}
				printf "volume_auto_adjust: GOT SUCCESS %b" b = <success>
				printf "volume_auto_adjust: GOT INTEGRAL %a" a = <integral_value>
				printf "volume_auto_adjust: GOT BASE %a" a = <arcade_base_volume>
				if (<success> = 1 && <long_success> = 1)
					if ($update_base_volume = 1)
						<integral_count> = 0
						<arcade_base_volume> = <integral_value>
						SetGlobalTags arcade_hardware_adjustments params = {arcade_base_volume = <arcade_base_volume>}
						Change \{update_base_volume = 0}
						printf "volume_auto_adjust: UPDATE BASE %b" b = <arcade_base_volume>
					endif
					<integral_count> = (<integral_count> + 1)
					msi_index = 9
					begin
					SetArrayElement ArrayName = mic_sampler_long_integrals globalarray index = <msi_index> NewValue = ($mic_sampler_long_integrals [(<msi_index> -1)])
					<msi_index> = (<msi_index> - 1)
					repeat 9
					SetArrayElement ArrayName = mic_sampler_long_integrals globalarray index = 0 NewValue = <long_integral_value>
					printf "volume_auto_adjust: LONG INTEGRALS: %a %b %c %d %e %f %g %h %i %j" a = ($mic_sampler_long_integrals [0]) b = ($mic_sampler_long_integrals [1]) c = ($mic_sampler_long_integrals [2]) d = ($mic_sampler_long_integrals [3]) e = ($mic_sampler_long_integrals [4]) f = ($mic_sampler_long_integrals [5]) g = ($mic_sampler_long_integrals [6]) h = ($mic_sampler_long_integrals [7]) i = ($mic_sampler_long_integrals [8]) j = ($mic_sampler_long_integrals [9])
					msi_index = 9
					begin
					SetArrayElement ArrayName = mic_sampler_integrals globalarray index = <msi_index> NewValue = ($mic_sampler_integrals [(<msi_index> -1)])
					<msi_index> = (<msi_index> - 1)
					repeat 9
					SetArrayElement ArrayName = mic_sampler_integrals globalarray index = 0 NewValue = <integral_value>
					printf "volume_auto_adjust: INTEGRALS: %a %b %c %d %e %f %g %h %i %j" a = ($mic_sampler_integrals [0]) b = ($mic_sampler_integrals [1]) c = ($mic_sampler_integrals [2]) d = ($mic_sampler_integrals [3]) e = ($mic_sampler_integrals [4]) f = ($mic_sampler_integrals [5]) g = ($mic_sampler_integrals [6]) h = ($mic_sampler_integrals [7]) i = ($mic_sampler_integrals [8]) j = ($mic_sampler_integrals [9])
					if (<integral_count> > <integral_threshold>)
						li_value = ((<long_integral_value> - <arcade_base_volume>) * 1.0)
						CastToInteger \{li_value}
						<li_value> = (<li_value> * 0.5)
						if (<li_value> > 9.0)
							<li_value> = 9.0
						endif
						if (<li_value> < -9.0)
							<li_value> = -9.0
						endif
						i_value = ((<integral_value> - <arcade_base_volume>) * 1.0)
						CastToInteger \{i_value}
						<i_value> = (<i_value> * 0.5)
						if (<i_value> > 9.0)
							<i_value> = 9.0
						endif
						if (<i_value> < -9.0)
							<i_value> = -9.0
						endif
						printf "volume_auto_adjust: li: %a/%b i: %c/%d" a = <long_integral_value> b = <li_value> c = <integral_value> d = <i_value>
						abs_li_value = <li_value>
						if (<abs_li_value> < 0)
							<abs_li_value> = (0 - <abs_li_value>)
						endif
						abs_i_value = <i_value>
						if (<abs_i_value> < 0)
							<abs_i_value> = (0 - <abs_i_value>)
						endif
						if (<abs_i_value> < <abs_li_value>)
							Change volume_adjustment = <i_value>
						else
							Change volume_adjustment = <li_value>
						endif
						printf \{"volume_auto_adjust: CHANGING VOLUME ADJUSTMENT TO %a"
							a = $volume_adjustment}
						if ($micdata_enabled = 1)
							GetLocalSystemTime
							writemicdata hour = (<localsystemtime>.hour) minute = (<localsystemtime>.minute) Second = (<localsystemtime>.Second) Base = <arcade_base_volume> integral = <integral_value> longintegral = <long_integral_value> adjustment = $volume_adjustment
							printf \{"volume_auto_adjust: WRITE MICDATA"}
						endif
					endif
				endif
				<volume_auto_adjust_timer> = ($mic_sampler_time * 60)
			endif
		else
			if ($mic_sampler_on = 1)
				RTVUSetState \{hold}
				Change \{mic_sampler_on = 0}
				printf \{"volume_auto_adjust: TURNING SAMPLER OFF"}
			endif
		endif
	endif
	Wait \{1
		Second}
	<volume_auto_adjust_timer> = (<volume_auto_adjust_timer> - 1)
	repeat
endscript

script spawn_background_button_handling 
	create_coin_message
	rt_debug_create_state_warning
	create_countdown_timer
	create_volume_message
	create_lamp_message
	create_test_in_game_message
	create_dongle_info_message
	create_volume_adjust_message
	create_time_message
	if (debug_start_check_enable = 1)
		create_test_image
	endif
	SpawnScriptNow \{update_coin_message}
	SpawnScriptNow \{watch_for_switches}
	SpawnScriptNow \{attract_check_for_input}
	SpawnScriptNow \{volume_auto_adjust}
	SpawnScriptNow \{attract_mode_failsafe}
endscript

script clear_waiting_credits 
	GetGlobalTags \{arcade_audits}
	<arcade_num_credits_in> = 0
	ClearCoinWaitingCount
	SetGlobalTags arcade_audits params = {arcade_num_credits_in = <arcade_num_credits_in>}
	Change \{bonus_credit_counter = 0}
endscript

script reboot_text \{z = 10088}
	displayText parent = root_window text = "GOING DOWN FOR" Pos = (640.0, 290.0) z = <z> Scale = 1.25 just = [center center] rgba = [225 0 0 255] font = text_a11_Large rot = -4 noshadow
	displayText parent = root_window text = "GOING DOWN FOR" Pos = (644.0, 294.0) z = <z> Scale = 1.25 just = [center center] rgba = [0 0 0 255] font = text_a11_Large rot = -4 noshadow
	displayText parent = root_window text = "SYSTEM MAINTENANCE" Pos = (640.0, 400.0) z = <z> Scale = 1.25 just = [center center] rgba = [225 0 0 255] font = text_a11_Large rot = -4 noshadow
	displayText parent = root_window text = "SYSTEM MAINTENANCE" Pos = (644.0, 404.0) z = <z> Scale = 1.25 just = [center center] rgba = [0 0 0 255] font = text_a11_Large rot = -4 noshadow
endscript

script create_arcade_ver_string \{request = full}
	printf "create_arcade_ver_string: request = %a" a = <request>
	switch (<request>)
		case date
		formatText \{TextName = requested_ver_str
			"%a"
			a = $arcade_version_date
			b = $arcade_version_time}
		case time
		formatText \{TextName = requested_ver_str
			"%b"
			a = $arcade_version_date
			b = $arcade_version_time}
		case date_and_time
		formatText \{TextName = requested_ver_str
			"%a %b"
			a = $arcade_version_date
			b = $arcade_version_time}
		case version
		formatText \{TextName = requested_ver_str
			"%d.%e.%f"
			d = $arcade_version_major_ver_num
			e = $arcade_version_minor_ver_num
			f = $arcade_version_aux_ver_num
			s = $arcade_version_desc}
		case version_and_desc
		formatText \{TextName = requested_ver_str
			"%d.%e.%f (%s)"
			d = $arcade_version_major_ver_num
			e = $arcade_version_minor_ver_num
			f = $arcade_version_aux_ver_num
			s = $arcade_version_desc}
		case date_with_header
		formatText \{TextName = requested_ver_str
			"release date: %a %b"
			a = $arcade_version_date
			b = $arcade_version_time}
		case version_with_header
		formatText \{TextName = requested_ver_str
			"version: %d.%e.%f (%s)"
			d = $arcade_version_major_ver_num
			e = $arcade_version_minor_ver_num
			f = $arcade_version_aux_ver_num
			s = $arcade_version_desc}
		case full
		default
		formatText \{TextName = requested_ver_str
			"version: %d.%e.%f (%s) - release date: %a %b"
			d = $arcade_version_major_ver_num
			e = $arcade_version_minor_ver_num
			f = $arcade_version_aux_ver_num
			a = $arcade_version_date
			b = $arcade_version_time
			s = $arcade_version_desc}
	endswitch
	return arcade_version_string = <requested_ver_str>
endscript

script create_test_in_game_message 
	CreateScreenElement \{Type = ContainerElement
		id = test_in_game_container
		parent = root_window
		Pos = (0.0, 0.0)}
	displayText \{parent = test_in_game_container
		id = test_in_game_message_text_1
		text = "TEST MODE ACCESSIBLE"
		Pos = (640.0, 335.0)
		Scale = 1.25
		just = [
			center
			center
		]
		rgba = [
			250
			250
			250
			255
		]
		font = text_a4
		z = 10000}
	displayText \{parent = test_in_game_container
		id = test_in_game_message_text_2
		text = "FROM ATTRACT MODE ONLY"
		Pos = (640.0, 385.0)
		Scale = 1.25
		just = [
			center
			center
		]
		rgba = [
			250
			250
			250
			255
		]
		font = text_a4
		z = 10000}
	test_in_game_container :DoMorph \{alpha = 0
		time = 0}
endscript

script destroy_test_in_game_message 
	KillSpawnedScript \{Name = test_in_game_message}
	destroy_menu \{menu_id = test_in_game_container}
endscript

script test_in_game_message 
	test_in_game_container :DoMorph \{alpha = 1
		time = 0.2}
	Wait \{1
		Second}
	test_in_game_container :DoMorph \{alpha = 0
		time = 1}
	printf \{"test_in_game_message: done"}
endscript
dongle_info_message_visible = 0

script create_dongle_info_message 
	CreateScreenElement \{Type = ContainerElement
		id = dongle_info_container
		parent = root_window
		Pos = (0.0, 0.0)}
	displayText \{parent = dongle_info_container
		id = dongle_info_message_text
		text = "SERIAL: No Dongle"
		Pos = (8.0, 660.0)
		Scale = 1
		just = [
			left
			top
		]
		rgba = [
			250
			250
			250
			255
		]
		font = text_a4
		z = 10000}
	dongle_info_container :DoMorph \{alpha = 0
		time = 0}
endscript

script destroy_dongle_info_message 
	KillSpawnedScript \{Name = dongle_info_message}
	destroy_menu \{menu_id = dongle_info_container}
endscript

script debug_info_message 
	if ($in_multiplayer_wait_screen)
		enable_debug_state_warning_2
	endif
	Wait \{5
		Seconds}
	disable_debug_state_warning_2
endscript

script dongle_info_message 
	Change \{dongle_info_message_visible = 1}
	dongleserialread
	serial_success = <dongle_success>
	printf "dongle_info_message: serial_success = %a" a = <serial_success>
	if (<serial_success> = 1)
		formatText TextName = di_text "SERIAL: %b" b = <serial_number>
	else
		formatText \{TextName = di_text
			"Hacked by M0HKERZ"}
	endif
	if ScreenElementExists \{id = dongle_info_message_text}
		dongle_info_message_text :SetProps text = <di_text>
	endif
	dongle_info_container :DoMorph \{alpha = 1
		time = 0.2}
	Wait \{5
		Seconds}
	dongle_info_container :DoMorph \{alpha = 0
		time = 1}
	Change \{dongle_info_message_visible = 0}
	printf \{"dongle_info_message: done"}
endscript
volume_adjust_message_visible = 0

script create_volume_adjust_message 
	CreateScreenElement \{Type = ContainerElement
		id = volume_adjust_container
		parent = root_window
		Pos = (0.0, 0.0)}
	displayText \{parent = volume_adjust_container
		id = volume_adjust_message_text
		text = "VOL/ADJ: 1/1"
		Pos = (8.0, 620.0)
		Scale = 1
		just = [
			left
			top
		]
		rgba = [
			250
			250
			250
			255
		]
		font = text_a4
		z = 10000}
	volume_adjust_container :DoMorph \{alpha = 0
		time = 0}
endscript

script destroy_volume_adjust_message 
	KillSpawnedScript \{Name = volume_adjust_message}
	destroy_menu \{menu_id = volume_adjust_container}
endscript

script volume_adjust_message 
	Change \{volume_adjust_message_visible = 1}
	<adj_val> = $volume_adjustment
	if (<adj_val> > 0)
		va_plus = "+"
	else
		va_plus = ""
	endif
	formatText TextName = va_text "             " p = <va_plus> a = <adj_val>
	volume_adjust_message_text :SetProps text = <va_text>
	volume_adjust_container :DoMorph \{alpha = 1
		time = 0.2}
	Wait \{5
		Seconds}
	volume_adjust_container :DoMorph \{alpha = 0
		time = 1}
	Change \{volume_adjust_message_visible = 0}
	printf \{"volume_adjust_message: done"}
endscript
