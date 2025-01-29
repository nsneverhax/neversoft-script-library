
script ui_create_bonus_videos_credits 
	cas_destroy_all_characters
	generic_ui_destroy
	menu_music_on
	SpawnScriptNow create_credits_menu params = {<...>}
endscript

script ui_destroy_bonus_videos_credits 
	SpawnScriptNow \{end_credits_button}
endscript
