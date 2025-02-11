current_selected_mode = p1_local

script create_select_mode_menu 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = sm_root_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		parent = sm_root_container
		texture = Newspaper_BG_2P
		Pos = (640.0, 360.0)
		just = [
			center
			center
		]
		dims = (1280.0, 720.0)
		z_priority = -100}
	CreateScreenElement \{Type = ContainerElement
		parent = sm_root_container
		id = sm_container
		Pos = (-90.0, 0.0)
		rot_angle = 6}
	create_menu_backdrop \{texture = Cash_reward_bg}
	CreateScreenElement \{Type = TextElement
		parent = sm_container
		Scale = (1.0, 0.7)
		Pos = (625.0, 0.0)
		text = "single player"
		font = text_a4
		rgba = [
			50
			50
			50
			255
		]
		just = [
			center
			top
		]
		z_priority = 3
		font_spacing = 6}
	CreateScreenElement \{Type = TextElement
		parent = sm_container
		Scale = (1.8, 1.2)
		Pos = (625.0, 25.0)
		text = "SELECT MODE"
		font = text_a4
		rgba = [
			150
			60
			35
			255
		]
		just = [
			center
			top
		]
		z_priority = 3
		font_spaceing = 2}
	CreateScreenElement \{Type = SpriteElement
		parent = sm_container
		texture = Multiplayer_2p_Flourish
		Pos = (395.0, 50.0)
		z_priority = 3
		rgba = [
			50
			50
			50
			255
		]
		just = [
			right
			top
		]
		flip_v}
	CreateScreenElement \{Type = SpriteElement
		parent = sm_container
		texture = Multiplayer_2p_Flourish
		Pos = (855.0, 50.0)
		z_priority = 3
		rgba = [
			50
			50
			50
			255
		]
		just = [
			left
			top
		]}
	new_menu {
		scrollid = scrolling_select_mode_menu
		vmenuid = vmenu_select_mode_menu
		menu_pos = (220.0, 230.0)
		exclusive_device = ($primary_controller)
		internal_just = [left center]
		no_focus = 1
		rot_angle = 6
		spacing = 48
	}
	set_focus_color \{rgba = [
			150
			60
			35
			255
		]}
	set_unfocus_color \{rgba = [
			50
			50
			50
			255
		]}
	text_params = {
		Type = TextElement
		parent = vmenu_select_mode_menu
		font = text_a4
		Scale = 1.0
		rgba = ($menu_unfocus_color)
	}
	CreateScreenElement {
		<text_params>
		id = sm_local_id
		text = "LOCAL PLAY"
		event_handlers = [
			{focus select_mode_focus}
			{unfocus select_mode_unfocus}
			{pad_choose select_mode_select_mode params = {mode = p1_local}}
		]
	}
	CreateScreenElement {
		<text_params>
		id = sm_axeclub_id
		text = "AXE CLUB"
		event_handlers = [
			{focus select_mode_focus}
			{unfocus select_mode_unfocus}
			{pad_choose select_mode_select_mode params = {mode = p1_axeclub}}
		]
	}
	CreateScreenElement {
		<text_params>
		id = sm_tourney_id
		text = "TOURNAMENT"
		event_handlers = [
			{focus select_mode_focus}
			{unfocus select_mode_unfocus}
			{pad_choose select_mode_select_mode params = {mode = p1_tourney}}
		]
		rgba = [150 150 150 255]
		not_focusable
	}
	displaySprite \{parent = sm_container
		id = sm_highlight
		tex = practice_typebar_1
		Pos = (240.0, 269.0)
		dims = (775.0, 100.0)
		rgba = [
			100
			100
			100
			50
		]
		z = 2
		just = [
			left
			center
		]}
	displaySprite \{parent = sm_container
		id = sm_highlight2
		tex = practice_typebar_2
		Pos = (240.0, 269.0)
		dims = (775.0, 100.0)
		rgba = [
			100
			100
			100
			50
		]
		z = 2
		just = [
			left
			center
		]}
	sm_highlight2 :SetProps \{alpha = 0}
	CreateScreenElement \{Type = TextElement
		parent = sm_container
		Scale = (0.7, 0.7)
		Pos = (360.0, 269.0)
		text = "No online features"
		font = text_a4
		rgba = [
			100
			100
			100
			255
		]
		just = [
			left
			top
		]
		z_priority = 3}
	CreateScreenElement \{Type = TextElement
		parent = sm_container
		Scale = (0.7, 0.7)
		Pos = (360.0, 371.0)
		text = "Track your statistics and personal bests"
		font = text_a4
		rgba = [
			100
			100
			100
			255
		]
		just = [
			left
			top
		]
		z_priority = 3}
	CreateScreenElement \{Type = TextElement
		parent = sm_container
		Scale = (0.7, 0.7)
		Pos = (360.0, 468.0)
		text = "Compete for cash and prizes"
		font = text_a4
		rgba = [
			100
			100
			100
			255
		]
		just = [
			left
			top
		]
		z_priority = 3}
	GetGlobalTags \{arcade_audits}
	GetGlobalTags \{arcade_adjustments}
	if ((<arcade_credits_for_axeclub> - <arcade_num_credits_in>) > 1)
		formatText TextName = axeclubpricetext "Insert %a More Credits" a = (<arcade_credits_for_axeclub> - <arcade_num_credits_in>)
	elseif ((<arcade_credits_for_axeclub> - <arcade_num_credits_in>) = 1)
		formatText \{TextName = axeclubpricetext
			"Insert 1 More Credit"}
	else
		formatText \{TextName = axeclubpricetext
			"Ready to Rock!!!"}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = sm_container
		id = sm_axeclub_price_container
		Pos = (775.0, 359.0)}
	CreateScreenElement {
		Type = TextElement
		id = sm_axeclub_price
		parent = sm_axeclub_price_container
		Scale = (0.7, 0.7)
		text = <axeclubpricetext>
		Pos = (0.0, 0.0)
		rgba = [150 60 35 255]
		z_priority = 3
		font = text_a4
		just = [center center]
		no_shadow
	}
	if (<arcade_credits_for_axeclub> > 0)
		spawnscript \{select_mode_watch_axeclub}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = sm_container
		id = sm_tourney_price_container
		Pos = (775.0, 456.0)}
	CreateScreenElement \{Type = TextElement
		id = sm_tourney_price
		parent = sm_tourney_price_container
		Scale = (0.7, 0.7)
		text = "Add'l Costs Apply"
		Pos = (0.0, 0.0)
		rgba = [
			205
			82
			48
			255
		]
		z_priority = 3
		font = text_a4
		just = [
			center
			center
		]
		no_shadow}
	add_user_control_helper \{text = "SELECT"
		button = green}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar}
	LaunchEvent \{Type = focus
		target = vmenu_select_mode_menu}
	SpawnScriptNow \{select_mode_watch_timer}
endscript

script destroy_select_mode_menu 
	KillSpawnedScript \{Name = axeclub_pop}
	KillSpawnedScript \{Name = select_mode_watch_timer}
	KillSpawnedScript \{Name = select_mode_watch_axeclub}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_select_mode_menu}
	destroy_menu \{menu_id = sm_root_container}
	destroy_menu_backdrop
endscript

script select_mode_focus 
	retail_menu_focus
	GetTags
	SetScreenElementProps id = <id> Scale = 1.2
	printf "select_mode_focus: id=%a" a = <id>
	switch (<id>)
		case sm_axeclub_id
		Change \{current_selected_mode = p1_axeclub}
		SetScreenElementProps \{id = sm_highlight
			Pos = (240.0, 371.0)
			dims = (775.0, 100.0)}
		SetScreenElementProps \{id = sm_highlight2
			Pos = (240.0, 371.0)
			dims = (775.0, 100.0)}
		case sm_tourney_id
		Change \{current_selected_mode = p1_tourney}
		SetScreenElementProps \{id = sm_highlight
			Pos = (240.0, 468.0)
			dims = (775.0, 100.0)}
		SetScreenElementProps \{id = sm_highlight2
			Pos = (240.0, 468.0)
			dims = (775.0, 100.0)}
		case sm_local_id
		default
		Change \{current_selected_mode = p1_local}
		SetScreenElementProps \{id = sm_highlight
			Pos = (240.0, 269.0)
			dims = (775.0, 100.0)}
		SetScreenElementProps \{id = sm_highlight2
			Pos = (240.0, 269.0)
			dims = (775.0, 100.0)}
	endswitch
	GetRandomValue \{Name = random_flip
		integer
		a = 0
		b = 1}
	if (<random_flip> = 0)
		sm_highlight :SetProps \{alpha = 1}
		sm_highlight2 :SetProps \{alpha = 0}
	else
		sm_highlight :SetProps \{alpha = 0}
		sm_highlight2 :SetProps \{alpha = 1}
	endif
	printf \{"select_mode_focus: current_selected_mode=%a"
		a = $current_selected_mode}
endscript

script select_mode_unfocus 
	retail_menu_unfocus
	GetTags
	SetScreenElementProps id = <id> Scale = 1.0
endscript

script select_mode_select_mode \{mode = p1_local
		timeout = 0}
	printf "select_mode_select_mode: mode = %s" s = <mode>
	if (<mode> = p1_axeclub)
		GetGlobalTags \{arcade_audits}
		GetGlobalTags \{arcade_adjustments}
		printf "select_mode_select_mode: axe club chosen: %a of %b credits" a = <arcade_num_credits_in> b = <arcade_credits_for_axeclub>
		if (<arcade_num_credits_in> < <arcade_credits_for_axeclub>)
			if (<timeout> = 1)
				printf \{"select_mode_select_mode: timeout on axe club with low funds, bumping timer"}
				SoundEvent \{event = Single_Player_Bad_Note_Guitar}
				KillSpawnedScript \{Name = axeclub_pop}
				SpawnScriptNow \{axeclub_pop}
				KillSpawnedScript \{Name = select_mode_watch_timer}
				spawnscript \{select_mode_watch_timer
					params = {
						Timer = 5
						warning = 5
					}}
				if ScreenElementExists \{id = vmenu_select_mode_menu}
					LaunchEvent \{Type = pad_up
						target = vmenu_select_mode_menu}
				endif
				return
			else
				printf \{"select_mode_select_mode: timeout on axe club with low funds, ignoring"}
				SoundEvent \{event = Single_Player_Bad_Note_Guitar}
				KillSpawnedScript \{Name = axeclub_pop}
				SpawnScriptNow \{axeclub_pop}
				return
			endif
		else
			<arcade_num_credits_in> = (<arcade_num_credits_in> - <arcade_credits_for_axeclub>)
			SetGlobalTags arcade_audits params = {arcade_num_credits_in = <arcade_num_credits_in>}
			printf "select_mode_select_mode: axe club selection arcade_num_credits_in=%d" d = <arcade_num_credits_in>
			change_coin_message
		endif
	endif
	Change coinup_game_mode = <mode>
	GetGlobalTags \{arcade_audits}
	switch <mode>
		case p1_local
		<arcade_total_local_plays> = (<arcade_total_local_plays> + 1)
		case p1_axeclub
		<arcade_total_axeclub_plays> = (<arcade_total_axeclub_plays> + 1)
		<arcade_total_coinup_plays> = (<arcade_total_coinup_plays> + 1)
		case p1_tourney
		<arcade_total_tourney_plays> = (<arcade_total_tourney_plays> + 1)
		<arcade_total_coinup_plays> = (<arcade_total_coinup_plays> + 1)
	endswitch
	SetGlobalTags arcade_audits params = {
		arcade_total_local_plays = <arcade_total_local_plays>
		arcade_total_axeclub_plays = <arcade_total_axeclub_plays>
		arcade_total_tourney_plays = <arcade_total_tourney_plays>
		arcade_total_coinup_plays = <arcade_total_coinup_plays>
	}
	printf "select_mode_select_mode: game_mode now %s" s = <mode>
	switch <mode>
		case p1_local
		ui_flow_manager_respond_to_action \{action = select_local}
		case p1_axeclub
		ui_flow_manager_respond_to_action \{action = select_axeclub}
		case p1_tourney
		ui_flow_manager_respond_to_action \{action = select_local}
	endswitch
endscript

script select_mode_watch_timer \{Timer = 15
		warning = 5}
	SpawnScriptNow set_countdown_timer params = {timer_value = <Timer> warning_val = <warning>}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		printf \{"select_mode_watch_timer: countdown expired with id=%s"
			s = $current_selected_mode}
		break
	endif
	Wait \{1
		Second}
	repeat
	SpawnScriptNow \{select_mode_select_mode
		params = {
			mode = $current_selected_mode
			timeout = 1
		}}
endscript

script select_mode_watch_axeclub 
	begin
	GetGlobalTags \{arcade_audits}
	GetGlobalTags \{arcade_adjustments}
	if ((<arcade_credits_for_axeclub> - <arcade_num_credits_in>) > 1)
		formatText TextName = axeclubpricetext "Insert %a More Credits" a = (<arcade_credits_for_axeclub> - <arcade_num_credits_in>)
	elseif ((<arcade_credits_for_axeclub> - <arcade_num_credits_in>) = 1)
		formatText \{TextName = axeclubpricetext
			"Insert 1 More Credit"}
	else
		formatText \{TextName = axeclubpricetext
			"Ready to Rock!!!"}
	endif
	sm_axeclub_price :SetProps text = <axeclubpricetext>
	Wait \{1
		gameframe}
	repeat
endscript

script axeclub_pop 
	DoScreenElementMorph \{id = sm_axeclub_price_container
		Scale = 0.5
		time = 0.1}
	Wait \{0.1
		Seconds}
	DoScreenElementMorph \{id = sm_axeclub_price_container
		Scale = 1
		time = 0.1}
	Wait \{0.1
		Seconds}
endscript
