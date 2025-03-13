musicstudio_jamroom_highways = 0
musicstudio_playline = 655.0
musicstudio_jamroom_gem_offset = 50.0
musicstudio_jamroom_show_playstate = 0
musicstudio_jamroom_max_highway_scroll_time = 1.8
musicstudio_jamroom_gem_offset_time = 0.88
musicstudio_jamroom_ghost_note_alpha = 0.3
musicstudio_jamroom_ghost_note_morph_time = 0.5
musicstudio_jamroom_max_bot_songlength = 550.0
musicstudio_jamroom_ffrw_delay = 30
musicstudio_jamroom_max_gems_per_highway = 150
musicstudio_jamroom_gem_allocation_frames = 4
musicstudio_enable_bot_highways = 0
musicstudio_jamroom_nowbar_offsets = [
	{
		scale_adj = 1
		pos_offset = -17
		anim_height_offset = -18
		anim_scale_offset = 1.5
	}
	{
		scale_adj = 1
		pos_offset = -17
		anim_height_offset = -18
		anim_scale_offset = 1.5
	}
	{
		scale_adj = 1
		pos_offset = -17
		anim_height_offset = -18
		anim_scale_offset = 1.5
	}
	{
		scale_adj = 0.7
		pos_offset = -11
		anim_height_offset = -18
		anim_scale_offset = 1.5
	}
]
musicstudio_piston_anim_speed = 8.0
musicstudio_sustain_hold_percent = 0.7
musicstudio_first_time_instrument_select = 0
musicstudio_jamroom_player_num_adj = [
	{
		whammy_adj = 0.4
	}
	{
		whammy_adj = 0.4
	}
	{
		whammy_adj = 0.4
	}
	{
		whammy_adj = 0.4
	}
]
musicstudio_jamroom_highway_info = {
	texture = `tex\models\highway\highway_judy_fm_01.dds`
	pak_name = highway_judy
}

script create_jamroom_highway_visuals \{bot = 0}
	setplayerinfo <player> four_lane_highway = 0
	formattext checksumname = input_array 'input_arrayp%p' p = <player>
	inputarraycreate name = <input_array>
	generate_pos_table player = <player> jam_room_highway = 1
	musicstudioplayer_enableperspectivehighway \{enable = true}
	difficulty_setup player = <player> difficulty = easy
	musicstudioplayer_getcontroller
	musicstudio_refresh_lefty_flip_flags player = <player> controller = <controller>
	resetyieldinfo \{yield = false}
	setup_highway player = <player> skip_highway_move = true jam_room_highway = 1
	change \{musicstudio_jamroom_highways = 0}
	obj_getid
	<objid> :musicstudioplayer_postcreatehighwayinit
	musicstudio_jamroom_set_transparent_highway player = <player>
endscript

script musicstudio_jamroom_set_transparent_highway 
	formattext checksumname = highway_name 'Highway_2Dp%p' p = <player> addtostringlookup = true
	if NOT screenelementexists id = <highway_name>
		return
	endif
	setscreenelementprops {
		id = <highway_name>
		materialprops = [{
				name = m_pspass0materialcolor
				vectorproperty = [1.0 1.0 1.0 0.7]
			}]
	}
endscript

script create_jamroom_highway \{bot = 0}
	musicstudio_mainobj :musicstudiojamroom_getnumjamroomplayers
	change musicstudio_jamroom_highways = <num_jam_room_players>
	musicstudioplayer_getplayerindex
	<create_highway_visual> = true
	if ((<bot> = 1) && ($musicstudio_enable_bot_highways = 0))
		<create_highway_visual> = false
	endif
	if (<create_highway_visual> = true)
		create_jamroom_highway_visuals <...>
	endif
	if (<bot> = 0)
		getplayerinfo <player> controller
		setplayerinfo <player> in_game = 1
		musicstudio_jamroom_init_player_menu player = <player> controller = <controller>
	endif
	safe_hide \{id = jam_menu_backdrop}
	safe_hide \{id = jam_band_black_banner}
	debug_analog_options_disable
	change \{select_shift = 0}
	musicstudioplayer_setjamming \{is_jamming = false}
endscript

script destroy_jamroom_highway 
	musicstudioplayer_getplayerindex
	musicstudioplayer_enableperspectivehighway \{enable = false}
	setplayerinfo <player> in_game = 0
	musicstudiomenu_deinitpreviousstate
	destroy_highway <...>
	debug_analog_options_enable
	change \{select_shift = 1}
endscript

script jamroom_remove_controller 
	getplayerinfo <player> jam_instrument
	if (<jam_instrument> = 4)
		jam_input_melody_stop_sound
	endif
	jam_destroy_player player = <player>
	setplayerinfo <player> jam_instrument = -1
	guitar_jam_simplerecops_command_stopplay
endscript

script jamroom_add_player \{bot = 0}
	musicstudio_mainobj :musicstudiojamroom_getavailableplayerindex
	<player> = <available_player_index>
	setplayerinfo <player> controller = <controller>
	if isdrumcontroller controller = <controller>
		setplayerinfo <player> part = drum
		setplayerinfo <player> stored_part = drum
	endif
	if isguitarcontroller controller = <controller>
		setplayerinfo <player> part = guitar
		setplayerinfo <player> stored_part = guitar
	endif
	jam_input_add_player_server player = <player> spawn_id = playback_sustain_note_0 bot = <bot>
	return new_player = <new_player>
endscript

script musicstudio_jamroom_init_player_menu 
	requireparams \{[
			player
			controller
		]
		all}
	formattext checksumname = container_id 'gem_containerp%p' p = <player> addtostringlookup = true
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudiomenu_init player = <player> controller = <controller>
	formattext checksumname = musicstudio_menu 'musicstudio_menu_%a' a = <player>
	createscreenelement {
		parent = <container_id>
		id = <musicstudio_menu>
		type = descinterface
		desc = 'musicstudio_jamroom_player_menu'
		pos = (1.0, -108.0)
		scale = 1.08
		z_priority = 15
	}
	formattext checksumname = player_cont 'inst_player_cont_%s' s = <player>
	if screenelementexists id = <player_cont>
		destroyscreenelement id = <player_cont>
	endif
	createscreenelement {
		type = containerelement
		parent = <musicstudio_menu>
		id = <player_cont>
		pos = (0.0, 0.0)
	}
	if <musicstudio_menu> :desc_resolvealias name = alias_jamroom_player_menu param = jamroom_player_menu
		<jamroom_player_menu> :se_setprops menu_cont_alpha = 0
		<jamroom_player_menu> :se_setprops window_dims = (340.0, 284.0) tip_alpha = 0 time = 0
		<player_object> :musicstudiomenu_setscrollingstate {
			id = <jamroom_player_menu>
			scrolling_state = musicstudio_jamroom_scrolling_track_select_state
		}
	endif
endscript

script musicstudio_jamroom_deinit_player_menu 
	formattext checksumname = musicstudio_menu 'musicstudio_menu_%s' s = <player>
	if screenelementexists id = <musicstudio_menu>
		destroyscreenelement id = <musicstudio_menu>
	endif
endscript

script musicstudio_jamroom_animate_player_menu 
	formattext checksumname = musicstudio_menu 'musicstudio_menu_%s' s = <player>
	if screenelementexists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias name = alias_jamroom_player_menu param = jamroom_player_menu
			if gotparam \{out}
				<jamroom_player_menu> :se_setprops menu_drop_pos = (-10.0, -190.0) time = 0.2
				musicstudio_jamroom_set_state_text player = <player> state = on
			else
				<jamroom_player_menu> :se_setprops menu_drop_pos = (-10.0, -33.0) time = 0.2
				musicstudio_jamroom_set_state_text player = <player> state = off
				set_highway_recording_effect player = <player> state = off
			endif
		endif
	endif
endscript

script musicstudio_jamroom_set_title_text 
	formattext checksumname = musicstudio_menu 'musicstudio_menu_%s' s = <player>
	if screenelementexists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias name = alias_jamroom_player_menu param = jamroom_player_menu
			<jamroom_player_menu> :se_setprops jamroom_top_title_text = <text>
			musicstudio_jamroom_update_title_text_color player = <player>
		endif
	endif
endscript

script musicstudio_jamroom_set_title_rgba 
	formattext checksumname = musicstudio_menu 'musicstudio_menu_%s' s = <player>
	if screenelementexists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias name = alias_jamroom_player_menu param = jamroom_player_menu
			<jamroom_player_menu> :se_setprops jamroom_top_title_rgba = <rgba>
		endif
	endif
endscript

script musicstudio_jamroom_set_start_text 
	formattext checksumname = musicstudio_menu 'musicstudio_menu_%s' s = <player>
	if screenelementexists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias name = alias_jamroom_player_menu param = jamroom_player_menu
			<jamroom_player_menu> :se_setprops jamroom_top_text = <text> jamroom_top_alpha = <alpha>
		endif
	endif
endscript
musicstudio_jamroom_tracks = [
	{
		name_text = qs(0xc1665045)
		instrument = 1
	}
	{
		name_text = qs(0x09aa4fdd)
		instrument = 4
	}
	{
		name_text = qs(0x7d5eb9c0)
		instrument = 0
	}
	{
		name_text = qs(0x4f551cbe)
		instrument = 2
	}
	{
		name_text = qs(0xf3e03f27)
		instrument = 3
	}
]

script musicstudio_jamroom_get_list_checksum_tracks_size 
	getarraysize ($musicstudio_jamroom_tracks)
	return list_size = <array_size>
endscript

script musicstudio_jamroom_get_list_checksum_tracks 
	return \{list_checksum = musicstudio_jamroom_tracks}
endscript

script musicstudio_jamroom_tracks_get_focusable 
	instrument = ($musicstudio_jamroom_tracks [<index>].instrument)
	<focusable> = focusable
	if gotparam \{first_time_instrument_select}
		musicstudio_mainobj :musicstudiojamroom_getbotstatus instrument = ($jam_tracks [<instrument>].id)
		if (<enabled> = 1)
			<focusable> = not_focusable
		endif
	else
		if musicstudio_mainobj :musicstudio_getplayerfrominstrument instrument = <instrument> not_this_player = <player>
			<local_player> = <player>
			<player_object> :musicstudioplayer_getplayerindex
			if (<local_player> != <player>)
				<player_object> :musicstudiomenu_getcurrentstate
				if NOT (<current_state> = musicstudio_jamroom_scrolling_track_select_state)
					<focusable> = not_focusable
				endif
			endif
			<player> = <local_player>
		endif
	endif
	getplayerinfo <player> part
	if (<part> = drum)
		if (<instrument> != 3)
			<focusable> = not_focusable
		elseif gotparam \{first_time_instrument_select}
			<focusable> = focusable
		endif
	endif
	return focusable = <focusable>
endscript

script musicstudio_jamroom_select_track 
	instrument = ($musicstudio_jamroom_tracks [<index>].instrument)
	getplayerinfo <player> part
	if (<part> = drum)
		<instrument> = 3
	endif
	setplayerinfo <player> jam_instrument = <instrument>
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_setinstrument instrument = <instrument>
	musicstudio_jam_room_create_instrument_live player = <player>
endscript
jam_highway_fast_forward = 0

script musicstudio_jamroom_transport_shared 
	getplayerinfo <player> controller
	formattext checksumname = musicstudio_menu 'musicstudio_menu_%s' s = <player>
	if screenelementexists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias name = alias_jamroom_player_menu param = jamroom_player_menu
			if NOT scriptisrunning <control_script>
				<jamroom_player_menu> :obj_spawnscriptnow <control_script> params = {jamroom_player_menu = <jamroom_player_menu>
					controller = <controller>
					player = <player>
					button = <button>}
			endif
			button_hold_count = 0
			<jamroom_player_menu> :gettags
			if NOT (($jam_highway_playing = 1) || ($jam_band_recording = 1))
				if scriptisrunning \{guitar_jam_simplerecops_skipfb}
					return
				else
					if (<button_hold_count> >= $musicstudio_jamroom_ffrw_delay)
						change \{jam_highway_fast_forward = 1}
						<jamroom_player_menu> :obj_spawnscriptnow guitar_jam_simplerecops_skipfb params = {dir = <button> select_player = <player>}
					else
						change \{jam_highway_fast_forward = 0}
					endif
				endif
			else
				if (<button_hold_count> >= $musicstudio_jamroom_ffrw_delay)
					guitar_jam_simplerecops_play select_player = <player>
					change \{jam_highway_fast_forward = 1}
					<jamroom_player_menu> :obj_spawnscriptnow guitar_jam_simplerecops_skipfb params = {dir = <button> select_player = <player>}
				else
					change \{jam_highway_fast_forward = 0}
					killspawnedscript \{name = guitar_jam_simplerecops_skipfb}
				endif
			endif
		endif
	endif
endscript

script musicstudio_jamroom_transport_right 
	musicstudio_jamroom_transport_shared control_script = musicstudio_jamroom_transport_count_hold_right button = right <...>
endscript

script musicstudio_jamroom_transport_left 
	musicstudio_jamroom_transport_shared control_script = musicstudio_jamroom_transport_count_hold_left button = left <...>
endscript

script musicstudio_jamroom_transport_count_hold_right 
	musicstudio_jamroom_transport_count_hold <...>
endscript

script musicstudio_jamroom_transport_count_hold_left 
	musicstudio_jamroom_transport_count_hold <...>
endscript

script musicstudio_jamroom_transport_count_hold 
	button_hold_count = 0
	<jamroom_player_menu> :settags button_hold_count = <button_hold_count>
	begin
	<jamroom_player_menu> :gettags
	if controllerpressed <button> <controller>
		<jamroom_player_menu> :settags button_hold_count = (<button_hold_count> + 1)
	else
		break
	endif
	wait \{1
		gameframe}
	repeat
	musicstudio_update_dir_for_lefty_flip button = <button> player = <player>
	if (<button_hold_count> < $musicstudio_jamroom_ffrw_delay)
		if (<dir> = right)
			guitar_jam_simplerecops_play select_player = <player>
		elseif (<dir> = left)
			if NOT musicstudio_is_recording_locked
				if ($jam_highway_playing = 0)
					guitar_jam_simplerecops_play select_player = <player>
				endif
				guitar_jam_simplerecops_record select_player = <player>
			endif
		endif
	endif
endscript

script musicstudio_update_dir_for_lefty_flip 
	dir = <button>
	getplayerinfo <player> lefty_flip
	getplayerinfo <player> controller
	if isguitarcontroller controller = <controller>
		if (<lefty_flip> = 1)
			if (<dir> = right)
				<dir> = left
			elseif (<dir> = left)
				<dir> = right
			endif
		endif
	endif
	return dir = <dir>
endscript

script musicstudio_jam_room_create_instrument_live 
	musicstudio_jamroom_create_instrument player = <player>
endscript

script musicstudio_jam_room_create_instrument_pattern 
	musicstudio_jamroom_create_instrument player = <player>
endscript

script musicstudio_jamroom_jamming_init 
	musicstudio_jamroom_animate_player_menu player = <player> out
	musicstudio_jamroom_create_instrument player = <player> controller = <controller>
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_setjamming is_jamming = true
endscript

script musicstudio_jamroom_jamming_deinit 
	musicstudio_jamroom_animate_player_menu player = <player> in
	musicstudio_jamroom_destroy_instrument player = <player> controller = <controller>
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_setjamming is_jamming = false
	killspawnedscript \{name = guitar_jam_simplerecops_skipfb}
endscript

script musicstudio_jamroom_get_inst_name_text 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	if (<instrument> = 3)
		musicstudio_jamroom_drum_get_name_text
	else
		name_text = ($jam_tracks [<instrument>].alt_text)
	endif
	return name_text = <name_text>
endscript

script musicstudio_jamroom_update_title_text_color 
	getplayerinfo <player> jam_instrument
	rgba = [113 121 133 255]
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudiomenu_getcurrentstate
	if NOT (<current_state> = musicstudio_jamroom_scrolling_track_select_state)
		if (<jam_instrument> != -1)
			<rgba> = ($jam_tracks [<jam_instrument>].color)
		endif
	endif
	musicstudio_jamroom_set_title_rgba rgba = <rgba> player = <player>
endscript

script music_studio_jamroom_count_in_check_player_status 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	if (<main_player> = null)
		return \{false}
	endif
	<main_player> :musicstudioplayer_getplayerindex
	formattext checksumname = highway_name 'Highway_2Dp%p' p = <player> addtostringlookup = true
	if NOT screenelementexists id = <highway_name>
		return \{false}
	endif
	return \{true}
endscript

script musicstudio_jamroom_count_in 
	musicstudio_mainobj :musicstudioghmix_getnotequantizems \{note_value = 0.25}
	<seconds> = (<note_quantize_ms> / 1000.0)
	begin
	audio_jam_play_metronome_sfx \{downbeat = 1}
	if NOT music_studio_jamroom_count_in_check_player_status
		return
	endif
	wait <seconds> seconds
	repeat 4
	if NOT music_studio_jamroom_count_in_check_player_status
		return
	endif
	guitar_jam_simplerecops_play from_countin select_player = <select_player>
endscript

script musicstudio_jamroom_create_instrument 
	getplayerinfo <player> jam_instrument
	getplayerinfo <player> controller
	formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <player>
	formattext checksumname = input_spawn 'input_spawn_%s' s = <player>
	if structurecontains structure = ($jam_tracks [<jam_instrument>]) input_func
		spawnscriptnow ($jam_tracks [<jam_instrument>].input_func) id = <input_spawn> params = {select_player = <player> show_hud = 0 controller = <controller> spawn_id = <input_spawn>}
	endif
	if ($jamroom_auto_play = 1)
		spawnscriptnow musicstudio_jamroom_count_in params = {select_player = <player>}
		change \{jamroom_auto_play = 0}
	endif
endscript

script musicstudio_jamroom_destroy_instrument 
	printf \{channel = trchen
		qs(0x5ec6e254)}
	getplayerinfo <player> jam_instrument
	if (<jam_instrument> = -1)
		return
	endif
	getplayerinfo <player> controller
	if structurecontains structure = ($jam_tracks [<jam_instrument>]) ui_destroy_func
		formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <player>
		spawnscriptnow ($jam_tracks [<jam_instrument>].ui_destroy_func) id = <jam_player_spawns> params = {player = <player>}
	endif
	formattext checksumname = input_spawn 'input_spawn_%s' s = <player>
	killspawnedscript id = <input_spawn>
	if musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
		<player_object> :musicstudioplayer_setinputupdate on = false
	endif
endscript

script musicstudio_jamroom_exit_cleanup 
	musicstudio_jamroom_destroy_hud_extras
	change \{jam_highway_playing = 0}
	change \{jam_band_recording = 0}
	change \{jam_highway_recording = 0}
	setplayerinfo \{1
		jam_instrument = -1}
	setplayerinfo \{2
		jam_instrument = -1}
	setplayerinfo \{3
		jam_instrument = -1}
	setplayerinfo \{4
		jam_instrument = -1}
endscript

script musicstudio_jamroom_destroy_hud_extras 
	if screenelementexists \{id = jamroom_hud}
		destroyscreenelement \{id = jamroom_hud}
	endif
endscript

script musicstudio_jamroom_create_hud_extras 
	musicstudio_jamroom_destroy_hud_extras
	if isxenonorwindx
		pad_360_alpha = 1
		pad_ps3_alpha = 0
	elseif isps3
		pad_360_alpha = 0
		pad_ps3_alpha = 1
	endif
	createscreenelement {
		type = descinterface
		parent = root_window
		id = jamroom_hud
		desc = 'musicstudio_jamroom_hud'
		z_priority = 100
		pos = (0.0, 0.0)
		pad_360_alpha = <pad_360_alpha>
		pad_ps3_alpha = <pad_ps3_alpha>
	}
	musicstudio_jamroom_update_hud_extras state = <stop>
endscript

script musicstudio_jamroom_update_hud_extras 
	if NOT screenelementexists \{id = jamroom_hud}
		return
	endif
	ffrw_color_on = [255 , 255 , 255 , 255]
	ffrw_color_off = [128 , 128 , 128 , 255]
	ffrw_color_dim = [128 , 128 , 128 , 50]
	inside_off_rgba = [30 , 30 , 30 , 255]
	inside_on_rgba = [255 , 255 , 255 , 255]
	inside_active_rgba = [181 , 181 , 181 , 255]
	dim = 0.15
	record_on_rgba = [255 , 255 , 255 , 255]
	record_off_rgba = [20 , 20 , 20 , 255]
	record_inside_off_rgba = <inside_off_rgba>
	record_inside_on_rgba = <inside_on_rgba>
	record_inside_active_rgba = <inside_active_rgba>
	if musicstudio_is_recording_locked
		<record_on_rgba> = <record_off_rgba>
		<record_inside_on_rgba> = <inside_off_rgba>
		<record_inside_active_rgba> = <inside_off_rgba>
	endif
	switch <state>
		case stop
		jamroom_hud :se_setprops {
			play_alpha = 1.0
			stop_alpha = 0.0
			rewind_pos = (-168.0, -101.0)
			fastforward_pos = (-32.0, -101.0)
			record_rgba = <record_on_rgba>
			record_inside_rgba = <record_inside_active_rgba>
			play_inside_rgba = <inside_active_rgba>
			fastforward_inside_rgba = <inside_active_rgba>
			rewind_inside_rgba = <inside_active_rgba>
		}
		musicstudio_jamroom_set_state_text all_players state = <state>
		case play
		jamroom_hud :se_setprops {
			play_alpha = 0.0
			stop_alpha = 1.0
			record_rgba = <record_on_rgba>
			record_inside_rgba = <record_inside_active_rgba>
			stop_inside_rgba = <inside_on_rgba>
		}
		musicstudio_jamroom_set_state_text all_players state = <state>
		case record
		jamroom_hud :se_setprops {
			play_alpha = 0.0
			stop_alpha = 1.0
			record_rgba = <record_on_rgba>
			record_inside_rgba = <record_inside_on_rgba>
			stop_inside_rgba = <inside_on_rgba>
		}
		case fast_forward
		jamroom_hud :se_setprops {
			play_alpha = 1.0
			stop_alpha = 0.0
			fastforward_scale = 1.1
			rewind_scale = 1.0
			rewind_pos = (-168.0, -101.0)
			fastforward_pos = (-22.0, -101.0)
			record_rgba = <record_off_rgba>
			record_inside_rgba = <record_inside_off_rgba>
			play_inside_rgba = <inside_off_rgba>
			fastforward_inside_rgba = <inside_on_rgba>
			rewind_inside_rgba = <inside_off_rgba>
		}
		musicstudio_jamroom_set_state_text all_players state = <state>
		setscreenelementprops id = jam_band_highway_playline pos = ($jam_band_playline_pos)
		case rewind
		jamroom_hud :se_setprops {
			play_alpha = 1.0
			stop_alpha = 0.0
			fastforward_scale = 1.0
			rewind_scale = 1.1
			rewind_pos = (-178.0, -101.0)
			fastforward_pos = (-32.0, -101.0)
			record_rgba = <record_off_rgba>
			record_inside_rgba = <record_inside_off_rgba>
			play_inside_rgba = <inside_off_rgba>
			fastforward_inside_rgba = <inside_off_rgba>
			rewind_inside_rgba = <inside_on_rgba>
		}
		musicstudio_jamroom_set_state_text all_players state = <state>
		setscreenelementprops id = jam_band_highway_playline pos = ($jam_band_playline_pos)
	endswitch
	if screenelementexists \{id = jamroom_hud_playline}
		<pos> = (((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second) + (0.0, 2.0))
		jamroom_hud_playline :se_setprops pos = <pos>
	endif
endscript

script musicstudio_jamroom_get_current_style_struct 
	musicstudio_mainobj :musicstudiojamroom_getcurrentstyleindex
	<style_struct> = ($jamroom_wizard_styles [<style_index>])
	return style_struct = <style_struct>
endscript

script musicstudio_update_script_bpm_with_song_info 
	getsonginfo
	change jam_current_bpm = <bpm>
endscript

script musicstudio_jamroom_set_style_from_wizard 
	<current_bpm> = ($jam_current_bpm)
	musicstudio_jamroom_get_current_style_struct
	musicstudio_mainobj :musicstudio_createvisualizerfromstylestruct style = <style_struct>
	musicstudio_mainobj :musicstudio_setupstylefromstruct style = <style_struct>
	musicstudio_init_volumes
	change \{editable_fretbars_size = 0}
	musicstudio_create_fretbars
	getsonginfo
	musicstudio_mainobj :musicstudioghmix_changebpm bpm = <bpm> current_bpm = <current_bpm>
endscript

script musicstudio_jamroom_set_state_text \{state = off}
	if gotparam \{all_players}
		player = 1
		begin
		musicstudio_jamroom_set_state_text_per_player player = <player> state = <state>
		<player> = (<player> + 1)
		repeat 4
	else
		musicstudio_jamroom_set_state_text_per_player player = <player> state = <state>
	endif
endscript

script musicstudio_jamroom_set_state_text_per_player 
	formattext checksumname = musicstudio_menu 'musicstudio_menu_%s' s = <player>
	if screenelementexists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias name = alias_jamroom_player_menu param = jamroom_player_menu
			switch <state>
				case stop
				<jamroom_player_menu> :se_setprops {
					jamroom_state_text = qs(0x122b8cfb)
					jamroom_state_rgba = [113 121 133 255]
					jamroom_state_light_alpha = 0.0
				}
				case play
				<jamroom_player_menu> :se_setprops {
					jamroom_state_text = qs(0xbd2d9e2b)
					jamroom_state_rgba = [113 121 133 255]
					jamroom_state_light_alpha = 0.0
				}
				case fast_forward
				<jamroom_player_menu> :se_setprops {
					jamroom_state_text = qs(0x2f6a8537)
					jamroom_state_rgba = [113 121 133 255]
					jamroom_state_light_alpha = 0.0
				}
				case rewind
				<jamroom_player_menu> :se_setprops {
					jamroom_state_text = qs(0x356ed184)
					jamroom_state_rgba = [113 121 133 255]
					jamroom_state_light_alpha = 0.0
				}
				case recording
				<jamroom_player_menu> :se_setprops {
					jamroom_state_light_alpha = 1.0
					jamroom_state_text = qs(0x98dfa675)
					jamroom_state_rgba = [188 36 36 255]
				}
				case on
				<jamroom_player_menu> :se_setprops jamroom_state_alpha = 1.0
				case off
				<jamroom_player_menu> :se_setprops jamroom_state_alpha = 0.0
			endswitch
		endif
	endif
endscript

script set_highway_recording_effect 
	formattext checksumname = highway_name 'Highway_2Dp%p' p = <player> addtostringlookup = true
	if (<state> = on)
		<color> = [1.0 0 0 1.0]
		<start_color> = ($hw_color_default)
	elseif gotparam \{blend_off}
		<start_color> = [1.0 0 0 1.0]
		<color> = ($hw_color_default)
	else
		<start_color> = ($hw_color_default)
		<color> = ($hw_color_default)
	endif
	if NOT screenelementexists id = <highway_name>
		return
	endif
	getscreenelementprops id = <highway_name> materialprops = [{name = m_pulsecolor}]
	if (<matx> = (<color>) [0])
		return
	endif
	spawnscript changescreenelementcolorbygfs params = {
		id = <highway_name>
		name = m_pulsecolor
		startcolor = <start_color>
		endcolor = <color>
		frames = 20
		stepframes = 4
	}
endscript

script musicstudio_jamroom_stop_recording_all_players 
	if (($jam_highway_playing = 1) || ($jam_band_recording = 1))
		<player> = 1
		begin
		if musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
			guitar_jam_simplerecops_command_stoprec select_player = <player>
		endif
		<player> = (<player> + 1)
		repeat ($num_jam_players)
	endif
endscript

script musicstudio_jamroom_loop_playtime 
	reset_song_time \{starttime = 0}
	change \{jam_highway_play_time = 0}
	musicstudio_jamroom_stop_recording_all_players
endscript

script musicstudio_jamroom_pause_script 
	if (($jam_band_recording = 1) || ($jam_highway_playing = 1))
		change \{jamroom_auto_play = 1}
	endif
	killspawnedscript \{name = musicstudio_jamroom_count_in}
	guitar_jam_simplerecops_command_stopplay
endscript

script musicstudio_jamroom_stop_recording_and_playing_all_players 
	musicstudio_jamroom_stop_recording_all_players
	killspawnedscript \{name = musicstudio_jamroom_count_in}
	guitar_jam_simplerecops_command_stopplay
endscript

script musicstudio_input_send_pattern_to_highway 
	gems = [
		{
			texture = green_top_gem
			texture_drum = red_top_gem
			pattern = 65536
		}
		{
			texture = red_top_gem
			texture_drum = yellow_top_gem
			pattern = 4096
		}
		{
			texture = yellow_top_gem
			texture_drum = blue_top_gem
			pattern = 256
		}
		{
			texture = blue_top_gem
			texture_drum = orange_top_gem
			pattern = 16
		}
		{
			texture = orange_top_gem
			texture_drum = green_top_gem
			pattern = 1
		}
		{
			texture = kick_bar_purple
			texture_drum = kick_bar_purple
			rgba = [255 255 255 255]
			pattern = 1048576
		}
	]
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	getarraysize <gems>
	gem_count = 0
	gem_created = 0
	begin
	if (<gem_pattern> && (<gems> [<gem_count>].pattern))
		<player_object> :musicstudioplayer_addjamroomnotetohighway gem_color_index = <gem_count>
	endif
	<gem_count> = (<gem_count> + 1)
	repeat <array_size>
endscript

script musicstudio_jamroom_create_joing_player_handler 
	musicstudio_jamroom_remove_joing_player_handler controller = <controller>
	formattext checksumname = handler 'join_player_handler_%p' p = <controller>
	createscreenelement {
		id = <handler>
		parent = root_window
		type = menuelement
		dims = (1024.0, 36.0)
		pos = (0.0, -36.0)
		pos_anchor = [center bottom]
		just = [center bottom]
		internal_just = [center center]
		isvertical = false
		position_children = true
		fit_major = `fit content if larger`
		fit_minor = `keep dims`
		spacing_between = 10
		z_priority = 1000
		exclusive_device = <controller>
		event_handlers = [
			{pad_btn_top musicstudio_jamroom_on_playerjoin}
		]
	}
	launchevent type = focus target = <handler>
endscript

script musicstudio_jamroom_remove_joing_player_handler 
	formattext checksumname = handler 'join_player_handler_%p' p = <controller>
	if screenelementexists id = <handler>
		destroyscreenelement id = <handler>
	endif
endscript

script rebuild_all_highways_spawned 
	wait \{1
		gameframe}
	musicstudio_mainobj :musicstudiojamroom_rebuildallhighways
endscript

script musicstudio_jamroom_on_playerjoin 
	printf channel = bkutcher qs(0x91948233) a = <device_num>
	if NOT musicstudio_mainobj :musicstudio_getplayerfromcontroller controller = <device_num>
		printf \{channel = bkutcher
			qs(0xe6117b39)}
		jamroom_add_player controller = <device_num>
		spawnscriptnow \{rebuild_all_highways_spawned}
		musicstudio_jamroom_remove_joing_player_handler controller = <device_num>
	endif
endscript

script musicstudio_jamroom_create_play_now_helper 
	if screenelementexists \{id = musicstudio_jamroom_join_parent}
		return
	endif
	musicstudio_jamroom_destroy_play_now_helper
	createscreenelement \{id = musicstudio_jamroom_join_parent
		parent = root_window
		type = menuelement
		dims = (1024.0, 36.0)
		pos = (0.0, -36.0)
		pos_anchor = [
			center
			bottom
		]
		just = [
			center
			bottom
		]
		internal_just = [
			center
			center
		]
		isvertical = false
		position_children = true
		fit_major = `fit content if larger`
		fit_minor = `keep dims`
		spacing_between = 10
		z_priority = 1000}
	add_user_control_helper \{text = qs(0x54683336)
		override_parent = musicstudio_jamroom_join_parent
		button = yellow
		all_buttons}
endscript

script musicstudio_jamroom_destroy_play_now_helper 
	if screenelementexists \{id = musicstudio_jamroom_join_parent}
		destroyscreenelement \{id = musicstudio_jamroom_join_parent}
	endif
endscript

script musicstudio_jamroom_collapse_player_num 
	<non_vocalist_player> = 1
	ii = 0
	begin
	if musicstudio_mainobj :musicstudio_getplayerfromindex player = <ii>
		<non_vocalist_player> = (<non_vocalist_player> + 1)
	endif
	ii = (<ii> + 1)
	repeat <player>
	return non_vocalist_player = <non_vocalist_player>
endscript

script musicstudio_jamroom_drop_out_init 
	wait \{1
		gameframe}
	<was_paused> = 0
	begin
	if NOT musicstudio_mainobj :musicstudio_getpauseall
		break
	endif
	<was_paused> = 1
	wait \{1
		gameframe}
	repeat
	if (<was_paused> = 1)
		formattext checksumname = musicstudio_menu 'musicstudio_menu_%s' s = <player>
		if <musicstudio_menu> :desc_resolvealias name = alias_jamroom_player_menu param = jamroom_player_menu
			musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
			<player_object> :musicstudiomenu_setscrollingstate {
				id = <jamroom_player_menu>
				scrolling_state = musicstudio_jamroom_scrolling_pause_state
			}
			return
		endif
	endif
	jamroom_remove_controller player = <player>
	musicstudio_mainobj :musicstudiojamroom_rebuildallhighways
	musicstudio_jamroom_create_play_now_helper
	getplayerinfo <player> controller
	musicstudio_jamroom_create_joing_player_handler controller = <controller>
endscript

script musicstudio_jamroom_refresh_lower_highway_display 
	change \{jam_band_force_refresh_detailed_highway = 1}
endscript

script musicstudio_jamroom_instrument_select_update_data 
	if ($musicstudio_first_time_instrument_select = 1)
		change \{musicstudio_first_time_instrument_select = 0}
		data = {first_time_instrument_select instrument_select}
	else
		data = {instrument_select}
	endif
	return data = <data>
endscript

script musicstudio_jamroom_sound_select_update_data 
	data = {sound_select}
	return data = <data>
endscript

script musicstudio_jamroom_scrolling_menu_update 
	if musicstudio_mainobj :musicstudio_getpauseall
		return
	endif
	formattext checksumname = musicstudio_menu 'musicstudio_menu_%s' s = <player>
	if NOT screenelementexists id = <musicstudio_menu>
		return
	endif
	if <musicstudio_menu> :desc_resolvealias name = alias_jamroom_player_menu param = jamroom_player_menu
		<menu_id> = <jamroom_player_menu>
		if <jamroom_player_menu> :desc_resolvealias name = alias_scrolling_cont param = scrolling_cont
			if <menu_id> :desc_resolvealias name = alias_scrolling_menu_elements param = scrolling_menu_elements
				if getscreenelementchildren id = <scrolling_menu_elements>
					<first> = null
					<focus_element> = null
					getarraysize <children>
					i = 0
					launchevent type = unfocus target = <scrolling_menu_elements>
					launchevent type = focus target = <scrolling_menu_elements>
					begin
					<child> = (<children> [<i>])
					if screenelementexists id = <child>
						focusable = focusable
						if structurecontains structure = <data> instrument_select
							musicstudio_jamroom_tracks_get_focusable player = <player> index = <i> <data>
						endif
						if structurecontains structure = <data> sound_select
							musicstudio_get_selected_sound_focusable player = <player> index = <i> <data>
						endif
						if (<focusable> = focusable)
							<child> :se_setprops focusable
							<child> :se_setprops alpha = 1.0
							if (<first> = null)
								<first> = <child>
							endif
							if isscreenelementinfocus id = <child>
								<focus_element> = <child>
							endif
						else
							<child> :se_setprops not_focusable
							<child> :se_setprops alpha = 0.2
							launchevent type = unfocus target = <child>
						endif
					endif
					<i> = (<i> + 1)
					repeat <array_size>
					if ((<first> != null) && (<focus_element> = null))
						launchevent type = focus target = <first>
					endif
				endif
			endif
		endif
	endif
endscript

script musicstudio_jamroom_track_select_deinit 
	musicstudio_menu_unused_button
endscript

script musicstudio_jamroom_visualizer_message 
	if NOT musicstudio_mainobj :musicstudiojamroom_isinjamroom
		return
	endif
	if gotparam \{pattern}
		<hold_pattern> = <pattern>
	endif
	if gotparam \{hold_pattern}
		if NOT gotparam \{instrument}
			<instrument> = 0
		endif
		if NOT gotparam \{select_player}
			musicstudio_mainobj :musicstudiojamroom_getvisualizerslot instrument = <instrument>
		elseif gotparam \{play_back}
			if (<play_back> = 1)
				musicstudio_mainobj :musicstudiojamroom_getvisualizerslot instrument = <instrument>
			endif
		endif
		if (<select_player> = -1)
			return
		endif
		processevent_note_hit strum_pattern = <hold_pattern> player = <select_player>
	endif
endscript

script musicstudio_jammrom_change_players_menu_focus 
	<ii> = 1
	begin
	formattext checksumname = musicstudio_menu 'musicstudio_menu_%a' a = <ii>
	if screenelementexists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias name = alias_jamroom_player_menu param = jamroom_player_menu
			formattext checksumname = musicstudio_menu_restore 'musicstudio_menu_restore_focus_%a' a = <ii>
			if (<focus_state> = focus)
				printstruct channel = bkutcher <...>
				printf \{channel = bkutcher
					qs(0x5a2fe466)}
				if screenelementexists id = <musicstudio_menu_restore>
					launchevent type = focus target = <musicstudio_menu_restore>
				endif
			else
				<jamroom_player_menu> :desc_resolvealias name = alias_scrolling_menu_elements param = scrolling_menu_elements
				if isscreenelementinfocus id = <scrolling_menu_elements>
					printf \{channel = bkutcher
						qs(0x9a843152)}
					launchevent type = unfocus target = <scrolling_menu_elements>
					assignalias id = <scrolling_menu_elements> alias = <musicstudio_menu_restore>
				else
					printf \{channel = bkutcher
						qs(0xbe56abc9)}
					launchevent type = unfocus target = <jamroom_player_menu>
					assignalias id = <jamroom_player_menu> alias = <musicstudio_menu_restore>
				endif
			endif
		endif
	endif
	<ii> = (<ii> + 1)
	repeat 4
endscript

script musicstudio_jamroom_outofnotes_warning_exit 
	destroy_dialog_box
	wait \{1
		frame}
	musicstudio_jammrom_change_players_menu_focus \{focus_state = focus}
endscript

script musicstudio_jamroom_outofnotes_warning 
	guitar_jam_simplerecops_command_stopplay
	musicstudio_jammrom_change_players_menu_focus \{focus_state = unfocus}
	destroy_dialog_box
	create_dialog_box {
		heading_text = qs(0x23bda601)
		body_text = qs(0x410e5bdf)
		player_device = ($primary_controller)
		no_background
		options = [
			{
				func = musicstudio_jamroom_outofnotes_warning_exit
				text = qs(0x182f0173)
				sound_func = musicstudio_menu_music_final_select
			}
		]
		pad_choose_sound = musicstudio_menu_music_final_select
	}
endscript

script musicstudio_jamroom_instrument_init 
	setplayerinfo <player> jam_instrument = -1
	musicstudio_clear_button_text <...>
endscript

script musicstudio_on_rebuild_all_highways 
	musicstudio_jamroom_stop_recording_and_playing_all_players
endscript

script musicstudio_jamroom_get_part_names \{player = 1
		array_count = 0}
	color = ($gem_colors [<array_count>])
	<color_string> = (($button_up_models [(<player> -1)]).<color>.name_string)
	formattext checksumname = name_lip '%s_lipp%p' s = <color_string> p = <player> addtostringlookup = true
	formattext checksumname = name_mid '%s_midp%p' s = <color_string> p = <player> addtostringlookup = true
	formattext checksumname = name_neck '%s_neckp%p' s = <color_string> p = <player> addtostringlookup = true
	formattext checksumname = name_head '%s_headp%p' s = <color_string> p = <player> addtostringlookup = true
	return <...>
endscript
jam_cont_start_pos = (330.0, 52.0)
jam_cont_offset = 205
jam_band_force_refresh_detailed_highway = 0
jam_band_recording = 0
jam_band_pixels_per_second = (0.0, 0.0)
jam_band_playline_pos = (0.0, 0.0)
jam_band_song_length = 0
jam_band_new_song = 0

script create_jam_band_menu \{editing = 0
		tutorial = 0
		song = none}
	set_focus_color \{color = pure_white}
	set_unfocus_color \{color = gh4_jam_orangeish}
	change \{jam_num_falling_gems = 0}
	change \{musicstudio_first_time_instrument_select = 1}
	change \{select_shift = 0}
	destroy_bg_viewport
	setup_bg_viewport
	audio_ui_menu_music_off
	createscreenelement \{type = containerelement
		parent = root_window
		id = jam_band_container
		pos = (0.0, 800.0)}
	jam_band_container :settags \{allow_easy_backout = 1}
	change \{target_jam_camera_prop = jam_band}
	jam_camera_wait
	createscreenelement \{type = spriteelement
		parent = jam_band_container
		id = jam_menu_backdrop
		texture = jam_screen
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 50}
	setplayerinfo \{1
		jam_instrument = -1}
	setplayerinfo \{2
		jam_instrument = -1}
	setplayerinfo \{3
		jam_instrument = -1}
	setplayerinfo \{4
		jam_instrument = -1}
	musicstudio_reinit_menu_sounds
	jam_setup_song editing = <editing> tutorial = <tutorial>
	num_players = ($num_jam_players)
	if (<tutorial> = 0)
		if (<editing> = 1)
			formattext \{textname = song_name_text
				qs(0x8b1f3160)
				a = $jam_selected_song}
		else
			formattext \{textname = song_name_text
				qs(0xd9070aee)}
			musicstudio_update_selected_song_name filename = <song_name_text>
		endif
	endif
	safe_hide \{id = jam_menu_backdrop}
	runscriptonscreenelement \{id = jam_band_container
		legacydomorph
		params = {
			pos = (0.0, 0.0)
			time = 0.2
		}}
	clean_up_user_control_helpers
	jam_band_container :obj_spawnscript \{jam_recording_check_disconnect
		params = {
			recording_studio
		}}
	musicstudio_jamroom_refresh_lower_highway_display
	destroy_loading_screen
endscript

script jam_setup_song \{advanced_record = 0
		tutorial = 0
		from_song = 0}
	getarraysize ($jam_quantize)
	change jam_current_quantize = (<array_size> - 1)
	if (<from_song> = 0)
		reset_song_time \{starttime = 0}
		change \{jam_highway_play_time = 0}
	endif
	change \{jam_highway_playing = 0}
	change \{jam_band_recording = 0}
	change \{is_percussion_kit = 0}
	change \{jam_player_recording_armed = [
			0
			0
			0
			0
		]}
	change \{jam_player_recording_begin_time = [
			0
			0
			0
			0
		]}
	song = editable
	if (<editing> = 1)
		musicstudio_init_all_line6_effects
		setsonginfo bpm = ($jam_current_bpm)
		musicstudio_init_volumes
		musicstudio_init_pan
		formattext \{textname = title_text
			qs(0xb2b7d449)
			s = $jam_selected_song
			b = $jam_current_bpm}
	else
		jam_setup_new_song
		if ((<advanced_record> = 1) || (<tutorial> = 1))
			change \{jam_current_bpm = 120}
			setsonginfo bpm = ($jam_current_bpm)
		endif
		setsonginfo line6_0_volume = ($line6_0_volume_default)
		setsonginfo line6_1_volume = ($line6_1_volume_default)
		setsonginfo line6_0_pan = ($line6_0_pan_default)
		setsonginfo line6_1_pan = ($line6_1_pan_default)
		musicstudio_init_pan
	endif
	if gotparam \{title_text}
		printf channel = jam_mode qs(0x73307931) s = <title_text>
	endif
	if (<advanced_record> = 0)
		jam_band_create_highway song = <song> editing = <editing>
		wait \{5
			gameframes}
		if (<editing> = 0)
			musicstudio_jamroom_set_style_from_wizard
		else
			getarraysize ($jamroom_wizard_styles)
			musicstudio_mainobj :musicstudiojamroom_setcurrentstyleindex style_index = (<array_size> - 1)
			musicstudio_jamroom_get_current_style_struct
			musicstudio_mainobj :musicstudio_createvisualizerfromstylestruct style = <style_struct>
		endif
	endif
endscript

script jam_setup_new_song 
	change \{jam_band_new_song = 1}
	getarraysize ($jam_quantize)
	change jam_current_quantize = (<array_size> - 1)
	change \{jam_current_tuning = 0}
	jam_recording_create_editable_arrays
	change \{jam_melody_octave_range = 2}
	change \{jam_lead_octave_range = 2}
	change \{jam_rhythm_chord_type = 0}
	jam_init_scales
	change \{jam_current_instrument_effects = [
			0
			0
			0
			0
			0
			0
		]}
	change \{jam_current_active_effects = [
			0
			0
			0
			0
			0
			0
		]}
	change \{custom_chord_pattern = [
			1
			1
			1
			1
			1
			1
			1
		]}
	jam_recording_setup_timesig
	musicstudio_create_fretbars
	clearcustomsong
	musicstudio_init_all_line6_effects
	setsonginfo genre = -1 bpm = ($jam_current_bpm) song_version = $jam_song_version downloaded = 0 drum_kit = $jam_current_drum_kit file_id = {file_id = [0 , 0]} tuning = 0 bass_kit = 0
	change \{jam_melody_pan = 0}
	change \{bass_kit_mode = 0}
	getarraysize \{$jam_tracks}
	index = 0
	begin
	volume = 0
	pan = 0
	switch <index>
		case 0
		volume = ($musicstudio_lead_volume_default)
		case 1
		pan = 0
		volume = ($musicstudio_rhythm_volume_default)
		case 2
		pan = ($musicstudio_bass_pan_default)
		volume = ($musicstudio_bass_volume_default)
		case 3
		pan = ($musicstudio_drums_pan_default)
		volume = ($musicstudio_drums_volume_default)
		case 4
		pan = ($musicstudio_keyboard_pan_default)
		volume = ($musicstudio_keyboard_volume_default)
	endswitch
	settrackinfo track = ($jam_tracks [<index>].id) volume = <volume> pan = <pan> effect = ($jam_current_instrument_effects [<index>])
	<index> = (<index> + 1)
	repeat <array_size>
	musicstudio_init_volumes
	musicstudio_init_pan
	reset_song_time \{starttime = 0}
endscript

script jam_create_select_instrument_menu \{player = 0}
	if gotparam \{do_wait}
		wait \{0.5
			seconds}
	endif
	getplayerinfo <player> controller
	musicstudio_jamroom_init_player_menu player = <player> controller = <controller>
endscript

script jam_update_falling_gem_sustain 
	<cur_id> = ($<sustain_global>)
	if gotparam \{stop}
		if (<cur_id> > 0)
			<cur_id> = (<cur_id> * -1)
		else
			<cur_id> = (<cur_id> - 1)
		endif
		change globalname = <sustain_global> newvalue = <cur_id>
		return
	endif
	if (<cur_id> < 0)
		<cur_id> = (<cur_id> * -1)
	endif
	<cur_id> = (<cur_id> + 1)
	if (<cur_id> > 1000)
		<cur_id> = 1
	endif
	change globalname = <sustain_global> newvalue = <cur_id>
endscript

script jam_fretboard_add_note 
	formattext checksumname = player_cont 'inst_player_cont_%s' s = <player>
	if NOT screenelementexists id = <player_cont>
		return
	endif
	gem_pos_start = (19.0, 0.0)
	gem_offset = (44.0, 0.0)
	jam_menu_get_lefty player = <player>
	getplayerinfo <player> jam_instrument
	getplayerinfo <player> controller
	if (<jam_instrument> = 3)
		if NOT isguitarcontroller controller = <controller>
			<lefty> = 0
		endif
	endif
	if (<lefty> = 1)
		<gem_pos_start> = (<gem_pos_start> + (<gem_offset> * 4))
	endif
	gem_pos = <gem_pos_start>
	z_priority = 28
	musicstudio_input_send_pattern_to_highway gem_pattern = <gem_pattern> player = <player>
endscript
jam_reverb = 0

script jam_init_reverb 
endscript

script jam_deinit_reverb 
endscript

script destroy_jam_band_menu 
	active_controllers = [0 0 0 0 0 0 0]
	getactivecontrollers
	jam_input_melody_stop_sound
	change \{jam_highway_playing = 0}
	change \{jam_band_recording = 0}
	change \{jam_highway_recording = 0}
	musicstudio_reinit_menu_sounds
	killspawnedscript \{name = line6_pod_remove}
	stop_custom_song
	killspawnedscript \{id = jam_band_spawns}
	killspawnedscript \{id = jam_input_spawns}
	killspawnedscript \{id = jam_recording_spawns}
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if screenelementexists \{id = jam_band_container}
		destroyscreenelement \{id = jam_band_container}
	endif
endscript

script jam_destroy_player 
	formattext checksumname = player_cont 'inst_player_cont_%s' s = <player>
	if screenelementexists id = <player_cont>
		destroyscreenelement id = <player_cont>
	endif
	formattext checksumname = scrolling_inst_select 'scrolling_inst_select_%s' s = <player>
	if screenelementexists id = <scrolling_inst_select>
		destroy_menu menu_id = <scrolling_inst_select>
	endif
	formattext checksumname = scrolling_options 'scrolling_options_%s' s = <player>
	if screenelementexists id = <scrolling_options>
		destroy_menu menu_id = <scrolling_options>
	endif
	formattext checksumname = inst_cont 'inst_cont_%s' s = <player>
	if screenelementexists id = <inst_cont>
		destroy_menu menu_id = <inst_cont>
	endif
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <player>
	killspawnedscript id = <scale_preview_spawn>
	formattext checksumname = jam_playback_delete 'jam_playback_delete_%s' s = <player>
	killspawnedscript id = <jam_playback_delete>
	formattext checksumname = input_spawn 'input_spawn_%s' s = <player>
	killspawnedscript id = <input_spawn>
	jam_input_destroy_player_server player = <player>
	jam_kill_update_note_length player = <player>
	formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <player>
	killspawnedscript id = <jam_player_spawns>
endscript
