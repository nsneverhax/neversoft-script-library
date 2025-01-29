
script ui_create_bonus_videos_credits 
	destroy_friend_feed
	cas_destroy_all_characters
	generic_ui_destroy
	SpawnScriptNow create_credits_menu params = {<...> soundcheck}
endscript

script ui_destroy_bonus_videos_credits 
	SpawnScriptNow \{end_credits_button}
endscript
