band_mode_available_text = {
	instruments = [
		qs(0x9504b94a)
		qs(0x7d4f9214)
		qs(0x388cd3db)
		qs(0x1b9f6f84)
	]
	difficulties = [
		qs(0x8d657387)
		qs(0x6ef11a01)
		qs(0x51b06d2f)
		qs(0x334908ac)
	]
}
allow_controller_for_all_instruments = 0
band_mode_show_signin = 1
band_mode_vocals = 0
band_mode_guitar = 0
band_mode_bass = 0
band_mode_drum = 0
band_mode_active = 0

script set_band_mode_dont_signin 
	Change \{band_mode_show_signin = 0}
endscript

script reset_band_mode 
	Change \{band_mode_active = 0}
	Change \{band_mode_vocals = 0}
	Change \{band_mode_guitar = 0}
	Change \{band_mode_bass = 0}
	Change \{band_mode_drum = 0}
endscript
