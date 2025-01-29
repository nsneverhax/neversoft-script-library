calibrate_lag_miss_avg_threshold_ms = 200
calibrate_lag_miss_threshold_max_ms = 500
calibrate_lag_failed_num = 0
calibrate_lag_fail_threshold_num = 3
allow_console_pause_for_cal_lag = 0
calibrate_lag_error_fix_audio = 25
calibrate_lag_error_fix_video = 12
calibrate_lag_error_fix_drums = 10

script get_lag_values 
	GetGlobalTags \{user_options
		param = lag_audio_calibration}
	GetGlobalTags \{user_options
		param = lag_video_calibration}
	if GotParam \{lag_audio_calibration}
		if GotParam \{lag_video_calibration}
			CastToInteger \{lag_audio_calibration}
			CastToInteger \{lag_video_calibration}
			audio_offset = <lag_audio_calibration>
			video_offset = <lag_video_calibration>
		endif
	endif
	return audio_offset = <audio_offset> video_offset = <video_offset>
endscript
