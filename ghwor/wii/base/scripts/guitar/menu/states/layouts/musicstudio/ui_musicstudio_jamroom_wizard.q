
script ui_create_musicstudio_jamroom_wizard \{from_song = 0
		musicstudio_ghmix = 0
		init_style_select = 0}
	if (<init_style_select> = 1)
		musicstudio_jamroom_wizard_style_menu musicstudio_ghmix = <musicstudio_ghmix> init_style_select = <init_style_select>
	else
		destroy_generic_menu
		make_generic_menu \{title = qs(0xdfdcfc7e)
			vmenu_id = jamroom_wizard_vmenu
			desc = 'generic_musicstudio_menu'
			$musicstudio_menu_sound_scripts
			pad_back_params = {
				nosound
			}}
		jamroom_wizard_get_style_name
		add_generic_musicstudio_menu_text_item {
			text = <name_text>
			pad_choose_script = musicstudio_jamroom_wizard_style_menu
			pad_choose_params = {musicstudio_ghmix = <musicstudio_ghmix>}
		}
		if (<musicstudio_ghmix> = 0)
			musicstudio_auto_play_get_icon \{instrument = drum}
			add_generic_musicstudio_menu_icon_item {
				text = qs(0xab9dbd9a)
				icon = <icon>
				pad_choose_script = musicstudio_toggle_auto_play
				pad_choose_params = {instrument = drum index = 1}
				pad_choose_sound = <check_sound>
				<focusable>
			}
			musicstudio_auto_play_get_icon \{instrument = bass}
			add_generic_musicstudio_menu_icon_item {
				text = qs(0x5bd468e3)
				icon = <icon>
				pad_choose_script = musicstudio_toggle_auto_play
				pad_choose_params = {instrument = bass index = 2}
				pad_choose_sound = <check_sound>
				<focusable>
			}
			musicstudio_auto_play_get_icon \{instrument = rhythm}
			add_generic_musicstudio_menu_icon_item {
				text = qs(0x31ec35a6)
				icon = <icon>
				pad_choose_script = musicstudio_toggle_auto_play
				pad_choose_params = {instrument = rhythm index = 3}
				pad_choose_sound = <check_sound>
				<focusable>
			}
			musicstudio_auto_play_get_icon \{instrument = melody}
			add_generic_musicstudio_menu_icon_item {
				text = qs(0x9f22abcd)
				icon = <icon>
				pad_choose_script = musicstudio_toggle_auto_play
				pad_choose_params = {instrument = melody index = 4}
				pad_choose_sound = <check_sound>
				<focusable>
			}
			musicstudio_auto_play_get_icon \{instrument = lead}
			add_generic_musicstudio_menu_icon_item {
				text = qs(0xce976957)
				icon = <icon>
				pad_choose_script = musicstudio_toggle_auto_play
				pad_choose_params = {instrument = lead index = 5}
				pad_choose_sound = <check_sound>
				<focusable>
			}
			add_generic_musicstudio_menu_text_item {
				text = qs(0xa1ea347f)
				icon = <icon>
				pad_choose_script = musicstudio_wizard_jamroom_popup
				internal_just = [center , center]
			}
		else
			add_generic_musicstudio_menu_text_item {
				text = qs(0xa1ea347f)
				icon = <icon>
				pad_choose_script = musicstudio_wizard_ghmix_popup
			}
		endif
		selected = 6
		if ($musicstudio_jamroom_wizard_last_selected >= 0)
			<selected> = ($musicstudio_jamroom_wizard_last_selected)
		endif
		LaunchEvent Type = focus target = jamroom_wizard_vmenu data = {child_index = <selected>}
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
endscript
g_musicstudio_welcome_popup_ghmix_text = qs(0x4a9c9281)
g_musicstudio_welcome_popup_ghjam_text = qs(0xcd06b0b5)
g_musicstudio_ngc_hold_button_text = qs(0x19b3b4a5)
g_musicstudio_drum_text = qs(0xbee05b1b)

script musicstudio_wizard_ghmix_popup 
	if GotParam \{index}
		jamroom_wizard_set_style index = <index>
	endif
	if ScreenElementExists \{id = jamroom_wizard_vmenu}
		LaunchEvent \{Type = unfocus
			target = jamroom_wizard_vmenu}
	endif
	if ScreenElementExists \{id = jamroom_style_vmenu}
		LaunchEvent \{Type = unfocus
			target = jamroom_style_vmenu}
	endif
	user_control_helper_get_buttonchar \{button = start}
	destroy_dialog_box
	create_dialog_box {
		heading_text = qs(0x03ac90f0)
		body_text = qs(0x03ac90f0)
		player_device = ($primary_controller)
		no_background
		template = extended
		options = [
			{
				func = musicstudio_wizard_ghmix_popup_confirm
				text = qs(0x182f0173)
				sound_func = musicstudio_menu_music_final_select
			}
		]
	}
	if isdrumcontroller controller = ($primary_controller)
		CreateScreenElement {
			parent = dialog_box_container
			Type = descinterface
			desc = 'gh_welcome_text'
			Pos = (0.0, 0.0)
			Scale = 1.0
			mix_drum_text_alpha = 1
			mix_text_alpha = 0
			jam_text_alpha = 0
			z_priority = 25000
			drum_welcome_text = ($g_musicstudio_welcome_popup_ghmix_text)
			drum_hold_button_text = ($g_musicstudio_drum_text)
		}
	else
		CreateScreenElement {
			parent = dialog_box_container
			Type = descinterface
			desc = 'gh_welcome_text'
			Pos = (0.0, 0.0)
			Scale = 1.0
			mix_drum_text_alpha = 0
			mix_text_alpha = 1
			jam_text_alpha = 0
			z_priority = 25000
			mix_welcome_text = ($g_musicstudio_welcome_popup_ghmix_text)
			hold_button_text = ($g_musicstudio_ngc_hold_button_text)
		}
	endif
endscript

script musicstudio_wizard_ghmix_popup_confirm 
	musicstudio_menu_music_final_select
	destroy_dialog_box
	ui_event event = menu_change data = {state = uistate_musicstudio_ghmix back_to_jam_band = 0 current_instrument = 0 Player = ($jam_current_recording_player)}
endscript

script musicstudio_wizard_jamroom_popup 
	LaunchEvent \{Type = unfocus
		target = jamroom_wizard_vmenu}
	destroy_dialog_box
	left_button = qs(0x33864e0b)
	right_button = qs(0x2a9d7f4a)
	if IsGuitarController controller = ($primary_controller)
		<left_button> = qs(0xd5f11356)
		<right_button> = qs(0xfedc4095)
	elseif isdrumcontroller controller = ($primary_controller)
		<left_button> = qs(0xd5f11356)
		<right_button> = qs(0xfedc4095)
	endif
	create_dialog_box {
		heading_text = qs(0x03ac90f0)
		body_text = qs(0x03ac90f0)
		player_device = ($primary_controller)
		no_background
		template = extended
		options = [
			{
				func = musicstudio_wizard_jamroom_popup_confirm
				text = qs(0x182f0173)
				sound_func = musicstudio_menu_music_final_select
			}
		]
		pad_choose_sound = musicstudio_menu_music_final_select
	}
	CreateScreenElement {
		parent = dialog_box_container
		Type = descinterface
		desc = 'gh_welcome_text'
		Pos = (0.0, 0.0)
		Scale = 0.95
		mix_text_alpha = 0
		jam_text_alpha = 1
		mix_drum_text_alpha = 0
		z_priority = 25000
		jam_welcome_text = ($g_musicstudio_welcome_popup_ghjam_text)
		left_button = <left_button>
		right_button = <right_button>
	}
endscript

script musicstudio_wizard_jamroom_popup_confirm 
	musicstudio_menu_music_final_select
	destroy_dialog_box
	create_loading_screen
	new_song_create_choose \{new_jamroom}
endscript

script new_song_create_choose \{tempo_index = 1}
	switch <tempo_index>
		case 0
		Change \{jam_current_bpm = 100}
		case 1
		Change \{jam_current_bpm = 120}
		case 2
		Change \{jam_current_bpm = 140}
	endswitch
	jam_setup_new_song \{no_drum}
	setsonginfo bpm = ($jam_current_bpm)
	generic_event_choose \{no_sound
		state = uistate_jam_band}
endscript
musicstudio_jamroom_wizard_last_selected = -1

script musicstudio_jamroom_wizard_style_menu \{init_style_select = 0}
	destroy_generic_menu
	Change \{musicstudio_jamroom_wizard_last_selected = 0}
	if (<init_style_select> = 1)
		Change \{musicstudio_jamroom_wizard_last_selected = -1}
		if (<musicstudio_ghmix> = 1)
			GetArraySize ($jamroom_wizard_styles)
			musicstudio_mainobj :musicstudiojamroom_setcurrentstyleindex style_index = (<array_Size> - 1)
		endif
		make_generic_menu \{title = qs(0x6fd9cc58)
			vmenu_id = jamroom_style_vmenu
			desc = 'generic_musicstudio_menu'
			$musicstudio_menu_sound_scripts
			pad_back_params = {
				nosound
			}}
	else
		make_generic_menu {
			title = qs(0x6fd9cc58)
			vmenu_id = jamroom_style_vmenu
			pad_back_script = ui_create_musicstudio_jamroom_wizard
			pad_back_params = {musicstudio_ghmix = <musicstudio_ghmix>}
			desc = 'generic_musicstudio_menu'
			$musicstudio_menu_sound_scripts
		}
	endif
	GetArraySize ($jamroom_wizard_styles)
	index = 0
	begin
	if (<musicstudio_ghmix> = 1)
		add_generic_musicstudio_menu_text_item {
			text = ($jamroom_wizard_styles [<index>].name_text)
			pad_choose_script = musicstudio_wizard_ghmix_popup
			pad_choose_params = {index = <index>}
		}
	else
		add_generic_musicstudio_menu_text_item {
			text = ($jamroom_wizard_styles [<index>].name_text)
			pad_choose_script = musicstudio_jamroom_wizard_select_style
			pad_choose_params = {index = <index> musicstudio_ghmix = <musicstudio_ghmix>}
		}
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	musicstudio_mainobj :musicstudiojamroom_getcurrentstyleindex
	LaunchEvent Type = focus target = jamroom_style_vmenu data = {child_index = <style_index>}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script musicstudio_jamroom_wizard_select_style 
	jamroom_wizard_set_style index = <index>
	musicstudio_toggle_auto_play_for_style
	ui_create_musicstudio_jamroom_wizard musicstudio_ghmix = <musicstudio_ghmix>
endscript

script musicstudio_toggle_auto_play 
	Change musicstudio_jamroom_wizard_last_selected = <index>
	musicstudio_mainobj :musicstudiojamroom_togglebotstatus instrument = <instrument>
	ui_create_musicstudio_jamroom_wizard
endscript

script musicstudio_auto_play_get_icon 
	focusable = focusable
	musicstudio_mainobj :musicstudiojamroom_getbotstatus instrument = <instrument>
	musicstudio_get_num_bots
	if (<num_bots> >= 4 && <Enabled> = 0)
		focusable = not_focusable
	endif
	musicstudio_mainobj :musicstudiojamroom_getcurrentstyleindex
	style_struct = ($jamroom_wizard_styles [<style_index>])
	if NOT StructureContains structure = <style_struct> bot_patterns
		focusable = not_focusable
	endif
	if (<Enabled> = 1)
		return icon = gh_studio_checked focusable = <focusable> check_sound = musicstudio_menu_music_uncheck
	else
		return icon = gh_studio_unchecked focusable = <focusable> check_sound = musicstudio_menu_music_check
	endif
endscript

script musicstudio_get_num_bots 
	GetArraySize ($jam_tracks)
	instrument = 0
	num_bots = 0
	begin
	musicstudio_mainobj :musicstudiojamroom_getbotstatus instrument = ($jam_tracks [<instrument>].id)
	if (<Enabled> = 1)
		<num_bots> = (<num_bots> + 1)
	endif
	<instrument> = (<instrument> + 1)
	repeat (<array_Size> - 1)
	return num_bots = <num_bots>
endscript

script musicstudio_toggle_auto_play_for_style 
	musicstudio_mainobj :musicstudiojamroom_getcurrentstyleindex
	GetArraySize ($jam_tracks)
	instrument = 0
	begin
	style_struct = ($jamroom_wizard_styles [<style_index>])
	instrument_checksum = ($jam_tracks [<instrument>].id)
	instrument_struct = (<style_struct>.track_settings.<instrument_checksum>)
	default_bot = (<instrument_struct>.default_bot)
	musicstudio_mainobj :musicstudiojamroom_togglebotstatus On = <default_bot> instrument = <instrument_checksum>
	<instrument> = (<instrument> + 1)
	repeat (<array_Size> - 1)
endscript

script musicstudio_toggle_auto_play_all_off 
	GetArraySize ($jam_tracks)
	instrument = 0
	begin
	instrument_checksum = ($jam_tracks [<instrument>].id)
	musicstudio_mainobj :musicstudiojamroom_togglebotstatus On = FALSE instrument = <instrument_checksum>
	<instrument> = (<instrument> + 1)
	repeat (<array_Size> - 1)
endscript

script ui_destroy_musicstudio_jamroom_wizard 
	destroy_generic_menu
	destroy_dialog_box
	Change \{musicstudio_jamroom_wizard_last_selected = -1}
endscript

script ui_init_musicstudio_jamroom_wizard 
	musicstudio_mainobj :musicstudiojamroom_setcurrentstyleindex \{style_index = 0}
	musicstudio_toggle_auto_play_for_style
endscript

script ui_deinit_musicstudio_jamroom_wizard 
endscript
