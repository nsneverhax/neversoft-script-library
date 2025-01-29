confirm_band_delete_menu_font = fontgrid_title_gh3

script create_confirm_band_delete_menu 
	set_focus_color \{Color = pink}
	set_unfocus_color \{Color = dk_violet_grey}
	text = [
		'You are about to permanently delete the selected band. '
		'All progress associated with that band will be lost. '
		'Are you sure you want to continue?'
	]
	create_popup_warning_menu {
		textblock = {
			text = <text>
			dims = (600.0, 500.0)
			Scale = 1
		}
		menu_pos = <menu_pos>
		dialog_dims = (600.0, 80.0)
		pad_back_script = menu_confirm_band_delete_select_no
		options = [
			{
				func = menu_confirm_band_delete_select_no
				text = 'NO'
			}
			{
				func = menu_confirm_band_delete_select_yes
				text = 'YES'
			}
		]
	}
endscript

script destroy_confirm_band_delete_menu 
	destroy_popup_warning_menu
endscript

script menu_confirm_band_delete_select_no 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script menu_confirm_band_delete_select_yes 
	band_count = ($current_band)
	GetArraySize \{$difficulty_list}
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	formatText checksumName = bandname 'p1_career_band%i_%d' i = ($num_career_bands + 1) d = <difficulty_text_nl> AddToStringLookup = true
	pop_bandtags bandname = <bandname>
	formatText checksumName = bandname 'p1_career_band%i_%d' i = <band_count> d = <difficulty_text_nl> AddToStringLookup = true
	push_bandtags bandname = <bandname> mode = p1_career
	formatText checksumName = default_bandname 'band%i_info_p1_career' i = <band_count> AddToStringLookup = true
	SetGlobalTags <default_bandname> params = {($default_bandtags)}
	array_count = (<array_count> + 1)
	repeat <array_Size>
	ui_flow_manager_respond_to_action \{action = continue}
endscript
