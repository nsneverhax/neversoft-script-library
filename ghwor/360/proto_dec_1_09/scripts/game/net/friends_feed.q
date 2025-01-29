
script attempt_to_add_friend_feed \{parent_id = root_window
		menu = !q1768515945}
	printf \{channel = ff
		qs(0xd5461f01)}
	controller_index = -1
	switch <menu>
		case band_lobby
		begin
		if (-1 != $g_leader_player_num)
			getplayerinfo ($g_leader_player_num) controller out = controller_index
			break
		endif
		Wait \{1
			Second}
		repeat
		case SongList
		if GotParam \{songlist_mode}
			if (leaderboard = <songlist_mode>
					|| practice = <songlist_mode>
					|| music_store = <songlist_mode>
					|| play_song = <songlist_mode>
					|| playlist = <songlist_mode>
				)
				if ($primary_controller_assigned = 0)
					<controller_index> = ($primary_controller)
				else
					<controller_index> = -1
				endif
			else
				getplayerinfo ($g_leader_player_num) controller
				<controller_index> = <controller>
			endif
		else
			<controller_index> = -1
		endif
		case main
		controller_index = ($primary_controller)
		case freeplay
		if ($primary_controller_assigned = 0)
			controller_index = ($primary_controller)
		else
			max_controllers = 4
			controller_index = 0
			0x04936f26 = 0
			begin
			if CheckForSignIn controller_index = <controller_index>
				0x04936f26 = 1
				break
			endif
			controller_index = (<controller_index> + 1)
			repeat <max_controllers>
			if (0 = <0x04936f26>)
				controller_index = -1
			endif
		endif
	endswitch
	if (-1 != <controller_index>)
		printf \{channel = ff
			qs(0x2f529583)}
		if CheckForSignIn controller_index = <controller_index>
			printf \{channel = ff
				qs(0x29ac0fbb)}
			create_friend_feed parent_id = <parent_id> menu = <menu> controller_index = <controller_index> event_handler = <event_handler>
		endif
	endif
endscript

script create_friend_feed \{parent_id = !q1768515945
		menu = !q1768515945
		controller_index = !i1768515945}
	if ScreenElementExists id = <parent_id>
		if ScreenElementExists \{id = friends_feed_desc_id}
			DestroyScreenElement \{id = friends_feed_desc_id}
		endif
		CreateScreenElement {
			parent = <parent_id>
			id = friends_feed_desc_id
			Type = descinterface
			desc = 'friend_feed'
			autosizedims = true
			tags = {
				menu = <menu>
			}
		}
		friends_feed_desc_id :Obj_SpawnScriptNow \{ff_cleanup_spawned}
		Pos = (0.0, 0.0)
		z_priority = 0.0
		Pos = ($friend_feed_menu_data.<menu>.Pos)
		z_priority = ($friend_feed_menu_data.<menu>.z_priority)
		friends_feed_desc_id :se_setprops Pos = <Pos> alpha = 0.0 z_priority = <z_priority>
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			Handlers = [{pad_back 0x9f80e0af}]
			<friend_feed_vmenu_id> :SetTags view_index = 0 state = Idle 0x94a921b3 = 0
			<friend_feed_vmenu_id> :se_setprops Pos = (0.0, -97.0) event_handlers = <Handlers>
			<friend_feed_vmenu_id> :Obj_SpawnScriptLater ff_scroll_feed_items
			<friend_feed_vmenu_id> :Obj_SpawnScriptLater 0xbcdaa185
		endif
		0x1052c0ef controller_index = <controller_index>
		0x5fa741e4 controller_index = <controller_index>
		Change \{0x621f73c3 = 1}
		if (1 = ($friend_feed_menu_data.<menu>.interactive))
			if GotParam \{event_handler}
				<friend_feed_vmenu_id> :SetTags return_menu = <event_handler>
				<event_handler> :se_setprops {
					event_handlers = [
						{($friend_feed_menu_data.<menu>.pad_handler) ff_attempt_to_expand_feed params = {}}
					]
				}
			endif
		endif
		friends_feed_desc_id :se_setprops \{alpha = 1.0}
	endif
endscript

script ff_cleanup_spawned 
	OnExitRun \{ff_cleanup}
	Block \{Type = ff_cleanup}
endscript

script ff_cleanup 
	netfeeddebugoverlay_destroy
endscript

script ff_clear_mini_feed_items 
	if ScreenElementExists \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			DestroyScreenElement id = <friend_feed_vmenu_id> preserve_parent
			<friend_feed_vmenu_id> :Obj_KillSpawnedScript Name = ff_scroll_feed_items
			Handlers = [{pad_back 0x9f80e0af}]
			<friend_feed_vmenu_id> :SetTags view_index = 0 state = Idle 0x94a921b3 = 0
			<friend_feed_vmenu_id> :se_setprops Pos = (0.0, -97.0) event_handlers = <Handlers>
			<friend_feed_vmenu_id> :Obj_SpawnScriptNow ff_scroll_feed_items
		endif
	endif
endscript

script ff_attempt_to_expand_feed \{device_num = !i1768515945}
	if (-1 != <device_num>)
		if CheckForSignIn controller_index = <device_num>
			ff_expand_feed controller_index = <device_num>
		else
			printf \{qs(0x5bc2d488)}
		endif
	endif
endscript

script ff_expand_feed \{controller_index = !i1768515945}
	if ScreenElementExists \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			Obj_GetID
			LaunchEvent Type = unfocus target = <objID>
			ff_setup_expanded_view controller_index = <controller_index>
			<friend_feed_vmenu_id> :Obj_KillSpawnedScript Name = 0xbcdaa185
			<friend_feed_vmenu_id> :Obj_SpawnScriptNow 0xb76ad2f7
			friends_feed_desc_id :GetSingleTag \{menu}
			<anim> = ($friend_feed_menu_data.<menu>.expand_anim)
			GetArraySize ($g_friend_feed_anims.<anim>) param = anim_steps
			if (<anim_steps> > 0)
				<anim_index> = 0
				begin
				friends_feed_desc_id :se_getprops
				friends_feed_desc_id :se_setprops {
					Pos = ((($g_friend_feed_anims.<anim> [<anim_index>]).Pos) + <Pos>)
					time = (($g_friend_feed_anims.<anim> [<anim_index>]).time)
					motion = (($g_friend_feed_anims.<anim> [<anim_index>]).motion)
				}
				friends_feed_desc_id :se_waitprops
				<anim_index> = (1 + <anim_index>)
				repeat <anim_steps>
			endif
			clean_up_user_control_helpers
			friends_feed_desc_id :se_getprops
			friends_feed_desc_id :se_setprops {
				gamertag_cont_pos = ((0.0, -32.0) + <gamertag_cont_pos>)
				0x247e1e74 = ((0.0, 45.0) + <0x247e1e74>)
				0x9bae8ebe = (-1.0, -45.0)
				0xb77c9c58 = (625.0, 0.0)
				motion = ease_in
				time = 0.1
			}
			friends_feed_desc_id :se_waitprops
			friends_feed_desc_id :se_getprops
			friends_feed_desc_id :se_setprops {
				0x0113c131 = (1.0, 4.9)
				gamertag_cont_pos = ((0.0, -392.0) + <gamertag_cont_pos>)
				0x2799bb6b = ((0.0, -392.0) + <0x2799bb6b>)
				0x247e1e74 = ((0.0, 5.0) + <0x247e1e74>)
				0x9bae8ebe = (-1.0, -363.0)
				0xb77c9c58 = (625.0, 420.0)
				motion = ease_in
				time = 0.2
			}
			friends_feed_desc_id :se_waitprops
			friends_feed_desc_id :se_getprops
			friends_feed_desc_id :se_setprops {
				0x0113c131 = (1.0, 4.75)
				gamertag_cont_pos = ((0.0, 10.0) + <gamertag_cont_pos>)
				0x2799bb6b = ((0.0, 10.0) + <0x2799bb6b>)
				0x247e1e74 = ((0.0, -5.0) + <0x247e1e74>)
				0x1cfc8248 = (475.0, 475.0)
				scroll_bar_alpha = 1
				time = 0.2
			}
			friends_feed_desc_id :se_waitprops
		endif
	endif
endscript

script 0x9f80e0af 
	if ScreenElementExists \{id = friends_feed_desc_id}
		Obj_GetID
		<objID> :GetSingleTag return_menu
		if ScreenElementExists id = <return_menu>
			LaunchEvent Type = unfocus target = <objID>
			friends_feed_desc_id :se_getprops
			friends_feed_desc_id :se_setprops \{0x9bae8ebe = (-1.0, -45.0)
				0xb77c9c58 = (625.0, 0.0)}
			friends_feed_desc_id :se_waitprops
			friends_feed_desc_id :se_getprops
			friends_feed_desc_id :se_setprops {
				0x0113c131 = (1.0, 4.9)
				gamertag_cont_pos = ((0.0, -15.0) + <gamertag_cont_pos>)
				0x247e1e74 = ((0.0, 5.0) + <0x247e1e74>)
				0x2799bb6b = ((0.0, -15.0) + <0x2799bb6b>)
				0x1cfc8248 = (475.0, 60.0)
				scroll_bar_alpha = 0.0
			}
			friends_feed_desc_id :se_waitprops
			friends_feed_desc_id :se_getprops
			friends_feed_desc_id :se_setprops {
				0x0113c131 = (1.0, 1.0)
				gamertag_cont_pos = ((0.0, 392.0) + <gamertag_cont_pos>)
				0x247e1e74 = ((0.0, -5.0) + <0x247e1e74>)
				0x2799bb6b = ((0.0, 392.0) + <0x2799bb6b>)
				motion = ease_in
				time = 0.2
			}
			friends_feed_desc_id :se_waitprops
			friends_feed_desc_id :se_getprops
			friends_feed_desc_id :se_setprops {
				gamertag_cont_pos = ((0.0, 32.0) + <gamertag_cont_pos>)
				0x247e1e74 = ((0.0, -45.0) + <0x247e1e74>)
				motion = ease_in
				time = 0.1
			}
			friends_feed_desc_id :se_waitprops
			friends_feed_desc_id :GetSingleTag \{menu}
			<anim> = ($friend_feed_menu_data.<menu>.expand_anim)
			GetArraySize ($g_friend_feed_anims.<anim>) param = anim_steps
			if (<anim_steps> > 0)
				<anim_index> = 0
				begin
				friends_feed_desc_id :se_getprops
				friends_feed_desc_id :se_setprops {
					Pos = ((-1) * (($g_friend_feed_anims.<anim> [<anim_index>]).Pos) + <Pos>)
					time = (($g_friend_feed_anims.<anim> [<anim_index>]).time)
					motion = (($g_friend_feed_anims.<anim> [<anim_index>]).motion)
				}
				friends_feed_desc_id :se_waitprops
				<anim_index> = (1 + <anim_index>)
				repeat <anim_steps>
			endif
			if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
					param = friend_feed_vmenu_id}
				<friend_feed_vmenu_id> :Obj_SpawnScriptLater ff_scroll_feed_items
				<friend_feed_vmenu_id> :Obj_SpawnScriptLater 0xbcdaa185
			endif
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100
				all_buttons}
			add_user_control_helper \{text = qs(0x8a778398)
				button = yellow
				z = 100
				all_buttons}
			add_user_control_helper \{text = qs(0xcc6e981d)
				button = blue
				z = 100
				all_buttons}
			LaunchEvent Type = focus target = <return_menu>
		endif
	endif
endscript

script 0xb540620a \{feed_data = 0x69696969}
	printf \{channel = friend_feed
		qs(0x10433f5b)}
	AddArrayElement array = ($0x968bb042) element = <feed_data>
	Change 0x968bb042 = <array>
endscript

script 0xbcdaa185 
	OnExitRun \{0x127a2c8e}
	Obj_GetID
	begin
	GetTags
	if (Idle = <state> && -1 < <view_index>)
		GetArraySize ($0x968bb042)
		if (<array_Size> > 0)
			0x36976d73 ($0x968bb042 [0])
			if (0 = <fail>)
				RemoveArrayElement array = ($0x968bb042) index = 0
				Change 0x968bb042 = <array>
				SetTags 0x94a921b3 = (<0x94a921b3> + 1)
			endif
		endif
	endif
	GetTags
	if ($friend_feed_menu_data.0x89b65daf <= <0x94a921b3>)
		Change \{0x621f73c3 = 0}
		SetTags \{0x94a921b3 = 0}
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script 0x127a2c8e 
	Change \{0x968bb042 = [
		]}
endscript

script ff_scroll_feed_items 
	Obj_GetID
	begin
	SetTags \{state = Idle}
	Wait ($friend_feed_menu_data.scroll_time) Seconds
	if GetScreenElementChildren id = <objID>
		GetArraySize <children> param = num_ff_items
		num_ff_items = (<num_ff_items> - 1)
		if (($friend_feed_menu_data.0x89b65daf) = <num_ff_items>)
			ff_index = 0
			num_items_displayed = 0
			begin
			(<children> [<ff_index>]) :GetTags
			if (0 < <mini_feed_display_count>)
				num_items_displayed = (1 + <num_items_displayed>)
			endif
			<ff_index> = (1 + <ff_index>)
			repeat <num_ff_items>
			if (<num_items_displayed> = <num_ff_items>)
				Change \{0x621f73c3 = 1}
			endif
		endif
		if ($friend_feed_menu_data.mini_feed_num_items_to_scroll <= <num_ff_items>)
			GetSingleTag \{view_index}
			SetTags \{state = animating}
			if (<num_ff_items> > <view_index>)
				GetArraySize ($g_friend_feed_anims.scroll_anim) param = anim_steps
				if (<anim_steps> > 0)
					<anim_index> = 0
					begin
					se_getprops
					se_setprops {
						Pos = ((($g_friend_feed_anims.scroll_anim [<anim_index>]).Pos) + <Pos>)
						time = (($g_friend_feed_anims.scroll_anim [<anim_index>]).time)
						motion = (($g_friend_feed_anims.scroll_anim [<anim_index>]).motion)
					}
					se_waitprops
					<anim_index> = (1 + <anim_index>)
					repeat <anim_steps>
				endif
				if (-1 < <view_index>)
					(<children> [<view_index>]) :GetSingleTag mini_feed_display_count
					(<children> [<view_index>]) :SetTags mini_feed_display_count = (<mini_feed_display_count> + 1)
				endif
				SetTags view_index = (<view_index> + 1)
			endif
			GetSingleTag \{view_index}
			if (<num_ff_items> = (<view_index> + 1))
				se_setprops \{Pos = (0.0, 0.0)}
				(<children> [<view_index>]) :GetSingleTag mini_feed_display_count
				(<children> [<view_index>]) :SetTags mini_feed_display_count = (<mini_feed_display_count> + 1)
				SetTags \{view_index = -1}
			endif
		endif
	endif
	repeat
endscript

script 0x36976d73 \{feed_string = qs(0xaf3e73b9)}
	printf \{channel = friend_feed
		qs(0x2998bf79)}
	fail = 0
	if ScreenElementExists \{id = friends_feed_desc_id}
		if friends_feed_desc_id :desc_resolvealias \{Name = alias_friend_feed_vmenu
				param = friend_feed_vmenu_id}
			<0xbf3bbba4> = 0
			if GetScreenElementChildren id = <friend_feed_vmenu_id>
				GetArraySize <children> param = num_ff_items
				num_ff_items = (<num_ff_items> - 1)
				if (($friend_feed_menu_data.0x89b65daf) = <num_ff_items>)
					ff_index = 1
					0xd1562846 = -1
					0xd4fc0b25 = 0
					begin
					(<children> [<ff_index>]) :GetSingleTag mini_feed_display_count
					if (<0xd1562846> < <mini_feed_display_count>)
						<0xd1562846> = <mini_feed_display_count>
						<0xd4fc0b25> = <ff_index>
					endif
					<ff_index> = (1 + <ff_index>)
					repeat <num_ff_items>
					<friend_feed_vmenu_id> :GetSingleTag view_index
					if ((<view_index> != <0xd4fc0b25> || 0 != <0xd4fc0b25>)
							&& 0 != <0xd4fc0b25>)
						if (($friend_feed_menu_data.0x89b65daf) != <0xd4fc0b25>)
							<0xbf3bbba4> = 0
						else
							DestroyScreenElement id = (<children> [($friend_feed_menu_data.0x89b65daf)])
							<0xbf3bbba4> = 1
						endif
					else
						fail = 1
					endif
				else
					<0xbf3bbba4> = 1
				endif
			else
				<0xbf3bbba4> = 1
			endif
			if (0 = <0xbf3bbba4>)
				DestroyScreenElement id = (<children> [<0xd4fc0b25>])
			else
				if GotParam \{children}
					DestroyScreenElement id = (<children> [0])
				endif
			endif
			CreateScreenElement {
				Type = descinterface
				desc = 'friend_feed_item'
				parent = <friend_feed_vmenu_id>
				autosizedims = true
				message_text = <feed_string>
				event_handlers = [
					{focus ff_change_item_focus params = {focus_type = focus}}
					{unfocus ff_change_item_focus params = {focus_type = unfocus}}
				]
				tags = {
					msg_type = <msg_type>
					mini_feed_display_count = 0
				}
			}
			if (0 = <0xbf3bbba4>)
				<friend_feed_vmenu_id> :menu_setitemindex id = <id> newindex = <0xd4fc0b25>
			else
				CreateScreenElement {
					Type = descinterface
					desc = 'friend_feed_item'
					parent = <friend_feed_vmenu_id>
					autosizedims = true
					message_text = <feed_string>
					not_focusable
					tags = {
						mini_feed_display_count = 1
					}
				}
				<friend_feed_vmenu_id> :menu_setitemindex id = <id> newindex = 0
			endif
		else
			fail = 1
		endif
	else
		fail = 1
	endif
	return fail = <fail>
endscript

script ff_setup_expanded_view 
	if ScreenElementExists \{id = friends_feed_desc_id}
		Name = qs(0xb2359d6b)
		NetSessionFunc Obj = match func = get_gamertag params = {controller = <controller_index>}
		friends_feed_desc_id :se_setprops gamertag_text = <Name>
		if friends_feed_desc_id :desc_resolvealias \{Name = 0xd29dbe72
				param = 0xb2f1f7fa}
			GetNetID controller_index = <controller_index>
			array = []
			AddArrayElement array = <array> element = <net_id_first>
			AddArrayElement array = <array> element = <net_id_second>
			0xe77c941b Name = <0xb2f1f7fa> get_small = 1 user_id = <array>
		endif
		if friends_feed_desc_id :desc_resolvealias \{Name = 0x0af46c4d
				param = 0xa0f7cd36}
			DestroyScreenElement id = <0xa0f7cd36> preserve_parent
			CreateScreenElement {
				Type = TextElement
				parent = <0xa0f7cd36>
				dims = (50.0, 50.0)
				internal_scale = (0.8, 0.8)
				internal_just = [center , center]
				text = qs(0x3a60bebc)
				font = fontgrid_text_a1
				autosizedims = FALSE
			}
			CreateScreenElement {
				Type = TextElement
				parent = <0xa0f7cd36>
				dims = (50.0, 25.0)
				internal_just = [center , center]
				text = qs(0xaf4d5dd2)
				internal_scale = (0.5, 0.5)
				font = fontgrid_text_a1
				fit_width = `scale	each	line	if	larger`
				fit_height = `scale	down	if	larger`
				autosizedims = FALSE
			}
			CreateScreenElement {
				Type = TextElement
				parent = <0xa0f7cd36>
				dims = (50.0, 50.0)
				internal_scale = (0.8, 0.8)
				internal_just = [center , center]
				text = qs(0x114ded7f)
				font = fontgrid_text_a1
			}
			CreateScreenElement {
				Type = TextElement
				parent = <0xa0f7cd36>
				dims = (25.0, 20.0)
				internal_just = [center , center]
				text = qs(0x7acb342a)
				internal_scale = (0.5, 0.5)
				font = fontgrid_text_a1
				fit_width = `scale	each	line	if	larger`
				fit_height = `scale	down	if	larger`
			}
		endif
	endif
endscript

script 0xb76ad2f7 
	begin
	GetSingleTag \{state}
	if (Idle = <state>)
		Obj_KillSpawnedScript \{Name = ff_scroll_feed_items}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	begin
	if NOT ScriptIsRunning \{ff_expand_feed}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Obj_GetID
	GetSingleTag \{view_index}
	if ScreenElementExists id = <objID>
		LaunchEvent Type = focus target = <objID> data = {child_index = (1 + <view_index>)}
	endif
endscript

script ff_change_item_focus \{focus_type = !q1768515945}
	Obj_GetID
	if (focus = <focus_type>)
		se_setprops \{bkgd_rgba = gh6_red_dk}
		if ScreenElementExists \{id = friends_feed_desc_id}
			if friends_feed_desc_id :desc_resolvealias \{Name = 0x0af46c4d
					param = 0xa0f7cd36}
				DestroyScreenElement id = <0xa0f7cd36> preserve_parent
				GetTags
				0xd11067ad msg_type = <msg_type>
				printf \{qs(0x19c820b3)}
				printstruct <...>
				if (1 = <0xb5ea39bf>)
					CreateScreenElement {
						Type = TextElement
						parent = <0xa0f7cd36>
						dims = (50.0, 50.0)
						internal_scale = (0.8, 0.8)
						internal_just = [center , center]
						text = qs(0x237b8ffd)
						font = fontgrid_text_a1
						autosizedims = FALSE
					}
					CreateScreenElement {
						Type = TextElement
						parent = <0xa0f7cd36>
						dims = (50.0, 25.0)
						internal_just = [center , center]
						text = <button_text>
						internal_scale = (0.5, 0.5)
						font = fontgrid_text_a1
						fit_width = `scale	each	line	if	larger`
						fit_height = `scale	down	if	larger`
						autosizedims = FALSE
					}
				endif
				CreateScreenElement {
					Type = TextElement
					parent = <0xa0f7cd36>
					dims = (50.0, 50.0)
					internal_scale = (0.8, 0.8)
					internal_just = [center , center]
					text = qs(0x3a60bebc)
					font = fontgrid_text_a1
					autosizedims = FALSE
				}
				CreateScreenElement {
					Type = TextElement
					parent = <0xa0f7cd36>
					dims = (50.0, 25.0)
					internal_just = [center , center]
					text = qs(0xaf4d5dd2)
					internal_scale = (0.5, 0.5)
					font = fontgrid_text_a1
					fit_width = `scale	each	line	if	larger`
					fit_height = `scale	down	if	larger`
					autosizedims = FALSE
				}
				CreateScreenElement {
					Type = TextElement
					parent = <0xa0f7cd36>
					dims = (50.0, 50.0)
					internal_scale = (0.8, 0.8)
					internal_just = [center , center]
					text = qs(0x114ded7f)
					font = fontgrid_text_a1
				}
				CreateScreenElement {
					Type = TextElement
					parent = <0xa0f7cd36>
					dims = (25.0, 20.0)
					internal_just = [center , center]
					text = qs(0x7acb342a)
					internal_scale = (0.5, 0.5)
					font = fontgrid_text_a1
					fit_width = `scale	each	line	if	larger`
					fit_height = `scale	down	if	larger`
				}
			endif
		endif
	else
		<objID> :se_setprops bkgd_rgba = [30 30 30 255]
	endif
endscript

script 0xd11067ad \{msg_type = !q1768515945}
	<0xb5ea39bf> = 1
	switch <msg_type>
		case beat_score
		case 0x59c99385
		case 0x245dec11
		case 0xf5bcb036
		case 0xf6026930
		case 0x65958817
		case 0x74753ec4
		case 0xb8aa5603
		case 0x84944e6c
		<location> = band_lobby
		<lobby_state> = quickplay
		<button_text> = qs(0xffb0c002)
		case 0x5636f414
		<location> = band_lobby
		<lobby_state> = vs
		<button_text> = qs(0xffb0c002)
		case 0x45bc8371
		case 0xc0e5376b
		case 0x9a05102e
		<location> = band_lobby
		<lobby_state> = career
		<button_text> = qs(0xffb0c002)
		case cash_milestone
		case 0x0da1d556
		case 0xcbe15a60
		case 0x2791abe0
		<location> = rock_record
		<button_text> = qs(0x78f3e2ef)
		case 0x6b4e0ec8
		case 0x12257924
		case highest_score
		<location> = leaderboards
		<button_text> = qs(0x78f3e2ef)
		case created_rocker
		case 0xf03ff1f4
		case 0x1c069af8
		<location> = car
		<button_text> = qs(0xaf9913ad)
		case 0xc9aa4357
		case 0x5884f28a
		<location> = music_store
		<button_text> = qs(0xaf9913ad)
		case 0x57dfa81d
		case 0xa798a837
		<location> = ghtunes
		<button_text> = qs(0xaf9913ad)
		case 0x20449ad2
		case 0xdc473df7
		<location> = 0x329bde07
		<button_text> = qs(0xaf9913ad)
		case 0x3ae1cd59
		<location> = vip_invite
		<button_text> = qs(0x78f3e2ef)
		default
		<location> = None
		<button_text> = qs(0x00000000)
		<0xb5ea39bf> = 0
	endswitch
	return location = <location> 0xb5ea39bf = <0xb5ea39bf> button_text = <button_text>
endscript

script 0x1052c0ef \{controller_index = !i1768515945}
	netfeed func = createsender controller_index = <controller_index>
	netfeed func = createlocalinbox controller_index = <controller_index>
endscript

script ff_wait_for_feed_ready \{controller_index = !i1768515945}
	begin
	if netfeed func = isready controller_index = <controller_index>
		netfeed \{func = logmessage
			msg = 'ff_wait_for_feed_ready: net feed is now ready.'}
		break
	endif
	Wait \{1
		Second}
	repeat
endscript

script ff_wait_for_inbox_ready \{controller_index = !i1768515945}
	begin
	if NOT netfeed func = islocalinboxbusy controller_index = <controller_index>
		netfeed \{func = logmessage
			msg = 'ff_wait_for_inbox_ready: local inbox no longer busy.'}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script 0x5fa741e4 \{controller_index = !i1768515945}
	<messagecount> = 0
	<array> = []
	ff_wait_for_feed_ready controller_index = <controller_index>
	ff_wait_for_inbox_ready controller_index = <controller_index>
	netfeed func = updatelocalinbox controller_index = <controller_index> qeventhandler = netfeedqeventhandler index = 0 numitems = 10
	ff_wait_for_inbox_ready controller_index = <controller_index>
	netfeed func = getmessagecount controller_index = <controller_index> out = messagecount
	if (0 < <messagecount>)
		if netfeed func = getmsgidfront controller_index = <controller_index> out = msgid out_first = msgid_first out_second = msgid_second
			begin
			AddArrayElement array = <array> element = <msgid>
			if NOT netfeed func = getmsgidnext controller_index = <controller_index> msgid = (<msgid>) out = msgid out_first = msgid_first out_second = msgid_second
				break
			endif
			repeat
		endif
		GetArraySize <array> param = num_headers
		if (0 < <num_headers>)
			<0xec28e319> = 0
			begin
			if netfeed func = fetchmessage msgid = (<array> [<0xec28e319>]) controller_index = <controller_index> qeventhandler = netfeedqeventhandler
				printf \{qs(0x063c1956)}
			endif
			<0xec28e319> = (1 + <0xec28e319>)
			repeat <num_headers>
		endif
	endif
endscript

script ff_get_source_value \{Type = !q1768515945}
	<ret> = true
	switch <Type>
		case encore_complete
		get_savegame_from_controller controller = <controller_index>
		GetGlobalTags savegame = <savegame> career_progression_tags param = current_chapter
		<value> = <current_chapter>
		case item_type
		printf \{qs(0xdff00147)}
		case instrument_type
		getplayerinfo <Player> part out = value
		case song_name
		playlist_getcurrentsong
		<value> = <current_song>
		case stars_count
		quickplay_get_overall_awards_progress Player = <Player>
		<value> = <current_award_points_total>
		default
		<ret> = FALSE
	endswitch
	printstruct <...>
	return <ret> value = <value>
endscript

script ff_get_song_string 
	ret = FALSE
	if get_song_name_no_assert song = <param>
		ret = true
		AddParam structure_name = return_struct Name = Result value = <song_name>
	else
		ret = true
		AddParam \{structure_name = return_struct
			Name = Result
			value = qs(0xb2359d6b)}
	endif
	return <ret> <return_struct>
endscript

script 0xf8f66ed7 
	ret = FALSE
	if get_song_name_no_assert song = <param>
		ret = true
		AddParam structure_name = return_struct Name = Result value = <song_name>
	else
		ret = true
		AddParam \{structure_name = return_struct
			Name = Result
			value = qs(0xb2359d6b)}
	endif
	return <ret> <return_struct>
endscript

script create_news_feed_events 
	GetArraySize \{$news_feed_events
		param = num_feed_events}
	array_entry = 0
	if (0 < <num_feed_events>)
		begin
		<event> = ($news_feed_events [<array_entry>].event)
		<Scr> = ($news_feed_events [<array_entry>].Scr)
		SetEventHandler response = call_script event = <event> Scr = <Scr> params = {}
		array_entry = (<array_entry> + 1)
		repeat <num_feed_events>
	endif
	Block
endscript

script feed_event_cheated 
	printf \{qs(0xe003e856)}
	printstruct <...>
	netfeed func = createsender controller_index = ($primary_controller)
	if netfeed \{func = gettitleid
			out = title_id}
		if friend_feed_get_message_structure titleid = <title_id> event = cheated msg_type = Default controller_index = <controller_index> Player = <Player> out_param = msg_pak
			if netfeed func = isoktosend controller_index = ($primary_controller)
				msg = {event = cheated <msg_pak>}
				if NOT netfeed func = sendmessage controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler sendto = myfriends msg = <msg>
					printf \{qs(0x90b0776a)}
				endif
			else
				printf \{qs(0x87bee461)}
			endif
		else
			printf \{qs(0x1dcf5125)}
		endif
	else
		printf \{qs(0xa034a921)}
	endif
endscript

script feed_event_created_rocker 
	printf \{qs(0x760fc908)}
	printstruct <...>
	netfeed func = createsender controller_index = ($primary_controller)
	if netfeed \{func = gettitleid
			out = title_id}
		if friend_feed_get_message_structure titleid = <title_id> event = created_rocker msg_type = Default controller_index = <controller_index> Player = <Player> out_param = msg_pak
			if netfeed func = isoktosend controller_index = ($primary_controller)
				msg = {event = created_rocker <msg_pak>}
				if NOT netfeed func = sendmessage controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler sendto = myfriends msg = <msg>
					printf \{qs(0x90b0776a)}
				endif
			else
				printf \{qs(0x87bee461)}
			endif
		else
			printf \{qs(0x1dcf5125)}
		endif
	else
		printf \{qs(0xa034a921)}
	endif
endscript

script feed_event_completed_encore 
	printf \{qs(0xf8d92c6c)}
	printstruct <...>
	netfeed func = createsender controller_index = ($primary_controller)
	if netfeed \{func = gettitleid
			out = title_id}
		if friend_feed_get_message_structure titleid = <title_id> event = encore_complete msg_type = Default controller_index = <controller_index> Player = <Player> out_param = msg_pak
			if netfeed func = isoktosend controller_index = ($primary_controller)
				msg = {event = encore_complete <msg_pak>}
				if NOT netfeed func = sendmessage controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler sendto = myfriends msg = <msg>
					printf \{qs(0x90b0776a)}
				endif
			else
				printf \{qs(0x87bee461)}
			endif
		else
			printf \{qs(0x1dcf5125)}
		endif
	else
		printf \{qs(0xa034a921)}
	endif
endscript

script feed_event_unlock_item_type 
	printf \{qs(0x69ca2032)}
	printstruct <...>
	if GotParam \{item_type}
		netfeed func = createsender controller_index = ($primary_controller)
		if netfeed \{func = gettitleid
				out = title_id}
			if friend_feed_get_message_structure titleid = <title_id> event = unlock_item_type msg_type = Default controller_index = <controller_index> Player = <Player> out_param = msg_pak item_type = <item_type>
				if netfeed func = isoktosend controller_index = ($primary_controller)
					msg = {event = unlock_item_type <msg_pak>}
					if NOT netfeed func = sendmessage controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler sendto = myfriends msg = <msg>
						printf \{qs(0x90b0776a)}
					endif
				else
					printf \{qs(0x87bee461)}
				endif
			else
				printf \{qs(0x1dcf5125)}
			endif
		else
			printf \{qs(0xa034a921)}
		endif
	endif
endscript

script 0xa4356b07 \{controller_index = !i1768515945}
	GetArraySize ($0x24f2a572) param = 0xdcf59f63
	GetRandomValue Name = message_index integer a = 0 b = (<0xdcf59f63> - 1)
	msg = {msg_type = ($0x24f2a572 [<message_index>])}
	if netfeed func = isoktosend controller_index = <controller_index>
		if NOT netfeed func = sendmessage controller_index = <controller_index> qeventhandler = netfeedqeventhandler sendto = myself msg = <msg>
			printf \{qs(0x90b0776a)}
		endif
	endif
endscript

script 0xecb03b87 
	GetArraySize ($0x24f2a572) param = 0xdcf59f63
	begin
	if (1 = $0x621f73c3)
		GetRandomValue Name = message_index integer a = 0 b = (<0xdcf59f63> - 1)
		0xb540620a msg_type = ($0x24f2a572 [<message_index>])
	endif
	Wait \{1
		Second}
	repeat
endscript
