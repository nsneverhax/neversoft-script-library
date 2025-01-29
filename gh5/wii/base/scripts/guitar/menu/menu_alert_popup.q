g_ap_prev_menu_id = 0

script create_alert_popup 
	ScriptAssert \{'create_alert_popup: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_alert_popup \{Force = 0}
	SoundEvent \{event = ui_sfx_select}
	destroy_menu \{menu_id = ap_popup_scroll}
	destroy_menu \{menu_id = ap_popup_container}
	if (<Force> = 0)
		if ScreenElementExists \{id = $g_ap_prev_menu_id}
			LaunchEvent \{Type = focus
				target = $g_ap_prev_menu_id}
		endif
	endif
	clean_up_user_control_helpers
	if (<Force> = 0 && $g_ap_prev_menu_id = ebn_marker)
		enter_band_name_reset_user_control_helpers
	endif
endscript

script autosave_popup_dot_progression 
	ScriptAssert \{'autosave_popup_dot_progression: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
