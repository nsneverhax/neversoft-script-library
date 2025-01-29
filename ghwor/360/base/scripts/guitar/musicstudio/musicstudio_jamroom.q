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
	setplayerinfo <Player> four_lane_highway = 0
	formatText checksumName = input_array 'input_arrayp%p' p = <Player>
	InputArrayCreate Name = <input_array>
	generate_pos_table Player = <Player> jam_room_highway = 1
	musicstudioplayer_enableperspectivehighway \{enable = true}
	difficulty_setup Player = <Player> difficulty = easy
	musicstudioplayer_getcontroller
	musicstudio_refresh_lefty_flip_flags Player = <Player> controller = <controller>
	resetyieldinfo \{yield = FALSE}
	setup_highway Player = <Player> skip_highway_move = true jam_room_highway = 1
	Change \{musicstudio_jamroom_highways = 0}
	Obj_GetID
	<objID> :musicstudioplayer_postcreatehighwayinit
	musicstudio_jamroom_set_transparent_highway Player = <Player>
endscript

script musicstudio_jamroom_set_transparent_highway 
	formatText checksumName = highway_name 'Highway_2Dp%p' p = <Player> AddToStringLookup = true
	if NOT ScreenElementExists id = <highway_name>
		return
	endif
	SetScreenElementProps {
		id = <highway_name>
		MaterialProps = [{
				Name = m_psPass0MaterialColor
				vectorproperty = [1.0 1.0 1.0 0.7]
			}]
	}
endscript

script create_jamroom_highway \{bot = 0}
	musicstudio_mainobj :musicstudiojamroom_getnumjamroomplayers
	Change musicstudio_jamroom_highways = <num_jam_room_players>
	musicstudioplayer_getplayerindex
	<create_highway_visual> = true
	if ((<bot> = 1) && ($musicstudio_enable_bot_highways = 0))
		<create_highway_visual> = FALSE
	endif
	if (<create_highway_visual> = true)
		create_jamroom_highway_visuals <...>
	endif
	if (<bot> = 0)
		getplayerinfo <Player> controller
		setplayerinfo <Player> in_game = 1
		musicstudio_jamroom_init_player_menu Player = <Player> controller = <controller>
	endif
	safe_hide \{id = jam_menu_backdrop}
	safe_hide \{id = jam_band_black_banner}
	debug_analog_options_disable
	Change \{select_shift = 0}
	musicstudioplayer_setjamming \{is_jamming = FALSE}
endscript

script destroy_jamroom_highway 
	musicstudioplayer_getplayerindex
	musicstudioplayer_enableperspectivehighway \{enable = FALSE}
	setplayerinfo <Player> in_game = 0
	musicstudiomenu_deinitpreviousstate
	destroy_highway <...>
	debug_analog_options_enable
	Change \{select_shift = 1}
endscript

script jamroom_remove_controller 
	getplayerinfo <Player> jam_instrument
	if (<jam_instrument> = 4)
		jam_input_melody_stop_sound
	endif
	jam_destroy_player Player = <Player>
	setplayerinfo <Player> jam_instrument = -1
	guitar_jam_simplerecops_command_stopplay
endscript

script jamroom_add_player \{bot = 0}
	musicstudio_mainobj :musicstudiojamroom_getavailableplayerindex
	<Player> = <available_player_index>
	setplayerinfo <Player> controller = <controller>
	if isdrumcontroller controller = <controller>
		setplayerinfo <Player> part = drum
		setplayerinfo <Player> stored_part = drum
	endif
	if IsGuitarController controller = <controller>
		setplayerinfo <Player> part = guitar
		setplayerinfo <Player> stored_part = guitar
	endif
	jam_input_add_player_server Player = <Player> spawn_id = playback_sustain_note_0 bot = <bot>
	return new_player = <new_player>
endscript

script musicstudio_jamroom_init_player_menu 
	RequireParams \{[
			Player
			controller
		]
		all}
	formatText checksumName = container_id 'gem_containerp%p' p = <Player> AddToStringLookup = true
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudiomenu_init Player = <Player> controller = <controller>
	formatText checksumName = musicstudio_menu 'musicstudio_menu_%a' a = <Player>
	CreateScreenElement {
		parent = <container_id>
		id = <musicstudio_menu>
		Type = descinterface
		desc = 'musicstudio_jamroom_player_menu'
		Pos = (1.0, -108.0)
		Scale = 1.08
		z_priority = 15
	}
	formatText checksumName = player_cont 'inst_player_cont_%s' s = <Player>
	if ScreenElementExists id = <player_cont>
		DestroyScreenElement id = <player_cont>
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <musicstudio_menu>
		id = <player_cont>
		Pos = (0.0, 0.0)
	}
	if <musicstudio_menu> :desc_resolvealias Name = alias_jamroom_player_menu param = jamroom_player_menu
		<jamroom_player_menu> :se_setprops menu_cont_alpha = 0
		<jamroom_player_menu> :se_setprops window_dims = (340.0, 284.0) tip_alpha = 0 time = 0
		<player_object> :musicstudiomenu_setscrollingstate {
			id = <jamroom_player_menu>
			scrolling_state = musicstudio_jamroom_scrolling_track_select_state
		}
	endif
endscript

script musicstudio_jamroom_deinit_player_menu 
	formatText checksumName = musicstudio_menu 'musicstudio_menu_%s' s = <Player>
	if ScreenElementExists id = <musicstudio_menu>
		DestroyScreenElement id = <musicstudio_menu>
	endif
endscript

script musicstudio_jamroom_animate_player_menu 
	formatText checksumName = musicstudio_menu 'musicstudio_menu_%s' s = <Player>
	if ScreenElementExists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias Name = alias_jamroom_player_menu param = jamroom_player_menu
			if GotParam \{out}
				<jamroom_player_menu> :se_setprops menu_drop_pos = (-10.0, -190.0) time = 0.2
				musicstudio_jamroom_set_state_text Player = <Player> state = On
			else
				<jamroom_player_menu> :se_setprops menu_drop_pos = (-10.0, -33.0) time = 0.2
				musicstudio_jamroom_set_state_text Player = <Player> state = OFF
				set_highway_recording_effect Player = <Player> state = OFF
			endif
		endif
	endif
endscript

script musicstudio_jamroom_set_title_text 
	formatText checksumName = musicstudio_menu 'musicstudio_menu_%s' s = <Player>
	if ScreenElementExists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias Name = alias_jamroom_player_menu param = jamroom_player_menu
			<jamroom_player_menu> :se_setprops jamroom_top_title_text = <text>
			musicstudio_jamroom_update_title_text_color Player = <Player>
		endif
	endif
endscript

script musicstudio_jamroom_set_title_rgba 
	formatText checksumName = musicstudio_menu 'musicstudio_menu_%s' s = <Player>
	if ScreenElementExists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias Name = alias_jamroom_player_menu param = jamroom_player_menu
			<jamroom_player_menu> :se_setprops jamroom_top_title_rgba = <rgba>
		endif
	endif
endscript

script musicstudio_jamroom_set_start_text 
	formatText checksumName = musicstudio_menu 'musicstudio_menu_%s' s = <Player>
	if ScreenElementExists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias Name = alias_jamroom_player_menu param = jamroom_player_menu
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
	GetArraySize ($musicstudio_jamroom_tracks)
	return list_size = <array_Size>
endscript

script musicstudio_jamroom_get_list_checksum_tracks 
	return \{list_checksum = musicstudio_jamroom_tracks}
endscript

script musicstudio_jamroom_tracks_get_focusable 
	instrument = ($musicstudio_jamroom_tracks [<index>].instrument)
	<focusable> = focusable
	if GotParam \{first_time_instrument_select}
		musicstudio_mainobj :musicstudiojamroom_getbotstatus instrument = ($jam_tracks [<instrument>].id)
		if (<Enabled> = 1)
			<focusable> = not_focusable
		endif
	else
		if musicstudio_mainobj :musicstudio_getplayerfrominstrument instrument = <instrument> not_this_player = <Player>
			<local_player> = <Player>
			<player_object> :musicstudioplayer_getplayerindex
			if (<local_player> != <Player>)
				<player_object> :musicstudiomenu_getcurrentstate
				if NOT (<current_state> = musicstudio_jamroom_scrolling_track_select_state)
					<focusable> = not_focusable
				endif
			endif
			<Player> = <local_player>
		endif
	endif
	getplayerinfo <Player> part
	if (<part> = drum)
		if (<instrument> != 3)
			<focusable> = not_focusable
		elseif GotParam \{first_time_instrument_select}
			<focusable> = focusable
		endif
	endif
	return focusable = <focusable>
endscript

script musicstudio_jamroom_select_track 
	instrument = ($musicstudio_jamroom_tracks [<index>].instrument)
	getplayerinfo <Player> part
	if (<part> = drum)
		<instrument> = 3
	endif
	setplayerinfo <Player> jam_instrument = <instrument>
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_setinstrument instrument = <instrument>
	musicstudio_jam_room_create_instrument_live Player = <Player>
endscript
jam_highway_fast_forward = 0

script musicstudio_jamroom_transport_shared 
	getplayerinfo <Player> controller
	formatText checksumName = musicstudio_menu 'musicstudio_menu_%s' s = <Player>
	if ScreenElementExists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias Name = alias_jamroom_player_menu param = jamroom_player_menu
			if NOT ScriptIsRunning <control_script>
				<jamroom_player_menu> :Obj_SpawnScriptNow <control_script> params = {jamroom_player_menu = <jamroom_player_menu>
					controller = <controller>
					Player = <Player>
					button = <button>}
			endif
			button_hold_count = 0
			<jamroom_player_menu> :GetTags
			if NOT (($jam_highway_playing = 1) || ($jam_band_recording = 1))
				if ScriptIsRunning \{guitar_jam_simplerecops_skipfb}
					return
				else
					if (<button_hold_count> >= $musicstudio_jamroom_ffrw_delay)
						Change \{jam_highway_fast_forward = 1}
						<jamroom_player_menu> :Obj_SpawnScriptNow guitar_jam_simplerecops_skipfb params = {Dir = <button> select_player = <Player>}
					else
						Change \{jam_highway_fast_forward = 0}
					endif
				endif
			else
				if (<button_hold_count> >= $musicstudio_jamroom_ffrw_delay)
					guitar_jam_simplerecops_play select_player = <Player>
					Change \{jam_highway_fast_forward = 1}
					<jamroom_player_menu> :Obj_SpawnScriptNow guitar_jam_simplerecops_skipfb params = {Dir = <button> select_player = <Player>}
				else
					Change \{jam_highway_fast_forward = 0}
					KillSpawnedScript \{Name = guitar_jam_simplerecops_skipfb}
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
	<jamroom_player_menu> :SetTags button_hold_count = <button_hold_count>
	begin
	<jamroom_player_menu> :GetTags
	if ControllerPressed <button> <controller>
		<jamroom_player_menu> :SetTags button_hold_count = (<button_hold_count> + 1)
	else
		break
	endif
	Wait \{1
		gameframe}
	repeat
	musicstudio_update_dir_for_lefty_flip button = <button> Player = <Player>
	if (<button_hold_count> < $musicstudio_jamroom_ffrw_delay)
		if (<Dir> = right)
			guitar_jam_simplerecops_play select_player = <Player>
		elseif (<Dir> = left)
			if NOT musicstudio_is_recording_locked
				if ($jam_highway_playing = 0)
					guitar_jam_simplerecops_play select_player = <Player>
				endif
				guitar_jam_simplerecops_record select_player = <Player>
			endif
		endif
	endif
endscript

script musicstudio_update_dir_for_lefty_flip 
	Dir = <button>
	getplayerinfo <Player> lefty_flip
	getplayerinfo <Player> controller
	if IsGuitarController controller = <controller>
		if (<lefty_flip> = 1)
			if (<Dir> = right)
				<Dir> = left
			elseif (<Dir> = left)
				<Dir> = right
			endif
		endif
	endif
	return Dir = <Dir>
endscript

script musicstudio_jam_room_create_instrument_live 
	musicstudio_jamroom_create_instrument Player = <Player>
endscript

script musicstudio_jam_room_create_instrument_pattern 
	musicstudio_jamroom_create_instrument Player = <Player>
endscript

script musicstudio_jamroom_jamming_init 
	musicstudio_jamroom_animate_player_menu Player = <Player> out
	musicstudio_jamroom_create_instrument Player = <Player> controller = <controller>
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_setjamming is_jamming = true
endscript

script musicstudio_jamroom_jamming_deinit 
	musicstudio_jamroom_animate_player_menu Player = <Player> in
	musicstudio_jamroom_destroy_instrument Player = <Player> controller = <controller>
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_setjamming is_jamming = FALSE
	KillSpawnedScript \{Name = guitar_jam_simplerecops_skipfb}
endscript

script musicstudio_jamroom_get_inst_name_text 
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getinstrument
	if (<instrument> = 3)
		musicstudio_jamroom_drum_get_name_text
	else
		name_text = ($jam_tracks [<instrument>].alt_text)
	endif
	return name_text = <name_text>
endscript

script musicstudio_jamroom_update_title_text_color 
	getplayerinfo <Player> jam_instrument
	rgba = [113 121 133 255]
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudiomenu_getcurrentstate
	if NOT (<current_state> = musicstudio_jamroom_scrolling_track_select_state)
		if (<jam_instrument> != -1)
			<rgba> = ($jam_tracks [<jam_instrument>].Color)
		endif
	endif
	musicstudio_jamroom_set_title_rgba rgba = <rgba> Player = <Player>
endscript

script music_studio_jamroom_count_in_check_player_status 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	if (<main_player> = NULL)
		return \{FALSE}
	endif
	<main_player> :musicstudioplayer_getplayerindex
	formatText checksumName = highway_name 'Highway_2Dp%p' p = <Player> AddToStringLookup = true
	if NOT ScreenElementExists id = <highway_name>
		return \{FALSE}
	endif
	return \{true}
endscript

script musicstudio_jamroom_count_in 
	musicstudio_mainobj :musicstudioghmix_getnotequantizems \{note_value = 0.25}
	<Seconds> = (<note_quantize_ms> / 1000.0)
	begin
	audio_jam_play_metronome_sfx \{downbeat = 1}
	if NOT music_studio_jamroom_count_in_check_player_status
		return
	endif
	Wait <Seconds> Seconds
	repeat 4
	if NOT music_studio_jamroom_count_in_check_player_status
		return
	endif
	guitar_jam_simplerecops_play from_countin select_player = <select_player>
endscript

script musicstudio_jamroom_create_instrument 
	getplayerinfo <Player> jam_instrument
	getplayerinfo <Player> controller
	formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <Player>
	formatText checksumName = input_spawn 'input_spawn_%s' s = <Player>
	if StructureContains structure = ($jam_tracks [<jam_instrument>]) input_func
		SpawnScriptNow ($jam_tracks [<jam_instrument>].input_func) id = <input_spawn> params = {select_player = <Player> show_hud = 0 controller = <controller> spawn_id = <input_spawn>}
	endif
	if ($jamroom_auto_play = 1)
		SpawnScriptNow musicstudio_jamroom_count_in params = {select_player = <Player>}
		Change \{jamroom_auto_play = 0}
	endif
endscript

script musicstudio_jamroom_destroy_instrument 
	printf \{channel = trchen
		qs(0x5ec6e254)}
	getplayerinfo <Player> jam_instrument
	if (<jam_instrument> = -1)
		return
	endif
	getplayerinfo <Player> controller
	if StructureContains structure = ($jam_tracks [<jam_instrument>]) ui_destroy_func
		formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <Player>
		SpawnScriptNow ($jam_tracks [<jam_instrument>].ui_destroy_func) id = <jam_player_spawns> params = {Player = <Player>}
	endif
	formatText checksumName = input_spawn 'input_spawn_%s' s = <Player>
	KillSpawnedScript id = <input_spawn>
	if musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
		<player_object> :musicstudioplayer_setinputupdate On = FALSE
	endif
endscript

script musicstudio_jamroom_exit_cleanup 
	musicstudio_jamroom_destroy_hud_extras
	Change \{jam_highway_playing = 0}
	Change \{jam_band_recording = 0}
	Change \{jam_highway_recording = 0}
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
	if ScreenElementExists \{id = jamroom_hud}
		DestroyScreenElement \{id = jamroom_hud}
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
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		id = jamroom_hud
		desc = 'musicstudio_jamroom_hud'
		z_priority = 100
		Pos = (0.0, 0.0)
		pad_360_alpha = <pad_360_alpha>
		pad_ps3_alpha = <pad_ps3_alpha>
	}
	musicstudio_jamroom_update_hud_extras state = <stop>
endscript

script musicstudio_jamroom_update_hud_extras 
	if NOT ScreenElementExists \{id = jamroom_hud}
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
		case Play
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
		SetScreenElementProps id = jam_band_highway_playline Pos = ($jam_band_playline_pos)
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
		SetScreenElementProps id = jam_band_highway_playline Pos = ($jam_band_playline_pos)
	endswitch
	if ScreenElementExists \{id = jamroom_hud_playline}
		<Pos> = (((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second) + (0.0, 2.0))
		jamroom_hud_playline :se_setprops Pos = <Pos>
	endif
endscript

script musicstudio_jamroom_get_current_style_struct 
	musicstudio_mainobj :musicstudiojamroom_getcurrentstyleindex
	<style_struct> = ($jamroom_wizard_styles [<style_index>])
	return style_struct = <style_struct>
endscript

script musicstudio_update_script_bpm_with_song_info 
	getsonginfo
	Change jam_current_bpm = <bpm>
endscript

script musicstudio_jamroom_set_style_from_wizard 
	<current_bpm> = ($jam_current_bpm)
	musicstudio_jamroom_get_current_style_struct
	musicstudio_mainobj :musicstudio_createvisualizerfromstylestruct style = <style_struct>
	musicstudio_mainobj :musicstudio_setupstylefromstruct style = <style_struct>
	musicstudio_init_volumes
	Change \{editable_fretbars_size = 0}
	musicstudio_create_fretbars
	getsonginfo
	musicstudio_mainobj :musicstudioghmix_changebpm bpm = <bpm> current_bpm = <current_bpm>
endscript

script musicstudio_jamroom_set_state_text \{state = OFF}
	if GotParam \{all_players}
		Player = 1
		begin
		musicstudio_jamroom_set_state_text_per_player Player = <Player> state = <state>
		<Player> = (<Player> + 1)
		repeat 4
	else
		musicstudio_jamroom_set_state_text_per_player Player = <Player> state = <state>
	endif
endscript

script musicstudio_jamroom_set_state_text_per_player 
	formatText checksumName = musicstudio_menu 'musicstudio_menu_%s' s = <Player>
	if ScreenElementExists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias Name = alias_jamroom_player_menu param = jamroom_player_menu
			switch <state>
				case stop
				<jamroom_player_menu> :se_setprops {
					jamroom_state_text = qs(0x122b8cfb)
					jamroom_state_rgba = [113 121 133 255]
					jamroom_state_light_alpha = 0.0
				}
				case Play
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
				case On
				<jamroom_player_menu> :se_setprops jamroom_state_alpha = 1.0
				case OFF
				<jamroom_player_menu> :se_setprops jamroom_state_alpha = 0.0
			endswitch
		endif
	endif
endscript

script set_highway_recording_effect 
	formatText checksumName = highway_name 'Highway_2Dp%p' p = <Player> AddToStringLookup = true
	if (<state> = On)
		<Color> = [1.0 0 0 1.0]
		<start_color> = ($hw_color_default)
	elseif GotParam \{blend_off}
		<start_color> = [1.0 0 0 1.0]
		<Color> = ($hw_color_default)
	else
		<start_color> = ($hw_color_default)
		<Color> = ($hw_color_default)
	endif
	if NOT ScreenElementExists id = <highway_name>
		return
	endif
	GetScreenElementProps id = <highway_name> MaterialProps = [{Name = m_pulsecolor}]
	if (<matx> = (<Color>) [0])
		return
	endif
	spawnscript changescreenelementcolorbygfs params = {
		id = <highway_name>
		Name = m_pulsecolor
		startcolor = <start_color>
		endcolor = <Color>
		frames = 20
		stepframes = 4
	}
endscript

script musicstudio_jamroom_stop_recording_all_players 
	if (($jam_highway_playing = 1) || ($jam_band_recording = 1))
		<Player> = 1
		begin
		if musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
			guitar_jam_simplerecops_command_stoprec select_player = <Player>
		endif
		<Player> = (<Player> + 1)
		repeat ($num_jam_players)
	endif
endscript

script musicstudio_jamroom_loop_playtime 
	reset_song_time \{starttime = 0}
	Change \{jam_highway_play_time = 0}
	musicstudio_jamroom_stop_recording_all_players
endscript

script musicstudio_jamroom_pause_script 
	if (($jam_band_recording = 1) || ($jam_highway_playing = 1))
		Change \{jamroom_auto_play = 1}
	endif
	KillSpawnedScript \{Name = musicstudio_jamroom_count_in}
	guitar_jam_simplerecops_command_stopplay
endscript

script musicstudio_jamroom_stop_recording_and_playing_all_players 
	musicstudio_jamroom_stop_recording_all_players
	KillSpawnedScript \{Name = musicstudio_jamroom_count_in}
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
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	GetArraySize <gems>
	gem_count = 0
	gem_created = 0
	begin
	if (<gem_pattern> && (<gems> [<gem_count>].pattern))
		<player_object> :musicstudioplayer_addjamroomnotetohighway gem_color_index = <gem_count>
	endif
	<gem_count> = (<gem_count> + 1)
	repeat <array_Size>
endscript

script musicstudio_jamroom_create_joing_player_handler 
	musicstudio_jamroom_remove_joing_player_handler controller = <controller>
	formatText checksumName = handler 'join_player_handler_%p' p = <controller>
	CreateScreenElement {
		id = <handler>
		parent = root_window
		Type = menuelement
		dims = (1024.0, 36.0)
		Pos = (0.0, -36.0)
		pos_anchor = [center bottom]
		just = [center bottom]
		internal_just = [center center]
		isvertical = FALSE
		position_children = true
		fit_major = `fit	content	if	larger`
		fit_minor = `keep	dims`
		spacing_between = 10
		z_priority = 1000
		exclusive_device = <controller>
		event_handlers = [
			{pad_btn_top musicstudio_jamroom_on_playerjoin}
		]
	}
	LaunchEvent Type = focus target = <handler>
endscript

script musicstudio_jamroom_remove_joing_player_handler 
	formatText checksumName = handler 'join_player_handler_%p' p = <controller>
	if ScreenElementExists id = <handler>
		DestroyScreenElement id = <handler>
	endif
endscript

script rebuild_all_highways_spawned 
	Wait \{1
		gameframe}
	musicstudio_mainobj :musicstudiojamroom_rebuildallhighways
endscript

script musicstudio_jamroom_on_playerjoin 
	printf channel = bkutcher qs(0x91948233) a = <device_num>
	if NOT musicstudio_mainobj :musicstudio_getplayerfromcontroller controller = <device_num>
		printf \{channel = bkutcher
			qs(0xe6117b39)}
		jamroom_add_player controller = <device_num>
		SpawnScriptNow \{rebuild_all_highways_spawned}
		musicstudio_jamroom_remove_joing_player_handler controller = <device_num>
	endif
endscript

script musicstudio_jamroom_create_play_now_helper 
	if ScreenElementExists \{id = musicstudio_jamroom_join_parent}
		return
	endif
	musicstudio_jamroom_destroy_play_now_helper
	CreateScreenElement \{id = musicstudio_jamroom_join_parent
		parent = root_window
		Type = menuelement
		dims = (1024.0, 36.0)
		Pos = (0.0, -36.0)
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
		isvertical = FALSE
		position_children = true
		fit_major = `fit	content	if	larger`
		fit_minor = `keep	dims`
		spacing_between = 10
		z_priority = 1000}
	add_user_control_helper \{text = qs(0x54683336)
		override_parent = musicstudio_jamroom_join_parent
		button = yellow
		all_buttons}
endscript

script musicstudio_jamroom_destroy_play_now_helper 
	if ScreenElementExists \{id = musicstudio_jamroom_join_parent}
		DestroyScreenElement \{id = musicstudio_jamroom_join_parent}
	endif
endscript

script musicstudio_jamroom_collapse_player_num 
	<non_vocalist_player> = 1
	ii = 0
	begin
	if musicstudio_mainobj :musicstudio_getplayerfromindex Player = <ii>
		<non_vocalist_player> = (<non_vocalist_player> + 1)
	endif
	ii = (<ii> + 1)
	repeat <Player>
	return non_vocalist_player = <non_vocalist_player>
endscript

script musicstudio_jamroom_drop_out_init 
	Wait \{1
		gameframe}
	<was_paused> = 0
	begin
	if NOT musicstudio_mainobj :musicstudio_getpauseall
		break
	endif
	<was_paused> = 1
	Wait \{1
		gameframe}
	repeat
	if (<was_paused> = 1)
		formatText checksumName = musicstudio_menu 'musicstudio_menu_%s' s = <Player>
		if <musicstudio_menu> :desc_resolvealias Name = alias_jamroom_player_menu param = jamroom_player_menu
			musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
			<player_object> :musicstudiomenu_setscrollingstate {
				id = <jamroom_player_menu>
				scrolling_state = musicstudio_jamroom_scrolling_pause_state
			}
			return
		endif
	endif
	jamroom_remove_controller Player = <Player>
	musicstudio_mainobj :musicstudiojamroom_rebuildallhighways
	musicstudio_jamroom_create_play_now_helper
	getplayerinfo <Player> controller
	musicstudio_jamroom_create_joing_player_handler controller = <controller>
endscript

script musicstudio_jamroom_refresh_lower_highway_display 
	Change \{jam_band_force_refresh_detailed_highway = 1}
endscript

script musicstudio_jamroom_instrument_select_update_data 
	if ($musicstudio_first_time_instrument_select = 1)
		Change \{musicstudio_first_time_instrument_select = 0}
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
	formatText checksumName = musicstudio_menu 'musicstudio_menu_%s' s = <Player>
	if NOT ScreenElementExists id = <musicstudio_menu>
		return
	endif
	if <musicstudio_menu> :desc_resolvealias Name = alias_jamroom_player_menu param = jamroom_player_menu
		<menu_id> = <jamroom_player_menu>
		if <jamroom_player_menu> :desc_resolvealias Name = alias_scrolling_cont param = scrolling_cont
			if <menu_id> :desc_resolvealias Name = alias_scrolling_menu_elements param = scrolling_menu_elements
				if GetScreenElementChildren id = <scrolling_menu_elements>
					<first> = NULL
					<focus_element> = NULL
					GetArraySize <children>
					i = 0
					LaunchEvent Type = unfocus target = <scrolling_menu_elements>
					LaunchEvent Type = focus target = <scrolling_menu_elements>
					begin
					<child> = (<children> [<i>])
					if ScreenElementExists id = <child>
						focusable = focusable
						if StructureContains structure = <data> instrument_select
							musicstudio_jamroom_tracks_get_focusable Player = <Player> index = <i> <data>
						endif
						if StructureContains structure = <data> sound_select
							musicstudio_get_selected_sound_focusable Player = <Player> index = <i> <data>
						endif
						if (<focusable> = focusable)
							<child> :se_setprops focusable
							<child> :se_setprops alpha = 1.0
							if (<first> = NULL)
								<first> = <child>
							endif
							if isscreenelementinfocus id = <child>
								<focus_element> = <child>
							endif
						else
							<child> :se_setprops not_focusable
							<child> :se_setprops alpha = 0.2
							LaunchEvent Type = unfocus target = <child>
						endif
					endif
					<i> = (<i> + 1)
					repeat <array_Size>
					if ((<first> != NULL) && (<focus_element> = NULL))
						LaunchEvent Type = focus target = <first>
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
	if GotParam \{pattern}
		<hold_pattern> = <pattern>
	endif
	if GotParam \{hold_pattern}
		if NOT GotParam \{instrument}
			<instrument> = 0
		endif
		if NOT GotParam \{select_player}
			musicstudio_mainobj :musicstudiojamroom_getvisualizerslot instrument = <instrument>
		elseif GotParam \{play_back}
			if (<play_back> = 1)
				musicstudio_mainobj :musicstudiojamroom_getvisualizerslot instrument = <instrument>
			endif
		endif
		if (<select_player> = -1)
			return
		endif
		processevent_note_hit strum_pattern = <hold_pattern> Player = <select_player>
	endif
endscript

script musicstudio_jammrom_change_players_menu_focus 
	<ii> = 1
	begin
	formatText checksumName = musicstudio_menu 'musicstudio_menu_%a' a = <ii>
	if ScreenElementExists id = <musicstudio_menu>
		if <musicstudio_menu> :desc_resolvealias Name = alias_jamroom_player_menu param = jamroom_player_menu
			formatText checksumName = musicstudio_menu_restore 'musicstudio_menu_restore_focus_%a' a = <ii>
			if (<focus_state> = focus)
				printstruct channel = bkutcher <...>
				printf \{channel = bkutcher
					qs(0x5a2fe466)}
				if ScreenElementExists id = <musicstudio_menu_restore>
					LaunchEvent Type = focus target = <musicstudio_menu_restore>
				endif
			else
				<jamroom_player_menu> :desc_resolvealias Name = alias_scrolling_menu_elements param = scrolling_menu_elements
				if isscreenelementinfocus id = <scrolling_menu_elements>
					printf \{channel = bkutcher
						qs(0x9a843152)}
					LaunchEvent Type = unfocus target = <scrolling_menu_elements>
					AssignAlias id = <scrolling_menu_elements> alias = <musicstudio_menu_restore>
				else
					printf \{channel = bkutcher
						qs(0xbe56abc9)}
					LaunchEvent Type = unfocus target = <jamroom_player_menu>
					AssignAlias id = <jamroom_player_menu> alias = <musicstudio_menu_restore>
				endif
			endif
		endif
	endif
	<ii> = (<ii> + 1)
	repeat 4
endscript

script musicstudio_jamroom_outofnotes_warning_exit 
	destroy_dialog_box
	Wait \{1
		Frame}
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
	setplayerinfo <Player> jam_instrument = -1
	musicstudio_clear_button_text <...>
endscript

script musicstudio_on_rebuild_all_highways 
	musicstudio_jamroom_stop_recording_and_playing_all_players
endscript

script musicstudio_jamroom_get_part_names \{Player = 1
		array_count = 0}
	Color = ($gem_colors [<array_count>])
	<color_string> = (($button_up_models [(<Player> -1)]).<Color>.name_string)
	formatText checksumName = name_lip '%s_lipp%p' s = <color_string> p = <Player> AddToStringLookup = true
	formatText checksumName = name_mid '%s_midp%p' s = <color_string> p = <Player> AddToStringLookup = true
	formatText checksumName = name_neck '%s_neckp%p' s = <color_string> p = <Player> AddToStringLookup = true
	formatText checksumName = name_head '%s_headp%p' s = <color_string> p = <Player> AddToStringLookup = true
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
		song = None}
	set_focus_color \{Color = pure_white}
	set_unfocus_color \{Color = gh4_jam_orangeish}
	Change \{jam_num_falling_gems = 0}
	Change \{musicstudio_first_time_instrument_select = 1}
	Change \{select_shift = 0}
	destroy_bg_viewport
	setup_bg_viewport
	audio_ui_menu_music_off
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = jam_band_container
		Pos = (0.0, 800.0)}
	jam_band_container :SetTags \{allow_easy_backout = 1}
	Change \{target_jam_camera_prop = jam_band}
	jam_camera_wait
	CreateScreenElement \{Type = SpriteElement
		parent = jam_band_container
		id = jam_menu_backdrop
		texture = jam_screen
		Pos = (640.0, 360.0)
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
			formatText \{TextName = song_name_text
				qs(0x8b1f3160)
				a = $jam_selected_song}
		else
			formatText \{TextName = song_name_text
				qs(0xd9070aee)}
			musicstudio_update_selected_song_name FileName = <song_name_text>
		endif
	endif
	safe_hide \{id = jam_menu_backdrop}
	RunScriptOnScreenElement \{id = jam_band_container
		legacydomorph
		params = {
			Pos = (0.0, 0.0)
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
	GetArraySize ($jam_quantize)
	Change jam_current_quantize = (<array_Size> - 1)
	if (<from_song> = 0)
		reset_song_time \{starttime = 0}
		Change \{jam_highway_play_time = 0}
	endif
	Change \{jam_highway_playing = 0}
	Change \{jam_band_recording = 0}
	Change \{is_percussion_kit = 0}
	Change \{jam_player_recording_armed = [
			0
			0
			0
			0
		]}
	Change \{jam_player_recording_begin_time = [
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
		formatText \{TextName = title_text
			qs(0xb2b7d449)
			s = $jam_selected_song
			b = $jam_current_bpm}
	else
		jam_setup_new_song
		if ((<advanced_record> = 1) || (<tutorial> = 1))
			Change \{jam_current_bpm = 120}
			setsonginfo bpm = ($jam_current_bpm)
		endif
		setsonginfo line6_0_volume = ($line6_0_volume_default)
		setsonginfo line6_1_volume = ($line6_1_volume_default)
		setsonginfo line6_0_pan = ($line6_0_pan_default)
		setsonginfo line6_1_pan = ($line6_1_pan_default)
		musicstudio_init_pan
	endif
	if GotParam \{title_text}
		printf channel = jam_mode qs(0x73307931) s = <title_text>
	endif
	if (<advanced_record> = 0)
		jam_band_create_highway song = <song> editing = <editing>
		Wait \{5
			gameframes}
		if (<editing> = 0)
			musicstudio_jamroom_set_style_from_wizard
		else
			GetArraySize ($jamroom_wizard_styles)
			musicstudio_mainobj :musicstudiojamroom_setcurrentstyleindex style_index = (<array_Size> - 1)
			musicstudio_jamroom_get_current_style_struct
			musicstudio_mainobj :musicstudio_createvisualizerfromstylestruct style = <style_struct>
		endif
	endif
endscript

script jam_setup_new_song 
	Change \{jam_band_new_song = 1}
	GetArraySize ($jam_quantize)
	Change jam_current_quantize = (<array_Size> - 1)
	Change \{jam_current_tuning = 0}
	jam_recording_create_editable_arrays
	Change \{jam_melody_octave_range = 2}
	Change \{jam_lead_octave_range = 2}
	Change \{jam_rhythm_chord_type = 0}
	jam_init_scales
	Change \{jam_current_instrument_effects = [
			0
			0
			0
			0
			0
			0
		]}
	Change \{jam_current_active_effects = [
			0
			0
			0
			0
			0
			0
		]}
	Change \{custom_chord_pattern = [
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
	Change \{jam_melody_pan = 0}
	Change \{bass_kit_mode = 0}
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	Volume = 0
	pan = 0
	switch <index>
		case 0
		Volume = ($musicstudio_lead_volume_default)
		case 1
		pan = 0
		Volume = ($musicstudio_rhythm_volume_default)
		case 2
		pan = ($musicstudio_bass_pan_default)
		Volume = ($musicstudio_bass_volume_default)
		case 3
		pan = ($musicstudio_drums_pan_default)
		Volume = ($musicstudio_drums_volume_default)
		case 4
		pan = ($musicstudio_keyboard_pan_default)
		Volume = ($musicstudio_keyboard_volume_default)
	endswitch
	settrackinfo track = ($jam_tracks [<index>].id) Volume = <Volume> pan = <pan> effect = ($jam_current_instrument_effects [<index>])
	<index> = (<index> + 1)
	repeat <array_Size>
	musicstudio_init_volumes
	musicstudio_init_pan
	reset_song_time \{starttime = 0}
endscript

script jam_create_select_instrument_menu \{Player = 0}
	if GotParam \{do_wait}
		Wait \{0.5
			Seconds}
	endif
	getplayerinfo <Player> controller
	musicstudio_jamroom_init_player_menu Player = <Player> controller = <controller>
endscript

script jam_update_falling_gem_sustain 
	<cur_id> = ($<sustain_global>)
	if GotParam \{stop}
		if (<cur_id> > 0)
			<cur_id> = (<cur_id> * -1)
		else
			<cur_id> = (<cur_id> - 1)
		endif
		Change GlobalName = <sustain_global> NewValue = <cur_id>
		return
	endif
	if (<cur_id> < 0)
		<cur_id> = (<cur_id> * -1)
	endif
	<cur_id> = (<cur_id> + 1)
	if (<cur_id> > 1000)
		<cur_id> = 1
	endif
	Change GlobalName = <sustain_global> NewValue = <cur_id>
endscript

script jam_fretboard_add_note 
	formatText checksumName = player_cont 'inst_player_cont_%s' s = <Player>
	if NOT ScreenElementExists id = <player_cont>
		return
	endif
	gem_pos_start = (19.0, 0.0)
	gem_offset = (44.0, 0.0)
	jam_menu_get_lefty Player = <Player>
	getplayerinfo <Player> jam_instrument
	getplayerinfo <Player> controller
	if (<jam_instrument> = 3)
		if NOT IsGuitarController controller = <controller>
			<lefty> = 0
		endif
	endif
	if (<lefty> = 1)
		<gem_pos_start> = (<gem_pos_start> + (<gem_offset> * 4))
	endif
	gem_pos = <gem_pos_start>
	z_priority = 28
	musicstudio_input_send_pattern_to_highway gem_pattern = <gem_pattern> Player = <Player>
endscript
jam_reverb = 0

script jam_init_reverb 
endscript

script jam_deinit_reverb 
endscript

script destroy_jam_band_menu 
	active_controllers = [0 0 0 0 0 0 0]
	GetActiveControllers
	jam_input_melody_stop_sound
	Change \{jam_highway_playing = 0}
	Change \{jam_band_recording = 0}
	Change \{jam_highway_recording = 0}
	musicstudio_reinit_menu_sounds
	KillSpawnedScript \{Name = line6_pod_remove}
	stop_custom_song
	KillSpawnedScript \{id = jam_band_spawns}
	KillSpawnedScript \{id = jam_input_spawns}
	KillSpawnedScript \{id = jam_recording_spawns}
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenElementExists \{id = jam_band_container}
		DestroyScreenElement \{id = jam_band_container}
	endif
endscript

script jam_destroy_player 
	formatText checksumName = player_cont 'inst_player_cont_%s' s = <Player>
	if ScreenElementExists id = <player_cont>
		DestroyScreenElement id = <player_cont>
	endif
	formatText checksumName = scrolling_inst_select 'scrolling_inst_select_%s' s = <Player>
	if ScreenElementExists id = <scrolling_inst_select>
		destroy_menu menu_id = <scrolling_inst_select>
	endif
	formatText checksumName = scrolling_options 'scrolling_options_%s' s = <Player>
	if ScreenElementExists id = <scrolling_options>
		destroy_menu menu_id = <scrolling_options>
	endif
	formatText checksumName = inst_cont 'inst_cont_%s' s = <Player>
	if ScreenElementExists id = <inst_cont>
		destroy_menu menu_id = <inst_cont>
	endif
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <Player>
	KillSpawnedScript id = <scale_preview_spawn>
	formatText checksumName = jam_playback_delete 'jam_playback_delete_%s' s = <Player>
	KillSpawnedScript id = <jam_playback_delete>
	formatText checksumName = input_spawn 'input_spawn_%s' s = <Player>
	KillSpawnedScript id = <input_spawn>
	jam_input_destroy_player_server Player = <Player>
	jam_kill_update_note_length Player = <Player>
	formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <Player>
	KillSpawnedScript id = <jam_player_spawns>
endscript
