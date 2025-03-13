jam_current_instrument_effects = [
	0
	0
	0
	0
	0
	0
]
jam_current_active_effects = [
	0
	0
	0
	0
	0
	0
]
num_unlocked_line6_effect_rhythm = 30
num_unlocked_line6_effect_lead = 20
jam_bass_effects = [
	{
		name_text = qs(0x25660ca4)
		amp_text = qs(0x0d01351b)
		fx_text = qs(0x0d01351b)
		cab_text = qs(0x0d01351b)
		on = {
		}
		off = {
		}
	}
	{
		name_text = qs(0xf82d5e60)
		amp_text = qs(0x328bd981)
		fx_text = qs(0x0d01351b)
		cab_text = qs(0x0d01351b)
		on = {
			effect = echo
			name = leadecho
			delay = 100
			decayratio = 0.22
			maxchannels = 6
			drymix = 1.0
			wetmix = 1.0
		}
		off = {
		}
	}
]

script guitar_jam_effects_select_effect 
	formattext checksumname = selector_id 'pause_submenu_effects_selector_%b' b = <player>
	formattext checksumname = option_id 'pause_submenu_effects_options_%b_%c' b = <player> c = <option_index>
	<selector_id> :setprops parent = <option_id>
	formattext checksumname = cur_effect 'current_effect_txt_%a' a = <player>
	if screenelementexists id = <cur_effect>
		getplayerinfo <player> jam_instrument
		switch (<jam_instrument>)
			case 0
			<effect_array> = pause_effects_options_rhythm
			case 1
			<effect_array> = pause_effects_options_lead
			case 2
			<effect_array> = pause_effects_options_bass
		endswitch
		<cur_effect> :se_setprops text = (($<effect_array>) [<option_index>].name_text)
	endif
	getplayerinfo <player> jam_instrument
	setarrayelement arrayname = jam_current_instrument_effects globalarray index = <jam_instrument> newvalue = <option_index>
endscript

script guitar_jam_effects_exit 
	getplayerinfo <select_player> jam_instrument
	musicstudio_change_effect instrument = <jam_instrument>
	jam_band_remove_pause_submenu vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript

script jam_load_effect \{loaded_effects = [
			0
			0
			0
			0
			0
		]}
	change \{jam_current_instrument_effects = [
			0
			0
			0
			0
			0
		]}
	track_count = 0
	begin
	gettrackinfo track = ($jam_tracks [<track_count>].id)
	setarrayelement arrayname = loaded_effects index = <track_count> newvalue = <effect>
	printf channel = jam_mode qs(0x2d0a9ddf) s = <effect>
	<track_count> = (<track_count> + 1)
	repeat 4
	change jam_current_instrument_effects = <loaded_effects>
	printf channel = jam_mode qs(0x2d0a9ddf) s = ($jam_current_instrument_effects [0])
endscript

script jam_save_effect 
	track_count = 0
	effects = ($jam_current_instrument_effects)
	begin
	effect = (<effects> [<track_count>])
	settrackinfo track = ($jam_tracks [<track_count>].id) effect = <effect>
	printf channel = jam_mode qs(0x0c5f8b33) s = <effect>
	<track_count> = (<track_count> + 1)
	repeat 4
endscript
