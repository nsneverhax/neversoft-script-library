confirm_band_delete_menu_font = fontgrid_title_gh3

script create_confirm_band_delete_menu 
	set_focus_color \{color = pink}
	set_unfocus_color \{color = dk_violet_grey}
	text = [
		"You are about to permanently delete the selected band. "
		"All progress associated with that band will be lost. "
		"Are you sure you want to continue?"
	]
	create_popup_warning_menu {
		textblock = {
			text = <text>
			dims = (700.0, 500.0)
			scale = 0.6
		}
		menu_pos = <menu_pos>
		dialog_dims = (600.0, 80.0)
		pad_back_script = menu_confirm_band_delete_select_no
		options = [
			{
				func = menu_confirm_band_delete_select_no
				text = "NO"
			}
			{
				func = menu_confirm_band_delete_select_yes
				text = "YES"
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
	getarraysize \{$difficulty_list}
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	formattext checksumname = bandname 'p1_career_band%i_%d' i = ($num_career_bands + 1) d = <difficulty_text_nl> addtostringlookup = true
	pop_bandtags bandname = <bandname>
	formattext checksumname = bandname 'p1_career_band%i_%d' i = <band_count> d = <difficulty_text_nl> addtostringlookup = true
	push_bandtags bandname = <bandname> mode = p1_career
	formattext checksumname = default_bandname 'band%i_info_p1_career' i = <band_count> addtostringlookup = true
	setglobaltags <default_bandname> params = {($default_bandtags)}
	array_count = (<array_count> + 1)
	repeat <array_size>
	ui_flow_manager_respond_to_action \{action = continue}
endscript
