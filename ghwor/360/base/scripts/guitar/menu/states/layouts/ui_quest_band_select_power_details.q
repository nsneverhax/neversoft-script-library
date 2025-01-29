
script ui_create_quest_band_select_power_details \{chapter_name = !q1768515945}
	hero_info = ($<chapter_name>.hero_info)
	character_name_text = ($<hero_info>.character_transformation_fullname)
	power_type_text = ($<hero_info>.character_power2)
	power_description_text = ($<hero_info>.power_desc2)
	hero_name_nl = ($<hero_info>.name_nl)
	desc_stars = ($<hero_info>.desc_stars)
	flavor_text = ($<hero_info>.info_desc4)
	ui_quest_get_giglist_bg hero_name_nl = <hero_name_nl> chapter_global = <chapter_name>
	CreateScreenElement {
		parent = root_window
		id = questbandselectpowerdetailsid
		Type = descinterface
		desc = 'career_gig_select'
		character_name_text = <character_name_text>
		power_type_text = <power_type_text>
		background_texture = <bg_texture>
		power_description_text = <power_description_text>
		character_description_text = <flavor_text>
		character_name_alpha = 1.0
		stars_next_transform_alpha = 0.0
		career_gig_select_leader_alpha = 0.0
		transfrom_meter_alpha = 0.0
		song_frame_alpha = 0.0
		event_handlers = [
			{pad_back generic_event_back}
			{pad_back ui_sfx params = {menustate = Generic uitype = back}}
		]
		exclusive_device = ($primary_controller)
		z_priority = 100
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 500}
	AssignAlias \{id = questbandselectpowerdetailsid
		alias = current_menu}
endscript

script ui_destroy_quest_band_select_power_details 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = questbandselectpowerdetailsid}
		DestroyScreenElement \{id = questbandselectpowerdetailsid}
	endif
endscript
