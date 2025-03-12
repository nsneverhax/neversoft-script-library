skate8_sfx_background_areas_and_states = {
	frontend = {
		`default` = silence_front_end_crowd_loop
		volume_params = {
			silence_front_end_crowd_loop = 10
		}
		fade_from = {
		}
	}
	crowd_stadium_good = {
		`default` = heavy_crowd_loop_good_02
		volume_params = {
			heavy_crowd_loop_good_02 = 40
		}
		fade_from = {
		}
	}
	crowd_stadium_nuetral = {
		`default` = heavy_crowd_loop_nuetral_02
		volume_params = {
			heavy_crowd_loop_nuetral_02 = 160
		}
		fade_from = {
		}
	}
	crowd_stadium_bad = {
		`default` = heavy_crowd_loop_bad_01
		volume_params = {
			heavy_crowd_loop_bad_01 = 135
		}
		fade_from = {
		}
	}
	crowd_medium_good1 = {
		`default` = medium_crowd_loop_good_02
		volume_params = {
			medium_crowd_loop_good_02 = 70
		}
		fade_from = {
		}
	}
	crowd_medium_neutral = {
		`default` = medium_crowd_loop_neutral_01
		volume_params = {
			medium_crowd_loop_neutral_01 = 100
		}
		fade_from = {
		}
	}
	crowd_medium_bad = {
		`default` = medium_crowd_loop_bad_01
		volume_params = {
			medium_crowd_loop_bad_01 = 140
		}
		fade_from = {
		}
	}
	crowd_small_bad = {
		`default` = small_crowd_loop_bad
		volume_params = {
			small_crowd_loop_bad = 60
		}
		fade_from = {
		}
	}
	crowd_small_good = {
		`default` = small_crowd_loop_good
		volume_params = {
			small_crowd_loop_good = 88
		}
		fade_from = {
		}
	}
	crowd_small_neutral = {
		`default` = small_crowd_loop_neutral
		volume_params = {
			small_crowd_loop_neutral = 16
		}
		fade_from = {
		}
	}
	crowd_nipmuc_bad = {
		`default` = nipmuc_crowd_loop_bad
		volume_params = {
			nipmuc_crowd_loop_bad = 60
		}
		fade_from = {
		}
	}
	crowd_nipmuc_good = {
		`default` = nipmuc_crowd_loop_good
		volume_params = {
			nipmuc_crowd_loop_good = 88
		}
		fade_from = {
		}
	}
	crowd_nipmuc_neutral = {
		`default` = nipmuc_crowd_loop_neutral
		volume_params = {
			nipmuc_crowd_loop_neutral = 16
		}
		fade_from = {
		}
	}
	crowd_hell_bad = {
		`default` = hell_crowd_loop_bad
		volume_params = {
			hell_crowd_loop_bad = 250
		}
		fade_from = {
		}
	}
	crowd_hell_neutral = {
		`default` = hell_crowd_loop_neutral
		volume_params = {
			hell_crowd_loop_neutral = 150
		}
		fade_from = {
		}
	}
	crowd_hell_good = {
		`default` = hell_crowd_loop_good
		volume_params = {
			hell_crowd_loop_good = 150
		}
		fade_from = {
		}
	}
	crowd_outdoor_neutral = {
		`default` = outdoor_crowd_loop_neutral
		volume_params = {
			outdoor_crowd_loop_neutral = 150
		}
		fade_from = {
		}
	}
	crowd_outdoor_good = {
		`default` = outdoor_crowd_loop_good
		volume_params = {
			outdoor_crowd_loop_good = 250
		}
		fade_from = {
		}
	}
	crowd_outdoor_bad = {
		`default` = outdoor_crowd_loop_bad
		volume_params = {
			outdoor_crowd_loop_bad = 300
		}
		fade_from = {
		}
	}
}

script bg_crowd_large_neutral 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_stadium_nuetral}
	one_shot_soundevent \{soundevent = donothing_oneshot}
endscript

script bg_crowd_large_good 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_stadium_good}
	one_shot_soundevent \{soundevent = crowd_oneshots_cheer_close
		waittime = 5}
endscript

script bg_crowd_large_bad 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_stadium_bad}
	one_shot_soundevent \{soundevent = crowd_oneshots_boo_close
		waittime = 5}
endscript

script bg_crowd_medium_neutral 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_medium_neutral}
	one_shot_soundevent \{soundevent = donothing_oneshot}
endscript

script bg_crowd_medium_good 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_medium_good1}
	one_shot_soundevent \{soundevent = crowd_oneshots_cheer_close
		waittime = 5}
endscript

script bg_crowd_medium_bad 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_medium_bad}
	one_shot_soundevent \{soundevent = crowd_oneshots_boo_close
		waittime = 5}
endscript

script bg_crowd_small_bad 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_small_bad}
	one_shot_soundevent \{soundevent = crowd_oneshots_boo_close
		waittime = 5}
endscript

script bg_crowd_small_good 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_small_good}
	one_shot_soundevent \{soundevent = crowd_oneshots_cheer_close
		waittime = 5}
endscript

script bg_crowd_small_neutral 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_small_neutral}
	one_shot_soundevent \{soundevent = donothing_oneshot
		waittime = 5}
endscript

script bg_crowd_nipmuc_bad 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_nipmuc_bad}
	one_shot_soundevent \{soundevent = crowd_oneshots_boo_close
		waittime = 5}
endscript

script bg_crowd_nipmuc_good 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_nipmuc_good}
	one_shot_soundevent \{soundevent = crowd_oneshots_cheer_close
		waittime = 5}
endscript

script bg_crowd_nipmuc_neutral 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_nipmuc_neutral}
	one_shot_soundevent \{soundevent = donothing_oneshot
		waittime = 5}
endscript

script bg_crowd_hell_bad 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_hell_bad}
	one_shot_soundevent \{soundevent = crowd_oneshots_boo_close
		waittime = 5}
endscript

script bg_crowd_hell_neutral 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_hell_neutral}
	one_shot_soundevent \{soundevent = donothing_oneshot
		waittime = 5}
endscript

script bg_crowd_hell_good 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_hell_good}
	one_shot_soundevent \{soundevent = crowd_oneshots_cheer_close
		waittime = 2}
endscript

script bg_crowd_front_end_silence \{immediate = 0}
	skate8_sfx_backgrounds_new_area bg_sfx_area = frontend immediate = <immediate>
	one_shot_soundevent soundevent = donothing_oneshot waittime = 5 immediate = <immediate>
endscript

script bg_crowd_outdoor_neutral 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_outdoor_neutral}
	one_shot_soundevent \{soundevent = donothing_oneshot
		waittime = 5}
endscript

script bg_crowd_outdoor_good 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_outdoor_good}
	one_shot_soundevent \{soundevent = crowd_oneshots_cheer_close
		waittime = 5}
endscript

script bg_crowd_outdoor_bad 
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = crowd_outdoor_bad}
	one_shot_soundevent \{soundevent = crowd_oneshots_boo_close
		waittime = 5}
endscript
