
script ui_create_options_settings 
	Change \{ui_options_from_submenu = 1}
	GetGlobalTags \{user_options}
	if ScreenElementExists \{id = settings_submenu}
		DestroyScreenElement \{id = settings_submenu}
	endif
	CreateScreenElement {
		Type = descinterface
		desc = 'settings_submenu_big'
		parent = <container_id>
		id = settings_submenu
		Pos = (1200.0, -115.0)
		Scale = 1.0
		just = [center center]
	}
	Change \{bx_highlightstars_focuswaittime = 12}
	if <id> :desc_resolvealias Name = alias_menu
		AssignAlias id = <resolved_id> alias = current_submenu
		current_submenu :se_setprops \{event_handlers = [
				{
					pad_up
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_down
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
				{
					pad_back
					ui_options_check_settings
				}
			]}
		GetScreenElementChildren \{id = current_submenu}
		getplayerinfo \{1
			lefty_flip}
		if (<lefty_flip> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 0
		endif
		if isXenon
			(<children> [0]) :se_setprops {
				text_text = qs(0x83adf584)
				check_alpha = <check_alpha>
				cross_alpha = <cross_alpha>
				event_handlers = [
					{pad_choose ui_options_controller_choose_lefty_flip params = {popup = <popup> player_device = $primary_controller}}
					{focus ui_options_settings_focus}
					{unfocus ui_options_settings_unfocus}
				]
			}
		else
			(<children> [0]) :se_setprops {
				text_text = qs(0x83adf584)
				check_alpha = <check_alpha>
				cross_alpha = <cross_alpha>
				event_handlers = [
					{pad_choose ui_event_block params = {event = menu_replace data = {state = uistate_options_settings_lefty_warning is_popup container_id = <id>}}}
					{focus ui_options_settings_focus}
					{unfocus ui_options_settings_unfocus}
				]
			}
			current_menu :SetTags lefty_id = <item_id>
		endif
		vocals_get_highway_view \{Player = 1}
		if (<highway_view> != static)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 0
		endif
		if ($vocal_enable_static_view = 1)
			(<children> [1]) :se_setprops {
				text_text = qs(0x804b43ff)
				check_alpha = <check_alpha>
				cross_alpha = <cross_alpha>
				event_handlers = [
					{pad_choose options_change_vocals_highway_view params = {no_restart Player = 1}}
					{focus ui_options_settings_focus}
					{unfocus ui_options_settings_unfocus}
				]
			}
		else
			(<children> [1]) :se_setprops {
				text_text = qs(0x804b43ff)
				check_alpha = <check_alpha>
				cross_alpha = <cross_alpha>
				not_focusable
				rgba = [110 100 90 175]
			}
		endif
		getplayerinfo \{1
			vocals_sp_clap}
		if (<vocals_sp_clap> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 0
		endif
		(<children> [2]) :se_setprops {
			text_text = qs(0xd22e8941)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose options_change_vocals_sp_clap params = {Player = 1}}
				{focus ui_options_settings_focus}
				{unfocus ui_options_settings_unfocus}
			]
		}
		if (<unpause_count> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 0
		endif
		(<children> [3]) :se_setprops {
			text_text = qs(0x8fdcfd13)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose ui_options_settings_choose_count params = {Player = 1}}
				{focus ui_options_settings_focus}
				{unfocus ui_options_settings_unfocus}
			]
		}
		getplayerinfo \{1
			use_tilt_for_starpower}
		if (<use_tilt_for_starpower> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 0
		endif
		(<children> [4]) :se_setprops {
			text_text = qs(0x629b3d19)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose options_change_tilt_star_power params = {Player = 1}}
				{focus ui_options_settings_focus}
				{unfocus ui_options_settings_unfocus}
			]
		}
		getplayerinfo \{1
			enable_touch_strip}
		if (<enable_touch_strip> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 0
		endif
		(<children> [5]) :se_setprops {
			text_text = qs(0xf4397d0c)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose options_change_touch_strip_option params = {Player = 1}}
				{focus ui_options_settings_focus}
				{unfocus ui_options_settings_unfocus}
			]
		}
		GetArraySize <children>
		child = 0
		begin
		if (<children> [<child>]) :desc_resolvealias Name = alias_text
			bx_resizetextfield {
				id = <resolved_id>
				dims = (415.0, 50.0)
				fit_width = `scale	each	line	if	larger`
			}
			(<children> [<child>]) :SetTags {text_id = <resolved_id>}
			SetScreenElementProps id = <resolved_id> rgba = (($g_menu_colors).menu_gold)
		endif
		Increment \{child}
		repeat <array_Size>
	endif
	settings_submenu :obj_spawnscript \{ui_options_settings_animate_in}
	ui_options_set_settings
endscript

script ui_destroy_options_settings 
	if ScreenElementExists \{id = settings_submenu}
		settings_submenu :obj_spawnscript \{ui_options_settings_animate_out}
	endif
	clean_up_user_control_helpers
endscript

script ui_return_options_settings 
	clean_up_user_control_helpers
	add_gamertag_helper \{exclusive_device = $primary_controller}
endscript

script ui_options_settings_choose_count 
	Obj_GetID
	GetGlobalTags \{user_options
		param = unpause_count}
	if (<unpause_count> = 1)
		<unpause_count> = 0
		SoundEvent \{event = Checkbox_SFX}
		if GotParam \{popup}
			<objID> :se_setprops check_alpha = 0
			<objID> :se_setprops cross_alpha = 0
		else
			<objID> :se_setprops check_alpha = 0
			<objID> :se_setprops cross_alpha = 0
		endif
	else
		<unpause_count> = 1
		SoundEvent \{event = CheckBox_Check_SFX}
		if GotParam \{popup}
			<objID> :se_setprops check_alpha = 1
			<objID> :se_setprops cross_alpha = 0
		else
			<objID> :se_setprops check_alpha = 1
			<objID> :se_setprops cross_alpha = 0
		endif
	endif
	SetGlobalTags user_options params = {unpause_count = <unpause_count>}
endscript

script ui_create_options_settings_lefty_warning 
	create_popup_warning_menu \{title = qs(0xaa163738)
		textblock = {
			text = qs(0x15cdec24)
		}
		options = [
			{
				func = ui_options_settings_lefty_warning
				text = qs(0x182f0173)
			}
		]
		no_background}
endscript

script ui_destroy_options_settings_lefty_warning 
	destroy_popup_warning_menu
endscript

script ui_options_settings_lefty_warning 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	current_menu :GetSingleTag \{lefty_id}
	obj_spawnscript \{ui_options_controller_choose_lefty_flip
		params = {
			player_device = $primary_controller
		}}
	generic_event_back
endscript

script ui_options_settings_animate_in 
	if ScreenElementExists \{id = current_menu_anchor}
		current_menu_anchor :se_setprops \{career_menu_skull_pos = {
				relative
				(500.0, 0.0)
			}
			time = 0.15
			motion = linear}
	endif
	if NOT GotParam \{Pos}
		Pos = (16.0, -115.0)
	endif
	se_setprops Pos = <Pos> time = 0.15 motion = linear
	se_setprops \{darker_alpha = 0.4
		time = 0.15}
endscript

script ui_options_settings_animate_out 
	if ScreenElementExists \{id = current_menu_anchor}
		current_menu_anchor :se_setprops \{career_menu_skull_pos = {
				relative
				(-500.0, 0.0)
			}
			time = 0.15
			motion = linear}
	endif
	Change \{bx_highlightstars_focuswaittime = 2}
	if NOT GotParam \{Pos}
		Pos = (1200.0, -115.0)
	endif
	se_setprops Pos = <Pos> time = 0.15 motion = linear
	se_setprops \{darker_alpha = 0.0
		time = 0.15}
	se_waitprops
	if ScreenElementExists \{id = settings_submenu}
		DestroyScreenElement \{id = settings_submenu}
	endif
endscript

script ui_options_settings_focus 
	Obj_GetID
	se_setprops text_rgba = (($g_menu_colors).menu_title)
	if <objID> :desc_resolvealias Name = alias_text
		bx_focushighlightstarson objID = <resolved_id>
	endif
endscript

script ui_options_settings_unfocus 
	Obj_GetID
	se_setprops text_rgba = (($g_menu_colors).menu_gold)
endscript
