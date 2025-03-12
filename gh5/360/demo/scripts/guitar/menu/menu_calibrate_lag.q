calibrate_lag_miss_avg_threshold_ms = 200
calibrate_lag_miss_threshold_max_ms = 500
calibrate_lag_failed_num = 0
calibrate_lag_fail_threshold_num = 3
allow_console_pause_for_cal_lag = 0

script get_lag_values 
	getglobaltags \{user_options
		param = lag_audio_calibration}
	getglobaltags \{user_options
		param = lag_video_calibration}
	if gotparam \{lag_audio_calibration}
		if gotparam \{lag_video_calibration}
			casttointeger \{lag_audio_calibration}
			casttointeger \{lag_video_calibration}
			audio_offset = <lag_audio_calibration>
			video_offset = <lag_video_calibration>
		endif
	endif
	return audio_offset = <audio_offset> video_offset = <video_offset>
endscript
