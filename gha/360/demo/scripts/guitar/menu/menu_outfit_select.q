os_made_first_selection_bool_p1 = 0
os_made_first_selection_bool_p2 = 0
os_selected_outfit_p1 = 1
os_selected_outfit_old_p1 = 1
os_selected_outfit_p2 = 1
os_selected_outfit_old_p2 = 1
os_selected_style_p1 = 1
os_selected_style_old_p1 = 1
os_selected_style_p2 = 1
os_selected_style_old_p2 = 1
os_frame_is_big = 1
os_menu_start_pos_p1 = (0.0, 110.0)

script get_style_index_from_profile_style \{player = 1}
	get_character_outfits player = <player>
	formattext checksumname = player_status 'player%i_status' i = <player>
	<curr_outfit> = ($<player_status>.outfit)
	if gotparam \{style}
		<curr_style> = <style>
	else
		<curr_style> = ($<player_status>.style)
	endif
	getarraysize (<character_outfits> [(<curr_outfit> - 1)].reference)
	<i> = 0
	begin
	if ((<character_outfits> [(<curr_outfit> - 1)].reference [<i>]) = <curr_style>)
		return style_index = <i>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script get_initial_outfit_reference \{player = 1}
	if gotparam \{character_id}
		get_character_outfits player = <player> character_id = <character_id>
	else
		get_character_outfits player = <player>
	endif
	if gotparam \{no_outfits}
		return \{reference = 1}
	endif
	if gotparam \{outfit2}
		<index> = 1
	else
		<index> = 0
	endif
	getarraysize <character_outfits>
	if (<array_size> <= <index>)
		return \{reference = 1}
	endif
	if structurecontains structure = (<character_outfits> [<index>]) reference
		return reference = (<character_outfits> [<index>].reference [0])
	else
		return \{reference = 1}
	endif
endscript

script get_random_aero_outfit 
	if NOT gotparam \{character_id}
		scriptassert \{"You need to pass a character_id to script get_random_aero_outfit!"}
	endif
	if NOT gotparam \{character_name}
		scriptassert \{"You need to pass a character_name to script get_random_aero_outfit!"}
	endif
	get_character_outfits character_id = <character_id>
	if gotparam \{no_outfits}
		return \{random_outfit = 1
			random_style = 1}
	endif
	<outfit1> = 1
	<outfit2> = 1
	<style1> = 1
	<style2> = 1
	if ((<character_id> = joep) || (<character_id> = bradw) || (<character_id> = tomh))
		<style1> = 1
		<style2> = 6
	else
		<outfit2> = 2
		<style1> = 5
		<style2> = 7
	endif
	aero_outfits = []
	<outfit_loop> = (<outfit2> - <outfit1> + 1)
	<style_loop> = (<style2> - <style1> + 1)
	<i> = <outfit1>
	begin
	<j> = <style1>
	begin
	formattext checksumname = outfit_checksum 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <i> s = <j>
	if getglobaltags <outfit_checksum> param = unlocked noassert = 1
		if (<unlocked>)
			elmt = {outfit = <i> style = <j>}
			addarrayelement array = <aero_outfits> element = <elmt>
			<aero_outfits> = <array>
		endif
	else
		elmt = {outfit = <i> style = <j>}
		addarrayelement array = <aero_outfits> element = <elmt>
		<aero_outfits> = <array>
	endif
	<j> = (<j> + 1)
	repeat <style_loop>
	<i> = (<i> + 1)
	repeat <outfit_loop>
	getarraysize <aero_outfits>
	getrandomvalue a = 0 b = (<array_size> - 1) name = random_index integer
	<random_outfit> = (<aero_outfits> [<random_index>].outfit)
	<random_style> = (<aero_outfits> [<random_index>].style)
	return random_outfit = <random_outfit> random_style = <random_style>
endscript

script create_select_outfit_menu \{player = 1}
	formattext checksumname = player_status 'player%i_status' i = <player>
	if (<player> = 1)
		change \{os_made_first_selection_bool_p1 = 0}
	else
		change \{os_made_first_selection_bool_p2 = 0}
	endif
	font = text_a4
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	if ((($is_network_game) = 1) && (<player> = 1))
		pad_back_script = net_outfit_menu_flow_go_back
	else
		pad_back_script = menu_flow_go_back
	endif
	event_handlers = [
		{pad_up os_scroll_up_or_down params = {
				player = <player>
				dir = up
			}
		}
		{pad_down os_scroll_up_or_down params = {
				player = <player>
				dir = down
			}
		}
		{pad_back select_outfit_go_back params = {
				player = <player>
			}
		}
		{pad_choose select_outfit_choose params = {
				player = <player>
			}
		}
	]
	if (<player> = 1)
		if ($current_num_players = 1)
			new_menu {
				scrollid = scrolling_select_outfit_p1
				vmenuid = vmenu_select_outfit_p1
				menu_pos = (120.0, 190.0)
				use_backdrop = 0
				event_handlers = <event_handlers>
			}
			vparent = vmenu_select_outfit_p1
		else
			new_menu {
				scrollid = scrolling_select_outfit_p1
				vmenuid = vmenu_select_outfit_p1
				menu_pos = (120.0, 190.0)
				use_backdrop = 0
				event_handlers = <event_handlers>
				exclusive_device = <exclusive_dev>
			}
			vparent = vmenu_select_outfit_p1
		endif
	else
		new_menu {
			scrollid = scrolling_select_outfit_p2
			vmenuid = vmenu_select_outfit_p2
			menu_pos = (700.0, 120.0)
			use_backdrop = 0
			event_handlers = <event_handlers>
			exclusive_device = <exclusive_dev>
		}
		if ($is_network_game = 1)
			vmenu_select_outfit_p2 :setprops \{disable_pad_handling}
			launchevent \{type = unfocus
				target = vmenu_select_outfit_p2}
		endif
		vparent = vmenu_select_outfit_p2
	endif
	if ($current_num_players = 1)
		launchevent \{type = unfocus
			target = vmenu_select_outfit_p1}
		formattext checksumname = player_status 'player%i_status' i = <player>
		if find_profile_by_id id = ($<player_status>.character_id)
			get_musician_profile_struct index = <index>
			formattext checksumname = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player>
			if getglobaltags <characterguitartags> noassert = 1
				change os_selected_outfit_p1 = (<current_outfit>)
				change os_selected_outfit_old_p1 = (<current_outfit>)
				change os_selected_style_p1 = (<current_style>)
				change os_selected_style_old_p1 = (<current_style>)
			endif
		endif
		createscreenelement \{type = containerelement
			id = select_outfit_container_p1
			parent = root_window
			pos = (392.0, 6.0)}
		frame_dims = (280.0, 600.0)
		center_pos = (0.0, 335.0)
		change \{os_frame_is_big = 1}
		create_ui_frame {
			parent = select_outfit_container_p1
			frame_dims = <frame_dims>
			center_pos = <center_pos>
			frame_rgba = (($g_menu_colors).frame_rgba)
			fill_rgba = (($g_menu_colors).fill_rgba)
			z_priority = 0
		}
		header_pos = (<center_pos> - ((<frame_dims>.(0.0, 1.0)) * (0.0, 0.5) - (0.0, 80.0)))
		createscreenelement {
			type = spriteelement
			parent = select_outfit_container_p1
			pos = <header_pos>
			id = os_frame_header_01
			just = [center bottom]
			texture = window_header_01
			rgba = (($g_menu_colors).lt_violet_grey)
			z_priority = 1
		}
		createscreenelement {
			type = textelement
			parent = select_outfit_container_p1
			text = "SELECT OUTFIT"
			pos = ($gs_element_offsets [0])
			scale = (0.6, 0.55)
			font = fontgrid_title_gh3
			just = [center center]
			rgba = (($g_menu_colors).pink)
			z_priority = 1
		}
		createscreenelement {
			type = spriteelement
			id = os_name_background
			parent = select_outfit_container_p1
			texture = char_select_frame_bg
			pos = ($gs_element_offsets [2])
			dims = (266.0, 128.0)
			just = [center center]
			rgba = (($g_menu_colors).lt_violet_grey)
			z_priority = 1
		}
		get_character_outfits player = <player>
		<curr_outfit> = $os_selected_outfit_p1
		styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
		get_style_index_from_profile_style player = <player>
		curr_style = (<styles> [<style_index>])
		getuppercasestring (<character_outfits> [(<curr_outfit> - 1)].name)
		createscreenelement {
			type = textelement
			id = os_outfit_name_id_p1
			parent = select_outfit_container_p1
			text = <uppercasestring>
			pos = (($gs_element_offsets [2]) + (-1.0, 8.0))
			scale = (1.0, 1.0)
			font = fontgrid_title_gh3
			just = [center center]
			rgba = (($g_menu_colors).black)
			z_priority = 2
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = (($g_menu_colors).lt_violet_grey)
		}
		getscreenelementdims \{id = os_outfit_name_id_p1}
		fit_text_in_rectangle id = os_outfit_name_id_p1 dims = ((250.0, 0.0) + (<height> * (0.0, 1.0))) only_if_larger_x = 1 start_x_scale = 1 start_y_scale = 1
		getuppercasestring <curr_style>
		createscreenelement {
			id = os_outfit_style_id_p1
			type = textblockelement
			parent = select_outfit_container_p1
			text = <uppercasestring>
			pos = ($gs_element_offsets [3])
			scale = (0.55, 0.55)
			dims = (440.0, 300.0)
			font = text_a4
			just = [center center]
			rgba = (($g_menu_colors).lt_violet_grey)
			z = 2
		}
		getscreenelementdims \{id = os_outfit_style_id_p1}
		if (<width> > 256)
			fit_text_in_rectangle id = os_outfit_style_id_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) pos = ($gs_element_offsets [3]) start_x_scale = 0.55 start_y_scale = 0.55
		endif
		get_character_name \{player = 1}
		get_initial_outfit_reference \{outfit2}
		formattext checksumname = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
		if getglobaltags <outfit_2_checksum> param = unlocked noassert = 1
			if NOT (<unlocked>)
				select_outfit_choose \{player = 1}
			else
				scale_outfit_select_menu \{make_small}
				launchevent \{type = focus
					target = vmenu_select_outfit_p1}
			endif
		else
			select_outfit_choose \{player = 1}
		endif
	else
		if (<player> = 1)
			formattext checksumname = player_status 'player%i_status' i = <player>
			if find_profile_by_id id = ($<player_status>.character_id)
				get_musician_profile_struct index = <index>
				formattext checksumname = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player>
				if getglobaltags <characterguitartags> noassert = 1
					change os_selected_outfit_p1 = (<current_outfit>)
					change os_selected_outfit_old_p1 = (<current_outfit>)
					change os_selected_style_p1 = (<current_style>)
					change os_selected_style_old_p1 = (<current_style>)
				endif
			endif
			createscreenelement \{type = containerelement
				id = select_outfit_container_p1
				parent = root_window
				pos = (460.0, 500.0)}
			create_ui_frame {
				frame_dims = (250.0, 185.0)
				center_pos = (0.0, 32.0)
				parent = select_outfit_container_p1
				frame_rgba = [240 225 200 50]
				fill_rgba = [50 25 40 185]
				z_priority = 0
				offset_top = 32
				offset_side = 32
				min_fill_pad_width = 73
				min_fill_pad_height = 63
				tex_param = 'simple'
				suffix = <player>
				check_side_swap = 0
			}
			displaytext {
				id = os_select_outfit_text_p1
				parent = select_outfit_container_p1
				text = "SELECT OUTFIT"
				pos = (0.0, -30.0)
				scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [center center]
				rgba = (($g_menu_colors).md_violet_grey)
				z = 1
			}
			displaysprite {
				id = os_name_background_p1
				parent = select_outfit_container_p1
				tex = char_select_frame_bg
				pos = (0.0, 30.0)
				dims = (266.0, 128.0)
				just = [center center]
				rgba = (($g_menu_colors).light_brown)
				z = 1
			}
			get_character_outfits player = <player>
			<curr_outfit> = $os_selected_outfit_p1
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			get_style_index_from_profile_style player = <player>
			curr_style = (<styles> [<style_index>])
			getuppercasestring (<character_outfits> [(<curr_outfit> - 1)].name)
			displaytext {
				id = os_outfit_name_id_p1
				parent = select_outfit_container_p1
				text = <uppercasestring>
				pos = (0.0, 20.0)
				scale = (1.0, 1.0)
				font = text_a4
				just = [center center]
				rgba = (($g_menu_colors).black)
				z = 2
				noshadow
			}
			getscreenelementdims \{id = os_outfit_name_id_p1}
			if (<width> > 260)
				fit_text_in_rectangle id = os_outfit_name_id_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) pos = (0.0, 20.0)
			endif
			getuppercasestring <curr_style>
			displaytext {
				id = os_outfit_style_id_p1
				parent = select_outfit_container_p1
				text = <uppercasestring>
				pos = (2.0, 93.0)
				scale = (0.75, 0.5)
				font = text_a4
				just = [center center]
				rgba = (($g_menu_colors).light_brown)
				z = 2
				noshadow
			}
			getscreenelementdims \{id = os_outfit_style_id_p1}
			if (<width> > 230)
				fit_text_in_rectangle id = os_outfit_style_id_p1 dims = ((225.0, 0.0) + (<height> * (0.0, 1.0))) pos = (2.0, 93.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			get_character_name \{player = 1}
			get_initial_outfit_reference \{outfit2}
			formattext checksumname = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
			if getglobaltags <outfit_2_checksum> param = unlocked noassert = 1
				if NOT (<unlocked>)
					select_outfit_choose \{player = 1}
				endif
			else
				select_outfit_choose \{player = 1}
			endif
		else
			if NOT ($is_network_game)
				formattext checksumname = player_status 'player%i_status' i = <player>
				if find_profile_by_id id = ($<player_status>.character_id)
					get_musician_profile_struct index = <index>
					formattext checksumname = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player>
					if getglobaltags <characterguitartags> noassert = 1
						change os_selected_outfit_p2 = (<current_outfit>)
						change os_selected_outfit_old_p2 = (<current_outfit>)
						change os_selected_style_p2 = (<current_style>)
						change os_selected_style_old_p2 = (<current_style>)
					endif
				endif
			endif
			createscreenelement \{type = containerelement
				id = select_outfit_container_p2
				parent = root_window
				pos = (810.0, 500.0)}
			create_ui_frame {
				frame_dims = (250.0, 185.0)
				center_pos = (0.0, 32.0)
				parent = select_outfit_container_p2
				frame_rgba = [180 150 175 75]
				fill_rgba = [50 25 40 185]
				z_priority = 0
				offset_top = 32
				offset_side = 32
				min_fill_pad_width = 73
				min_fill_pad_height = 63
				tex_param = 'simple'
				suffix = <player>
				check_side_swap = 0
			}
			displaytext {
				id = os_select_outfit_text_p2
				parent = select_outfit_container_p2
				text = "SELECT OUTFIT"
				pos = (0.0, -30.0)
				scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [center center]
				rgba = (($g_menu_colors).md_violet_grey)
				z = 1
			}
			displaysprite {
				id = os_name_background_p2
				parent = select_outfit_container_p2
				tex = char_select_frame_bg
				pos = (0.0, 30.0)
				dims = (266.0, 128.0)
				just = [center center]
				rgba = (($g_menu_colors).lt_violet_bar)
				z = 1
			}
			get_character_outfits player = <player>
			<curr_outfit> = $os_selected_outfit_p2
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			get_style_index_from_profile_style player = <player>
			curr_style = (<styles> [<style_index>])
			getuppercasestring (<character_outfits> [(<curr_outfit> - 1)].name)
			displaytext {
				id = os_outfit_name_id_p2
				parent = select_outfit_container_p2
				text = <uppercasestring>
				pos = (0.0, 20.0)
				scale = 1
				font = text_a4
				just = [center center]
				rgba = (($g_menu_colors).black)
				z = 2
				noshadow
			}
			getscreenelementdims \{id = os_outfit_name_id_p2}
			if (<width> > 260)
				fit_text_in_rectangle id = os_outfit_name_id_p2 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) pos = (0.0, 20.0)
			endif
			getuppercasestring <curr_style>
			displaytext {
				id = os_outfit_style_id_p2
				parent = select_outfit_container_p2
				text = <uppercasestring>
				pos = (2.0, 93.0)
				scale = (0.75, 0.5)
				font = text_a4
				just = [center center]
				rgba = (($g_menu_colors).lt_violet_bar)
				z = 2
				noshadow
			}
			getscreenelementdims \{id = os_outfit_style_id_p2}
			if (<width> > 230)
				fit_text_in_rectangle id = os_outfit_style_id_p2 dims = ((225.0, 0.0) + (<height> * (0.0, 1.0))) pos = (2.0, 93.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			get_character_name \{player = 2}
			get_initial_outfit_reference \{player = 2
				outfit2}
			formattext checksumname = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
			if getglobaltags <outfit_2_checksum> param = unlocked noassert = 1
				if NOT (<unlocked>)
					select_outfit_choose \{player = 2}
				endif
			else
				select_outfit_choose \{player = 2}
			endif
		endif
	endif
endscript

script scale_outfit_select_menu 
	<frames> = 30
	if gotparam \{make_big}
		change \{os_frame_is_big = 1}
		spawnscriptnow do_ui_frame_morph params = {
			start_dims = (280.0, 330.0)
			end_dims = (280.0, 600.0)
			start_pos = (0.0, 200.0)
			end_pos = (0.0, 335.0)
			frames = <frames>
			parent = select_outfit_container_p1
		}
		wait (<frames> + 2) gameframes
		killspawnedscript \{name = do_ui_frame_morph}
	elseif gotparam \{make_small}
		change \{os_frame_is_big = 0}
		spawnscriptnow do_ui_frame_morph params = {
			start_dims = (280.0, 600.0)
			end_dims = (280.0, 330.0)
			start_pos = (0.0, 335.0)
			end_pos = (0.0, 200.0)
			frames = <frames>
			parent = select_outfit_container_p1
		}
		wait (<frames> + 2) gameframes
		killspawnedscript \{name = do_ui_frame_morph}
	endif
endscript

script destroy_select_outfit_menu \{player = 1}
	formattext checksumname = scrolling_select_outfit 'scrolling_select_outfit_p%i' i = <player>
	formattext checksumname = select_outfit_container 'select_outfit_container_p%i' i = <player>
	formattext checksumname = scrolling_select_style 'scrolling_outfit_style_menu_p%i' i = <player>
	formattext checksumname = select_style_container 'select_style_container_p%i' i = <player>
	destroy_menu menu_id = <scrolling_select_outfit>
	destroy_menu menu_id = <select_outfit_container>
	destroy_menu menu_id = <scrolling_select_style>
	destroy_menu menu_id = <select_style_container>
endscript

script select_outfit_go_back \{player = 1}
	if (($is_network_game) && (<player> = 1))
		network_player_lobby_message \{type = outfit_select
			action = deselect}
	endif
	if ($current_num_players = 1)
		if NOT ($os_frame_is_big = 1)
			launchevent \{type = unfocus
				target = vmenu_select_outfit_p1}
			scale_outfit_select_menu \{make_big}
		endif
	endif
	formattext checksumname = player_status 'player%i_status' i = <player>
	formattext checksumname = this_outfit 'os_selected_outfit_p%i' i = <player>
	formattext checksumname = old_outfit 'os_selected_outfit_old_p%i' i = <player>
	formattext checksumname = old_style 'os_selected_style_old_p%i' i = <player>
	if NOT ($<old_outfit> = ($<player_status>.outfit) && $<old_style> = ($<player_status>.style))
		change structurename = <player_status> outfit = $<old_outfit>
		change structurename = <player_status> style = $<old_style>
		formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
		change globalname = <change_flag> newvalue = 1
	endif
	if (<player> = 1)
		change \{os_selected_outfit_p1 = $os_selected_outfit_old_p1}
	else
		change \{os_selected_outfit_p2 = $os_selected_outfit_old_p2}
	endif
	if (($is_network_game = 0) || (<player> = 1))
		if find_profile_by_id id = ($<player_status>.character_id)
			get_musician_profile_struct index = <index>
			formattext checksumname = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player>
			setglobaltags <characterguitartags> params = {current_outfit = ($<old_outfit>)}
		endif
	endif
	ui_flow_manager_respond_to_action action = go_back player = <player>
endscript

script os_scroll_up_or_down \{player = 1
		dir = down}
	generic_menu_up_or_down_sound params = {<dir>}
	if (<player> = 1)
		if ($os_made_first_selection_bool_p1 = 0)
			if ($os_selected_outfit_p1 = 1)
				get_character_name player = <player>
				get_initial_outfit_reference \{outfit2}
				formattext checksumname = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
				if getglobaltags <outfit_2_checksum> param = unlocked noassert = 1
					if (<unlocked>)
						change \{os_selected_outfit_p1 = 2}
					endif
				endif
			else
				change \{os_selected_outfit_p1 = 1}
			endif
			if ($is_network_game)
				network_player_lobby_message \{type = outfit_select
					action = update
					value1 = $os_selected_outfit_p1}
			endif
			if NOT ($os_selected_outfit_p1 = ($player1_status.outfit))
				change \{structurename = player1_status
					outfit = $os_selected_outfit_p1}
				get_character_outfits player = <player>
				<curr_outfit> = ($player1_status.outfit)
				if NOT ($os_selected_outfit_p1 = $os_selected_outfit_old_p1)
					<style> = (<character_outfits> [(<curr_outfit> - 1)].reference [0])
				else
					<style> = ($os_selected_style_p1)
				endif
				change structurename = player1_status style = <style>
				formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
				change globalname = <change_flag> newvalue = 1
				get_character_outfits player = <player>
				<curr_outfit> = ($player1_status.outfit)
				styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
				if ($os_selected_outfit_p1 = $os_selected_outfit_old_p1)
					get_style_index_from_profile_style player = <player>
					curr_style = (<styles> [<style_index>])
				else
					curr_style = (<styles> [0])
				endif
				getuppercasestring (<character_outfits> [(<curr_outfit> - 1)].name)
				setscreenelementprops id = os_outfit_name_id_p1 text = <uppercasestring>
				getuppercasestring <curr_style>
				setscreenelementprops id = os_outfit_style_id_p1 text = <uppercasestring>
				if ($current_num_players = 1)
					setscreenelementprops \{id = os_outfit_name_id_p1
						scale = (1.0, 1.0)}
					getscreenelementdims \{id = os_outfit_name_id_p1}
					fit_text_in_rectangle id = os_outfit_name_id_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) pos = (($gs_element_offsets [2]) + (-2.0, 8.0)) only_if_larger_x = 1
					getscreenelementdims \{id = os_outfit_style_id_p1}
					if (<width> > 256)
						fit_text_in_rectangle id = os_outfit_style_id_p1 dims = ((220.0, 0.0) + (<height> * (0.0, 1.0))) pos = ($gs_element_offsets [3]) start_x_scale = 0.55 start_y_scale = 0.55
					endif
				else
					setscreenelementprops \{id = os_outfit_name_id_p1
						scale = (1.0, 1.0)}
					getscreenelementdims \{id = os_outfit_name_id_p1}
					fit_text_in_rectangle id = os_outfit_name_id_p1 dims = ((250.0, 0.0) + (<height> * (0.0, 1.0))) pos = (0.0, 20.0) only_if_larger_x = 1
					getscreenelementdims \{id = os_outfit_style_id_p1}
					if (<width> > 230)
						fit_text_in_rectangle id = os_outfit_style_id_p1 dims = ((225.0, 0.0) + (<height> * (0.0, 1.0))) pos = (2.0, 93.0) start_x_scale = 0.75 start_y_scale = 0.5
					endif
				endif
			endif
		endif
	else
		if ($os_made_first_selection_bool_p2 = 0)
			if ($os_selected_outfit_p2 = 1)
				get_character_name player = <player>
				get_initial_outfit_reference player = <player> outfit2
				formattext checksumname = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
				if getglobaltags <outfit_2_checksum> param = unlocked noassert = 1
					if (<unlocked>)
						change \{os_selected_outfit_p2 = 2}
					endif
				endif
			else
				change \{os_selected_outfit_p2 = 1}
			endif
			if NOT ($os_selected_outfit_p2 = $player2_status.outfit)
				change \{structurename = player2_status
					outfit = $os_selected_outfit_p2}
				get_character_outfits player = <player>
				<curr_outfit> = ($player2_status.outfit)
				if NOT ($os_selected_outfit_p2 = $os_selected_outfit_old_p2)
					<style> = (<character_outfits> [(<curr_outfit> - 1)].reference [0])
				else
					<style> = ($os_selected_style_p2)
				endif
				change structurename = player2_status style = <style>
				formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
				change globalname = <change_flag> newvalue = 1
				get_character_outfits player = <player>
				<curr_outfit> = ($player2_status.outfit)
				styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
				if ($os_selected_outfit_p2 = $os_selected_outfit_old_p2)
					get_style_index_from_profile_style player = <player>
					curr_style = (<styles> [<style_index>])
				else
					curr_style = (<styles> [0])
				endif
				getuppercasestring (<character_outfits> [(<curr_outfit> - 1)].name)
				setscreenelementprops id = os_outfit_name_id_p2 text = <uppercasestring>
				getuppercasestring <curr_style>
				setscreenelementprops id = os_outfit_style_id_p2 text = <uppercasestring>
				getscreenelementdims \{id = os_outfit_name_id_p2}
				setscreenelementprops \{id = os_outfit_name_id_p2
					scale = 1}
				if (<width> > 260)
					fit_text_in_rectangle id = os_outfit_name_id_p2 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) pos = (0.0, 20.0)
				endif
				getscreenelementdims \{id = os_outfit_style_id_p2}
				if (<width> > 230)
					fit_text_in_rectangle id = os_outfit_style_id_p2 dims = ((225.0, 0.0) + (<height> * (0.0, 1.0))) pos = (2.0, 93.0) start_x_scale = 0.75 start_y_scale = 0.5
				endif
			endif
		endif
	endif
endscript

script select_outfit_choose \{player = 1
		needs_net_message = 1}
	soundevent \{event = ui_sfx_select}
	if (<player> = 1)
		if ($os_made_first_selection_bool_p1 = 1)
			change \{structurename = player1_status
				outfit = $os_selected_outfit_p1}
			change \{structurename = player1_status
				style = $os_selected_style_p1}
			if find_profile_by_id id = ($player1_status.character_id)
				get_musician_profile_struct index = <index>
				formattext checksumname = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player>
				setglobaltags <characterguitartags> params = {current_outfit = ($os_selected_outfit_p1) current_style = ($os_selected_style_p1)}
			endif
			change \{os_selected_outfit_old_p1 = $os_selected_outfit_p1}
			change \{os_selected_style_old_p1 = $os_selected_style_p1}
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{type = style_select
					action = select
					value1 = $os_selected_style_p1}
			endif
			ui_flow_manager_respond_to_action action = select_character_hub player = <player> create_params = {player = <player>} destroy_params = {player = <player>}
		else
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{type = outfit_select
					action = select
					checksum = $os_selected_outfit_p1}
			endif
			if ($current_num_players = 1)
				if NOT ($os_frame_is_big = 1)
					launchevent \{type = unfocus
						target = vmenu_select_outfit_p1}
					scale_outfit_select_menu \{make_big}
				endif
			endif
			select_outfit_create_style_menu player = <player>
			change \{os_made_first_selection_bool_p1 = 1}
		endif
	else
		if ($os_made_first_selection_bool_p2 = 1)
			change \{structurename = player2_status
				outfit = $os_selected_outfit_p2}
			change \{structurename = player2_status
				style = $os_selected_style_p2}
			if NOT ($is_network_game)
				if find_profile_by_id id = ($player2_status.character_id)
					get_musician_profile_struct index = <index>
					formattext checksumname = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.name) p = <player>
					setglobaltags <characterguitartags> params = {current_outfit = ($os_selected_outfit_p2) current_style = ($os_selected_style_p2)}
				endif
			endif
			change \{os_selected_outfit_old_p2 = $os_selected_outfit_p2}
			change \{os_selected_style_old_p2 = $os_selected_style_p2}
			ui_flow_manager_respond_to_action action = select_character_hub player = <player> create_params = {player = <player>} destroy_params = {player = <player>}
		else
			select_outfit_create_style_menu player = <player>
			change \{os_made_first_selection_bool_p2 = 1}
		endif
	endif
endscript

script select_outfit_create_style_menu \{player = 1}
	formattext checksumname = player_status 'player%i_status' i = <player>
	font = text_a4
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	if ((($is_network_game) = 1) && (<player> = 1))
		pad_back_script = net_destroy_select_style_menu
	else
		pad_back_script = destroy_select_style_menu
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back <pad_back_script> params = {player = <player>}}
		{pad_start menu_show_gamercard}
	]
	<p1_menu_pos> = (566.0, 480.0)
	<p2_menu_pos> = (786.0, 490.0)
	<menu_offset> = (-270.0, -160.0)
	if (<player> = 1)
		if ($current_num_players = 2)
			new_menu {
				scrollid = scrolling_outfit_style_menu_p1
				vmenuid = vmenu_outfit_style_menu_p1
				use_backdrop = 0
				event_handlers = <event_handlers>
				menu_pos = (<p1_menu_pos> + (-178.0, -210.0))
				exclusive_device = <exclusive_dev>
				internal_just = [center top]
			}
		else
			new_menu {
				scrollid = scrolling_outfit_style_menu_p1
				vmenuid = vmenu_outfit_style_menu_p1
				use_backdrop = 0
				event_handlers = <event_handlers>
				menu_pos = (<p1_menu_pos> + <menu_offset>)
				internal_just = [center top]
				text_left
			}
		endif
		vparent = vmenu_outfit_style_menu_p1
	else
		new_menu {
			scrollid = scrolling_outfit_style_menu_p2
			vmenuid = vmenu_outfit_style_menu_p2
			use_backdrop = 0
			event_handlers = <event_handlers>
			menu_pos = <p2_menu_pos>
			exclusive_device = <exclusive_dev>
			internal_just = [center top]
		}
		if ($is_network_game = 1)
			vmenu_outfit_style_menu_p2 :setprops \{disable_pad_handling}
			launchevent \{type = unfocus
				target = vmenu_outfit_style_menu_p2}
		endif
		vparent = vmenu_outfit_style_menu_p2
	endif
	if (<player> = 1)
		launchevent \{type = unfocus
			target = scrolling_select_outfit_p1}
		launchevent \{type = unfocus
			target = scrolling_outfit_style_menu_p1}
	else (<player> = 2)
		launchevent \{type = unfocus
			target = scrolling_select_outfit_p2}
	endif
	if ($current_num_players = 1)
		createscreenelement {
			type = containerelement
			id = select_style_container
			parent = root_window
			pos = (<p1_menu_pos> + <menu_offset>)
			internal_just = [center top]
		}
		setscreenelementprops \{id = os_name_background
			texture = char_select_frame_bg2
			rgba = [
				210
				120
				155
				255
			]}
		setscreenelementprops {
			id = os_outfit_name_id_p1
			shadow_rgba = (($g_menu_colors).frame_rgba)
		}
		getscreenelementdims \{id = os_outfit_name_id_p1}
		getscreenelementprops \{id = os_outfit_name_id_p1}
		if (<scale> = 1)
			<x_scale> = 1.0
			<y_scale> = 1.0
		else
			<x_scale> = (<scale>.(1.0, 0.0))
			<y_scale> = (<scale>.(0.0, 1.0))
		endif
		fit_text_in_rectangle id = os_outfit_name_id_p1 dims = ((250.0, 0.0) + (<height> * (0.0, 1.0))) only_if_larger_x = 1 start_x_scale = <x_scale> start_y_scale = <y_scale>
		displaysprite {
			id = os_bookend1_id
			parent = select_style_container
			tex = character_hub_hilite_bookend
			dims = (24.0, 32.0)
			just = [left top]
			rgba = (($g_menu_colors).md_violet_grey)
			z = 4
			flip_v
		}
		displaysprite {
			id = os_bookend2_id
			parent = select_style_container
			tex = character_hub_hilite_bookend
			dims = (24.0, 32.0)
			just = [right top]
			rgba = (($g_menu_colors).md_violet_grey)
			z = 4
		}
		displaysprite {
			id = os_whitetexhighlight_id
			parent = select_style_container
			tex = hilite_bar_01
			just = [left top]
			rgba = (($g_menu_colors).md_violet_grey)
			dims = (264.0, 32.0)
			pos = (-37.0, 8.0)
			z = 2
		}
		set_focus_color \{color = black}
		set_unfocus_color \{color = dk_violet_grey}
		get_character_outfits player = <player>
		outfit = ($player1_status.outfit)
		styles = (<character_outfits> [(<outfit> - 1)].styles)
		getarraysize <styles>
		<num_in_list> = 0
		<i> = 0
		begin
		<add_style> = 1
		if NOT (<i> = 0)
			get_character_name player = <player>
			formattext checksumname = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = (<character_outfits> [(<outfit> - 1)].reference [<i>])
			if getglobaltags <outfit_style_cs> param = unlocked noassert = 1
				if (<unlocked> = 0)
					<add_style> = 0
				endif
			else
				<add_style> = 0
			endif
		endif
		formattext checksumname = os_style_menu_item_id 'os_style_menu_item_%n' n = <i>
		getuppercasestring (<styles> [<i>])
		if (<add_style>)
			<num_in_list> = (<num_in_list> + 1)
			createscreenelement {
				id = <os_style_menu_item_id>
				type = textelement
				parent = <vparent>
				font = text_a4
				scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [center top]
				text = <uppercasestring>
				event_handlers = [
					{focus retail_menu_focus}
					{focus select_outfit_style_highlight params = {player = <player>
							index = <i>
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose select_outfit_style_choose params = {player = <player>}}
				]
			}
			getscreenelementdims id = <id>
			if (<width> > 180)
				setscreenelementprops id = <id> scale = (1.0, 1.0)
				fit_text_in_rectangle id = <id> dims = ((180.0, 34.0))
			endif
		else
			createscreenelement {
				type = textelement
				parent = <vparent>
				font = text_a4
				scale = (0.7, 0.7)
				rgba = [128 128 128 75]
				just = [center top]
				text = <uppercasestring>
				not_focusable
			}
			getscreenelementdims id = <id>
			if (<width> > 180)
				setscreenelementprops id = <id> scale = (1.0, 1.0)
				fit_text_in_rectangle id = <id> dims = ((180.0, 34.0))
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		if (<num_in_list> = 1)
			change \{os_made_first_selection_bool_p1 = 1}
			select_outfit_style_highlight {
				player = <player>
			}
			select_outfit_style_choose {
				player = <player>
			}
		else
			launchevent \{type = focus
				target = scrolling_outfit_style_menu_p1}
			if ($os_selected_outfit_p1 = $os_selected_outfit_old_p1)
				get_style_index_from_profile_style player = <player>
				if (<style_index> > 0)
					change \{disable_menu_sounds = 1}
					begin
					launchevent type = pad_down target = <vparent>
					if ($os_selected_style_p1 = $os_selected_style_old_p1)
						break
					endif
					repeat (<style_index>)
					change \{disable_menu_sounds = 0}
				endif
			endif
		endif
	else
		if (<player> = 1)
			launchevent \{type = unfocus
				target = scrolling_select_outfit_p1}
			launchevent type = focus target = <vparent>
			setscreenelementprops \{id = os_select_outfit_text_p1
				text = "SELECT STYLE"}
			setscreenelementprops \{id = os_name_background_p1
				pos = (0.0, 58.0)}
			get_character_outfits player = <player>
			outfit = ($player1_status.outfit)
			styles = (<character_outfits> [(<outfit> - 1)].styles)
			curr_style = (<styles> [(($player1_status.style) - 1)])
			getuppercasestring (<character_outfits> [(<outfit> - 1)].name)
			setscreenelementprops {
				id = os_outfit_name_id_p1
				text = <uppercasestring>
				scale = (0.75, 0.5)
				pos = (0.0, -13.0)
				rgba = (($g_menu_colors).light_brown)
			}
			getscreenelementdims \{id = os_outfit_name_id_p1}
			fit_text_in_rectangle id = os_outfit_name_id_p1 dims = ((250.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, -6.0) only_if_larger_x = 1
			getuppercasestring <curr_style>
			setscreenelementprops {
				id = os_outfit_style_id_p1
				text = <uppercasestring>
				scale = 1
				pos = (0.0, 48.0)
				rgba = (($g_menu_colors).black)
			}
			getscreenelementdims \{id = os_outfit_style_id_p1}
			if (<width> > 260)
				fit_text_in_rectangle id = os_outfit_style_id_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 48.0)
			endif
			getarraysize <styles>
			<num_in_list> = 0
			<i> = 0
			begin
			<add_style> = 1
			if NOT (<i> = 0)
				get_character_name player = <player>
				formattext checksumname = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = (<character_outfits> [(<outfit> - 1)].reference [<i>])
				if getglobaltags <outfit_style_cs> param = unlocked noassert = 1
					if (<unlocked> = 0)
						<add_style> = 0
					endif
				else
					<add_style> = 0
				endif
			endif
			if (<add_style>)
				<num_in_list> = (<num_in_list> + 1)
				getuppercasestring (<styles> [<i>])
				createscreenelement {
					type = textelement
					parent = <vparent>
					font = text_a4
					scale = (0.7, 0.7)
					rgba = ($menu_unfocus_color)
					just = [center top]
					text = <uppercasestring>
					event_handlers = [
						{focus retail_menu_focus}
						{focus select_outfit_style_highlight params = {player = <player>
								index = <i>
							}
						}
						{unfocus retail_menu_unfocus}
						{pad_choose select_outfit_style_choose params = {
								player = <player>
							}
						}
					]
					exclusive_device = <exclusive_dev>
					hide
				}
				getscreenelementdims id = <id>
				if (<width> > 180)
					fit_text_in_rectangle id = <id> dims = (0.7 * ((160.0, 0.0) + (<height> * (0.0, 1.0)))) pos = (<p1_menu_pos> + <menu_offset>)
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_size>
			if (<num_in_list> = 1)
				change \{os_made_first_selection_bool_p1 = 1}
				select_outfit_style_highlight {
					needs_net_message = 0
					player = <player>
				}
				select_outfit_style_choose {
					needs_net_message = 0
					player = <player>
				}
			else
				if ($os_selected_outfit_p1 = $os_selected_outfit_old_p1)
					get_style_index_from_profile_style player = <player>
					if (<style_index> > 0)
						change \{disable_menu_sounds = 1}
						begin
						launchevent type = pad_down target = <vparent>
						if ($os_selected_style_p1 = $os_selected_style_old_p1)
							break
						endif
						repeat (<style_index>)
						change \{disable_menu_sounds = 0}
					endif
				endif
			endif
		else
			launchevent \{type = unfocus
				target = scrolling_select_outfit_p2}
			if ($is_network_game = 0)
				launchevent type = focus target = <vparent>
			endif
			setscreenelementprops \{id = os_select_outfit_text_p2
				text = "SELECT STYLE"}
			setscreenelementprops \{id = os_name_background_p2
				pos = (0.0, 58.0)}
			get_character_outfits player = <player>
			<outfit> = ($player2_status.outfit)
			styles = (<character_outfits> [(<outfit> - 1)].styles)
			curr_style = (<styles> [(($player2_status.style) - 1)])
			getuppercasestring (<character_outfits> [(<outfit> - 1)].name)
			setscreenelementprops {
				id = os_outfit_name_id_p2
				text = <uppercasestring>
				scale = (0.75, 0.5)
				pos = (0.0, -13.0)
				rgba = (($g_menu_colors).lt_violet_bar)
			}
			getscreenelementdims \{id = os_outfit_name_id_p2}
			if (<width> > 260)
				fit_text_in_rectangle id = os_outfit_name_id_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, -6.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			getuppercasestring <curr_style>
			setscreenelementprops {
				id = os_outfit_style_id_p2
				text = <uppercasestring>
				scale = 1
				pos = (0.0, 48.0)
				rgba = (($g_menu_colors).black)
			}
			getscreenelementdims \{id = os_outfit_style_id_p2}
			if (<width> > 260)
				fit_text_in_rectangle id = os_outfit_style_id_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 48.0)
			endif
			getarraysize <styles>
			<num_in_list> = 0
			<i> = 0
			begin
			<add_style> = 1
			if NOT (<i> = 0)
				get_character_name player = <player>
				formattext checksumname = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = (<character_outfits> [(<outfit> - 1)].reference [<i>])
				if getglobaltags <outfit_style_cs> param = unlocked noassert = 1
					if (<unlocked> = 0)
						<add_style> = 0
					endif
				else
					<add_style> = 0
				endif
			endif
			if (<add_style>)
				<num_in_list> = (<num_in_list> + 1)
				getuppercasestring (<styles> [<i>])
				createscreenelement {
					type = textelement
					parent = <vparent>
					font = text_a4
					scale = (0.7, 0.7)
					rgba = ($menu_unfocus_color)
					just = [center top]
					text = <uppercasestring>
					event_handlers = [
						{focus retail_menu_focus}
						{focus select_outfit_style_highlight params = {player = <player>
								index = <i>
							}
						}
						{unfocus retail_menu_unfocus}
						{pad_choose select_outfit_style_choose params = {
								player = <player>
							}
						}
					]
					exclusive_device = <exclusive_dev>
					hide
				}
				getscreenelementdims id = <id>
				if (<width> > 180)
					fit_text_in_rectangle id = <id> dims = (0.7 * ((160.0, 0.0) + (<height> * (0.0, 1.0)))) pos = (<p2_menu_pos> + <menu_offset>)
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_size>
			if (<num_in_list> = 1)
				change \{os_made_first_selection_bool_p2 = 1}
				select_outfit_style_highlight {
					player = <player>
				}
				select_outfit_style_choose {
					player = <player>
				}
			else
				if ($os_selected_outfit_p2 = $os_selected_outfit_old_p2)
					get_style_index_from_profile_style player = <player>
					if (<style_index> > 0)
						change \{disable_menu_sounds = 1}
						begin
						launchevent type = pad_down target = <vparent>
						if ($os_selected_style_p2 = $os_selected_style_old_p2)
							break
						endif
						repeat (<style_index>)
						change \{disable_menu_sounds = 0}
					endif
				endif
			endif
		endif
	endif
endscript

script net_destroy_select_style_menu \{player = 1}
	if ($is_network_game)
		network_player_lobby_message \{type = style_select
			action = deselect}
	endif
	destroy_select_style_menu player = <player>
endscript

script destroy_select_style_menu \{player = 1}
	soundevent \{event = generic_menu_back_sfx}
	if ($current_num_players = 1)
		launchevent \{type = unfocus
			target = scrolling_outfit_style_menu_p1}
		destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
		change \{os_made_first_selection_bool_p1 = 0}
		destroy_menu \{menu_id = select_style_container}
		formattext checksumname = old_outfit 'os_selected_outfit_old_p%i' i = <player>
		formattext checksumname = old_style 'os_selected_style_old_p%i' i = <player>
		if NOT ($<old_outfit> = ($player1_status.outfit) && $<old_style> = ($player1_status.style))
			change structurename = player1_status outfit = $<old_outfit>
			change structurename = player1_status style = $<old_style>
			formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
			change globalname = <change_flag> newvalue = 1
		endif
		change os_selected_outfit_p1 = $<old_outfit>
		change os_selected_style_p1 = $<old_style>
		get_character_name \{player = 1}
		get_initial_outfit_reference \{outfit2}
		formattext checksumname = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
		if getglobaltags <outfit_2_checksum> param = unlocked noassert = 1
			if (<unlocked>)
				if ($os_frame_is_big = 1)
					scale_outfit_select_menu \{make_small}
				endif
			endif
		endif
		if screenelementexists \{id = scrolling_select_outfit_p1}
			launchevent \{type = focus
				target = scrolling_select_outfit_p1}
		endif
		setscreenelementprops {
			id = os_name_background
			texture = char_select_frame_bg
			dims = (266.0, 128.0)
			rgba = (($g_menu_colors).lt_violet_grey)
		}
		setscreenelementprops {
			id = os_outfit_name_id_p1
			shadow_rgba = (($g_menu_colors).lt_violet_grey)
		}
		get_character_outfits player = <player>
		<curr_outfit> = ($player1_status.outfit)
		styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
		get_style_index_from_profile_style player = <player>
		curr_style = (<styles> [<style_index>])
		getuppercasestring (<character_outfits> [(<curr_outfit> - 1)].name)
		setscreenelementprops id = os_outfit_name_id_p1 text = <uppercasestring>
		getuppercasestring <curr_style>
		setscreenelementprops id = os_outfit_style_id_p1 text = <uppercasestring>
		setscreenelementprops \{id = os_outfit_name_id_p1
			scale = (1.0, 1.0)}
		getscreenelementdims \{id = os_outfit_name_id_p1}
		fit_text_in_rectangle id = os_outfit_name_id_p1 dims = ((250.0, 0.0) + (<height> * (0.0, 1.0))) pos = (($gs_element_offsets [2]) + (0.0, 8.0)) only_if_larger_x = 1
		get_character_name \{player = 1}
		get_initial_outfit_reference \{outfit2}
		formattext checksumname = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
		if getglobaltags <outfit_2_checksum> param = unlocked noassert = 1
			if NOT (<unlocked>)
				select_outfit_go_back \{player = 1}
			endif
		else
			select_outfit_go_back \{player = 1}
		endif
	else
		if (<player> = 1)
			setscreenelementprops \{id = os_select_outfit_text_p1
				text = "SELECT OUTFIT"}
			launchevent \{type = focus
				target = scrolling_select_outfit_p1}
			launchevent \{type = unfocus
				target = scrolling_outfit_style_menu_p1}
			destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
			change \{os_made_first_selection_bool_p1 = 0}
			formattext checksumname = old_outfit 'os_selected_outfit_old_p%i' i = <player>
			formattext checksumname = old_style 'os_selected_style_old_p%i' i = <player>
			if NOT ($<old_outfit> = ($player1_status.outfit) && $<old_style> = ($player1_status.style))
				change structurename = player1_status outfit = $<old_outfit>
				change structurename = player1_status style = $<old_style>
				formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
				change globalname = <change_flag> newvalue = 1
			endif
			change os_selected_outfit_p1 = $<old_outfit>
			change os_selected_style_p1 = $<old_style>
			get_character_outfits player = <player>
			<curr_outfit> = ($player1_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			get_style_index_from_profile_style player = <player>
			curr_style = (<styles> [<style_index>])
			setscreenelementprops \{id = os_name_background_p1
				pos = (0.0, 30.0)}
			getuppercasestring (<character_outfits> [(<curr_outfit> - 1)].name)
			setscreenelementprops {
				id = os_outfit_name_id_p1
				text = <uppercasestring>
				scale = 1
				pos = (0.0, 20.0)
				rgba = (($g_menu_colors).black)
			}
			getscreenelementdims \{id = os_outfit_name_id_p1}
			fit_text_in_rectangle id = os_outfit_name_id_p1 dims = ((250.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 20.0) only_if_larger_x = 1
			getuppercasestring <curr_style>
			setscreenelementprops {
				id = os_outfit_style_id_p1
				text = <uppercasestring>
				scale = (0.75, 0.5)
				pos = (2.0, 93.0)
				rgba = (($g_menu_colors).light_brown)
			}
			getscreenelementdims \{id = os_outfit_style_id_p1}
			if (<width> > 230)
				fit_text_in_rectangle id = os_outfit_style_id_p1 dims = ((225.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (2.0, 93.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			get_character_name \{player = 1}
			get_initial_outfit_reference \{outfit2}
			formattext checksumname = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
			if getglobaltags <outfit_2_checksum> param = unlocked noassert = 1
				if NOT (<unlocked>)
					select_outfit_go_back \{player = 1}
				endif
			else
				select_outfit_go_back \{player = 1}
			endif
		else
			setscreenelementprops \{id = os_select_outfit_text_p2
				text = "SELECT OUTFIT"}
			launchevent \{type = focus
				target = scrolling_select_outfit_p2}
			launchevent \{type = unfocus
				target = scrolling_outfit_style_menu_p2}
			destroy_menu \{menu_id = scrolling_outfit_style_menu_p2}
			change \{os_made_first_selection_bool_p2 = 0}
			formattext checksumname = old_outfit 'os_selected_outfit_old_p%i' i = <player>
			formattext checksumname = old_style 'os_selected_style_old_p%i' i = <player>
			if NOT ($<old_outfit> = ($player2_status.outfit) && $<old_style> = ($player2_status.style))
				change structurename = player2_status outfit = $<old_outfit>
				change structurename = player2_status style = $<old_style>
				formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
				change globalname = <change_flag> newvalue = 1
			endif
			change os_selected_outfit_p2 = $<old_outfit>
			change os_selected_style_p2 = $<old_style>
			get_character_outfits player = <player>
			<curr_outfit> = ($player2_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			get_style_index_from_profile_style player = <player>
			curr_style = (<styles> [<style_index>])
			setscreenelementprops \{id = os_name_background_p2
				pos = (0.0, 30.0)}
			getuppercasestring (<character_outfits> [(<curr_outfit> - 1)].name)
			setscreenelementprops {
				id = os_outfit_name_id_p2
				text = <uppercasestring>
				scale = 1
				pos = (0.0, 20.0)
				rgba = (($g_menu_colors).black)
			}
			getscreenelementdims \{id = os_outfit_name_id_p2}
			if (<width> > 260)
				fit_text_in_rectangle id = os_outfit_name_id_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 20.0)
			endif
			getuppercasestring <curr_style>
			setscreenelementprops {
				id = os_outfit_style_id_p2
				text = <uppercasestring>
				scale = (0.75, 0.5)
				pos = (2.0, 93.0)
				rgba = (($g_menu_colors).lt_violet_bar)
			}
			getscreenelementdims \{id = os_outfit_style_id_p2}
			if (<width> > 230)
				fit_text_in_rectangle id = os_outfit_style_id_p2 dims = ((225.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (2.0, 93.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			get_character_name \{player = 2}
			get_initial_outfit_reference \{player = 2
				outfit2}
			formattext checksumname = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
			if getglobaltags <outfit_2_checksum> param = unlocked noassert = 1
				if NOT (<unlocked>)
					select_outfit_go_back \{player = 2}
				endif
			else
				select_outfit_go_back \{player = 2}
			endif
		endif
	endif
	if (<player> = 1)
		destroy_menu \{menu_id = select_style_container}
	else
		destroy_menu \{menu_id = select_style_container_p2}
	endif
endscript

script select_outfit_style_highlight \{player = 1
		index = 0
		needs_net_message = 1}
	get_character_outfits player = <player>
	if (<player> = 1)
		<curr_outfit> = ($player1_status.outfit)
	else
		<curr_outfit> = ($player2_status.outfit)
	endif
	formattext checksumname = player_status 'player%i_status' i = <player>
	formattext checksumname = selected_outfit 'os_selected_outfit_p%i' i = <player>
	<our_style> = (<character_outfits> [(<curr_outfit> - 1)].reference [<index>])
	if NOT ($<selected_outfit> = ($<player_status>.outfit) && <our_style> = ($<player_status>.style))
		change structurename = <player_status> style = <our_style>
		formattext checksumname = change_flag 'generic_select_monitor_p%i_changed' i = <player>
		change globalname = <change_flag> newvalue = 1
	endif
	if (<player> = 1)
		change os_selected_style_p1 = <our_style>
	else
		change os_selected_style_p2 = <our_style>
	endif
	styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
	curr_style = (<styles> [(<index>)])
	if ($current_num_players = 1)
		getuppercasestring (<character_outfits> [(<curr_outfit> - 1)].name)
		setscreenelementprops id = os_outfit_name_id_p1 text = <uppercasestring>
		getuppercasestring <curr_style>
		setscreenelementprops id = os_outfit_style_id_p1 text = <uppercasestring>
		<offset> = (<index> * (0.0, 34.1))
		<l_pos> = ((-61.0, 7.0) + <offset>)
		<r_pos> = ((250.0, 7.0) + <offset>)
		<hl_pos> = ((-37.0, 8.0) + <offset>)
		setscreenelementprops id = os_bookend1_id pos = <l_pos> preserve_flip
		setscreenelementprops id = os_bookend2_id pos = <r_pos>
		setscreenelementprops id = os_whitetexhighlight_id pos = <hl_pos>
	else
		if (<player> = 1)
			getuppercasestring <curr_style>
			setscreenelementprops {
				id = os_outfit_style_id_p1
				text = <uppercasestring>
			}
			setscreenelementprops \{id = os_outfit_style_id_p1
				scale = (1.0, 1.0)}
			getscreenelementdims \{id = os_outfit_style_id_p1}
			if (<width> > 260)
				fit_text_in_rectangle id = os_outfit_style_id_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 48.0)
			endif
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{type = style_select
					action = update
					value1 = $os_selected_style_p1}
			endif
		else
			getuppercasestring <curr_style>
			setscreenelementprops {
				id = os_outfit_style_id_p2
				text = <uppercasestring>
			}
			setscreenelementprops \{id = os_outfit_style_id_p2
				scale = 1}
			getscreenelementdims \{id = os_outfit_style_id_p2}
			if (<width> > 260)
				fit_text_in_rectangle id = os_outfit_style_id_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) pos = (0.0, 48.0)
			endif
		endif
	endif
endscript

script select_outfit_style_choose \{player = 1
		needs_net_message = 1}
	if (<player> = 1)
		select_outfit_choose {
			player = <player>
			needs_net_message = <needs_net_message>
		}
	else
		select_outfit_choose {
			player = <player>
		}
	endif
	if (<player> = 1)
		destroy_menu \{menu_id = select_style_container}
		destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
	else
		destroy_menu \{menu_id = select_style_container_p2}
		destroy_menu \{menu_id = scrolling_outfit_style_menu_p2}
	endif
endscript
