
script ui_create_magazine_cover 
	ui_magazine_page_should_i_show_mag_page
	if (<show_page> = 0)
		spawnscript \{ui_magazine_page_continue_to_next_screen}
	else
		get_current_band_info
		GetGlobalTags <band_info>
		bandname = <Name>
		get_all_exclusive_devices
		CreateScreenElement {
			parent = root_window
			id = my_magazine_container
			Type = ContainerElement
			Pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [center center]
			exclusive_device = <exclusive_device>
		}
		CreateScreenElement {
			parent = my_magazine_container
			id = my_magazine_id
			Type = descinterface
			desc = 'song_summary_magazine'
			magazine_band_text = <bandname>
			event_handlers = [
				{pad_choose ui_magazine_page_continue_to_next_screen}
			]
		}
		ui_magazine_page_show_stuff_based_on_venu
		AssignAlias \{id = my_magazine_id
			alias = current_menu}
		add_user_control_helper \{text = qs(0x182f0173)
			button = green
			z = 100000}
	endif
endscript

script ui_destroy_magazine_cover 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_magazine_container}
endscript

script ui_magazine_cover_anim_in 

	ui_magazine_page_should_i_show_mag_page
	if (<show_page> = 0)
		return
	else
		SoundEvent \{event = gigcomplete_magazine_in}
		if ScreenElementExists \{id = my_magazine_id}
			my_magazine_id :se_setprops \{magazine_pos = (800.0, 630.0)
				magazine_rot = 45
				magazine_scale = 1.5}
			my_magazine_id :se_setprops \{magazine_pos = (35.0, 0.0)
				magazine_rot = 0
				magazine_scale = 1
				time = 0.2
				motion = ease_in}
			my_magazine_id :se_waitprops
			my_magazine_id :se_setprops \{magazine_pos = (15.0, 0.0)
				time = 0.1
				magazine_scale = 1.05
				motion = ease_out}
			my_magazine_id :se_waitprops
			my_magazine_id :se_setprops \{magazine_pos = (5.0, 0.0)
				time = 0.2
				magazine_scale = 1
				motion = ease_out}
			my_magazine_id :se_waitprops
			my_magazine_id :se_setprops \{magazine_pos = (0.0, 0.0)
				time = 0.1
				motion = ease_out}
			my_magazine_id :se_waitprops
		endif
	endif
endscript

script ui_magazine_cover_anim_out 

	ui_magazine_page_should_i_show_mag_page
	if (<show_page> = 0)
		return
	else
		clean_up_user_control_helpers
		if ScreenElementExists \{id = my_magazine_id}
			SoundEvent \{event = gigcomplete_magazine_out}
			my_magazine_id :se_setprops \{magazine_pos = (-1000.0, 630.0)
				magazine_rot = -45
				magazine_scale = 0.8
				time = 0.2
				motion = ease_in}
			my_magazine_id :se_waitprops
		endif
	endif
endscript

script ui_magazine_page_should_i_show_mag_page 
	lvl = ($current_level)
	show_mag_page = 0
	GetGlobalTags \{Progression
		params = career_using_createagig}
	if (<career_using_createagig> = 1)
		return \{show_page = 0}
	endif
	switch <lvl>
		case load_z_hob
		case load_z_frathouse
		case load_z_harbor
		case load_z_cathedral
		case load_z_bayou
		case load_z_recordstore
		case load_z_goth
		case load_z_fairgrounds
		case load_z_military
		case load_z_castle
		case load_z_ballpark
		case load_z_metalfest
		case load_z_newyork
		show_mag_page = 1
	endswitch
	return show_page = <show_mag_page>
endscript

script ui_magazine_page_continue_to_next_screen 
	ui_event_wait_for_safe

	progression_get_new_unlocks
	GetArraySize <new_unlocks>
	gamemode_gettype
	if (<array_Size> > 0)
		generic_event_choose \{state = uistate_rewards}
	else
		ui_att_ballpark_should_i_show_ad
		if (<show_att_ad> = 1)
			generic_event_choose \{state = uistate_att_ballpark}
		else
			ui_win_song_continue_next_menu
		endif
	endif
endscript

script ui_magazine_page_show_stuff_based_on_venu 
	lvl = ($current_level)

	switch <lvl>
		case load_z_hob

		my_magazine_id :se_setprops \{mag_masthead_revolver_alpha = 1}
		my_magazine_id :se_setprops \{magazine_statement_rgba = [
				140
				212
				213
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0x74d40e21)}
		my_magazine_id :se_setprops \{magazine_band_rgba = [
				245
				183
				108
				255
			]}
		my_magazine_id :se_setprops \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_bg_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_cover_hob = 1}
		case load_z_frathouse

		my_magazine_id :se_setprops \{mag_masthead_decibel_alpha = 1}
		my_magazine_id :se_setprops \{magazine_statement_rgba = [
				168
				161
				221
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0x43171d7f)}
		my_magazine_id :se_setprops \{magazine_band_rgba = [
				220
				220
				220
				255
			]}
		my_magazine_id :se_setprops \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_bg_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_cover_frat = 1}
		case load_z_harbor

		my_magazine_id :se_setprops \{mag_masthead_kerrang_alpha = 1}
		my_magazine_id :se_setprops \{magazine_statement_rgba = [
				200
				200
				200
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0xf4d6f8f8)}
		my_magazine_id :se_setprops \{magazine_band_rgba = [
				255
				169
				66
				255
			]}
		my_magazine_id :se_setprops \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_bg_rgba = [
				162
				181
				141
				255
			]}
		my_magazine_id :se_setprops \{magazine_cover_hongkong = 1}
		case load_z_cathedral

		my_magazine_id :se_setprops \{mag_masthead_nme_alpha = 1}
		my_magazine_id :se_setprops \{mag_photo_billy = 1}
		my_magazine_id :se_setprops \{magazine_statement_rgba = [
				220
				220
				220
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0x86000f17)}
		my_magazine_id :se_setprops \{magazine_band_rgba = [
				220
				220
				220
				255
			]}
		my_magazine_id :se_setprops \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_bg_rgba = [
				175
				51
				56
				255
			]}
		case load_z_bayou

		my_magazine_id :se_setprops \{mag_masthead_metaledge_alpha = 1}
		my_magazine_id :se_setprops \{mag_photo_zakk = 1}
		my_magazine_id :se_setprops \{magazine_statement_rgba = [
				158
				1
				58
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0xe9b9bddc)}
		my_magazine_id :se_setprops \{magazine_band_rgba = [
				212
				170
				25
				255
			]}
		my_magazine_id :se_setprops \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_bg_rgba = [
				0
				0
				0
				255
			]}
		case load_z_recordstore

		my_magazine_id :se_setprops \{mag_masthead_spin_alpha = 1}
		my_magazine_id :se_setprops \{mag_photo_haley = 1}
		my_magazine_id :se_setprops \{magazine_statement_rgba = [
				0
				70
				98
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0x74a7314c)}
		my_magazine_id :se_setprops \{magazine_band_rgba = [
				175
				35
				55
				255
			]}
		my_magazine_id :se_setprops \{magazine_bg_rgba = [
				200
				200
				200
				255
			]}
		case load_z_goth

		my_magazine_id :se_setprops \{mag_masthead_q_alpha = 1}
		my_magazine_id :se_setprops \{mag_photo_goth = 1}
		my_magazine_id :se_setprops \{magazine_statement_rgba = [
				172
				218
				227
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_shadow_rgba = [
				100
				100
				100
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0xf71d6c67)}
		my_magazine_id :se_setprops \{magazine_band_rgba = [
				185
				37
				60
				255
			]}
		my_magazine_id :se_setprops \{magazine_band_shadow_rgba = [
				224
				182
				230
				255
			]}
		my_magazine_id :se_setprops \{magazine_bg_rgba = [
				100
				100
				100
				255
			]}
		case load_z_fairgrounds

		my_magazine_id :se_setprops \{mag_masthead_guitarworld_alpha = 1}
		my_magazine_id :se_setprops \{mag_photo_nugent = 1}
		my_magazine_id :se_setprops \{magazine_statement_rgba = [
				166
				124
				82
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_shadow_rgba = [
				57
				45
				85
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0xb230eb57)}
		my_magazine_id :se_setprops \{magazine_band_rgba = [
				220
				220
				220
				255
			]}
		my_magazine_id :se_setprops \{magazine_band_shadow_rgba = [
				57
				45
				85
				255
			]}
		my_magazine_id :se_setprops \{magazine_bg_rgba = [
				77
				45
				85
				255
			]}
		case load_z_military

		my_magazine_id :se_setprops \{mag_masthead_ap_alpha = 1}
		my_magazine_id :se_setprops \{mag_photo_travis = 1}
		my_magazine_id :se_setprops \{magazine_statement_rgba = [
				152
				205
				60
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0x7616304f)}
		my_magazine_id :se_setprops \{magazine_band_rgba = [
				216
				95
				49
				255
			]}
		my_magazine_id :se_setprops \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_bg_rgba = [
				94
				147
				155
				255
			]}
		case load_z_castle

		my_magazine_id :se_setprops \{mag_masthead_mojo_alpha = 1}
		my_magazine_id :se_setprops \{mag_photo_sting = 1}
		my_magazine_id :se_setprops \{magazine_statement_rgba = [
				200
				200
				200
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0x2d772b11)}
		my_magazine_id :se_setprops \{magazine_band_rgba = [
				158
				1
				75
				255
			]}
		my_magazine_id :se_setprops \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_bg_rgba = [
				0
				0
				0
				255
			]}
		case load_z_ballpark

		my_magazine_id :se_setprops \{mag_masthead_hits_alpha = 1}
		my_magazine_id :se_setprops \{mag_photo_jimi = 1}
		my_magazine_id :se_setprops \{magazine_statement_rgba = [
				200
				200
				200
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0x9ef76969)}
		my_magazine_id :se_setprops \{magazine_band_rgba = [
				206
				80
				85
				255
			]}
		my_magazine_id :se_setprops \{magazine_band_shadow_rgba = [
				49
				23
				45
				255
			]}
		my_magazine_id :se_setprops \{magazine_bg_rgba = [
				49
				23
				45
				255
			]}
		case load_z_metalfest

		my_magazine_id :se_setprops \{mag_masthead_revolver_alpha = 1}
		my_magazine_id :se_setprops \{mag_photo_ozzy = 1}
		my_magazine_id :se_setprops \{magazine_statement_rgba = [
				224
				215
				235
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0xff01ee1d)}
		my_magazine_id :se_setprops \{magazine_band_rgba = [
				157
				178
				189
				255
			]}
		my_magazine_id :se_setprops \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_bg_rgba = [
				110
				87
				122
				255
			]}
		case load_z_newyork

		my_magazine_id :se_setprops \{mag_masthead_rollingstone_alpha = 1}
		my_magazine_id :se_setprops \{magazine_statement_rgba = [
				200
				200
				200
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0x99b20125)}
		my_magazine_id :se_setprops \{magazine_band_rgba = [
				225
				91
				110
				255
			]}
		my_magazine_id :se_setprops \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_bg_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :se_setprops \{magazine_cover_newyork = 1}
		case Default
		my_magazine_id :se_setprops \{magazine_statement_text = qs(0xe1419b6d)}
	endswitch
endscript
