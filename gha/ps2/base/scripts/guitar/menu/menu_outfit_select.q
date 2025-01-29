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

script get_style_index_from_profile_style \{Player = 1}
	get_character_outfits Player = <Player>
	formatText checksumName = player_status 'player%i_status' i = <Player>
	<curr_outfit> = ($<player_status>.outfit)
	if GotParam \{style}
		<curr_style> = <style>
	else
		<curr_style> = ($<player_status>.style)
	endif
	GetArraySize (<character_outfits> [(<curr_outfit> - 1)].reference)
	<i> = 0
	begin
	if ((<character_outfits> [(<curr_outfit> - 1)].reference [<i>]) = <curr_style>)
		return style_index = <i>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script get_initial_outfit_reference \{Player = 1}
	if GotParam \{character_id}
		get_character_outfits Player = <Player> character_id = <character_id>
	else
		get_character_outfits Player = <Player>
	endif
	if GotParam \{no_outfits}
		return \{reference = 1}
	endif
	if GotParam \{outfit2}
		<index> = 1
	else
		<index> = 0
	endif
	GetArraySize <character_outfits>
	if (<array_Size> <= <index>)
		return \{reference = 1}
	endif
	if StructureContains structure = (<character_outfits> [<index>]) reference
		return reference = (<character_outfits> [<index>].reference [0])
	else
		return \{reference = 1}
	endif
endscript

script get_random_aero_outfit 
	if NOT GotParam \{character_id}
		ScriptAssert \{'You need to pass a character_id to script get_random_aero_outfit!'}
	endif
	get_character_outfits character_id = <character_id>
	if GotParam \{no_outfits}
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
	elseif (<character_id> = dmc)
		return \{random_outfit = 1
			random_style = 1}
	elseif ((<character_id> = Satan))
		<style1> = 2
		<style2> = 4
	else
		<outfit2> = 2
		<style1> = 5
		<style2> = 7
	endif
	begin
	GetRandomValue a = <outfit1> b = <outfit2> Name = random_outfit integer
	GetRandomValue a = <style1> b = <style2> Name = random_style integer
	formatText checksumName = outfit_checksum 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <random_outfit> s = <random_style>
	if GetGlobalTags <outfit_checksum> noassert = 1
		if (<unlocked>)
			return random_outfit = <random_outfit> random_style = <random_style>
		endif
	else
		break
	endif
	repeat 6
	if ((<character_id> = joep) || (<character_id> = bradw) || (<character_id> = tomh))
		return \{random_outfit = 1
			random_style = 1}
	elseif ((<character_id> = Satan))
		return \{random_outfit = 1
			random_style = 2}
	elseif ((<character_id> = 0x641a743f) || (<character_id> = robot))
		return \{random_outfit = 1
			random_style = 7}
	else
		return \{random_outfit = 1
			random_style = 5}
	endif
endscript

script create_select_outfit_menu \{Player = 1}
	formatText checksumName = player_status 'player%i_status' i = <Player>
	if (<Player> = 1)
		Change \{os_made_first_selection_bool_p1 = 0}
	else
		Change \{os_made_first_selection_bool_p2 = 0}
	endif
	font = text_a4
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	if ((($is_network_game) = 1) && (<Player> = 1))
		pad_back_script = net_outfit_menu_flow_go_back
	else
		pad_back_script = menu_flow_go_back
	endif
	event_handlers = [
		{pad_up os_scroll_up_or_down params = {
				Player = <Player>
				Dir = up
			}
		}
		{pad_down os_scroll_up_or_down params = {
				Player = <Player>
				Dir = down
			}
		}
		{pad_back select_outfit_go_back params = {
				Player = <Player>
			}
		}
		{pad_choose select_outfit_choose params = {
				Player = <Player>
			}
		}
	]
	if (<Player> = 1)
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
			vmenu_select_outfit_p2 :SetProps \{disable_pad_handling}
			LaunchEvent \{Type = unfocus
				target = vmenu_select_outfit_p2}
		endif
		vparent = vmenu_select_outfit_p2
	endif
	if ($current_num_players = 1)
		LaunchEvent \{Type = unfocus
			target = vmenu_select_outfit_p1}
		formatText checksumName = player_status 'player%i_status' i = <Player>
		if find_profile_by_id id = ($<player_status>.character_id)
			get_musician_profile_struct index = <index>
			formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
			if GetGlobalTags <characterguitartags> noassert = 1
				Change os_selected_outfit_p1 = (<current_outfit>)
				Change os_selected_outfit_old_p1 = (<current_outfit>)
				Change os_selected_style_p1 = (<current_style>)
				Change os_selected_style_old_p1 = (<current_style>)
			endif
		endif
		CreateScreenElement \{Type = ContainerElement
			id = select_outfit_container_p1
			parent = root_window
			Pos = (366.0, 0.0)}
		frame_dims = (280.0, 600.0)
		center_pos = (0.0, 335.0)
		Change \{os_frame_is_big = 1}
		create_ui_frame {
			parent = select_outfit_container_p1
			frame_dims = <frame_dims>
			center_pos = <center_pos>
			frame_rgba = (($g_menu_colors).frame_rgba)
			fill_rgba = (($g_menu_colors).fill_rgba)
			z_priority = 0
		}
		header_pos = (<center_pos> - ((<frame_dims>.(0.0, 1.0)) * (0.0, 0.5) - (0.0, 70.0)))
		CreateScreenElement {
			Type = SpriteElement
			parent = select_outfit_container_p1
			Pos = <header_pos>
			id = os_frame_header_01
			just = [center bottom]
			texture = window_header_01
			rgba = (($g_menu_colors).lt_violet_grey)
			z_priority = 1
		}
		scale_header = (0.85, 0.8)
		if French
			<scale_header> = (0.7, 0.8)
		endif
		CreateScreenElement {
			Type = TextElement
			parent = select_outfit_container_p1
			text = 'SELECT OUTFIT'
			id = 0x827d3dc9
			Pos = ($gs_element_offsets [0] + (0.0, 15.0))
			Scale = <scale_header>
			font = fontgrid_title_gh3
			just = [center center]
			rgba = (($g_menu_colors).pink)
			z_priority = 1
		}
		fit_text_in_rectangle \{id = 0x827d3dc9
			only_if_larger_x = 1
			dims = (200.0, 37.0)}
		CreateScreenElement {
			Type = SpriteElement
			id = os_name_background
			parent = select_outfit_container_p1
			texture = Char_Select_Frame_BG
			Pos = ($gs_element_offsets [2] + (0.0, 10.0))
			dims = (266.0, 128.0)
			just = [center center]
			rgba = (($g_menu_colors).lt_violet_grey)
			z_priority = 1
		}
		get_character_outfits Player = <Player>
		<curr_outfit> = $os_selected_outfit_p1
		styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
		get_style_index_from_profile_style Player = <Player>
		curr_style = (<styles> [<style_index>])
		GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
		CreateScreenElement {
			Type = TextElement
			id = os_outfit_name_ID_p1
			parent = select_outfit_container_p1
			text = <UppercaseString>
			Pos = ($gs_element_offsets [2] - (0.0, 4.0))
			Scale = 1.3499999
			font = fontgrid_title_gh3
			just = [center center]
			rgba = (($g_menu_colors).black)
			z_priority = 2
			Shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = (($g_menu_colors).lt_violet_grey)
		}
		GetScreenElementDims \{id = os_outfit_name_ID_p1}
		if (<width> > 256)
			SetScreenElementProps \{id = os_outfit_name_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((240.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (0.0, -4.0)) only_if_larger_x = 1
		endif
		GetUpperCaseString <curr_style>
		CreateScreenElement {
			id = os_outfit_style_ID_p1
			Type = TextBlockElement
			parent = select_outfit_container_p1
			text = <UppercaseString>
			Pos = ($gs_element_offsets [3] + (2.0, 9.0))
			Scale = 0.8
			dims = (280.0, 300.0)
			font = text_a4
			just = [center center]
			rgba = (($g_menu_colors).lt_violet_grey)
			z = 2
		}
		GetScreenElementDims \{id = os_outfit_style_ID_p1}
		stringremove text = <UppercaseString> remove = ' ' new_string = test_string
		StringLength string = <UppercaseString>
		if (<UppercaseString> = <test_string> && <str_len> > 12)
			SetScreenElementProps \{id = os_outfit_style_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((210.0, 0.0) + (<height> * (0.0, 1.0))) Pos = ($gs_element_offsets [3] + (2.0, 9.0))
		elseif (<UppercaseString> != <test_string> && <str_len> > 16)
			SetScreenElementProps \{id = os_outfit_style_ID_p1
				Scale = 0.65000004}
		else
			SetScreenElementProps \{id = os_outfit_style_ID_p1
				Scale = 0.8}
		endif
		get_character_name \{Player = 1}
		get_initial_outfit_reference \{outfit2}
		formatText checksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
		if GetGlobalTags <outfit_2_checksum> param = unlocked noassert = 1
			if NOT (<unlocked>)
				select_outfit_choose \{Player = 1}
			else
				scale_outfit_select_menu \{make_small}
				LaunchEvent \{Type = focus
					target = vmenu_select_outfit_p1}
			endif
		else
			select_outfit_choose \{Player = 1}
		endif
	else
		if (<Player> = 1)
			formatText checksumName = player_status 'player%i_status' i = <Player>
			if find_profile_by_id id = ($<player_status>.character_id)
				get_musician_profile_struct index = <index>
				formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
				if GetGlobalTags <characterguitartags> noassert = 1
					Change os_selected_outfit_p1 = (<current_outfit>)
					Change os_selected_outfit_old_p1 = (<current_outfit>)
					Change os_selected_style_p1 = (<current_style>)
					Change os_selected_style_old_p1 = (<current_style>)
				endif
			endif
			CreateScreenElement \{Type = ContainerElement
				id = select_outfit_container_p1
				parent = root_window
				Pos = (460.0, 500.0)}
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
				suffix = <Player>
				check_side_swap = 0
			}
			displayText {
				id = os_select_outfit_text_p1
				parent = select_outfit_container_p1
				text = 'SELECT OUTFIT'
				Pos = (0.0, -40.0)
				Scale = (0.7333, 0.64000005)
				font = fontgrid_title_gh3
				just = [center center]
				rgba = (($g_menu_colors).md_violet_grey)
				z = 1
			}
			displaySprite {
				id = os_name_background_p1
				parent = select_outfit_container_p1
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				dims = (266.0, 128.0)
				just = [center center]
				rgba = (($g_menu_colors).light_brown)
				z = 1
			}
			get_character_outfits Player = <Player>
			<curr_outfit> = $os_selected_outfit_p1
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			get_style_index_from_profile_style Player = <Player>
			curr_style = (<styles> [<style_index>])
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			displayText {
				id = os_outfit_name_ID_p1
				parent = select_outfit_container_p1
				text = <UppercaseString>
				Pos = (0.0, 27.0)
				Scale = 1.1
				font = text_a4
				just = [center center]
				rgba = (($g_menu_colors).black)
				z = 2
				noshadow
			}
			GetScreenElementDims \{id = os_outfit_name_ID_p1}
			if (<width> > 250)
				SetScreenElementProps \{id = os_outfit_name_ID_p1
					Scale = 1.1}
				fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((250.0, 0.0) + (<height> * (0.0, 1.25))) Pos = (0.0, 27.0)
			endif
			GetUpperCaseString <curr_style>
			displayText {
				id = os_outfit_style_ID_p1
				parent = select_outfit_container_p1
				text = <UppercaseString>
				Pos = (0.0, 98.0)
				Scale = (0.8, 0.7)
				font = text_a4
				just = [center center]
				rgba = (($g_menu_colors).light_brown)
				z = 2
				noshadow
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p1}
			if (<width> >= 210)
				SetScreenElementProps \{id = os_outfit_style_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 98.0)
			endif
			get_character_name \{Player = 1}
			get_initial_outfit_reference \{outfit2}
			formatText checksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
			if GetGlobalTags <outfit_2_checksum> param = unlocked noassert = 1
				if NOT (<unlocked>)
					select_outfit_choose \{Player = 1}
				endif
			else
				select_outfit_choose \{Player = 1}
			endif
		else
			if NOT ($is_network_game)
				formatText checksumName = player_status 'player%i_status' i = <Player>
				if find_profile_by_id id = ($<player_status>.character_id)
					get_musician_profile_struct index = <index>
					formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
					if GetGlobalTags <characterguitartags> noassert = 1
						Change os_selected_outfit_p2 = (<current_outfit>)
						Change os_selected_outfit_old_p2 = (<current_outfit>)
						Change os_selected_style_p2 = (<current_style>)
						Change os_selected_style_old_p2 = (<current_style>)
					endif
				endif
			endif
			CreateScreenElement \{Type = ContainerElement
				id = select_outfit_container_p2
				parent = root_window
				Pos = (810.0, 500.0)}
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
				suffix = <Player>
				check_side_swap = 0
			}
			displayText {
				id = os_select_outfit_text_p2
				parent = select_outfit_container_p2
				text = 'SELECT OUTFIT'
				Pos = (0.0, -40.0)
				Scale = (0.7333, 0.64000005)
				font = fontgrid_title_gh3
				just = [center center]
				rgba = (($g_menu_colors).md_violet_grey)
				z = 1
			}
			displaySprite {
				id = os_name_background_p2
				parent = select_outfit_container_p2
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				dims = (266.0, 128.0)
				just = [center center]
				rgba = (($g_menu_colors).lt_violet_bar)
				z = 1
			}
			get_character_outfits Player = <Player>
			<curr_outfit> = $os_selected_outfit_p2
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			get_style_index_from_profile_style Player = <Player>
			curr_style = (<styles> [<style_index>])
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			displayText {
				id = os_outfit_name_ID_p2
				parent = select_outfit_container_p2
				text = <UppercaseString>
				Pos = (0.0, 27.0)
				Scale = 1.1
				font = text_a4
				just = [center center]
				rgba = (($g_menu_colors).black)
				z = 2
				noshadow
			}
			GetScreenElementDims \{id = os_outfit_name_ID_p2}
			if (<width> > 250)
				SetScreenElementProps \{id = os_outfit_name_ID_p2
					Scale = 1.1}
				fit_text_in_rectangle id = os_outfit_name_ID_p2 dims = ((250.0, 0.0) + (<height> * (0.0, 1.25))) Pos = (0.0, 27.0)
			endif
			GetUpperCaseString <curr_style>
			displayText {
				id = os_outfit_style_ID_p2
				parent = select_outfit_container_p2
				text = <UppercaseString>
				Pos = (0.0, 98.0)
				Scale = (0.8, 0.7)
				font = text_a4
				just = [center center]
				rgba = (($g_menu_colors).lt_violet_bar)
				z = 2
				noshadow
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p2}
			if (<width> >= 210)
				SetScreenElementProps \{id = os_outfit_style_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p2 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 98.0)
			endif
			get_character_name \{Player = 2}
			get_initial_outfit_reference \{Player = 2
				outfit2}
			formatText checksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
			if GetGlobalTags <outfit_2_checksum> param = unlocked noassert = 1
				if NOT (<unlocked>)
					select_outfit_choose \{Player = 2}
				endif
			else
				select_outfit_choose \{Player = 2}
			endif
		endif
	endif
endscript

script scale_outfit_select_menu 
	<frames> = 30
	if GotParam \{make_big}
		Change \{os_frame_is_big = 1}
		SpawnScriptNow do_ui_frame_morph params = {
			start_dims = (280.0, 330.0)
			end_dims = (280.0, 600.0)
			start_pos = (0.0, 200.0)
			end_pos = (0.0, 335.0)
			frames = <frames>
			parent = select_outfit_container_p1
		}
		Wait (<frames> + 2) gameframes
		KillSpawnedScript \{Name = do_ui_frame_morph}
	elseif GotParam \{make_small}
		Change \{os_frame_is_big = 0}
		SpawnScriptNow do_ui_frame_morph params = {
			start_dims = (280.0, 600.0)
			end_dims = (280.0, 330.0)
			start_pos = (0.0, 335.0)
			end_pos = (0.0, 200.0)
			frames = <frames>
			parent = select_outfit_container_p1
		}
		Wait (<frames> + 2) gameframes
		KillSpawnedScript \{Name = do_ui_frame_morph}
	endif
endscript

script destroy_select_outfit_menu \{Player = 1}
	formatText checksumName = scrolling_select_outfit 'scrolling_select_outfit_p%i' i = <Player>
	formatText checksumName = select_outfit_container 'select_outfit_container_p%i' i = <Player>
	formatText checksumName = scrolling_select_style 'scrolling_outfit_style_menu_p%i' i = <Player>
	formatText checksumName = select_style_container 'select_style_container_p%i' i = <Player>
	destroy_menu menu_id = <scrolling_select_outfit>
	destroy_menu menu_id = <select_outfit_container>
	destroy_menu menu_id = <scrolling_select_style>
	destroy_menu menu_id = <select_style_container>
endscript

script select_outfit_go_back \{Player = 1}
	if (($is_network_game) && (<Player> = 1))
		network_player_lobby_message \{Type = outfit_select
			action = deselect}
	endif
	if ($current_num_players = 1)
		if NOT ($os_frame_is_big = 1)
			LaunchEvent \{Type = unfocus
				target = vmenu_select_outfit_p1}
			scale_outfit_select_menu \{make_big}
		endif
	endif
	formatText checksumName = player_status 'player%i_status' i = <Player>
	formatText checksumName = this_outfit 'os_selected_outfit_p%i' i = <Player>
	formatText checksumName = old_outfit 'os_selected_outfit_old_p%i' i = <Player>
	formatText checksumName = old_style 'os_selected_style_old_p%i' i = <Player>
	if NOT ($<old_outfit> = ($<player_status>.outfit) && $<old_style> = ($<player_status>.style))
		Change structurename = <player_status> outfit = $<old_outfit>
		Change structurename = <player_status> style = $<old_style>
		formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
		Change GlobalName = <change_flag> NewValue = 1
	endif
	if (<Player> = 1)
		Change \{os_selected_outfit_p1 = $os_selected_outfit_old_p1}
	else
		Change \{os_selected_outfit_p2 = $os_selected_outfit_old_p2}
	endif
	if (($is_network_game = 0) || (<Player> = 1))
		if find_profile_by_id id = ($<player_status>.character_id)
			get_musician_profile_struct index = <index>
			formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
			SetGlobalTags <characterguitartags> params = {current_outfit = ($<old_outfit>)}
		endif
	endif
	ui_flow_manager_respond_to_action action = go_back Player = <Player>
endscript

script os_scroll_up_or_down \{Player = 1
		Dir = down}
	generic_menu_up_or_down_sound params = {<Dir>}
	if (<Player> = 1)
		if ($os_made_first_selection_bool_p1 = 0)
			if ($os_selected_outfit_p1 = 1)
				get_character_name Player = <Player>
				get_initial_outfit_reference \{outfit2}
				formatText checksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
				if GetGlobalTags <outfit_2_checksum> param = unlocked noassert = 1
					if (<unlocked>)
						Change \{os_selected_outfit_p1 = 2}
					endif
				endif
			else
				Change \{os_selected_outfit_p1 = 1}
			endif
			if ($is_network_game)
				network_player_lobby_message \{Type = outfit_select
					action = update
					value1 = $os_selected_outfit_p1}
			endif
			if NOT ($os_selected_outfit_p1 = ($player1_status.outfit))
				Change \{structurename = player1_status
					outfit = $os_selected_outfit_p1}
				get_character_outfits Player = <Player>
				<curr_outfit> = ($player1_status.outfit)
				if NOT ($os_selected_outfit_p1 = $os_selected_outfit_old_p1)
					<style> = (<character_outfits> [(<curr_outfit> - 1)].reference [0])
				else
					<style> = ($os_selected_style_p1)
				endif
				Change structurename = player1_status style = <style>
				formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
				Change GlobalName = <change_flag> NewValue = 1
				get_character_outfits Player = <Player>
				<curr_outfit> = ($player1_status.outfit)
				styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
				if ($os_selected_outfit_p1 = $os_selected_outfit_old_p1)
					get_style_index_from_profile_style Player = <Player>
					curr_style = (<styles> [<style_index>])
				else
					curr_style = (<styles> [0])
				endif
				GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
				SetScreenElementProps id = os_outfit_name_ID_p1 text = <UppercaseString>
				GetUpperCaseString <curr_style>
				SetScreenElementProps id = os_outfit_style_ID_p1 text = <UppercaseString>
				if ($current_num_players = 1)
					GetScreenElementDims \{id = os_outfit_name_ID_p1}
					if (<width> > 240)
						SetScreenElementProps \{id = os_outfit_name_ID_p1
							Scale = 1.0}
						fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((240.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (0.0, -19.0))
					endif
					GetScreenElementDims \{id = os_outfit_style_ID_p1}
					stringremove text = <UppercaseString> remove = ' ' new_string = test_string
					StringLength string = <UppercaseString>
					if (<UppercaseString> = <test_string> && <str_len> > 12)
						SetScreenElementProps \{id = os_outfit_style_ID_p1
							Scale = 1}
						fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((210.0, 0.0) + (<height> * (0.0, 1.0))) Pos = ($gs_element_offsets [3] + (2.0, 9.0))
					elseif (<UppercaseString> != <test_string> && <str_len> > 16)
						SetScreenElementProps \{id = os_outfit_style_ID_p1
							Scale = 0.65000004}
					else
						SetScreenElementProps \{id = os_outfit_style_ID_p1
							Scale = 0.8}
					endif
				else
					GetScreenElementDims \{id = os_outfit_name_ID_p1}
					if (<width> > 250)
						SetScreenElementProps \{id = os_outfit_name_ID_p1
							Scale = 1.1}
						fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((250.0, 0.0) + (<height> * (0.0, 1.25))) Pos = (0.0, 27.0)
					endif
					GetScreenElementDims \{id = os_outfit_style_ID_p1}
					if (<width> >= 270)
						SetScreenElementProps \{id = os_outfit_style_ID_p1
							Scale = 1}
						fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((235.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 98.0)
					else
						SetScreenElementProps \{id = os_outfit_style_ID_p1
							Scale = (0.8, 0.7)}
						SetScreenElementProps \{id = os_outfit_style_ID_p1
							Pos = (0.0, 98.0)}
					endif
				endif
			endif
		endif
	else
		if ($os_made_first_selection_bool_p2 = 0)
			if ($os_selected_outfit_p2 = 1)
				get_character_name Player = <Player>
				get_initial_outfit_reference Player = <Player> outfit2
				formatText checksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
				if GetGlobalTags <outfit_2_checksum> param = unlocked noassert = 1
					if (<unlocked>)
						Change \{os_selected_outfit_p2 = 2}
					endif
				endif
			else
				Change \{os_selected_outfit_p2 = 1}
			endif
			if NOT ($os_selected_outfit_p2 = $player2_status.outfit)
				Change \{structurename = player2_status
					outfit = $os_selected_outfit_p2}
				get_character_outfits Player = <Player>
				<curr_outfit> = ($player2_status.outfit)
				if NOT ($os_selected_outfit_p2 = $os_selected_outfit_old_p2)
					<style> = (<character_outfits> [(<curr_outfit> - 1)].reference [0])
				else
					<style> = ($os_selected_style_p2)
				endif
				Change structurename = player2_status style = <style>
				formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
				Change GlobalName = <change_flag> NewValue = 1
				get_character_outfits Player = <Player>
				<curr_outfit> = ($player2_status.outfit)
				styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
				if ($os_selected_outfit_p2 = $os_selected_outfit_old_p2)
					get_style_index_from_profile_style Player = <Player>
					curr_style = (<styles> [<style_index>])
				else
					curr_style = (<styles> [0])
				endif
				GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
				SetScreenElementProps id = os_outfit_name_ID_p2 text = <UppercaseString>
				GetUpperCaseString <curr_style>
				SetScreenElementProps id = os_outfit_style_ID_p2 text = <UppercaseString>
				GetScreenElementDims \{id = os_outfit_name_ID_p2}
				if (<width> > 260)
					SetScreenElementProps \{id = os_outfit_name_ID_p2
						Scale = 1.1}
					fit_text_in_rectangle id = os_outfit_name_ID_p2 dims = ((255.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 27.0)
				endif
				GetScreenElementDims \{id = os_outfit_style_ID_p2}
				if (<width> >= 270)
					SetScreenElementProps \{id = os_outfit_style_ID_p2
						Scale = 1}
					fit_text_in_rectangle id = os_outfit_style_ID_p2 dims = ((235.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 98.0)
				else
					SetScreenElementProps \{id = os_outfit_style_ID_p2
						Scale = (0.8, 0.7)}
					SetScreenElementProps \{id = os_outfit_style_ID_p2
						Pos = (0.0, 98.0)}
				endif
			endif
		endif
	endif
endscript

script select_outfit_choose \{Player = 1
		needs_net_message = 1}
	SoundEvent \{event = ui_sfx_select}
	if (<Player> = 1)
		if ($os_made_first_selection_bool_p1 = 1)
			Change \{structurename = player1_status
				outfit = $os_selected_outfit_p1}
			Change \{structurename = player1_status
				style = $os_selected_style_p1}
			if find_profile_by_id id = ($player1_status.character_id)
				get_musician_profile_struct index = <index>
				formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
				SetGlobalTags <characterguitartags> params = {current_outfit = ($os_selected_outfit_p1) current_style = ($os_selected_style_p1)}
			endif
			Change \{os_selected_outfit_old_p1 = $os_selected_outfit_p1}
			Change \{os_selected_style_old_p1 = $os_selected_style_p1}
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{Type = style_select
					action = select
					value1 = $os_selected_style_p1}
			endif
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		else
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{Type = outfit_select
					action = select
					checksum = $os_selected_outfit_p1}
			endif
			if ($current_num_players = 1)
				if NOT ($os_frame_is_big = 1)
					LaunchEvent \{Type = unfocus
						target = vmenu_select_outfit_p1}
					scale_outfit_select_menu \{make_big}
				endif
			endif
			select_outfit_create_style_menu Player = <Player>
			Change \{os_made_first_selection_bool_p1 = 1}
		endif
	else
		if ($os_made_first_selection_bool_p2 = 1)
			Change \{structurename = player2_status
				outfit = $os_selected_outfit_p2}
			Change \{structurename = player2_status
				style = $os_selected_style_p2}
			if NOT ($is_network_game)
				if find_profile_by_id id = ($player2_status.character_id)
					get_musician_profile_struct index = <index>
					formatText checksumName = characterguitartags 'character_%c_player_%p_guitar_tags' c = (<profile_struct>.Name) p = <Player>
					SetGlobalTags <characterguitartags> params = {current_outfit = ($os_selected_outfit_p2) current_style = ($os_selected_style_p2)}
				endif
			endif
			Change \{os_selected_outfit_old_p2 = $os_selected_outfit_p2}
			Change \{os_selected_style_old_p2 = $os_selected_style_p2}
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		else
			select_outfit_create_style_menu Player = <Player>
			Change \{os_made_first_selection_bool_p2 = 1}
		endif
	endif
endscript

script select_outfit_create_style_menu \{Player = 1}
	formatText checksumName = player_status 'player%i_status' i = <Player>
	font = text_a4
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	if ((($is_network_game) = 1) && (<Player> = 1))
		pad_back_script = net_destroy_select_style_menu
	else
		pad_back_script = destroy_select_style_menu
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back <pad_back_script> params = {Player = <Player>}}
		{pad_start menu_show_gamercard}
	]
	<p1_menu_pos> = (566.0, 480.0)
	<p2_menu_pos> = (786.0, 490.0)
	<menu_offset> = (-300.0, -180.0)
	if (<Player> = 1)
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
				spacing = 10
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
			vmenu_outfit_style_menu_p2 :SetProps \{disable_pad_handling}
			LaunchEvent \{Type = unfocus
				target = vmenu_outfit_style_menu_p2}
		endif
		vparent = vmenu_outfit_style_menu_p2
	endif
	if (<Player> = 1)
		LaunchEvent \{Type = unfocus
			target = scrolling_select_outfit_p1}
		LaunchEvent \{Type = unfocus
			target = scrolling_outfit_style_menu_p1}
	else (<Player> = 2)
		LaunchEvent \{Type = unfocus
			target = scrolling_select_outfit_p2}
	endif
	if ($current_num_players = 1)
		CreateScreenElement {
			Type = ContainerElement
			id = 0x9a4a2f59
			parent = root_window
			Pos = (<p1_menu_pos> + <menu_offset>)
			internal_just = [center top]
		}
		<brown_window_color> = [120 60 10 255]
		SetScreenElementProps \{id = os_name_background
			texture = char_select_frame_bg2
			rgba = [
				210
				120
				155
				255
			]}
		SetScreenElementProps {
			id = os_outfit_name_ID_p1
			shadow_rgba = (($g_menu_colors).frame_rgba)
		}
		GetScreenElementDims \{id = os_outfit_name_ID_p1}
		if (<width> > 240)
			SetScreenElementProps \{id = os_outfit_name_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((235.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (0.0, -19.0))
		endif
		displaySprite {
			id = os_bookend1_ID
			parent = 0x9a4a2f59
			tex = character_hub_hilite_bookend
			dims = (24.0, 32.0)
			just = [left top]
			rgba = (($g_menu_colors).md_violet_grey)
			z = 4
			flip_v
		}
		displaySprite {
			id = os_bookend2_ID
			parent = 0x9a4a2f59
			tex = character_hub_hilite_bookend
			dims = (24.0, 32.0)
			just = [right top]
			rgba = (($g_menu_colors).md_violet_grey)
			z = 4
		}
		displaySprite {
			id = os_whiteTexHighlight_ID
			parent = 0x9a4a2f59
			tex = hilite_bar_01
			just = [left top]
			rgba = (($g_menu_colors).md_violet_grey)
			dims = (320.0, 32.0)
			Pos = (-47.0, 8.0)
			z = 2
		}
		set_focus_color \{Color = black}
		set_unfocus_color \{Color = dk_violet_grey}
		get_character_outfits Player = <Player>
		outfit = ($player1_status.outfit)
		styles = (<character_outfits> [(<outfit> - 1)].styles)
		GetArraySize <styles>
		<num_in_list> = 0
		<i> = 0
		begin
		<add_style> = 1
		if NOT (<i> = 0)
			get_character_name Player = <Player>
			formatText checksumName = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = (<character_outfits> [(<outfit> - 1)].reference [<i>])
			if GetGlobalTags <outfit_style_cs> param = unlocked noassert = 1
				if (<unlocked> = 0)
					<add_style> = 0
				endif
			else
				<add_style> = 0
			endif
		endif
		formatText checksumName = os_style_menu_item_id 'os_style_menu_item_%n' n = <i>
		GetUpperCaseString (<styles> [<i>])
		if (<add_style>)
			<num_in_list> = (<num_in_list> + 1)
			CreateScreenElement {
				id = <os_style_menu_item_id>
				Type = TextElement
				parent = <vparent>
				font = text_a4
				Scale = (0.8, 0.7)
				rgba = ($menu_unfocus_color)
				just = [center top]
				text = <UppercaseString>
				event_handlers = [
					{focus retail_menu_focus}
					{focus select_outfit_style_highlight params = {Player = <Player>
							index = <i>
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose select_outfit_style_choose params = {Player = <Player>}}
				]
			}
			GetScreenElementDims id = <id>
			if (<width> > 210)
				SetScreenElementProps id = <id> Scale = (1.0, 1.0)
				fit_text_in_rectangle id = <id> dims = ((210.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (<p1_menu_pos> + <menu_offset>)
			endif
		else
			CreateScreenElement {
				Type = TextElement
				parent = <vparent>
				font = text_a4
				Scale = (0.7, 0.7)
				rgba = [128 128 128 75]
				just = [center top]
				text = <UppercaseString>
				not_focusable
			}
			GetScreenElementDims id = <id>
			if (<width> > 160)
				SetScreenElementProps id = <id> Scale = (1.0, 1.0)
				fit_text_in_rectangle id = <id> dims = ((160.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (<p1_menu_pos> + <menu_offset>)
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		if (<num_in_list> = 1)
			Change \{os_made_first_selection_bool_p1 = 1}
			select_outfit_style_highlight {
				Player = <Player>
			}
			select_outfit_style_choose {
				Player = <Player>
			}
		else
			LaunchEvent \{Type = focus
				target = scrolling_outfit_style_menu_p1}
			if ($os_selected_outfit_p1 = $os_selected_outfit_old_p1)
				get_style_index_from_profile_style Player = <Player>
				if (<style_index> > 0)
					Change \{disable_menu_sounds = 1}
					begin
					LaunchEvent Type = pad_down target = <vparent>
					if ($os_selected_style_p1 = $os_selected_style_old_p1)
						break
					endif
					repeat (<style_index>)
					Change \{disable_menu_sounds = 0}
				endif
			endif
		endif
	else
		if (<Player> = 1)
			LaunchEvent \{Type = unfocus
				target = scrolling_select_outfit_p1}
			LaunchEvent Type = focus target = <vparent>
			SetScreenElementProps \{id = os_select_outfit_text_p1
				text = 'SELECT STYLE'}
			SetScreenElementProps \{id = os_name_background_p1
				Pos = (0.0, 58.0)}
			get_character_outfits Player = <Player>
			outfit = ($player1_status.outfit)
			styles = (<character_outfits> [(<outfit> - 1)].styles)
			curr_style = (<styles> [(($player1_status.style) - 1)])
			GetUpperCaseString (<character_outfits> [(<outfit> - 1)].Name)
			SetScreenElementProps {
				id = os_outfit_name_ID_p1
				text = <UppercaseString>
				Scale = (0.8, 0.7)
				Pos = (0.0, -10.0)
				rgba = (($g_menu_colors).light_brown)
			}
			GetScreenElementDims \{id = os_outfit_name_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_name_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				id = os_outfit_style_ID_p1
				text = <UppercaseString>
				Scale = 1
				Pos = (0.0, 55.0)
				rgba = (($g_menu_colors).black)
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_style_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 55.0)
			endif
			GetArraySize <styles>
			<num_in_list> = 0
			<i> = 0
			begin
			<add_style> = 1
			if NOT (<i> = 0)
				get_character_name Player = <Player>
				formatText checksumName = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = (<character_outfits> [(<outfit> - 1)].reference [<i>])
				if GetGlobalTags <outfit_style_cs> param = unlocked noassert = 1
					if (<unlocked> = 0)
						<add_style> = 0
					endif
				else
					<add_style> = 0
				endif
			endif
			if (<add_style>)
				<num_in_list> = (<num_in_list> + 1)
				GetUpperCaseString (<styles> [<i>])
				CreateScreenElement {
					Type = TextElement
					parent = <vparent>
					font = text_a4
					Scale = 1.05
					rgba = ($menu_unfocus_color)
					just = [center top]
					text = <UppercaseString>
					event_handlers = [
						{focus retail_menu_focus}
						{focus select_outfit_style_highlight params = {Player = <Player>
								index = <i>
							}
						}
						{unfocus retail_menu_unfocus}
						{pad_choose select_outfit_style_choose params = {
								Player = <Player>
							}
						}
					]
					exclusive_device = <exclusive_dev>
					Hide
				}
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			if (<num_in_list> = 1)
				Change \{os_made_first_selection_bool_p1 = 1}
				select_outfit_style_highlight {
					needs_net_message = 0
					Player = <Player>
				}
				select_outfit_style_choose {
					needs_net_message = 0
					Player = <Player>
				}
			else
				if ($os_selected_outfit_p1 = $os_selected_outfit_old_p1)
					get_style_index_from_profile_style Player = <Player>
					if (<style_index> > 0)
						Change \{disable_menu_sounds = 1}
						begin
						LaunchEvent Type = pad_down target = <vparent>
						if ($os_selected_style_p1 = $os_selected_style_old_p1)
							break
						endif
						repeat (<style_index>)
						Change \{disable_menu_sounds = 0}
					endif
				endif
			endif
		else
			LaunchEvent \{Type = unfocus
				target = scrolling_select_outfit_p2}
			if ($is_network_game = 0)
				LaunchEvent Type = focus target = <vparent>
			endif
			SetScreenElementProps \{id = os_select_outfit_text_p2
				text = 'SELECT STYLE'}
			SetScreenElementProps \{id = os_name_background_p2
				Pos = (0.0, 58.0)}
			get_character_outfits Player = <Player>
			<outfit> = ($player2_status.outfit)
			styles = (<character_outfits> [(<outfit> - 1)].styles)
			curr_style = (<styles> [(($player2_status.style) - 1)])
			GetUpperCaseString (<character_outfits> [(<outfit> - 1)].Name)
			SetScreenElementProps {
				id = os_outfit_name_ID_p2
				text = <UppercaseString>
				Scale = (0.8, 0.7)
				Pos = (0.0, -10.0)
				rgba = (($g_menu_colors).lt_violet_bar)
			}
			GetScreenElementDims \{id = os_outfit_name_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_name_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_name_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				id = os_outfit_style_ID_p2
				text = <UppercaseString>
				Scale = 1
				Pos = (0.0, 55.0)
				rgba = (($g_menu_colors).black)
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_style_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 55.0)
			endif
			GetArraySize <styles>
			<num_in_list> = 0
			<i> = 0
			begin
			<add_style> = 1
			if NOT (<i> = 0)
				get_character_name Player = <Player>
				formatText checksumName = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = (<character_outfits> [(<outfit> - 1)].reference [<i>])
				if GetGlobalTags <outfit_style_cs> param = unlocked noassert = 1
					if (<unlocked> = 0)
						<add_style> = 0
					endif
				else
					<add_style> = 0
				endif
			endif
			if (<add_style>)
				<num_in_list> = (<num_in_list> + 1)
				GetUpperCaseString (<styles> [<i>])
				CreateScreenElement {
					Type = TextElement
					parent = <vparent>
					font = text_a4
					Scale = 1.05
					rgba = ($menu_unfocus_color)
					just = [center top]
					text = <UppercaseString>
					event_handlers = [
						{focus retail_menu_focus}
						{focus select_outfit_style_highlight params = {Player = <Player>
								index = <i>
							}
						}
						{unfocus retail_menu_unfocus}
						{pad_choose select_outfit_style_choose params = {
								Player = <Player>
							}
						}
					]
					exclusive_device = <exclusive_dev>
					Hide
				}
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			if (<num_in_list> = 1)
				Change \{os_made_first_selection_bool_p2 = 1}
				select_outfit_style_highlight {
					Player = <Player>
				}
				select_outfit_style_choose {
					Player = <Player>
				}
			else
				if ($os_selected_outfit_p2 = $os_selected_outfit_old_p2)
					get_style_index_from_profile_style Player = <Player>
					if (<style_index> > 0)
						Change \{disable_menu_sounds = 1}
						begin
						LaunchEvent Type = pad_down target = <vparent>
						if ($os_selected_style_p2 = $os_selected_style_old_p2)
							break
						endif
						repeat (<style_index>)
						Change \{disable_menu_sounds = 0}
					endif
				endif
			endif
		endif
	endif
endscript

script net_destroy_select_style_menu \{Player = 1}
	if ($is_network_game)
		network_player_lobby_message \{Type = style_select
			action = deselect}
	endif
	destroy_select_style_menu Player = <Player>
endscript

script destroy_select_style_menu \{Player = 1}
	SoundEvent \{event = Generic_Menu_Back_SFX}
	if ($current_num_players = 1)
		LaunchEvent \{Type = unfocus
			target = scrolling_outfit_style_menu_p1}
		destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
		Change \{os_made_first_selection_bool_p1 = 0}
		destroy_menu \{menu_id = 0x9a4a2f59}
		formatText checksumName = old_outfit 'os_selected_outfit_old_p%i' i = <Player>
		formatText checksumName = old_style 'os_selected_style_old_p%i' i = <Player>
		if NOT ($<old_outfit> = ($player1_status.outfit) && $<old_style> = ($player1_status.style))
			Change structurename = player1_status outfit = $<old_outfit>
			Change structurename = player1_status style = $<old_style>
			formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
			Change GlobalName = <change_flag> NewValue = 1
		endif
		Change os_selected_outfit_p1 = $<old_outfit>
		Change os_selected_style_p1 = $<old_style>
		get_character_name \{Player = 1}
		get_initial_outfit_reference \{outfit2}
		formatText checksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
		if GetGlobalTags <outfit_2_checksum> param = unlocked noassert = 1
			if (<unlocked>)
				if ($os_frame_is_big = 1)
					scale_outfit_select_menu \{make_small}
				endif
			endif
		endif
		if ScreenElementExists \{id = scrolling_select_outfit_p1}
			LaunchEvent \{Type = focus
				target = scrolling_select_outfit_p1}
		endif
		SetScreenElementProps {
			id = os_name_background
			texture = Char_Select_Frame_BG
			dims = (266.0, 128.0)
			rgba = (($g_menu_colors).lt_violet_grey)
		}
		SetScreenElementProps {
			id = os_outfit_name_ID_p1
			shadow_rgba = (($g_menu_colors).lt_violet_grey)
		}
		get_character_outfits Player = <Player>
		<curr_outfit> = ($player1_status.outfit)
		styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
		get_style_index_from_profile_style Player = <Player>
		curr_style = (<styles> [<style_index>])
		GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
		SetScreenElementProps id = os_outfit_name_ID_p1 text = <UppercaseString>
		GetUpperCaseString <curr_style>
		SetScreenElementProps id = os_outfit_style_ID_p1 text = <UppercaseString>
		SetScreenElementProps id = os_outfit_name_ID_p1 Scale = 1.3 Pos = (($gs_element_offsets [2]) + (0.0, -4.0))
		GetScreenElementDims \{id = os_outfit_name_ID_p1}
		if (<width> > 240)
			SetScreenElementProps \{id = os_outfit_name_ID_p1
				Scale = 1.0}
			fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((240.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (0.0, -19.0))
		endif
		GetScreenElementDims \{id = os_outfit_style_ID_p1}
		stringremove text = <UppercaseString> remove = ' ' new_string = test_string
		StringLength string = <UppercaseString>
		if (<UppercaseString> = <test_string> && <str_len> > 12)
			SetScreenElementProps \{id = os_outfit_style_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((210.0, 0.0) + (<height> * (0.0, 1.0))) Pos = ($gs_element_offsets [3] + (2.0, 9.0))
		elseif (<UppercaseString> != <test_string> && <str_len> > 16)
			SetScreenElementProps \{id = os_outfit_style_ID_p1
				Scale = 0.65000004}
		else
			SetScreenElementProps \{id = os_outfit_style_ID_p1
				Scale = 0.8}
		endif
		get_character_name \{Player = 1}
		get_initial_outfit_reference \{outfit2}
		formatText checksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
		if GetGlobalTags <outfit_2_checksum> param = unlocked noassert = 1
			if NOT (<unlocked>)
				select_outfit_go_back \{Player = 1}
			endif
		else
			select_outfit_go_back \{Player = 1}
		endif
	else
		if (<Player> = 1)
			SetScreenElementProps \{id = os_select_outfit_text_p1
				text = 'SELECT OUTFIT'}
			LaunchEvent \{Type = focus
				target = scrolling_select_outfit_p1}
			LaunchEvent \{Type = unfocus
				target = scrolling_outfit_style_menu_p1}
			destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
			Change \{os_made_first_selection_bool_p1 = 0}
			formatText checksumName = old_outfit 'os_selected_outfit_old_p%i' i = <Player>
			formatText checksumName = old_style 'os_selected_style_old_p%i' i = <Player>
			if NOT ($<old_outfit> = ($player1_status.outfit) && $<old_style> = ($player1_status.style))
				Change structurename = player1_status outfit = $<old_outfit>
				Change structurename = player1_status style = $<old_style>
				formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
				Change GlobalName = <change_flag> NewValue = 1
			endif
			Change os_selected_outfit_p1 = $<old_outfit>
			Change os_selected_style_p1 = $<old_style>
			get_character_outfits Player = <Player>
			<curr_outfit> = ($player1_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			get_style_index_from_profile_style Player = <Player>
			curr_style = (<styles> [<style_index>])
			SetScreenElementProps \{id = os_name_background_p1
				Pos = (0.0, 30.0)}
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			SetScreenElementProps {
				id = os_outfit_name_ID_p1
				text = <UppercaseString>
				Scale = 1.1
				Pos = (0.0, 27.0)
				rgba = (($g_menu_colors).black)
			}
			GetScreenElementDims \{id = os_outfit_name_ID_p1}
			if (<width> > 250)
				SetScreenElementProps \{id = os_outfit_name_ID_p1
					Scale = 1.1}
				fit_text_in_rectangle id = os_outfit_name_ID_p1 dims = ((250.0, 0.0) + ((<height>) * (0.0, 1.25))) Pos = (0.0, 27.0)
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				id = os_outfit_style_ID_p1
				text = <UppercaseString>
				Scale = (0.8, 0.7)
				Pos = (0.0, 93.0)
				rgba = (($g_menu_colors).light_brown)
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p1}
			if (<width> >= 210)
				SetScreenElementProps \{id = os_outfit_style_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 85.0)
			endif
			get_character_name \{Player = 1}
			get_initial_outfit_reference \{outfit2}
			formatText checksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
			if GetGlobalTags <outfit_2_checksum> param = unlocked noassert = 1
				if NOT (<unlocked>)
					select_outfit_go_back \{Player = 1}
				endif
			else
				select_outfit_go_back \{Player = 1}
			endif
		else
			SetScreenElementProps \{id = os_select_outfit_text_p2
				text = 'SELECT OUTFIT'}
			LaunchEvent \{Type = focus
				target = scrolling_select_outfit_p2}
			LaunchEvent \{Type = unfocus
				target = scrolling_outfit_style_menu_p2}
			destroy_menu \{menu_id = scrolling_outfit_style_menu_p2}
			Change \{os_made_first_selection_bool_p2 = 0}
			formatText checksumName = old_outfit 'os_selected_outfit_old_p%i' i = <Player>
			formatText checksumName = old_style 'os_selected_style_old_p%i' i = <Player>
			if NOT ($<old_outfit> = ($player2_status.outfit) && $<old_style> = ($player2_status.style))
				Change structurename = player2_status outfit = $<old_outfit>
				Change structurename = player2_status style = $<old_style>
				formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
				Change GlobalName = <change_flag> NewValue = 1
			endif
			Change os_selected_outfit_p2 = $<old_outfit>
			get_character_outfits Player = <Player>
			<curr_outfit> = ($player2_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			get_style_index_from_profile_style Player = <Player>
			curr_style = (<styles> [<style_index>])
			SetScreenElementProps \{id = os_name_background_p2
				Pos = (0.0, 30.0)}
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			SetScreenElementProps {
				id = os_outfit_name_ID_p2
				text = <UppercaseString>
				Scale = 1.1
				Pos = (0.0, 27.0)
				rgba = (($g_menu_colors).black)
			}
			GetScreenElementDims \{id = os_outfit_name_ID_p2}
			if (<width> > 250)
				SetScreenElementProps \{id = os_outfit_name_ID_p2
					Scale = 1.1}
				fit_text_in_rectangle id = os_outfit_name_ID_p2 dims = ((250.0, 0.0) + ((<height>) * (0.0, 1.25))) Pos = (0.0, 27.0)
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				id = os_outfit_style_ID_p2
				text = <UppercaseString>
				Scale = (0.8, 0.7)
				Pos = (0.0, 93.0)
				rgba = (($g_menu_colors).lt_violet_bar)
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p2}
			if (<width> >= 210)
				SetScreenElementProps \{id = os_outfit_style_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 85.0)
			endif
			get_character_name \{Player = 2}
			get_initial_outfit_reference \{Player = 2
				outfit2}
			formatText checksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' n = <character_name> r = <reference>
			if GetGlobalTags <outfit_2_checksum> param = unlocked noassert = 1
				if NOT (<unlocked>)
					select_outfit_go_back \{Player = 2}
				endif
			else
				select_outfit_go_back \{Player = 2}
			endif
		endif
	endif
	if (<Player> = 1)
		destroy_menu \{menu_id = 0x9a4a2f59}
	else
		destroy_menu \{menu_id = select_style_container_p2}
	endif
endscript

script select_outfit_style_highlight \{Player = 1
		index = 0
		needs_net_message = 1}
	get_character_outfits Player = <Player>
	if (<Player> = 1)
		<curr_outfit> = ($player1_status.outfit)
	else
		<curr_outfit> = ($player2_status.outfit)
	endif
	formatText checksumName = player_status 'player%i_status' i = <Player>
	formatText checksumName = selected_outfit 'os_selected_outfit_p%i' i = <Player>
	<our_style> = (<character_outfits> [(<curr_outfit> - 1)].reference [<index>])
	if NOT ($<selected_outfit> = ($<player_status>.outfit) && <our_style> = ($<player_status>.style))
		Change structurename = <player_status> style = <our_style>
		formatText checksumName = change_flag 'generic_select_monitor_p%i_changed' i = <Player>
		Change GlobalName = <change_flag> NewValue = 1
	endif
	if (<Player> = 1)
		Change os_selected_style_p1 = <our_style>
	else
		Change os_selected_style_p2 = <our_style>
	endif
	styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
	curr_style = (<styles> [(<index>)])
	if ($current_num_players = 1)
		GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
		SetScreenElementProps id = os_outfit_name_ID_p1 text = <UppercaseString>
		GetUpperCaseString <curr_style>
		SetScreenElementProps id = os_outfit_style_ID_p1 text = <UppercaseString>
		GetScreenElementDims \{id = os_outfit_style_ID_p1}
		stringremove text = <UppercaseString> remove = ' ' new_string = test_string
		StringLength string = <UppercaseString>
		if (<UppercaseString> = <test_string> && <str_len> > 10)
			SetScreenElementProps \{id = os_outfit_style_ID_p1
				Scale = 1}
			fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((210.0, 0.0) + (<height> * (0.0, 1.0))) Pos = ($gs_element_offsets [3] + (2.0, 9.0))
		elseif (<UppercaseString> != <test_string> && <str_len> > 16)
			SetScreenElementProps \{id = os_outfit_style_ID_p1
				Scale = 0.75}
		else
			SetScreenElementProps \{id = os_outfit_style_ID_p1
				Scale = 0.8}
		endif
		<offset> = (<index> * (0.0, 37.0))
		<l_pos> = ((-73.0, 0.0) + <offset>)
		<r_pos> = ((292.0, 0.0) + <offset>)
		<hl_pos> = ((-50.0, 0.0) + <offset>)
		SetScreenElementProps id = os_bookend1_ID Pos = <l_pos> preserve_flip
		SetScreenElementProps id = os_bookend2_ID Pos = <r_pos>
		SetScreenElementProps id = os_whiteTexHighlight_ID Pos = <hl_pos>
	else
		if (<Player> = 1)
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				id = os_outfit_style_ID_p1
				text = <UppercaseString>
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_style_ID_p1
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p1 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 55.0)
			endif
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{Type = style_select
					action = update
					value1 = $os_selected_style_p1}
			endif
		else
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				id = os_outfit_style_ID_p2
				text = <UppercaseString>
			}
			GetScreenElementDims \{id = os_outfit_style_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{id = os_outfit_style_ID_p2
					Scale = 1}
				fit_text_in_rectangle id = os_outfit_style_ID_p2 dims = ((255.0, 0.0) + ((<height>) * (0.0, 1.0))) Pos = (0.0, 55.0)
			endif
		endif
	endif
endscript

script select_outfit_style_choose \{Player = 1
		needs_net_message = 1}
	if (<Player> = 1)
		select_outfit_choose {
			Player = <Player>
			needs_net_message = <needs_net_message>
		}
	else
		select_outfit_choose {
			Player = <Player>
		}
	endif
	if (<Player> = 1)
		destroy_menu \{menu_id = 0x9a4a2f59}
		destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
	else
		destroy_menu \{menu_id = select_style_container_p2}
		destroy_menu \{menu_id = scrolling_outfit_style_menu_p2}
	endif
endscript
