
script qbr_callback_setup 
	if retailbuild
		return
	endif
	addqbrcallback \{q_file_names = [
			guitar_band_preset_profiles
			guitar_band_ghrocker_profiles
			guitar_band_profile
		]
		callBack_Script = qbr_callback_cas}
	addqbrcallback \{q_file_names = [
			guitar_material
		]
		callBack_Script = qbr_callback_materials_pre
		preqbr}
	addqbrcallback \{q_file_names = [
			guitar_material
		]
		callBack_Script = qbr_callback_materials_post}
	addqbrcallback \{q_file_names = [
			guitar_events
		]
		callBack_Script = qbr_callback_guitar_events_post}
endscript

script qbr_callback_cas 
	stars
	printf \{qs(0xb2f78668)}
	stars
	debug_reset_character_profiles
	get_num_savegames
	if (<num_savegames> > 0)
		<savegame> = 0
		begin
		reset_all_preset_characters savegame = <savegame>
		<savegame> = (<savegame> + 1)
		repeat <num_savegames>
	endif
	if (($is_in_cas) = 1)
		if getcurrentcasobject
			if NOT is_completely_custom_musician id = ($cas_current_profile)
				refreshcasprofile
			endif
		endif
	endif
endscript

script qbr_callback_materials_pre 
	destroy_in_game_materials
	destroy_multipass_materials \{async = 0}
endscript

script qbr_callback_materials_post 
	create_in_game_materials \{savegame = 0
		async = 0}
	create_multipass_materials \{async = 0}
endscript

script qbr_callback_guitar_events_post 
	getmaxlocalplayers
	Player = 1
	begin
	if ($autolaunch_startnow = 1)
		SpawnScriptNow create_guitar_events params = {Player = <Player>}
	else
		SpawnScriptLater create_guitar_events params = {Player = <Player>}
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	Destroy_AllWhammyFX
	NoteFX \{reset = 1}
endscript
