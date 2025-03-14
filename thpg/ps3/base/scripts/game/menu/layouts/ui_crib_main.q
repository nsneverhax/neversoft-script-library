
script ui_create_crib_main 
	printf "UI: ui_create_crib_main"
	restore_start_key_binding
	make_cas_menu {
		menu_id = crib_main_anchor
		vmenu_id = crib_main_vmenu
		title = "SKATE LOUNGE"
		back_state = uistate_pausemenu
		pausemenu
	}
	if NOT skater :cap_allow_rigger_mode_entry
		<rigger_disable> = {not_focusable}
	endif
	add_cas_menu_item {
		text = "PURCHASE ITEMS"
		pad_choose_script = ui_create_crib_purchase
	}
	add_cas_menu_item {
		text = "CLEAR SKATE LOUNGE"
		pad_choose_script = ui_clear_crib_warning_dialog
	}
	crib_get_theme_data theme = (($crib_current_settings).zone)
	formattext textname = theme_entry "Theme: %s" s = (<data>.name)
	add_cas_menu_item {
		text = <theme_entry>
		cas_heading
	}
	add_cas_menu_item {
		text = "CHANGE THEME"
		choose_state = UIstate_Crib_Theme
	}
	if crib_get_video_used
		video_text = ((($crib_video_params).<video>).text)
	else
		video_text = ""
	endif
	formattext textname = video_entry "Video: %s" s = <video_text>
	add_cas_menu_item {
		text = <video_entry>
		cas_heading
	}
	add_cas_menu_item {
		text = "CHANGE VIDEO"
		choose_state = UIstate_Crib_Video
	}
	if crib_get_music_used
		if (<music> = none)
			music_text = "None"
		elseif (<music> = playlist)
			music_text = "Playlist"
		else
			music_text = "Custom"
		endif
	else
		music_text = "None"
	endif
	formattext textname = music_entry "Music: %s" s = <music_text>
	add_cas_menu_item {
		text = <music_entry>
		cas_heading
	}
	add_cas_menu_item {
		text = "CHANGE MUSIC"
		choose_state = UIstate_Crib_Music
	}
	add_cas_menu_item {
		text = "Back"
		choose_state = uistate_pausemenu
	}
	cas_menu_finish
endscript

script ui_crib_purchase_theme 
	printf \{'ui_crib_purchase_theme'}
	if careerfunc func = havepurchasedcribtheme params = {index = <index>}
		scriptassert \{'already have this'}
	endif
	if ui_crib_check_cash cost = <cost>
		ui_crib_deduct_cash cost = <cost>
		careerfunc func = purchasecribtheme params = {index = <index>}
		ui_crib_change_zone zone = <theme>
		ui_create_crib_purchase_theme
	endif
endscript

script ui_crib_purchase_video 
	printf \{'ui_crib_purchase_video'}
	if careerfunc func = havepurchasedcribvideo params = {index = <index>}
		scriptassert \{'already have this'}
	endif
	if ui_crib_check_cash cost = <cost>
		ui_crib_deduct_cash cost = <cost>
		careerfunc func = purchasecribvideo params = {index = <index>}
		the_video = (($crib_video_list) [<index>])
		crib_change_video video = <the_video>
		ui_create_crib_purchase_video
	endif
endscript

script ui_crib_change_zone 
	setbuttoneventmappings \{block_menu_input}
	load_level_handle_loading_screen
	crib_change_zone zone = <zone>
	hideloadingscreen
	setbuttoneventmappings \{unblock_menu_input}
	ui_create_crib_theme
	if (<zone> = z_crib_Theater)
		crib_turn_all_objects_off
	endif
endscript

script ui_clear_crib_warning_dialog 
	create_dialog_box {
		title = "CLEAR SKATE LOUNGE?"
		text = "Are you sure you want to remove everything you've placed?"
		pos = (320.0, 240.0)
		just = [center center]
		pad_back_script = ui_clear_crib_warning_cancel
		buttons = [
			{font = text_a1 text = "CLEAR SKATE LOUNGE" pad_choose_script = ui_clear_crib_warning_accept}
			{font = text_a1 text = "CANCEL" pad_choose_script = ui_clear_crib_warning_cancel}
		]
	}
endscript

script ui_clear_crib_warning_accept 
	dialog_box_exit
	crib_clear_crib
	ui_create_crib_main
endscript

script ui_clear_crib_warning_cancel 
	dialog_box_exit
	cas_menu_finish
endscript

script ui_destroy_crib_main 
	printf \{"UI: ui_destroy_crib_main"}
	generic_ui_destroy
endscript

script ui_crib_go_to_closet_dialog 
	create_dialog_box {
		title = "GO TO CREATE-A-SKATER?"
		text = "Are you sure you want to exit to the create-a-skater?"
		pos = (320.0, 240.0)
		just = [center center]
		pad_back_script = ui_crib_go_to_closet_dialog_cancel
		buttons = [
			{font = text_a1 text = "GO TO CREATE-A-SKATER" pad_choose_script = ui_crib_go_to_closet_dialog_accept}
			{font = text_a1 text = "CANCEL" pad_choose_script = ui_crib_go_to_closet_dialog_cancel}
		]
	}
endscript

script ui_crib_go_to_closet_dialog_accept 
	dialog_box_exit
	spawnscriptnow \{ui_crib_closet_go}
endscript

script ui_crib_go_to_closet_dialog_cancel 
	dialog_box_exit
	cas_menu_finish
endscript

script ui_crib_closet_go 
	kill_start_key_binding
	do_autosave \{immediate
		suspend_ui}
	generic_ui_destroy
	pause_menu_fmv_kill
	killskatercamanim \{all}
	change \{bedroom_select_skater = came_from_crib}
	spawnscriptnow \{noqbid
		change_level
		params = {
			level = load_z_bedroom
		}}
endscript

script ui_crib_go_to_pro_tricks 
	generic_ui_destroy
	pause_menu_fmv_kill
	killskatercamanim \{all}
	load_cas_pak \{pak = CAS_PROS}
	setgametype \{mocap}
	setcurrentgametype
	mocap_startup
	printf \{"ui_crib_go_to_pro_tricks: HUD_switch_nollie Off"}
	spawnscriptnow \{hud_switch_nollie
		params = {
			off
		}}
	mocap_anim_menu
endscript

script ui_crib_return_from_pro_tricks 
	mocap_exit
	setgametype \{career}
	setcurrentgametype
	unload_cas_pak \{pak = CAS_PROS}
	MakeSkaterGoto \{SkaterInit}
	if gotparam \{unpause}
		generic_ui_destroy
		pause_menu_fmv_kill
		killskatercamanim \{all}
		unpause_game_and_destroy_pause_menu
		restore_start_key_binding
	else
		spawnscriptnow \{pause_menu_fmv_play}
		create_debug_menu
	endif
endscript

script ui_create_crib_purchase 
	printf 'ui_create_crib_purchase'
	make_cas_menu {
		menu_id = crib_purchase_anchor
		vmenu_id = crib_purchase_vmenu
		title = "SKATE LOUNGE SHOP"
		back_state = UIstate_Crib_Main
		pausemenu
	}
	careerfunc func = GetCash
	formattext textname = cash_text "Cash $%i" i = <cash>
	add_cas_menu_item {
		text = <cash_text>
		cas_heading
	}
	add_cas_menu_item {
		text = "THEMES"
		pad_choose_script = ui_create_crib_purchase_theme
	}
	add_cas_menu_item {
		text = "VIDEOS"
		pad_choose_script = ui_create_crib_purchase_video
	}
	cas_menu_finish
endscript

script ui_create_crib_purchase_theme 
	getarraysize ($crib_zone_list)
	count = 0
	<i> = 0
	begin
	if NOT careerfunc func = havepurchasedcribtheme params = {index = <i>}
		count = (<count> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	isScrolling = {}
	if (<count> > 8)
		isScrolling = {scrolling}
	endif
	make_cas_menu {
		menu_id = crib_purchase_anchor
		vmenu_id = crib_purchase_vmenu
		title = "Purchase Themes"
		pad_back_script = ui_create_crib_purchase
		pausemenu
		<isScrolling>
	}
	careerfunc func = GetCash
	formattext textname = cash_text "Cash $%i" i = <cash>
	add_cas_menu_item {
		text = <cash_text>
		cas_heading
	}
	<i> = 0
	sold_out = 1
	begin
	if NOT careerfunc func = havepurchasedcribtheme params = {index = <i>}
		zone_entry = (($crib_zone_list) [<i>])
		cost = (<zone_entry>.cost)
		formattext textname = cost_text "$%i" i = <cost>
		add_cas_menu_item {
			text = (<zone_entry>.name)
			extra_text = <cost_text>
			pad_choose_script = ui_crib_purchase_theme
			pad_choose_params = {theme = (<zone_entry>.zone) index = <i> cost = <cost>}
		}
		sold_out = 0
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (<sold_out> = 1)
		add_cas_menu_item {
			text = "All Purchased"
			pad_choose_script = ui_create_crib_purchase
		}
	endif
	cas_menu_finish
endscript

script ui_create_crib_purchase_video 
	getarraysize ($crib_video_list)
	count = 0
	<i> = 0
	begin
	if NOT careerfunc func = havepurchasedcribvideo params = {index = <i>}
		count = (<count> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	isScrolling = {}
	if (<count> > 8)
		isScrolling = {scrolling}
	endif
	make_cas_menu {
		menu_id = crib_purchase_anchor
		vmenu_id = crib_purchase_vmenu
		title = "Purchase Videos"
		pad_back_script = ui_create_crib_purchase
		pausemenu
		<isScrolling>
	}
	careerfunc func = GetCash
	formattext textname = cash_text "Cash $%i" i = <cash>
	add_cas_menu_item {
		text = <cash_text>
		cas_heading
	}
	<i> = 0
	sold_out = 1
	begin
	if NOT careerfunc func = havepurchasedcribvideo params = {index = <i>}
		video = (($crib_video_list) [<i>])
		video_params = (($crib_video_params).<video>)
		cost = (<video_params>.cost)
		formattext textname = cost_text "$%i" i = <cost>
		add_cas_menu_item {
			text = (<video_params>.text)
			extra_text = <cost_text>
			pad_choose_script = ui_crib_purchase_video
			pad_choose_params = {video = <video> index = <i> cost = <cost>}
		}
		sold_out = 0
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (<sold_out> = 1)
		add_cas_menu_item {
			text = "All Purchased"
			pad_choose_script = ui_create_crib_purchase
		}
	endif
	cas_menu_finish
endscript

script ui_destroy_crib_purchase 
	printf \{'ui_destroy_crib_purchase'}
	generic_ui_destroy
endscript

script ui_create_crib_theme 
	getarraysize ($crib_zone_list)
	<count> = 0
	<i> = 0
	begin
	if ((careerfunc func = havepurchasedcribtheme params = {index = <i>}) || (getglobalflag flag = $CHEAT_UNLOCKED_ALL_CRIB_THEMES))
		<count> = (<count> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	isScrolling = {}
	if (<count> > 7)
		isScrolling = {scrolling}
	endif
	make_cas_menu {
		menu_id = crib_theme_anchor
		vmenu_id = crib_theme_vmenu
		title = "SKATE LOUNGE THEME"
		back_state = UIstate_Crib_Main
		pausemenu
		<isScrolling>
	}
	<i> = 0
	begin
	if ((careerfunc func = havepurchasedcribtheme params = {index = <i>}) || (getglobalflag flag = $CHEAT_UNLOCKED_ALL_CRIB_THEMES))
		zone_entry = (($crib_zone_list) [<i>])
		if ((<zone_entry>.zone) = (($crib_current_settings).zone))
			toggle = {no_toggle toggle = on}
			focus_index = <i>
		else
			toggle = {no_toggle}
		endif
		add_cas_menu_item {
			text = (<zone_entry>.name)
			<toggle>
			pad_choose_script = ui_crib_change_zone
			pad_choose_params = {zone = (<zone_entry>.zone)}
			tag_grid_x = <i>
		}
	endif
	i = (<i> + 1)
	repeat <array_size>
	add_cas_menu_item {
		text = "BACK"
		choose_state = UIstate_Crib_Main
	}
	cas_menu_finish index = <focus_index>
	printf 'ui_create_crib_theme'
endscript

script ui_destroy_crib_theme 
	printf \{'ui_destroy_crib_theme'}
	generic_ui_destroy
endscript

script ui_crib_check_cash fail_script = ui_create_crib_purchase
	if NOT gotparam cost
		printf "ui_crib_check_cash: param cost not found"
		spawnscriptnow <fail_script>
		return false
	endif
	careerfunc func = GetCash
	if NOT gotparam cash
		printf "ui_crib_check_cash: param cash not found"
		spawnscriptnow <fail_script>
		return false
	endif
	if (<cash> < <cost>)
		soundevent event = Goal_UI_Negative_Text_Loud
		printf "poopy"
		create_dialog_box {title = "Not enough cash"
			text = "You don't have enough cash to purchase this item."
			buttons = [{text = "ok" pad_choose_script = <fail_script>}
			]
			text_dims = (280.0, 0.0)
		}
		return false
	endif
	return true
endscript

script ui_crib_deduct_cash 
	if NOT gotparam cost
		printf "ui_crib_deduct_cash: param cost not found"
		return
	endif
	careerfunc func = GetCash
	if NOT gotparam cash
		printf "ui_crib_deduct_cash: param cash not found"
		return
	endif
	if (<cash> < <cost>)
		scriptassert 'Out of cash!'
	endif
	careerfunc func = AddCash params = {cash = (<cost> * -1)}
endscript
ui_video_choose_ui_back_state = UIstate_Crib_Main

script ui_create_crib_video 
	printf 'ui_create_crib_video'
	getarraysize ($crib_video_list)
	<i> = 0
	<count> = 0
	begin
	if ui_crib_video_is_available index = <i>
		count = (<count> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	isScrolling = {}
	if (<count> > 7)
		isScrolling = {scrolling}
	endif
	make_cas_menu {
		menu_id = crib_video_anchor
		vmenu_id = crib_video_vmenu
		title = "SKATE LOUNGE VIDEO"
		back_state = ($ui_video_choose_ui_back_state)
		pausemenu
		<isScrolling>
	}
	<i> = 0
	begin
	if ui_crib_video_is_available index = <i>
		the_video = (($crib_video_list) [<i>])
		video_params = (($crib_video_params).<the_video>)
		toggle = {no_toggle}
		if crib_get_video_used
			if (<video> = <the_video>)
				toggle = {no_toggle toggle = on}
				focus_index = <i>
			endif
		endif
		add_cas_menu_item {
			text = (<video_params>.text)
			<toggle>
			pad_choose_script = ui_crib_change_video
			pad_choose_params = {video = <the_video>}
			tag_grid_x = <i>
		}
	endif
	i = (<i> + 1)
	repeat <array_size>
	add_cas_menu_item {
		text = "BACK"
		choose_state = ($ui_video_choose_ui_back_state)
	}
	cas_menu_finish index = <focus_index>
endscript

script ui_crib_video_is_available 
	if careerfunc func = havepurchasedcribvideo params = {index = <index>}
		the_video = (($crib_video_list) [<index>])
		video_params = (($crib_video_params).<the_video>)
		if getglobalflag flag = $CHEAT_UNLOCK_ALL_MOVIES
			return true
		endif
		if structurecontains structure = <video_params> unlock_flag
			if getglobalflag flag = (<video_params>.unlock_flag)
				return true
			else
				return false
			endif
		else
			return true
		endif
	else
		return false
	endif
endscript

script ui_destroy_crib_video 
	if ($ui_video_choose_ui_back_state = uistate_gameplay)
		skater :unpause
	endif
	change \{ui_video_choose_ui_back_state = UIstate_Crib_Main}
	printf \{'ui_destroy_crib_video'}
	generic_ui_destroy
endscript

script ui_crib_change_video 
	crib_change_video video = <video>
	generic_ui_destroy
	ui_create_crib_video
endscript
ui_music_choose_ui_back_state = UIstate_Crib_Main

script ui_create_crib_music 
	printf 'ui_create_crib_music'
	make_cas_menu {
		menu_id = crib_music_anchor
		vmenu_id = crib_music_vmenu
		title = "SKATE LOUNGE MUSIC"
		back_state = ($ui_music_choose_ui_back_state)
		pausemenu
		scrolling
		width = 1100
		highlight_add = (350.0, 0.0)
	}
	crib_get_music_used
	toggle_offset = {extras_offset = (400.0, 0.0)}
	if (<music> = none)
		toggle = {<toggle_offset> no_toggle toggle = on}
		focus_index = 0
	else
		toggle = {<toggle_offset> no_toggle}
	endif
	add_cas_menu_item {
		text = "None"
		<toggle>
		pad_choose_script = ui_crib_change_music
		pad_choose_params = {music = none}
		tag_grid_x = 0
	}
	if (<music> = playlist)
		toggle = {<toggle_offset> no_toggle toggle = on}
		focus_index = 1
	else
		toggle = {e <toggle_offset> no_toggle}
	endif
	add_cas_menu_item {
		text = "Playlist"
		<toggle>
		pad_choose_script = ui_crib_change_music
		pad_choose_params = {music = playlist}
		tag_grid_x = 1
	}
	getarraysize ($playlist_tracks)
	<i> = 0
	begin
	formattext textname = songname "%a - %t" a = (($playlist_tracks) [<i>].artist) t = (($playlist_tracks) [<i>].title)
	if (<music> = (($playlist_tracks) [<i>].asset))
		toggle = {<toggle_offset> no_toggle toggle = on}
		focus_index = (2 + <i>)
	else
		toggle = {<toggle_offset> no_toggle}
	endif
	add_cas_menu_item {
		text = <songname>
		<toggle>
		pad_choose_script = ui_crib_change_music
		pad_choose_params = {music = (($playlist_tracks) [<i>].asset)}
		tag_grid_x = (2 + <i>)
	}
	i = (<i> + 1)
	repeat <array_size>
	add_cas_menu_item {
		text = "BACK"
		choose_state = ($ui_music_choose_ui_back_state)
	}
	cas_menu_finish index = <focus_index>
endscript

script ui_destroy_crib_music 
	if ($ui_music_choose_ui_back_state = uistate_gameplay)
		skater :unpause
	endif
	change \{ui_music_choose_ui_back_state = UIstate_Crib_Main}
	printf \{'ui_destroy_crib_music'}
	generic_ui_destroy
endscript

script ui_crib_change_music 
	launchevent \{type = unfocus
		target = crib_music_anchor}
	crib_change_music music = <music>
	generic_ui_destroy
	ui_create_crib_music
endscript
