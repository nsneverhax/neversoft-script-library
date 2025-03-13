
script ui_create_detailed_stats \{player = 1}
	create_menu_backdrop \{texture = boot_brick_bg}
	pad_choose_script = nullscript
	pad_back_script = generic_event_back
	if ($special_event_stage != 0)
		<pad_choose_script> = ui_win_song_continue
		<pad_back_script> = nullscript
	endif
	createscreenelement {
		type = windowelement
		parent = root_window
		id = current_menu
		dims = (1280.0, 550.0)
		pos = (640.0, 360.0)
		just = [center center]
		child_anchor = [center top]
		event_handlers = [
			{pad_up ui_detailed_stats_shift params = {up}}
			{pad_down ui_detailed_stats_shift params = {down}}
			{pad_back <pad_back_script>}
			{pad_choose <pad_choose_script>}
		]
		tags = {current = 0 fit = 11 total = 11}
	}
	createscreenelement \{type = vmenu
		parent = current_menu
		id = stat_vmenu
		dims = (768.0, 0.0)
		just = [
			center
			top
		]
		internal_just = [
			center
			top
		]}
	createscreenelement \{type = containerelement
		parent = current_menu
		id = stat_scrollbar
		dims = (38.0, 550.0)
		pos = {
			(0.305, 0.0)
			proportional
		}
		just = [
			left
			top
		]}
	ui_detailed_stats_add_title player = <player>
	ui_detailed_stats_add_basic_stats player = <player>
	ui_detailed_stats_add_section_stats player = <player>
	getscreenelementchildren \{id = stat_vmenu}
	getarraysize <children>
	current_menu :settags total = <array_size>
	if ($special_event_stage != 0)
		add_user_control_helper \{text = qs(0x182f0173)
			button = green
			z = 100000}
	else
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
endscript

script ui_destroy_detailed_stats 
	if screenelementexists \{id = current_menu}
		current_menu :die
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script ui_detailed_stats_shift 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	gettags
	if gotparam \{down}
		if (<current> >= (<total> - <fit>))
			return
		endif
		stat_vmenu :setprops \{pos = {
				(0.0, -50.0)
				relative
			}
			time = 0.1}
		settags current = (<current> + 1)
	else
		if (<current> <= 0)
			return
		endif
		stat_vmenu :setprops \{pos = {
				(0.0, 50.0)
				relative
			}
			time = 0.1}
		settags current = (<current> - 1)
	endif
endscript

script ui_detailed_stats_add_row 
	if NOT gotparam \{columns}
		return
	endif
	createscreenelement \{type = hmenu
		parent = stat_vmenu
		dims = (768.0, 50.0)
		just = [
			center
			top
		]
		internal_just = [
			center
			center
		]
		spacing_between = 8}
	<hmenu_id> = <id>
	getarraysize <columns>
	width_mod_array = [1.0]
	switch (<array_size>)
		case 2
		width_mod_array = [0.6 0.4]
		case 3
		width_mod_array = [0.4 0.3 0.3]
		case 4
		width_mod_array = [0.4 0.2 0.2 0.2]
		case 5
		width_mod_array = [0.4 0.15 0.15 0.15 0.15]
	endswitch
	if (<array_size> > 0)
		i = 0
		begin
		createscreenelement {
			type = containerelement
			parent = <hmenu_id>
			dims = (((1.0, 0.0) * (<width_mod_array> [<i>] * 768)) + (0.0, 50.0) - (8.0, 0.0))
			just = [center center]
			child_anchor = ((<columns> [<i>]).just)
		}
		createscreenelement {
			type = textelement
			parent = <id>
			font = fontgrid_text_a3
			rgba = [200 200 200 255]
			(<columns> [<i>])
		}
		fit_text_in_rectangle id = <id> dims = (((1.0, 0.0) * (<width_mod_array> [<i>] * 768)) + (0.0, 50.0) - (8.0, 0.0)) only_if_larger_x = 1 keep_ar = 1
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_detailed_stats_add_title 
	ui_detailed_stats_add_row columns = [{text = qs(0x1483ab79) just = [left top] scale = 2.0 rgba = <title_rgba>}]
	ui_detailed_stats_add_row \{columns = [
			{
				text = qs(0x03ac90f0)
			}
		]}
	ui_detailed_stats_add_row columns = [{text = qs(0x0b3b793c) just = [left top] scale = 2.0 rgba = <title_rgba> pos = (0.0, -25.0)}]
	ui_detailed_stats_add_row \{columns = [
			{
				text = qs(0x03ac90f0)
			}
		]}
endscript

script ui_detailed_stats_add_basic_stats 
	player_name_array = [{text = qs(0xd6268827) just = [left center]}]
	notes_hit_array = [{text = qs(0x7d221f06) just = [left center]}]
	sp_phrases_array = [{text = qs(0xf75837da) just = [left center]}]
	avg_mult_array = [{text = qs(0xff3216c6) just = [left center]}]
	i = 1
	begin
	formattext checksumname = status 'player%a_status' a = <i>
	avg = 1.0
	if ($<status>.base_score > 0)
		if ($game_mode != p2_pro_faceoff && $game_mode != p2_faceoff)
			avg = ((1.0 * $<status>.score) / (1.0 * $<status>.base_score))
		else
			<avg_sim_bot> = (($player1_status.sim_bot_score + $player2_status.sim_bot_score) / 2.0)
			<avg> = (($<status>.score * $<status>.sim_bot_score) / ($<status>.base_score * <avg_sim_bot>))
		endif
		if (<avg> < 1.0)
			<avg> = 1.0
		elseif (<avg> > 4.0)
			<avg> = 4.0
		endif
	endif
	formattext textname = name qs(0x0bc409e2) a = <i>
	formattext textname = notes_hit qs(0x953baf82) a = ($<status>.notes_hit) b = ($<status>.total_notes)
	formattext textname = sp_phrases qs(0x953baf82) a = ($<status>.sp_phrases_hit) b = ($<status>.sp_phrases_total)
	formattext textname = avg_mult qs(0xf272d1f0) a = <avg> decimalplaces = 3
	if (($<status>.notes_hit) = ($<status>.total_notes))
		notes_hit_rgba = [0 200 0 255]
	endif
	addarrayelement array = <player_name_array> element = {text = <name> just = [center center]}
	player_name_array = <array>
	addarrayelement array = <notes_hit_array> element = {text = <notes_hit> just = [right center] rgba = <notes_hit_rgba>}
	notes_hit_array = <array>
	addarrayelement array = <sp_phrases_array> element = {text = <sp_phrases> just = [right center]}
	sp_phrases_array = <array>
	addarrayelement array = <avg_mult_array> element = {text = <avg_mult> just = [right center]}
	avg_mult_array = <array>
	removeparameter \{notes_hit_rgba}
	i = (<i> + 1)
	repeat ($current_num_players)
	ui_detailed_stats_add_row columns = <player_name_array>
	ui_detailed_stats_add_row columns = <notes_hit_array>
	ui_detailed_stats_add_row columns = <avg_mult_array>
	ui_detailed_stats_add_row \{columns = [
			{
				text = qs(0x28151c2d)
				just = [
					center
					center
				]
			}
		]}
endscript

script ui_detailed_stats_add_section_stats 
	getplayerinfo \{1
		current_song_section_array}
	if (<current_song_section_array> = none)
		return
	endif
	<song_section_array> = <current_song_section_array>
	getmarkerarraysize array = <song_section_array>
	if (<array_size> > 0)
		i = 0
		begin
		ui_detailed_stats_get_section_stats section_index = <i> section_array = <song_section_array>
		section_array = [{text = <section_name> just = [left center]}]
		j = 0
		begin
		if (<notes_max> [<j>] > 0)
			hit_percent = ((100 * (<notes_hit> [<j>])) / (<notes_max> [<j>]))
			formattext textname = hit qs(0x22cb1903) a = <hit_percent>
		else
			formattext \{textname = hit
				qs(0xf874d5f8)}
		endif
		addarrayelement array = <section_array> element = {text = <hit> just = [right center]}
		section_array = <array>
		repeat ($current_num_players)
		ui_detailed_stats_add_row columns = <section_array>
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_detailed_stats_get_section_stats \{section_index = 0}
	notes_hit = [0 0 0 0]
	notes_max = [1 1 1 1]
	section_name = qs(0x00000000)
	getarraysize \{$p1_last_song_detailed_stats}
	if (<section_index> < <array_size>)
		setarrayelement arrayname = notes_hit index = 0 newvalue = ($p1_last_song_detailed_stats [<section_index>])
		setarrayelement arrayname = notes_hit index = 1 newvalue = ($p2_last_song_detailed_stats [<section_index>])
		setarrayelement arrayname = notes_hit index = 2 newvalue = ($p3_last_song_detailed_stats [<section_index>])
		setarrayelement arrayname = notes_hit index = 3 newvalue = ($p4_last_song_detailed_stats [<section_index>])
		setarrayelement arrayname = notes_max index = 0 newvalue = ($p1_last_song_detailed_stats_max [<section_index>])
		setarrayelement arrayname = notes_max index = 1 newvalue = ($p2_last_song_detailed_stats_max [<section_index>])
		setarrayelement arrayname = notes_max index = 2 newvalue = ($p3_last_song_detailed_stats_max [<section_index>])
		setarrayelement arrayname = notes_max index = 3 newvalue = ($p4_last_song_detailed_stats_max [<section_index>])
	endif
	getarraysize ($<section_array>)
	if (<section_index> < <array_size>)
		section_name = (($<section_array> [<section_index>]).marker)
	endif
	return {notes_hit = <notes_hit> notes_max = <notes_max> section_name = <section_name>}
endscript
