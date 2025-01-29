jam_reverb = 0

script jam_init_reverb 

	createeffectsendstack \{slot = 2
		effects = [
			{
				$jam_mode_medroom_reverb
			}
		]}
	setsoundbussparams \{jammode_rhythmguitar = {
			send_vol2 = -30
		}}
	setsoundbussparams \{jammode_leadguitar = {
			send_vol2 = -30
		}}

	if ($jam_reverb = 0)
		Change \{jam_reverb = 1}
	endif
endscript

script jam_deinit_reverb 

	setsoundbussparams \{jammode_rhythmguitar = {
			send_vol2 = -100
		}}
	setsoundbussparams \{jammode_leadguitar = {
			send_vol2 = -100
		}}
	destroyeffectsendstack \{slot = 2}

	if ($jam_reverb = 1)
		Change \{jam_reverb = 0}
	endif
endscript
