options_menu_font = text_a5
g_options_start_pos = (460.0, 100.0)
options_menu_index = 1
options_version_string_scale = 0.45000002
options_version_loc_root = (25.0, 50.0)
options_version_loc_text_off = (15.0, 10.0)
options_poster_loc_root = (640.0, 340.0)
options_menu_num_selections = 1

script create_options_menu 
	if ($rt_file_debug_enabled)
		Change \{options_menu_num_selections = 7}
	else
		Change \{options_menu_num_selections = 7}
	endif
	Change \{options_version_loc_root = (25.0, 50.0)}
	Change \{is_test_mode = 1}
	lamps_all_off
	SpawnScriptNow \{menu_music_on}
	Change \{options_for_manage_band = 0}
	disable_props = {rgba = [255 128 128 255] tag_disabled}
	Change \{current_num_players = 1}
	font_size = 0.95
	bluish = [130 160 175 255]
	set_focus_color \{rgba = [
			223
			223
			223
			255
		]}
	set_unfocus_color rgba = <red>
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = om_container
		Scale = 1.1
		Pos = (-20.0, -20.0)}
	set_focus_color \{rgba = [
			220
			220
			220
			255
		]}
	set_unfocus_color \{rgba = [
			0
			0
			0
			255
		]}
	if ($enable_saving = 0)
		saveload_props = {rgba = [128 128 128 255] tag_disabled}
	else
		saveload_props = {}
	endif
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] tag_disabled}
	else
		demo_mode_disable = {}
	endif
	Change \{options_menu_index = 1}
	rot = 3
	displaySprite parent = om_container tex = options_main_poster Pos = $options_poster_loc_root dims = (600.0, 600.0) just = [center center] rot_angle = <rot>
	displaySprite parent = om_container id = om_black_bg tex = options_main_highlight Pos = (500.0, 210.0) dims = (180.0, 30.0) rgba = [50 0 0 255] z = 9 just = [center center] rot_angle = <rot>
	titleScale = 1.1
	if ((German) || (Spanish))
		titleScale = 1.5
	endif
	text_options_desc_root_loc = (746.0, 110.0)
	displayText parent = om_container text = "TEST MENU" Pos = <text_options_desc_root_loc> Scale = <titleScale> just = [center center] rgba = [50 0 0 255] font = text_a11_Large z = 10 rot = (<rot> -3) noshadow
	displayText parent = om_container text = "TEST MENU" Pos = (<text_options_desc_root_loc> + (-5.0, 5.0)) Scale = <titleScale> just = [center center] rgba = [160 130 105 255] font = text_a11_Large z = 9 rot = (<rot> -2) noshadow
	displaySprite parent = om_container id = options_monster tex = options_main_monster Pos = (735.0, 320.0) dims = (256.0, 512.0) z = 15 just = [center center] rot_angle = <rot>
	RunScriptOnScreenElement \{id = options_monster
		anim_float}
	text_params = {parent = om_container Type = TextElement font = ($options_menu_font) rgba = ($menu_unfocus_color) Scale = <font_size> rot_angle = <rot> z_priority = 10}
	CreateScreenElement {
		<text_params>
		id = om_text_1
		text = "AUDITS"
		Pos = (508.0, 100.0)
		Scale = 0.7
		Enabled = 0
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_audits}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (512.0, 93.0) bg_dims = (190.0, 53.0)
	CreateScreenElement {
		<text_params>
		id = om_text_2
		text = "CALIBRATIONS"
		Pos = (506.0, 140.0)
		Scale = 0.6
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_calibrations}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (510.0, 135.0) bg_dims = (190.0, 39.0)
	CreateScreenElement {
		<text_params>
		id = om_text_3
		text = "DIAGNOSTICS"
		Pos = (506.0, 184.0)
		Scale = 0.65000004
		Enabled = 1
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_diagnostics}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (506.0, 178.0) bg_dims = (190.0, 50.0)
	CreateScreenElement {
		<text_params>
		id = om_text_4
		text = "LOGS"
		Pos = (503.0, 225.0)
		Scale = 0.48000002
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_log}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (505.0, 221.0) bg_dims = (192.0, 38.0)
	CreateScreenElement {
		<text_params>
		id = om_text_5
		text = "RESETS"
		Pos = (501.0, 264.0)
		Scale = 0.48000002
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_resets}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (503.0, 260.0) bg_dims = (192.0, 38.0)
	CreateScreenElement {
		<text_params>
		id = om_text_6
		text = "SETTINGS"
		Pos = (501.0, 308.0)
		Scale = 0.65000004
		Enabled = 0
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_settings}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (501.0, 302.0) bg_dims = (185.0, 52.0)
	CreateScreenElement {
		<text_params>
		id = om_text_7
		text = "SERIAL"
		Pos = (500.0, 354.0)
		Scale = 0.75
		Enabled = 1
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_serial}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (498.0, 348.0) bg_dims = (190.0, 52.0)
	dongleserialread
	if (<dongle_success> = 0 || (<serial_number> >= 0 && <serial_number> <= 99999))
		<id> :SetProps <disable_props>
		<id> :SetTags <disable_props>
	endif
	displaySprite \{parent = om_container
		tex = tape_H_03
		Pos = (420.0, 590.0)
		Scale = 0.5
		z = 20}
	displaySprite {
		parent = <id>
		tex = tape_H_03
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaySprite \{parent = om_container
		tex = tape_H_04
		Pos = (309.0, 55.0)
		Scale = 0.5
		z = 20
		rot_angle = -20}
	displaySprite {
		parent = <id>
		tex = tape_H_04
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaySprite \{parent = om_container
		tex = tape_V_02
		Pos = (840.0, 380.0)
		Scale = 0.5
		z = 20}
	displaySprite {
		parent = <id>
		tex = tape_V_02
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaySprite parent = om_container tex = Options_Calibrate_Paper Pos = ($options_version_loc_root - (0.0, 30.0)) noshadow Scale = (1.4, 1.6)
	Change options_version_loc_root = ($options_version_loc_root + $options_version_loc_text_off)
	displayText parent = om_container text = "Version Info" Pos = ($options_version_loc_root + (120.0, -6.0)) Scale = 0.8 just = [center center] rgba = [0 0 0 255] rot = -5 font = text_a8 z = 10 noshadow
	Change options_version_loc_root = ($options_version_loc_root + (0.0, 20.0))
	numStringCount = 0
	nameStr = ""
	begin
	Change options_version_loc_root = ($options_version_loc_root + (0.0, 22.0))
	create_rt_version_get_string stringID = <numStringCount> nameOrData = Name
	<nameStr> = <versionString>
	create_rt_version_get_string stringID = <numStringCount>
	printf "create_options: string %d (%t) = %s" d = <numStringCount> t = <nameStr> s = <versionString>
	formatText TextName = op_ver_txt "%s: %t" s = <nameStr> t = <versionString>
	displayText parent = om_container text = <op_ver_txt> Pos = ($options_version_loc_root) Scale = $options_version_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	<numStringCount> = (<numStringCount> + 1)
	if (<numStringCount> >= 5)
		break
	endif
	repeat
	Change options_version_loc_root = ($options_version_loc_root + (0.0, 22.0))
	GetBBHBoardVersion
	formatText TextName = bbh_io_version_str "I/O: %s" s = <verString>
	CreateScreenElement {
		Type = TextElement
		parent = om_container
		id = io_board_version
		just = [left bottom]
		font = text_a4
		text = <bbh_io_version_str>
		Scale = $options_version_string_scale
		rgba = [0 0 0 255]
		Pos = $options_version_loc_root
		z_priority = 51
	}
	Change options_version_loc_root = ($options_version_loc_root + (0.0, 22.0))
	GetFMODVersion
	printf "create_options: FMOD = %s" s = <fmodVerStr>
	formatText TextName = op_fmod_ver "FMOD Ver: %s" s = <fmodVerStr>
	displayText parent = om_container text = <op_fmod_ver> Pos = ($options_version_loc_root) Scale = $options_version_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	Change options_version_loc_root = ($options_version_loc_root + (0.0, 22.0))
	if ($rt_guitar_left_initialized)
		if ($rt_guitar_left_enabled)
			GetRTGuitarFretVersion \{controller = player1_device}
			formatText TextName = op_left_guitar_status "LEFT GUITAR: fw:%d hw:%e" d = <fwVersion> e = <boardVersion>
		else
			formatText \{TextName = op_left_guitar_status
				"LEFT GUITAR: removed"}
		endif
	else
		formatText \{TextName = op_left_guitar_status
			"LEFT GUITAR: missing at boot"}
	endif
	displayText parent = om_container text = <op_left_guitar_status> Pos = ($options_version_loc_root) Scale = $options_version_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	Change options_version_loc_root = ($options_version_loc_root + (0.0, 22.0))
	if ($rt_guitar_right_initialized)
		if ($rt_guitar_right_enabled)
			GetRTGuitarFretVersion \{controller = player2_device}
			formatText TextName = op_right_guitar_status "RIGHT GUITAR: fw:%d hw:%e" d = <fwVersion> e = <boardVersion>
		else
			formatText \{TextName = op_right_guitar_status
				"RIGHT GUITAR: removed"}
		endif
	else
		formatText \{TextName = op_right_guitar_status
			"RIGHT GUITAR: missing at boot"}
	endif
	displayText parent = om_container text = <op_right_guitar_status> Pos = ($options_version_loc_root) Scale = $options_version_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	Change options_version_loc_root = ($options_version_loc_root + (0.0, 22.0))
	formatText \{TextName = op_seed_text
		"ID: N/A"}
	displayText parent = om_container id = om_seed_text text = <op_seed_text> Pos = ($options_version_loc_root) Scale = $options_version_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	SpawnScriptLater \{options_seed_read}
	Change options_version_loc_root = ($options_version_loc_root + (0.0, 22.0))
	formatText \{TextName = op_serial_text
		"SERIAL: N/A"}
	displayText parent = om_container id = om_serial_text text = <op_serial_text> Pos = ($options_version_loc_root) Scale = $options_version_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	SpawnScriptLater \{options_serial_read}
	Change options_version_loc_root = ($options_version_loc_root + (0.0, 22.0))
	formatText \{TextName = op_lifetime_coins_text
		"LIFETIME COINS: N/A"}
	displayText parent = om_container id = om_lifetime_coins_text text = <op_lifetime_coins_text> Pos = ($options_version_loc_root) Scale = $options_version_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	SpawnScriptLater \{options_lifetime_coins_read}
	Change options_version_loc_root = ($options_version_loc_root + (0.0, 22.0))
	if ($watchdog_audit_retries)
		watchdog_char = '!'
	else
		watchdog_char = ''
	endif
	IsWatchdogFound
	printf "Watchdog state: %d" d = <isWDPresent>
	GetWDRetries
	GetWDConfigMsgCount
	if ($rt_debug_watchdog_info_mode)
		if (<isWDPresent> = FALSE)
			formatText TextName = op_watchdog_status_text "WATCHDOG: not found (a:%d n:%e c:%f/%g)%s" d = <wd_att_tries> e = <wd_nf_tries> f = <wd_msg_sent_count> g = <wd_msg_recd_count> s = <watchdog_char>
		else
			formatText TextName = op_watchdog_status_text "WATCHDOG: present (a:%d n:%e c:%f/%g)%s" d = <wd_att_tries> e = <wd_nf_tries> f = <wd_msg_sent_count> g = <wd_msg_recd_count> s = <watchdog_char>
		endif
	else
		if (<isWDPresent> = FALSE)
			formatText TextName = op_watchdog_status_text "WATCHDOG: not found %s" s = <watchdog_char>
		else
			formatText TextName = op_watchdog_status_text "WATCHDOG: present %s" s = <watchdog_char>
		endif
	endif
	displayText parent = om_container id = op_watchdog_status_text text = <op_watchdog_status_text> Pos = ($options_version_loc_root) Scale = $options_version_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	SpawnScriptLater \{options_lifetime_coins_read}
	displaySprite \{parent = om_container
		tex = Venue_Overlay
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50}
	Change \{menu_options_current_index = 1}
	LaunchEvent \{Type = focus
		target = om_text_1}
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	begin
	index = ($menu_options_current_index)
	formatText checksumName = text_id 'om_text_%d' d = <index>
	<text_id> :GetTags
	if is_disabled id = <text_id>
		LaunchEvent Type = unfocus target = <text_id>
		LaunchEvent Type = pad_down target = <text_id>
		<text_id> :SetProps rgba = [255 128 128 255]
	else
		break
	endif
	repeat
	GetGlobalTags \{arcade_audits}
	printf "create_options_menu: adjusts before left=%d right=%e" d = <arcade_left_guitar_device> e = <arcade_right_guitar_device>
endscript

script options_seed_read 
	Wait \{5
		gameframes}
	if ScreenElementExists \{id = om_seed_text}
		dongleseedread
		if (<dongle_success> = 1)
			formatText TextName = op_seed_text "ID: %a-GHA" a = <seed_value>
		elseif (<dongle_success> = -1)
			formatText \{TextName = op_seed_text
				"ID: Session Error"}
		elseif (<dongle_success> = -2)
			formatText \{TextName = op_seed_text
				"ID: Parse Error"}
		elseif (<dongle_success> = -3)
			formatText \{TextName = op_seed_text
				"ID: Extents Error"}
		else
			formatText \{TextName = op_seed_text
				"ID: No Dongle"}
		endif
		if ScreenElementExists \{id = om_seed_text}
			om_seed_text :SetProps text = <op_seed_text>
		endif
	endif
endscript

script options_serial_read 
	Wait \{10
		gameframes}
	tc = [0 0 0 255]
	if ScreenElementExists \{id = om_serial_text}
		dongleserialread
		if (<dongle_success> = 1)
			if (<serial_number> >= 0 && <serial_number> <= 99999)
				formatText TextName = op_serial_text "SERIAL: %a" a = <serial_number>
			else
				formatText TextName = op_serial_text "SERIAL: NOT SET" a = <serial_number>
				<tc> = [255 0 0 255]
			endif
		else
			formatText \{TextName = op_serial_text
				"SERIAL: No Dongle"}
		endif
		if ScreenElementExists \{id = om_serial_text}
			om_serial_text :SetProps text = <op_serial_text> rgba = <tc>
		endif
	endif
endscript

script options_lifetime_coins_read 
	Wait \{15
		gameframes}
	if ScreenElementExists \{id = om_lifetime_coins_text}
		donglecreditread
		if (<dongle_success> = 1)
			formatText TextName = op_lifetime_coins_text "LIFETIME COINS: %a" a = <coin_count>
		else
			formatText \{TextName = op_lifetime_coins_text
				"LIFETIME COINS: No Dongle"}
		endif
		if ScreenElementExists \{id = om_lifetime_coins_text}
			om_lifetime_coins_text :SetProps text = <op_lifetime_coins_text>
		endif
	endif
endscript

script options_select_manage_band 
	ui_flow_manager_respond_to_action \{action = select_manage_band}
	Change \{options_for_manage_band = 1}
endscript

script anim_float 
	if NOT ScreenElementExists \{id = options_monster}
		return
	endif
	GetScreenElementProps \{id = options_monster}
	base_pos = <Pos>
	options_monster :DoMorph \{Pos = {
			(0.0, 20.0)
			relative
		}
		time = 0.5
		motion = ease_in}
	begin
	options_monster :DoMorph \{Pos = {
			(0.0, -40.0)
			relative
		}
		time = 0.5
		motion = ease_out}
	options_monster :DoMorph \{Pos = {
			(0.0, 40.0)
			relative
		}
		time = 0.5
		motion = ease_in}
	repeat
endscript

script destroy_options_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = om_container}
	destroy_menu \{menu_id = om_scroll}
endscript
menu_options_current_index = 0

script options_change_index \{move = up}
	formatText checksumName = last_text_id 'om_text_%d' d = ($menu_options_current_index)
	if (<move> = up)
		if ($menu_options_current_index = 1)
			Change \{menu_options_current_index = $options_menu_num_selections}
		else
			Change menu_options_current_index = ($menu_options_current_index - 1)
		endif
	else
		if ($menu_options_current_index = $options_menu_num_selections)
			Change \{menu_options_current_index = 1}
		else
			Change menu_options_current_index = ($menu_options_current_index + 1)
		endif
	endif
	index = ($menu_options_current_index)
	if NOT is_disabled id = <last_text_id>
		LaunchEvent Type = unfocus target = <id>
	endif
	formatText checksumName = text_id 'om_text_%d' d = <index>
	<text_id> :GetTags
	if (GotParam tag_disabled)
		if (<move> = up)
			LaunchEvent Type = pad_up target = <text_id>
		else
			LaunchEvent Type = pad_down target = <text_id>
		endif
		return
	endif
	LaunchEvent Type = focus target = <text_id>
	generic_menu_up_or_down_sound
endscript

script is_disabled 
	<id> :GetTags
	if (GotParam tag_disabled)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script options_menu_hilight 
	index = ($menu_options_current_index)
	GetTags
	printf "options_menu_hilight: getting elements for %s" s = <id>
	GetScreenElementProps id = <id>
	SetScreenElementProps id = om_black_bg Pos = <bg_pos> dims = <bg_dims>
	retail_menu_focus
endscript
