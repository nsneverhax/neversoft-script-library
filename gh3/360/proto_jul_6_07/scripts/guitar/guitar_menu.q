gh3_button_font = buttonsxenon
bunny_flame_index = 1
default_event_handlers = [
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
		generic_menu_pad_back
		params = {
			callback = menu_flow_go_back
		}
	}
]
menu_text_color = [
	180
	100
	60
	255
]

script menu_flow_go_back \{player = 1
		create_params = {
		}
		destroy_params = {
		}}
	ui_flow_manager_respond_to_action action = go_back player = <player> create_params = <create_params> destroy_params = <destroy_params>
endscript

script new_menu {
		menu_pos = $menu_pos
		event_handlers = $default_event_handlers
		use_backdrop = 0
		z = 1
		dims = (400.0, 480.0)
		font = text_a1
		font_size = 0.75
		default_colors = 1
		just = [left top]
		no_focus = 0
	}
	if screenelementexists id = <scrollid>
		printf "script new_menu - %s Already exists." s = <scrollid>
		return
	endif
	if screenelementexists id = <vmenuid>
		printf "script new_menu - %s Already exists." s = <vmenuid>
		return
	endif
	createscreenelement {
		type = vscrollingmenu
		parent = root_window
		id = <scrollid>
		just = <just>
		dims = <dims>
		pos = <menu_pos>
		z_priority = <z>
	}
	if (<use_backdrop>)
		create_generic_backdrop
	endif
	if gotparam name
		createscreenelement {
			type = textelement
			parent = <scrollid>
			font = <font>
			pos = (0.0, -45.0)
			scale = <font_size>
			rgba = [210 210 210 250]
			text = <name>
			just = <just>
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
		}
	endif
	createscreenelement {
		type = vmenu
		parent = <scrollid>
		id = <vmenuid>
		pos = (0.0, 0.0)
		just = <just>
		event_handlers = <event_handlers>
	}
	if gotparam rot_angle
		setscreenelementprops id = <vmenuid> rot_angle = <rot_angle>
	endif
	if gotparam no_wrap
		setscreenelementprops id = <vmenuid> dont_allow_wrap
	endif
	if gotparam spacing
		setscreenelementprops id = <vmenuid> spacing_between = <spacing>
	endif
	if gotparam text_left
		setscreenelementprops id = <vmenuid> internal_just = [left top]
	endif
	if gotparam text_right
		setscreenelementprops id = <vmenuid> internal_just = [right top]
	endif
	if NOT gotparam exclusive_device
		exclusive_device = ($primary_controller)
	endif
	if NOT (<exclusive_device> = none)
		setscreenelementprops {
			id = <scrollid>
			exclusive_device = <exclusive_device>
		}
		setscreenelementprops {
			id = <vmenuid>
			exclusive_device = <exclusive_device>
		}
	endif
	if gotparam tierlist
		tier = 0
		begin
		<tier> = (<tier> + 1)
		setlist_prefix = ($<tierlist>.prefix)
		formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<tier>)
		formattext checksumname = tier_checksum 'tier%s' s = (<tier>)
		<unlocked> = 1
		getglobaltags <tiername> param = unlocked
		if ((<unlocked> = 1) || ($is_network_game))
			getarraysize ($<tierlist>.<tier_checksum>.songs)
			song_count = 0
			if (<array_size> > 0)
				begin
				formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<tier>) addtostringlookup = true
				getglobaltags <song_checksum> param = unlocked
				if ((<unlocked> = 1) || ($is_network_game))
					get_song_title song = ($<tierlist>.<tier_checksum>.songs [<song_count>])
					createscreenelement {
						type = textelement
						parent = <vmenuid>
						font = <font>
						scale = <font_size>
						rgba = [210 210 210 250]
						text = <song_title>
						just = [left top]
						event_handlers = [
							{focus menu_focus}
							{unfocus menu_unfocus}
							{pad_choose <on_choose> params = {tier = <tier> song_count = <song_count>}}
							{pad_left <on_left> params = {tier = <tier> song_count = <song_count>}}
							{pad_right <on_right> params = {tier = <tier> song_count = <song_count>}}
							{pad_l3 <on_l3> params = {tier = <tier> song_count = <song_count>}}
						]
					}
				endif
				song_count = (<song_count> + 1)
				repeat <array_size>
			endif
		endif
		repeat ($<tierlist>.num_tiers)
	endif
	if (<default_colors>)
		set_focus_color rgba = ($default_menu_focus_color)
		set_unfocus_color rgba = ($default_menu_unfocus_color)
	endif
	if (<no_focus> = 0)
		launchevent type = focus target = <vmenuid>
	endif
endscript

script destroy_menu 
	if gotparam \{menu_id}
		if screenelementexists id = <menu_id>
			destroyscreenelement id = <menu_id>
		endif
		destroy_generic_backdrop
	endif
endscript

script create_main_menu 
	setmenuautorepeattimes (0.3, 0.05)
	kill_start_key_binding
	unpausegame
	change current_num_players = 1
	change structurename = player1_status controller = ($primary_controller)
	disable_pause
	spawnscriptnow menu_music_on
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	deregisteratoms
	change setlist_previous_tier = 1
	change setlist_previous_song = 0
	change setlist_previous_tab = tab_setlist
	change current_song = welcometothejungle
	change end_credits = 0
	change structurename = player1_status character_id = axel
	change structurename = player2_status character_id = axel
	change default_menu_focus_color = [125 0 0 255]
	change default_menu_unfocus_color = [180 100 60 255]
	safe_create_gh3_pause_menu
	base_menu_pos = (700.0, 90.0)
	main_menu_font = fontgrid_title_gh3
	new_menu scrollid = main_menu_scrolling_menu vmenuid = vmenu_main_menu use_backdrop = (0) menu_pos = (<base_menu_pos>)
	change rich_presence_context = presence_main_menu
	create_menu_backdrop texture = gh3_main_menu_bg
	createscreenelement {
		type = containerelement
		id = main_menu_text_container
		parent = root_window
		pos = (<base_menu_pos>)
		just = [left top]
		z_priority = 3
	}
	career_text_off = (-30.0, 0.0)
	career_text_scale = (1.55, 1.4499999)
	coop_career_text_off = (<career_text_off> + (30.0, 63.0))
	coop_career_text_scale = (1.1, 0.9)
	quickplay_text_off = (<coop_career_text_off> + (-35.0, 40.0))
	quickplay_text_scale = (1.3, 1.15)
	multiplayer_text_off = (<quickplay_text_off> + (-40.0, 50.0))
	multiplayer_text_scale = (1.2, 1.1)
	training_text_off = (<multiplayer_text_off> + (30.0, 47.0))
	training_text_scale = (1.65, 1.55)
	leaderboards_text_off = (<training_text_off> + (-20.0, 66.0))
	leaderboards_text_scale = (1.1, 1.0)
	options_text_off = (<leaderboards_text_off> + (40.0, 44.0))
	options_text_scale = (1.2, 1.1)
	debug_menu_text_off = (<options_text_off> + (-30.0, 80.0))
	debug_menu_text_scale = 0.8
	createscreenelement {
		type = spriteelement
		parent = main_menu_text_container
		texture = logo_gh3_lor_256
		dims = (250.0, 250.0)
		pos = (-230.0, 100.0)
		just = [center center]
		z_priority = 4
	}
	createscreenelement {
		type = textelement
		id = main_menu_career_text
		parent = main_menu_text_container
		text = "CAREER"
		font = <main_menu_font>
		pos = {(<career_text_off>) relative}
		scale = (<career_text_scale>)
		rgba = ($menu_text_color)
		just = [left top]
		font_spacing = 0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 4
	}
	createscreenelement {
		type = textelement
		id = main_menu_coop_career_text
		parent = main_menu_text_container
		text = "CO-OP CAREER"
		font = <main_menu_font>
		pos = {(<coop_career_text_off>) relative}
		scale = (<coop_career_text_scale>)
		rgba = ($menu_text_color)
		just = [left top]
		font_spacing = 0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 4
	}
	createscreenelement {
		type = textelement
		id = main_menu_quickplay_text
		parent = main_menu_text_container
		font = <main_menu_font>
		text = "QUICKPLAY"
		font_spacing = 0
		pos = {(<quickplay_text_off>) relative}
		scale = (<quickplay_text_scale>)
		rgba = ($menu_text_color)
		just = [left top]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 4
	}
	createscreenelement {
		type = textelement
		id = main_menu_multiplayer_text
		parent = main_menu_text_container
		font = <main_menu_font>
		text = "MULTIPLAYER"
		font_spacing = 1
		pos = {(<multiplayer_text_off>) relative}
		scale = (<multiplayer_text_scale>)
		rgba = ($menu_text_color)
		just = [left top]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 4
	}
	createscreenelement {
		type = textelement
		id = main_menu_training_text
		parent = main_menu_text_container
		font = <main_menu_font>
		text = "TRAINING"
		font_spacing = 0
		pos = {(<training_text_off>) relative}
		scale = (<training_text_scale>)
		rgba = ($menu_text_color)
		just = [left top]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 4
		<demo_mode_disable>
	}
	if isxenon
		createscreenelement {
			type = textelement
			id = main_menu_leaderboards_text
			parent = main_menu_text_container
			font = <main_menu_font>
			text = "XBOX LIVE"
			font_spacing = 0
			pos = {(<leaderboards_text_off>) relative}
			scale = (<leaderboards_text_scale>)
			rgba = ($menu_text_color)
			just = [left top]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = 4
			<demo_mode_disable>
		}
	else
		createscreenelement {
			type = textelement
			id = main_menu_leaderboards_text
			parent = main_menu_text_container
			font = <main_menu_font>
			text = "ONLINE"
			font_spacing = 0
			pos = {(<leaderboards_text_off>) relative}
			scale = (<leaderboards_text_scale>)
			rgba = ($menu_text_color)
			just = [left top]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = 4
		}
	endif
	createscreenelement {
		type = textelement
		id = main_menu_options_text
		parent = main_menu_text_container
		font = <main_menu_font>
		text = "OPTIONS"
		font_spacing = 0
		pos = {(<options_text_off>) relative}
		scale = (<options_text_scale>)
		rgba = ($menu_text_color)
		just = [left top]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 4
	}
	if ($enable_button_cheats = 1)
		createscreenelement {
			type = textelement
			id = main_menu_debug_menu_text
			parent = main_menu_text_container
			font = <main_menu_font>
			text = "DEBUG MENU"
			pos = {(<debug_menu_text_off>) relative}
			scale = (<debug_menu_text_scale>)
			rgba = ($menu_text_color)
			just = [left top]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = 4
		}
	endif
	offwhite = [255 255 205 255]
	hilite_off = (5.0, 0.0)
	gm_hlinfolist = [
		{
			posl = (<career_text_off> + <hilite_off> + (-40.0, 9.0))
			posr = (<career_text_off> + <hilite_off> + (218.0, 9.0))
			bedims = (40.0, 40.0)
			posh = (<career_text_off> + <hilite_off> + (-16.0, 0.0))
			hdims = (240.0, 57.0)
		} ,
		{
			posl = (<coop_career_text_off> + <hilite_off> + (-33.0, 3.0))
			posr = (<coop_career_text_off> + <hilite_off> + (281.0, 3.0))
			bedims = (32.0, 32.0)
			posh = (<coop_career_text_off> + <hilite_off> + (-13.0, -1.0))
			hdims = (300.0, 37.0)
		} ,
		{
			posl = (<quickplay_text_off> + <hilite_off> + (-34.0, 4.0))
			posr = (<quickplay_text_off> + <hilite_off> + (251.0, 4.0))
			bedims = (40.0, 40.0)
			posh = (<quickplay_text_off> + <hilite_off> + (-10.0, 0.0))
			hdims = (267.0, 47.0)
		} ,
		{
			posl = (<multiplayer_text_off> + <hilite_off> + (-37.0, 4.0))
			posr = (<multiplayer_text_off> + <hilite_off> + (301.0, 4.0))
			bedims = (38.0, 38.0)
			posh = (<multiplayer_text_off> + <hilite_off> + (-13.0, 0.0))
			hdims = (320.0, 43.0)
		} ,
		{
			posl = (<training_text_off> + <hilite_off> + (-31.0, 9.0))
			posr = (<training_text_off> + <hilite_off> + (282.0, 9.0))
			bedims = (42.0, 42.0)
			posh = (<training_text_off> + <hilite_off> + (-7.0, 0.0))
			hdims = (295.0, 61.0)
		} ,
		{
			posl = (<leaderboards_text_off> + <hilite_off> + (-33.0, 3.0))
			posr = (<leaderboards_text_off> + <hilite_off> + (213.0, 3.0))
			bedims = (34.0, 34.0)
			posh = (<leaderboards_text_off> + <hilite_off> + (-13.0, -1.0))
			hdims = (232.0, 40.0)
		} ,
		{
			posl = (<options_text_off> + <hilite_off> + (-36.0, 5.0))
			posr = (<options_text_off> + <hilite_off> + (183.0, 5.0))
			bedims = (36.0, 36.0)
			posh = (<options_text_off> + <hilite_off> + (-16.0, 0.0))
			hdims = (205.0, 43.0)
		}
	]
	<gm_hlindex> = 0
	displaysprite {
		parent = main_menu_text_container
		tex = character_hub_hilite_bookend
		pos = ((<gm_hlinfolist> [<gm_hlindex>]).posl)
		dims = ((<gm_hlinfolist> [<gm_hlindex>]).bedims)
		rgba = <offwhite>
		z = 2
	}
	<bookend1id> = <id>
	displaysprite {
		parent = main_menu_text_container
		tex = character_hub_hilite_bookend
		pos = ((<gm_hlinfolist> [<gm_hlindex>]).posr)
		dims = ((<gm_hlinfolist> [<gm_hlindex>]).bedims)
		rgba = <offwhite>
		z = 2
	}
	<bookend2id> = <id>
	displaysprite {
		parent = main_menu_text_container
		tex = white
		rgba = <offwhite>
		pos = ((<gm_hlinfolist> [<gm_hlindex>]).posh)
		dims = ((<gm_hlinfolist> [<gm_hlindex>]).hdims)
		z = 2
	}
	<whitetexhighlightid> = <id>
	createscreenelement {
		type = textelement
		parent = vmenu_main_menu
		font = <main_menu_font>
		text = "career placeholder"
		event_handlers = [
			{focus retail_menu_focus params = {id = main_menu_career_text}}
			{focus setscreenelementprops params = {id = main_menu_career_text no_shadow}}
			{focus guitar_menu_highlighter params = {
					hlindex = 0
					hlinfolist = <gm_hlinfolist>
					be1id = <bookend1id>
					be2id = <bookend2id>
					wthlid = <whitetexhighlightid>
				}
			}
			{unfocus setscreenelementprops params = {id = main_menu_career_text shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus params = {id = main_menu_career_text}}
			{pad_choose main_menu_select_career}
		]
		z_priority = -1
	}
	createscreenelement {
		type = textelement
		parent = vmenu_main_menu
		font = <main_menu_font>
		text = "coop career placeholder"
		event_handlers = [
			{focus retail_menu_focus params = {id = main_menu_coop_career_text}}
			{focus setscreenelementprops params = {id = main_menu_coop_career_text no_shadow}}
			{focus guitar_menu_highlighter params = {
					hlindex = 1
					hlinfolist = <gm_hlinfolist>
					be1id = <bookend1id>
					be2id = <bookend2id>
					wthlid = <whitetexhighlightid>
				}
			}
			{unfocus setscreenelementprops params = {id = main_menu_coop_career_text shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus params = {id = main_menu_coop_career_text}}
			{pad_choose main_menu_select_coop_career}
		]
		z_priority = -1
	}
	createscreenelement {
		type = textelement
		parent = vmenu_main_menu
		font = <main_menu_font>
		text = "quickplay placeholder"
		event_handlers = [
			{focus retail_menu_focus params = {id = main_menu_quickplay_text}}
			{focus setscreenelementprops params = {id = main_menu_quickplay_text no_shadow}}
			{focus guitar_menu_highlighter params = {
					hlindex = 2
					hlinfolist = <gm_hlinfolist>
					be1id = <bookend1id>
					be2id = <bookend2id>
					wthlid = <whitetexhighlightid>
				}
			}
			{unfocus setscreenelementprops params = {id = main_menu_quickplay_text shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus params = {id = main_menu_quickplay_text}}
			{pad_choose main_menu_select_quickplay}
		]
		z_priority = -1
	}
	createscreenelement {
		type = textelement
		parent = vmenu_main_menu
		font = <main_menu_font>
		text = "multiplayer placeholder"
		event_handlers = [
			{focus retail_menu_focus params = {id = main_menu_multiplayer_text}}
			{focus setscreenelementprops params = {id = main_menu_multiplayer_text no_shadow}}
			{focus guitar_menu_highlighter params = {
					hlindex = 3
					hlinfolist = <gm_hlinfolist>
					be1id = <bookend1id>
					be2id = <bookend2id>
					wthlid = <whitetexhighlightid>
				}
			}
			{unfocus setscreenelementprops params = {id = main_menu_multiplayer_text shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus params = {id = main_menu_multiplayer_text}}
			{pad_choose main_menu_select_multiplayer}
		]
		z_priority = -1
	}
	createscreenelement {
		type = textelement
		parent = vmenu_main_menu
		font = <main_menu_font>
		text = "training placeholder"
		event_handlers = [
			{focus retail_menu_focus params = {id = main_menu_training_text}}
			{focus setscreenelementprops params = {id = main_menu_training_text no_shadow}}
			{focus guitar_menu_highlighter params = {
					hlindex = 4
					hlinfolist = <gm_hlinfolist>
					be1id = <bookend1id>
					be2id = <bookend2id>
					wthlid = <whitetexhighlightid>
				}
			}
			{unfocus setscreenelementprops params = {id = main_menu_training_text shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus params = {id = main_menu_training_text}}
			{pad_choose main_menu_select_training}
		]
		z_priority = -1
		<demo_mode_disable>
	}
	printf "disable training"
	createscreenelement {
		type = textelement
		parent = vmenu_main_menu
		font = <main_menu_font>
		text = "leaderboards placeholder"
		event_handlers = [
			{focus retail_menu_focus params = {id = main_menu_leaderboards_text}}
			{focus setscreenelementprops params = {id = main_menu_leaderboards_text no_shadow}}
			{focus guitar_menu_highlighter params = {
					hlindex = 5
					hlinfolist = <gm_hlinfolist>
					be1id = <bookend1id>
					be2id = <bookend2id>
					wthlid = <whitetexhighlightid>
				}
			}
			{unfocus setscreenelementprops params = {id = main_menu_leaderboards_text shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus params = {id = main_menu_leaderboards_text}}
			{pad_choose main_menu_select_xbox_live}
		]
		z_priority = -1
		<demo_mode_disable>
	}
	createscreenelement {
		type = textelement
		parent = vmenu_main_menu
		font = <main_menu_font>
		text = "options placeholder"
		event_handlers = [
			{focus retail_menu_focus params = {id = main_menu_options_text}}
			{focus setscreenelementprops params = {id = main_menu_options_text no_shadow}}
			{focus guitar_menu_highlighter params = {
					hlindex = 6
					hlinfolist = <gm_hlinfolist>
					be1id = <bookend1id>
					be2id = <bookend2id>
					wthlid = <whitetexhighlightid>
				}
			}
			{unfocus setscreenelementprops params = {id = main_menu_options_text shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus params = {id = main_menu_options_text}}
			{pad_choose main_menu_select_options}
		]
		z_priority = -1
	}
	if ($enable_button_cheats = 1)
		createscreenelement {
			type = textelement
			parent = vmenu_main_menu
			font = <main_menu_font>
			text = "debug menu placeholder"
			event_handlers = [
				{focus retail_menu_focus params = {id = main_menu_debug_menu_text}}
				{focus guitar_menu_highlighter params = {
						zpri = -2
						hlindex = 0
						hlinfolist = <gm_hlinfolist>
						be1id = <bookend1id>
						be2id = <bookend2id>
						wthlid = <whitetexhighlightid>
					}
				}
				{unfocus retail_menu_unfocus params = {id = main_menu_debug_menu_text}}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_debug_menu}}
			]
			z_priority = -1
		}
	endif
	change user_control_pill_text_color = [0 0 0 255]
	change user_control_pill_color = [180 180 180 255]
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
	launchevent type = focus target = vmenu_main_menu
endscript

script guitar_menu_highlighter zpri = 2
	setscreenelementprops {
		id = <be1id>
		pos = ((<hlinfolist> [<hlindex>]).posl)
		dims = ((<hlinfolist> [<hlindex>]).bedims)
		z_priority = <zpri>
	}
	setscreenelementprops {
		id = <be2id>
		pos = ((<hlinfolist> [<hlindex>]).posr)
		dims = ((<hlinfolist> [<hlindex>]).bedims)
		z_priority = <zpri>
	}
	setscreenelementprops {
		id = <wthlid>
		pos = ((<hlinfolist> [<hlindex>]).posh)
		dims = ((<hlinfolist> [<hlindex>]).hdims)
		z_priority = <zpri>
	}
endscript

script destroy_main_menu 
	clean_up_user_control_helpers
	change \{default_menu_focus_color = [
			210
			210
			210
			250
		]}
	change \{default_menu_unfocus_color = [
			210
			130
			0
			250
		]}
	printstruct x = ($ui_flow_manager_state)
	destroy_menu \{menu_id = main_menu_scrolling_menu}
	destroy_menu \{menu_id = main_menu_text_container}
	destroy_menu_backdrop
endscript

script main_menu_select_career 
	change \{game_mode = p1_career}
	change \{current_num_players = 1}
	change \{structurename = player1_status
		part = guitar}
	change \{structurename = player2_status
		part = guitar}
	ui_flow_manager_respond_to_action \{action = select_career}
endscript

script main_menu_select_coop_career 
	change \{game_mode = p2_career}
	change \{current_num_players = 2}
	ui_flow_manager_respond_to_action \{action = select_coop_career}
endscript

script main_menu_select_quickplay 
	change \{game_mode = p1_quickplay}
	change \{current_num_players = 1}
	change \{structurename = player1_status
		part = guitar}
	change \{structurename = player2_status
		part = guitar}
	ui_flow_manager_respond_to_action \{action = select_quickplay}
endscript

script main_menu_select_multiplayer 
	change \{game_mode = p2_faceoff}
	change \{current_num_players = 2}
	change \{structurename = player1_status
		part = guitar}
	change \{structurename = player2_status
		part = guitar}
	ui_flow_manager_respond_to_action \{action = select_multiplayer}
endscript

script main_menu_select_training 
	change \{game_mode = training}
	change \{current_num_players = 1}
	change \{came_to_practice_from = main_menu}
	change \{structurename = player1_status
		part = guitar}
	change \{structurename = player2_status
		part = guitar}
	ui_flow_manager_respond_to_action \{action = select_training}
endscript

script main_menu_select_xbox_live 
	ui_flow_manager_respond_to_action \{action = select_xbox_live}
endscript

script main_menu_select_options 
	ui_flow_manager_respond_to_action \{action = select_options}
endscript

script create_play_song_menu 
endscript

script destroy_play_song_menu 
endscript

script issingleplayergame 
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		return \{true}
	else
		return \{false}
	endif
endscript

script create_pause_menu player = 1 for_options = 0 for_practice = 0
	player_device = ($last_start_pressed_device)
	if (<for_options> = 0)
		if ($view_mode)
			return
		endif
		if ismovieplaying textureslot = 0
			pausemovie textureslot = 0
		endif
		if ismovieplaying textureslot = 1
			pausemovie textureslot = 1
		endif
		enable_pause
		safe_create_gh3_pause_menu
		flame_handlers = [
			{pad_up swap_bunny_flame params = {up}}
			{pad_down swap_bunny_flame params = {down}}
		]
	else
		kill_start_key_binding
		flame_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
	endif
	change bunny_flame_index = 1
	pause_z = 100
	if (<for_options> = 0)
		menu_pos = (610.0, 275.0)
		if (<for_practice> = 1)
			<menu_pos> = (575.0, 240.0)
		endif
		if ($game_mode = p1_career || $game_mode = p2_career)
			<menu_pos> = (610.0, 265.0)
		endif
	else
		if isguitarcontroller controller = <player_device>
			menu_pos = (440.0, 265.0)
		else
			menu_pos = (510.0, 300.0)
		endif
	endif
	new_menu {
		scrollid = scrolling_pause
		vmenuid = vmenu_pause
		menu_pos = <menu_pos>
		rot_angle = 2
		event_handlers = <flame_handlers>
		spacing = -20
		use_backdrop = (0)
		exclusive_device = <player_device>
	}
	create_pause_menu_frame z = (<pause_z> - 10)
	createscreenelement {
		type = spriteelement
		parent = pause_menu_frame_container
		texture = menu_pause_frame_banner
		pos = (640.0, 540.0)
		just = [center center]
		z_priority = (<pause_z> + 100)
	}
	if gotparam banner_text
		pause_player_text = <banner_text>
		if gotparam banner_scale
			pause_player_scale = <banner_scale>
		else
			pause_player_scale = (1.0, 1.0)
		endif
	else
		if (<for_options> = 0)
			if (<for_practice> = 1)
				<pause_player_text> = "PAUSED"
			else
				if NOT issingleplayergame
					formattext textname = pause_player_text "P%d PAUSED" d = (<player_device> + 1)
				else
					<pause_player_text> = "PAUSED"
				endif
			endif
			pause_player_scale = (0.6, 0.75)
		else
			pause_player_text = "OPTIONS"
			pause_player_scale = (0.75, 0.75)
		endif
	endif
	createscreenelement {
		type = textelement
		parent = <id>
		text = <pause_player_text>
		font = text_a6
		pos = (125.0, 53.0)
		scale = <pause_player_scale>
		rgba = [170 90 30 255]
		scale = 0.8
	}
	text_scale = (0.9, 0.9)
	if (<for_options> = 0)
		createscreenelement {
			type = containerelement
			parent = pause_menu_frame_container
			id = bunny_container
			pos = (380.0, 170.0)
			just = [left top]
			z_priority = <pause_z>
		}
		i = 1
		begin
		formattext checksumname = bunny_id 'pause_bunny_flame_%d' d = <i>
		formattext checksumname = bunny_tex 'GH3_Pause_Bunny_Flame%d' d = <i>
		createscreenelement {
			type = spriteelement
			id = <bunny_id>
			parent = bunny_container
			pos = (160.0, 170.0)
			texture = <bunny_tex>
			rgba = [255 255 255 255]
			dims = (300.0, 300.0)
			just = [right bottom]
			z_priority = (<pause_z> + 3)
			rot_angle = 5
		}
		if (<i> > 1)
			doscreenelementmorph id = <bunny_id> alpha = 0
		endif
		<i> = (<i> + 1)
		repeat 7
		createscreenelement {
			type = spriteelement
			id = pause_bunny_shadow
			parent = bunny_container
			texture = gh3_pause_bunny
			rgba = [0 0 0 128]
			pos = (20.0, -110.0)
			dims = (550.0, 550.0)
			just = [center top]
			z_priority = (<pause_z> + 4)
		}
		createscreenelement {
			type = spriteelement
			id = pause_bunny
			parent = bunny_container
			texture = gh3_pause_bunny
			rgba = [255 255 255 255]
			pos = (0.0, -130.0)
			dims = (550.0, 550.0)
			just = [center top]
			z_priority = (<pause_z> + 5)
		}
		runscriptonscreenelement id = bunny_container bunny_hover params = {hover_origin = (380.0, 170.0)}
		if (<for_practice> = 1)
			createscreenelement {
				type = textelement
				parent = vmenu_pause
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				text = "RESUME"
				just = [left top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose gh3_start_pressed}
				]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			createscreenelement {
				type = textelement
				parent = vmenu_pause
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				text = "RESTART"
				just = [left top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_restart}}
				]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			createscreenelement {
				type = textelement
				parent = vmenu_pause
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				text = "CHANGE SPEED"
				just = [left top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_change_speed}}
				]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			createscreenelement {
				type = textelement
				parent = vmenu_pause
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				text = "CHANGE SECTION"
				just = [left top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_change_section}}
				]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			createscreenelement {
				type = textelement
				parent = vmenu_pause
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				text = "NEW SONG"
				just = [left top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_new_song}}
				]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			createscreenelement {
				type = textelement
				parent = vmenu_pause
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				text = "QUIT"
				just = [left top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_quit}}
				]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
		else
			createscreenelement {
				type = textelement
				parent = vmenu_pause
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				text = "RESUME"
				just = [left top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose gh3_start_pressed}
				]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			if ($is_network_game = 0)
				if NOT ($end_credits = 1)
					createscreenelement {
						type = textelement
						parent = vmenu_pause
						font = fontgrid_title_gh3
						scale = <text_scale>
						rgba = [210 130 0 250]
						text = "RESTART"
						just = [left top]
						shadow
						shadow_offs = (3.0, 3.0)
						shadow_rgba [0 0 0 255]
						event_handlers = [
							{focus retail_menu_focus}
							{unfocus retail_menu_unfocus}
							{pad_choose ui_flow_manager_respond_to_action params = {action = select_restart}}
						]
						z_priority = <pause_z>
						exclusive_device = <player_device>
					}
					if ($is_demo_mode = 1)
						demo_mode_disable = {rgba = [80 80 80 255] not_focusable}
					else
						demo_mode_disable = {}
					endif
					if (($game_mode = p1_career && $boss_battle = 0) || ($game_mode = p1_quickplay))
						createscreenelement {
							type = textelement
							parent = vmenu_pause
							font = fontgrid_title_gh3
							scale = <text_scale>
							rgba = [210 130 0 250]
							text = "PRACTICE"
							just = [left top]
							shadow
							shadow_offs = (3.0, 3.0)
							shadow_rgba [0 0 0 255]
							event_handlers = [
								{focus retail_menu_focus}
								{unfocus retail_menu_unfocus}
								{pad_choose ui_flow_manager_respond_to_action params = {action = select_practice}}
							]
							z_priority = <pause_z>
							exclusive_device = <player_device>
							<demo_mode_disable>
						}
					endif
					createscreenelement {
						type = textelement
						parent = vmenu_pause
						font = fontgrid_title_gh3
						scale = <text_scale>
						rgba = [210 130 0 250]
						text = "OPTIONS"
						just = [left top]
						shadow
						shadow_offs = (3.0, 3.0)
						shadow_rgba [0 0 0 255]
						event_handlers = [
							{focus retail_menu_focus}
							{unfocus retail_menu_unfocus}
							{pad_choose ui_flow_manager_respond_to_action params = {action = select_options create_params = {player_device = <player_device>}}}
						]
						z_priority = <pause_z>
						exclusive_device = <player_device>
					}
				endif
			endif
			createscreenelement {
				type = textelement
				parent = vmenu_pause
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				text = "QUIT"
				just = [left top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_quit create_params = {player = <player>}}}
				]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			if ($enable_button_cheats = 1)
				createscreenelement {
					type = textelement
					parent = vmenu_pause
					font = fontgrid_title_gh3
					scale = <text_scale>
					rgba = [210 130 0 250]
					text = "DEBUG MENU"
					just = [left top]
					shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					event_handlers = [
						{focus retail_menu_focus}
						{unfocus retail_menu_unfocus}
						{pad_choose ui_flow_manager_respond_to_action params = {action = select_debug_menu}}
					]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
			endif
		endif
	else
		createscreenelement {
			type = textelement
			parent = vmenu_pause
			font = fontgrid_title_gh3
			scale = <text_scale>
			rgba = [210 130 0 250]
			text = "SET AUDIO"
			just = [left top]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_audio_settings create_params = {player = (<player_device> + 1)}}}
			]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		createscreenelement {
			type = textelement
			parent = vmenu_pause
			font = fontgrid_title_gh3
			scale = <text_scale>
			rgba = [210 130 0 250]
			text = "CALIBRATE LAG"
			just = [left top]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_calibrate_lag create_params = {player = (<player_device> + 1)}}}
			]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		if isguitarcontroller controller = <player_device>
			createscreenelement {
				type = textelement
				parent = vmenu_pause
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				text = "CALIBRATE WHAMMY"
				just = [left top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_calibrate_whammy_bar create_params = {player = (<player_device> + 1)}}}
				]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			createscreenelement {
				type = textelement
				parent = vmenu_pause
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				text = "CALIBRATE STAR POWER"
				just = [left top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_calibrate_star_power_trigger create_params = {player = (<player_device> + 1)}}}
				]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
		endif
		if issingleplayergame
			lefty_flip_text = "LEFTY FLIP:"
		else
			if (<player_device> = 0)
				lefty_flip_text = "P1 LEFTY FLIP:"
			else
				lefty_flip_text = "P2 LEFTY FLIP:"
			endif
		endif
		createscreenelement {
			type = textelement
			parent = vmenu_pause
			id = pause_options_lefty
			font = fontgrid_title_gh3
			scale = <text_scale>
			rgba = [210 130 0 250]
			text = <lefty_flip_text>
			just = [left top]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action params = {action = select_lefty_flip create_params = {player = (<player_device> + 1)}}}
			]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		getglobaltags user_options
		if (<player_device> = 0)
			if (<lefty_flip_p1> = 1)
				lefty_tex = options_controller_check
			else
				lefty_tex = options_controller_x
			endif
		else
			if (<lefty_flip_p2> = 1)
				lefty_tex = options_controller_check
			else
				lefty_tex = options_controller_x
			endif
		endif
		displaysprite {
			parent = pause_options_lefty
			tex = <lefty_tex>
			pos = (50.0, 50.0)
			just = [center center]
			z = (<pause_z> + 10)
		}
		getscreenelementdims id = pause_options_lefty
		<id> :setprops pos = (<width> * (1.0, 0.0) + (50.0, 30.0))
	endif
	if NOT issingleplayergame
		if (<for_practice> = 0)
			formattext textname = player_paused_text "PLAYER %d PAUSED. ONLY PLAYER %d OPTIONS ARE AVAILABLE." d = (<player_device> + 1)
			displaysprite {
				parent = pause_menu_frame_container
				id = pause_helper_text_bg
				tex = control_pill_body
				pos = (640.0, 600.0)
				just = [center center]
				rgba = [96 0 0 255]
				z = (<pause_z> + 10)
			}
			displaytext {
				parent = pause_menu_frame_container
				pos = (640.0, 604.0)
				just = [center center]
				text = <player_paused_text>
				rgba = [186 105 0 255]
				scale = (0.45000002, 0.6)
				z = (<pause_z> + 11)
				font = text_a6
			}
			getscreenelementdims id = <id>
			bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
			pause_helper_text_bg :setprops dims = <bg_dims>
			displaysprite {
				parent = pause_menu_frame_container
				tex = control_pill_end
				pos = ((640.0, 600.0) - <width> * (0.5, 0.0))
				rgba = [96 0 0 255]
				just = [right center]
				flip_v
				z = (<pause_z> + 10)
			}
			displaysprite {
				parent = pause_menu_frame_container
				tex = control_pill_end
				pos = ((640.0, 601.0) + <width> * (0.5, 0.0))
				rgba = [96 0 0 255]
				just = [left center]
				z = (<pause_z> + 10)
			}
		endif
	endif
	change user_control_pill_text_color = [0 0 0 255]
	change user_control_pill_color = [180 180 180 255]
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "BACK" button = red z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
endscript

script bunny_hover 
	if NOT screenelementexists id = bunny_container
		return
	endif
	i = 1
	begin
	formattext checksumname = bunnyid 'pause_bunny_flame_%d' d = <i>
	if NOT screenelementexists id = <bunnyid>
		return
	else
		setscreenelementprops id = <bunnyid> pos = <flame_origin>
	endif
	<i> = (<i> + 1)
	repeat 7
	begin
	bunny_container :domorph pos = (360.0, 130.0) time = 1 rot_angle = -25 scale = 1.05 motion = ease_out
	bunny_container :domorph pos = (390.0, 170.0) time = 1 rot_angle = -20 scale = 0.95 motion = ease_in
	bunny_container :domorph pos = (360.0, 130.0) time = 1 rot_angle = -15 scale = 1.05 motion = ease_out
	bunny_container :domorph pos = (390.0, 170.0) time = 1 rot_angle = -20 scale = 0.95 motion = ease_in
	repeat
endscript

script destroy_pause_menu 
	if ismovieplaying \{textureslot = 0}
		resumemovie \{textureslot = 0}
	endif
	if ismovieplaying \{textureslot = 1}
		resumemovie \{textureslot = 1}
	endif
	restore_start_key_binding
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu \{menu_id = scrolling_pause}
	destroy_menu \{menu_id = pause_menu_frame_container}
endscript

script swap_bunny_flame 
	if gotparam \{up}
		generic_menu_up_or_down_sound \{up}
	elseif gotparam \{down}
		generic_menu_up_or_down_sound \{down}
	endif
	change bunny_flame_index = ($bunny_flame_index + 1)
	if ($bunny_flame_index > 7)
		change \{bunny_flame_index = 1}
	endif
	reset_bunny_alpha
	formattext \{checksumname = bunnyid
		'pause_bunny_flame_%d'
		d = $bunny_flame_index}
	doscreenelementmorph id = <bunnyid> alpha = 1
endscript

script reset_bunny_alpha 
	i = 1
	begin
	formattext checksumname = bunnyid 'pause_bunny_flame_%d' d = <i>
	doscreenelementmorph id = <bunnyid> alpha = 0
	<i> = (<i> + 1)
	repeat 7
endscript

script create_menu_backdrop texture = venue_bg rgba = [255 255 255 255]
	if screenelementexists id = menu_backdrop_container
		destroyscreenelement id = menu_backdrop_container
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = menu_backdrop_container
		pos = (0.0, 0.0)
		just = [left top]
	}
	createscreenelement {
		type = spriteelement
		parent = menu_backdrop_container
		id = menu_backdrop
		texture = <texture>
		rgba = <rgba>
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [center center]
		z_priority = 0
	}
endscript

script destroy_menu_backdrop 
	if screenelementexists \{id = menu_backdrop_container}
		destroyscreenelement \{id = menu_backdrop_container}
	endif
endscript

script create_pause_menu_frame x_scale = 1 y_scale = 1 tile_sprite = 1 container_id = pause_menu_frame_container z = 0 gradient = 1 parent = root_window
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <container_id>
		pos = (0.0, 0.0)
		just = [left top]
		z_priority = <z>
	}
	<center_pos> = (640.0, 360.0)
	pos_scale_2 = ((0.0, -5.0) * <y_scale>)
	scale_1 = ((1.5, 0.0) * <x_scale> + (0.0, 1.4) * <y_scale>)
	scale_2 = ((1.4, 0.0) * <x_scale> + (0.0, 1.4) * <y_scale>)
	scale_3 = ((1.4, 0.0) * <x_scale> + (0.0, 1.3499999) * <y_scale>)
	scale_4 = ((1.575, 0.0) * <x_scale> + (0.0, 1.5) * <y_scale>)
	scale_5 = ((1.5, 0.0) * <x_scale> + (0.0, 1.4) * <y_scale>)
	if (<gradient> = 1)
		createscreenelement {
			type = spriteelement
			id = pause_gradient
			parent = <container_id>
			texture = gradient_128
			rgba = [0 0 0 180]
			pos = (0.0, 0.0)
			dims = (1280.0, 720.0)
			just = [left top]
			z_priority = (<z> + 1)
		}
	endif
	if (<tile_sprite> = 1)
		createscreenelement {
			type = windowelement
			parent = <container_id>
			id = pause_menu_scrolling_bg_01
			pos = (640.0, 360.0)
			dims = ((520.0, 0.0) * <x_scale> + (0.0, 340.0) * <y_scale>)
			just = [center center]
			z_priority = (<z> - 1)
		}
		tilesprite parent = pause_menu_scrolling_bg_01 tile_dims = (980.0, 910.0) pos = (0.0, 0.0) texture = gh3_pause_bg_tile
		runscriptonscreenelement tilespriteloop id = <id> params = {move_x = -2 move_y = -2}
	else
		createscreenelement {
			type = spriteelement
			id = frame_background
			parent = <container_id>
			rgba = [0 0 0 255]
			pos = (640.0, 360.0)
			just = [center center]
			dims = ((520.0, 0.0) * <x_scale> + (0.0, 340.0) * <y_scale>)
			z_priority = (<z> - 1)
		}
	endif
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = gh3_pause_frame_02
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [bottom right]
		z_priority = (<z> + 2)
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = gh3_pause_frame_02
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [top right]
		z_priority = (<z> + 2)
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = gh3_pause_frame_02
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [top left]
		z_priority = (<z> + 2)
		flip_v
		flip_h
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = gh3_pause_frame_02
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [bottom left]
		z_priority = (<z> + 2)
		flip_h
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = gh3_pause_frame_01
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [bottom right]
		z_priority = (<z> + 2)
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = gh3_pause_frame_01
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [top right]
		z_priority = (<z> + 2)
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = gh3_pause_frame_01
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [top left]
		z_priority = (<z> + 2)
		flip_v
		flip_h
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = gh3_pause_frame_01
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [bottom left]
		z_priority = (<z> + 2)
		flip_h
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = gh3_pause_frame_01
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [bottom right]
		z_priority = (<z> + 2)
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = gh3_pause_frame_01
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [top right]
		z_priority = (<z> + 2)
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = gh3_pause_frame_01
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [top left]
		z_priority = (<z> + 2)
		flip_v
		flip_h
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = gh3_pause_frame_01
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [bottom left]
		z_priority = (<z> + 2)
		flip_h
	}
endscript

script destroy_pause_menu_frame \{container_id = pause_menu_frame_container}
	destroy_menu menu_id = <container_id>
endscript
default_menu_focus_color = [
	210
	210
	210
	250
]
default_menu_unfocus_color = [
	210
	130
	0
	250
]
menu_focus_color = [
	210
	210
	210
	250
]
menu_unfocus_color = [
	210
	130
	0
	250
]

script set_focus_color \{rgba = [
			210
			210
			210
			250
		]}
	change menu_focus_color = <rgba>
endscript

script set_unfocus_color \{rgba = [
			210
			130
			0
			250
		]}
	change menu_unfocus_color = <rgba>
endscript

script retail_menu_focus 
	if gotparam \{id}
		if screenelementexists id = <id>
			setscreenelementprops id = <id> rgba = ($menu_focus_color)
		endif
	else
		gettags
		printstruct <...>
		setscreenelementprops id = <id> rgba = ($menu_focus_color)
	endif
endscript

script retail_menu_unfocus 
	if gotparam \{id}
		if screenelementexists id = <id>
			setscreenelementprops id = <id> rgba = ($menu_unfocus_color)
		endif
	else
		gettags
		setscreenelementprops id = <id> rgba = ($menu_unfocus_color)
	endif
endscript

script fit_text_in_rectangle dims = (100.0, 100.0) just = center
	if NOT gotparam id
		scriptassert "No id passed to fit_text_in_rectangle!"
	endif
	getscreenelementdims id = <id>
	x_dim = (<dims>.(1.0, 0.0))
	y_dim = (<dims>.(0.0, 1.0))
	x_scale = (<x_dim> / <width>)
	y_scale = (<y_dim> / <height>)
	if (<just> = center)
		if gotparam pos
		endif
	endif
	scale_pair = ((1.0, 0.0) * <x_scale> + (0.0, 1.0) * <y_scale>)
	setscreenelementprops {
		id = <id>
		scale = <scale_pair>
	}
	if gotparam pos
		setscreenelementprops id = <id> pos = <pos>
	endif
endscript
num_user_control_helpers = 0
user_control_text_font = fontgrid_title_gh3
user_control_pill_color = [
	20
	20
	20
	155
]
user_control_pill_text_color = [
	180
	180
	180
	255
]
user_control_auto_center = 1
user_control_super_pill = 0
user_control_pill_y_position = 650
user_control_pill_scale = 0.4
user_control_pill_end_width = 50
user_control_pill_gap = 150
user_control_super_pill_gap = 0.4

script clean_up_user_control_helpers 
	if screenelementexists \{id = user_control_container}
		destroyscreenelement \{id = user_control_container}
	endif
	change \{num_user_control_helpers = 0}
	change \{user_control_pill_color = [
			20
			20
			20
			155
		]}
	change \{user_control_pill_text_color = [
			180
			180
			180
			255
		]}
	change \{user_control_auto_center = 1}
	change \{user_control_super_pill = 0}
	change \{user_control_pill_y_position = 650}
	change \{user_control_pill_scale = 0.4}
endscript

script add_user_control_helper z = 10 pill = 1
	scale = ($user_control_pill_scale)
	pos = ((0.0, 1.0) * ($user_control_pill_y_position))
	if NOT screenelementexists id = user_control_container
		createscreenelement {
			id = user_control_container
			type = containerelement
			parent = root_window
			pos = (0.0, 0.0)
		}
	endif
	if gotparam button
		switch (<button>)
			case green
			buttonchar = "\\b4"
			case red
			buttonchar = "\\b5"
			case yellow
			buttonchar = "\\b6"
			case blue
			buttonchar = "\\b7"
			case orange
			buttonchar = "\\b8"
			case strumbar
			buttonchar = "\\bb"
			offset_for_strumbar = 1
			case start
			buttonchar = "\\ba"
		endswitch
	else
		buttonchar = ""
	endif
	if (<pill> = 0)
		createscreenelement {
			type = textelement
			parent = user_control_container
			text = <buttonchar>
			pos = (<pos> + (-10.0, 8.0) * <scale>)
			scale = (1 * <scale>)
			rgba = [255 255 255 255]
			font = ($gh3_button_font)
			just = [left top]
			z_priority = (<z> + 0.1)
		}
		createscreenelement {
			type = textelement
			parent = user_control_container
			text = <text>
			rgba = $user_control_pill_text_color
			scale = (1.1 * <scale>)
			pos = (<pos> + (50.0, 0.0) * <scale> + (0.0, 20.0) * <scale>)
			font = ($user_control_text_font)
			z_priority = (<z> + 0.1)
			just = [left top]
		}
	else
		if (($user_control_super_pill = 0) && ($user_control_auto_center = 0))
			createscreenelement {
				type = textelement
				parent = user_control_container
				text = <text>
				id = <textid>
				rgba = $user_control_pill_text_color
				scale = (1.1 * <scale>)
				pos = (<pos> + (50.0, 0.0) * <scale> + (0.0, 20.0) * <scale>)
				font = ($user_control_text_font)
				z_priority = (<z> + 0.1)
				just = [left top]
			}
			textid = <id>
			createscreenelement {
				type = textelement
				parent = user_control_container
				id = <buttonid>
				text = <buttonchar>
				pos = (<pos> + (-10.0, 8.0) * <scale>)
				scale = (1 * <scale>)
				rgba = [255 255 255 255]
				font = ($gh3_button_font)
				just = [left top]
				z_priority = (<z> + 0.1)
			}
			buttonid = <id>
			if gotparam offset_for_strumbar
				<textid> :settags is_strumbar = 1
				fastscreenelementpos id = <textid> absolute
				setscreenelementprops id = <textid> pos = (<screenelementpos> + (50.0, 0.0) * <scale>)
			else
			endif
			fastscreenelementpos id = <buttonid> absolute
			top_left = <screenelementpos>
			fastscreenelementpos id = <textid> absolute
			bottom_right = <screenelementpos>
			getscreenelementdims id = <textid>
			bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
			pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
			pill_height = ((0.0, 1.0).<bottom_right> - (0.0, 1.0).<top_left>)
			pill_y_offset = (<pill_height> * 0.2)
			pill_height = (<pill_height> + <pill_y_offset>)
			<pos> = (<pos> + (0.0, 1.0) * (<scale> * 3))
			createscreenelement {
				type = spriteelement
				parent = user_control_container
				texture = control_pill_body
				dims = ((1.0, 0.0) * <pill_width> + (0.0, 1.0) * <pill_height>)
				pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
				rgba = ($user_control_pill_color)
				just = [left top]
				z_priority = <z>
			}
			createscreenelement {
				type = spriteelement
				parent = user_control_container
				texture = control_pill_end
				dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
				pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
				rgba = ($user_control_pill_color)
				just = [right top]
				z_priority = <z>
				flip_v
			}
			createscreenelement {
				type = spriteelement
				parent = user_control_container
				texture = control_pill_end
				dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
				pos = (<pos> + (0.0, -0.5) * <pill_y_offset> + (1.0, 0.0) * <pill_width>)
				rgba = ($user_control_pill_color)
				just = [left top]
				z_priority = <z>
			}
		else
			formattext checksumname = textid 'uc_text_%d' d = ($num_user_control_helpers)
			createscreenelement {
				type = textelement
				parent = user_control_container
				text = <text>
				id = <textid>
				rgba = $user_control_pill_text_color
				scale = (1.1 * <scale>)
				pos = (<pos> + (50.0, 0.0) * <scale> + (0.0, 20.0) * <scale>)
				font = ($user_control_text_font)
				z_priority = (<z> + 0.1)
				just = [left top]
			}
			formattext checksumname = buttonid 'uc_button_%d' d = ($num_user_control_helpers)
			createscreenelement {
				type = textelement
				parent = user_control_container
				id = <buttonid>
				text = <buttonchar>
				pos = (<pos> + (-10.0, 8.0) * <scale>)
				scale = (1.2 * <scale>)
				rgba = [255 255 255 255]
				font = ($gh3_button_font)
				just = [left top]
				z_priority = (<z> + 0.1)
			}
			if gotparam offset_for_strumbar
				<textid> :settags is_strumbar = 1
				fastscreenelementpos id = <textid> absolute
				setscreenelementprops id = <textid> pos = (<screenelementpos> + (50.0, 0.0) * <scale>)
			endif
			change num_user_control_helpers = ($num_user_control_helpers + 1)
		endif
	endif
	if ($user_control_super_pill = 1)
		user_control_build_super_pill z = <z>
	elseif ($user_control_auto_center = 1)
		user_control_build_pills z = <z>
	endif
endscript

script user_control_cleanup_pills 
	destroy_menu menu_id = user_control_super_pill_object_main
	destroy_menu menu_id = user_control_super_pill_object_l
	destroy_menu menu_id = user_control_super_pill_object_r
	index = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		formattext checksumname = pill_id 'uc_pill_%d' d = <index>
		if screenelementexists id = <pill_id>
			destroyscreenelement id = <pill_id>
		endif
		formattext checksumname = pill_l_id 'uc_pill_l_%d' d = <index>
		if screenelementexists id = <pill_l_id>
			destroyscreenelement id = <pill_l_id>
		endif
		formattext checksumname = pill_r_id 'uc_pill_r_%d' d = <index>
		if screenelementexists id = <pill_r_id>
			destroyscreenelement id = <pill_r_id>
		endif
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
endscript

script user_control_build_pills 
	user_control_cleanup_pills
	scale = ($user_control_pill_scale)
	index = 0
	max_pill_width = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		formattext checksumname = textid 'uc_text_%d' d = <index>
		formattext checksumname = buttonid 'uc_button_%d' d = <index>
		fastscreenelementpos id = <buttonid> absolute
		top_left = <screenelementpos>
		fastscreenelementpos id = <textid> absolute
		bottom_right = <screenelementpos>
		getscreenelementdims id = <textid>
		bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
		pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
		if (<pill_width> > <max_pill_width>)
			<max_pill_width> = (<pill_width>)
		endif
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
	index = 0
	initial_pill_x = (640 + -1 * (($num_user_control_helpers / 2.0) * <max_pill_width>) - ((0.5 * $user_control_pill_gap * <scale>) * ($num_user_control_helpers -1)))
	pos = ((1.0, 0.0) * <initial_pill_x> + (0.0, 1.0) * ($user_control_pill_y_position) + (0.0, 0.8) * (<scale>))
	if NOT ($num_user_control_helpers = 0)
		begin
		formattext checksumname = pill_id 'uc_pill_%d' d = <index>
		formattext checksumname = pill_l_id 'uc_pill_l_%d' d = <index>
		formattext checksumname = pill_r_id 'uc_pill_r_%d' d = <index>
		formattext checksumname = textid 'uc_text_%d' d = <index>
		formattext checksumname = buttonid 'uc_button_%d' d = <index>
		fastscreenelementpos id = <buttonid> absolute
		top_left = <screenelementpos>
		fastscreenelementpos id = <textid> absolute
		bottom_right = <screenelementpos>
		getscreenelementdims id = <textid>
		bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
		pill_width = (<max_pill_width>)
		pill_height = ((0.0, 1.0).<bottom_right> - (0.0, 1.0).<top_left>)
		pill_y_offset = (<pill_height> * 0.2)
		pill_height = (<pill_height> + <pill_y_offset>)
		createscreenelement {
			type = spriteelement
			parent = user_control_container
			id = <pill_id>
			texture = control_pill_body
			dims = ((1.0, 0.0) * <pill_width> + (0.0, 1.0) * <pill_height>)
			pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
			rgba = ($user_control_pill_color)
			just = [left top]
			z_priority = <z>
		}
		createscreenelement {
			type = spriteelement
			parent = user_control_container
			id = <pill_l_id>
			texture = control_pill_end
			dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
			pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
			rgba = ($user_control_pill_color)
			just = [right top]
			z_priority = <z>
			flip_v
		}
		createscreenelement {
			type = spriteelement
			parent = user_control_container
			id = <pill_r_id>
			texture = control_pill_end
			dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
			pos = (<pos> + (0.0, -0.5) * <pill_y_offset> + (1.0, 0.0) * <max_pill_width>)
			rgba = ($user_control_pill_color)
			just = [left top]
			z_priority = <z>
		}
		<index> = (<index> + 1)
		pos = (<pos> + (1.0, 0.0) * ($user_control_pill_gap * <scale> + <max_pill_width>))
		repeat ($num_user_control_helpers)
	endif
	index = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		align_user_control_with_pill pill_index = <index>
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
endscript

script align_user_control_with_pill 
	formattext checksumname = pill_id 'uc_pill_%d' d = <pill_index>
	fastscreenelementpos id = <pill_id> absolute
	getscreenelementdims id = <pill_id>
	pill_midpoint_x = (<screenelementpos>.(1.0, 0.0) + 0.5 * <width>)
	align_user_control_with_x x = <pill_midpoint_x> pill_index = <pill_index>
endscript

script align_user_control_with_x 
	formattext checksumname = textid 'uc_text_%d' d = <pill_index>
	formattext checksumname = buttonid 'uc_button_%d' d = <pill_index>
	fastscreenelementpos id = <buttonid> absolute
	top_left = <screenelementpos>
	button_pos = <screenelementpos>
	fastscreenelementpos id = <textid> absolute
	bottom_right = <screenelementpos>
	text_pos = <screenelementpos>
	getscreenelementdims id = <textid>
	bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
	pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
	text_button_midpoint = (<top_left>.(1.0, 0.0) + 0.5 * <pill_width>)
	midpoint_diff = (<text_button_midpoint> - <x>)
	new_button_pos = (<button_pos> - (1.0, 0.0) * <midpoint_diff>)
	new_text_pos = (<text_pos> - (1.0, 0.0) * <midpoint_diff>)
	setscreenelementprops id = <textid> pos = <new_text_pos>
	setscreenelementprops id = <buttonid> pos = <new_button_pos>
endscript

script user_control_build_super_pill 
	user_control_cleanup_pills
	scale = ($user_control_pill_scale)
	index = 0
	pos = ((0.0, 1.0) * $user_control_pill_y_position)
	leftmost = 9999.0
	rightmost = -9999.0
	if NOT ($num_user_control_helpers = 0)
		begin
		formattext checksumname = textid 'uc_text_%d' d = <index>
		formattext checksumname = buttonid 'uc_button_%d' d = <index>
		fastscreenelementpos id = <buttonid> absolute
		top_left = <screenelementpos>
		fastscreenelementpos id = <textid> absolute
		bottom_right = <screenelementpos>
		getscreenelementdims id = <textid>
		bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
		button_text_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
		left_x = ((1.0, 0.0).<pos>)
		right_x = ((1.0, 0.0).<pos> + <button_text_width>)
		if (<left_x> < <leftmost>)
			<leftmost> = (<left_x>)
		endif
		if (<right_x> > <rightmost>)
			<rightmost> = (<right_x>)
		endif
		pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
		<buttonid> :settags calc_width = <pill_width>
		<buttonid> :settags calc_pos = <pos>
		pos = (<pos> + (1.0, 0.0) * ($user_control_pill_gap * <scale> * $user_control_super_pill_gap + <pill_width>))
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
	whole_pill_width = (<rightmost> - <leftmost>)
	holy_midpoint_batman = (<leftmost> + 0.5 * <whole_pill_width>)
	midpoint_diff = (<holy_midpoint_batman> - 640)
	index = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		formattext checksumname = textid 'uc_text_%d' d = <index>
		formattext checksumname = buttonid 'uc_button_%d' d = <index>
		<buttonid> :gettags
		<calc_pos> = (<calc_pos> - (1.0, 0.0) * <midpoint_diff>)
		setscreenelementprops id = <buttonid> pos = (<calc_pos>)
		istextstrumbar id = <textid>
		if (<is_strumbar> = 0)
			setscreenelementprops id = <textid> pos = (<calc_pos> + (50.0, 7.0) * <scale>)
		else
			setscreenelementprops id = <textid> pos = (<calc_pos> + (100.0, 7.0) * <scale>)
		endif
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
	pill_height = ((0.0, 1.0).<bottom_right> - (0.0, 1.0).<top_left>)
	pill_y_offset = (<pill_height> * 0.2)
	pill_height = (<pill_height> + <pill_y_offset>)
	pos = ((1.0, 0.0) * (<leftmost> - <midpoint_diff>) + (0.0, 1.0) * $user_control_pill_y_position)
	createscreenelement {
		type = spriteelement
		parent = user_control_container
		id = user_control_super_pill_object_main
		texture = control_pill_body
		dims = ((1.0, 0.0) * <whole_pill_width> + (0.0, 1.0) * <pill_height>)
		pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
		rgba = ($user_control_pill_color)
		just = [left top]
		z_priority = <z>
	}
	createscreenelement {
		type = spriteelement
		parent = user_control_container
		id = user_control_super_pill_object_l
		texture = control_pill_end
		dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
		pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
		rgba = ($user_control_pill_color)
		just = [right top]
		z_priority = <z>
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = user_control_container
		id = user_control_super_pill_object_r
		texture = control_pill_end
		dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
		pos = (<pos> + (0.0, -0.5) * <pill_y_offset> + (1.0, 0.0) * <whole_pill_width>)
		rgba = ($user_control_pill_color)
		just = [left top]
		z_priority = <z>
	}
endscript

script fastscreenelementpos 
	getscreenelementprops id = <id>
	return screenelementpos = <pos>
endscript

script istextstrumbar 
	<id> :gettags
	if gotparam \{is_strumbar}
		return \{is_strumbar = 1}
	else
		return \{is_strumbar = 0}
	endif
endscript

script get_diff_completion_text for_p2_career = 0
	diff_completion_text = ["" "" "" ""]
	get_progression_globals game_mode = ($game_mode)
	change g_gh3_setlist = <tier_global>
	difficulty_array = [easy medium hard expert]
	stored_difficulty = ($current_difficulty)
	if ($game_mode = p2_career)
		stored_difficulty2 = ($current_difficulty2)
		change current_difficulty2 = expert
	endif
	num_tiers = ($g_gh3_setlist.num_tiers)
	diff_index = 0
	begin
	diff_num_songs = 0
	diff_songs_completed = 0
	change current_difficulty = (<difficulty_array> [<diff_index>])
	progression_pop_current
	tier_index = 1
	begin
	setlist_prefix = ($g_gh3_setlist.prefix)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier_index>
	formattext checksumname = tier_checksum 'tier%s' s = <tier_index>
	getarraysize ($g_gh3_setlist.<tier_checksum>.songs)
	num_songs = <array_size>
	diff_num_songs = (<diff_num_songs> + <num_songs>)
	song_count = 0
	begin
	formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <tier_index> addtostringlookup = true
	getglobaltags <song_checksum> param = stars
	if NOT (<stars> = 0)
		<diff_songs_completed> = (<diff_songs_completed> + 1)
	endif
	song_count = (<song_count> + 1)
	repeat <num_songs>
	<tier_index> = (<tier_index> + 1)
	repeat <num_tiers>
	if NOT (<diff_songs_completed> = 0)
		if NOT (<for_p2_career>)
			formattext textname = diff_completion_string "%a OF %b SONGS" a = <diff_songs_completed> b = <diff_num_songs>
			setarrayelement arrayname = diff_completion_text index = (<diff_index>) newvalue = (<diff_completion_string>)
		else
			formattext textname = diff_completion_string "%a of %b" a = <diff_songs_completed> b = <diff_num_songs>
			setarrayelement arrayname = diff_completion_text index = (<diff_index>) newvalue = (<diff_completion_string>)
		endif
	endif
	progression_push_current
	<diff_index> = (<diff_index> + 1)
	repeat 4
	change current_difficulty = <stored_difficulty>
	if ($game_mode = p2_career)
		change current_difficulty2 = <stored_difficulty2>
	endif
	return diff_completion_text = <diff_completion_text>
endscript

script get_diff_completion_percentage for_p2_career = 0
	diff_completion_percentage = [0 0 0 0]
	get_progression_globals game_mode = ($game_mode)
	change g_gh3_setlist = <tier_global>
	difficulty_array = [easy medium hard expert]
	stored_difficulty = ($current_difficulty)
	if ($game_mode = p2_career)
		stored_difficulty2 = ($current_difficulty2)
		change current_difficulty2 = expert
	endif
	num_tiers = ($g_gh3_setlist.num_tiers)
	diff_index = 0
	begin
	diff_num_songs = 0
	diff_songs_completed = 0
	change current_difficulty = (<difficulty_array> [<diff_index>])
	progression_pop_current
	tier_index = 1
	begin
	setlist_prefix = ($g_gh3_setlist.prefix)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier_index>
	formattext checksumname = tier_checksum 'tier%s' s = <tier_index>
	getarraysize ($g_gh3_setlist.<tier_checksum>.songs)
	num_songs = <array_size>
	diff_num_songs = (<diff_num_songs> + <num_songs>)
	song_count = 0
	begin
	formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <tier_index> addtostringlookup = true
	getglobaltags <song_checksum> param = stars
	if NOT (<stars> = 0)
		<diff_songs_completed> = (<diff_songs_completed> + 1)
	endif
	song_count = (<song_count> + 1)
	repeat <num_songs>
	<tier_index> = (<tier_index> + 1)
	repeat <num_tiers>
	setarrayelement arrayname = diff_completion_percentage index = (<diff_index>) newvalue = (<diff_songs_completed> / <diff_num_songs>)
	progression_push_current
	<diff_index> = (<diff_index> + 1)
	repeat 4
	change current_difficulty = <stored_difficulty>
	if ($game_mode = p2_career)
		change current_difficulty2 = <stored_difficulty2>
	endif
	return diff_completion_percentage = <diff_completion_percentage>
endscript
