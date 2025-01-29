
script ui_create_band_choose 
	band_name1 = $wii_new_band
	formatText \{checksumName = bandname_id
		'band1_info'}
	GetGlobalTags <bandname_id> param = Name
	if NOT (<Name> = qs(0x03ac90f0))
		<band_name1> = <Name>
	endif
	band_name2 = $wii_new_band
	formatText \{checksumName = bandname_id
		'band2_info'}
	GetGlobalTags <bandname_id> param = Name
	if NOT (<Name> = qs(0x03ac90f0))
		<band_name2> = <Name>
	endif
	band_name3 = $wii_new_band
	formatText \{checksumName = bandname_id
		'band3_info'}
	GetGlobalTags <bandname_id> param = Name
	if NOT (<Name> = qs(0x03ac90f0))
		<band_name3> = <Name>
	endif
	create_new_generic_popup {
		popup_type = band_choose
		title = $wii_band_choose
		options = [
			{
				func = menu_choose_band_make_selection
				func_params = {band_index = 1 from_options = <from_options>}
				text = <band_name1>
			}
			{
				func = menu_choose_band_make_selection
				func_params = {band_index = 2 from_options = <from_options>}
				text = <band_name2>
			}
			{
				func = menu_choose_band_make_selection
				func_params = {band_index = 3 from_options = <from_options>}
				text = <band_name3>
			}
		]
	}
	displaySprite \{parent = root_window
		id = band_choose_bg1
		tex = boot_brick_bg
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z = 0}
	displaySprite \{parent = root_window
		id = band_choose_bg2
		tex = gradient_256
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z = 1
		alpha = 0.5
		BlendMode = subtract
		flip_h}
	menu_finish \{no_back_button}
endscript

script ui_destroy_band_choose 
	edit_graphic_prepare_sprite_infos \{reload_on_empty_logo}
	generatecagtexture info_array = <sprite_infos> Player = <currentskaterprofileindex> test = 0 slow_path = 1
	DestroyScreenElement \{id = band_choose_bg1}
	DestroyScreenElement \{id = band_choose_bg2}
	if ScreenElementExists \{id = generic_popupelement}
		destroy_new_generic_popup
	endif
endscript
