ui_initial_boot = 1

script startup_loading_screen 
	startdelaysystemui
	change \{is_changing_levels = 1}
	load_level_handle_loading_screen \{intro}
	stopdelaysystemui
endscript
ANY_LEVEL_LOADED_YET = 0
loadscreen_last_game_mode = career

script get_level_load_time 
	GetLevelStructureName level = <level>
	level_struct = <level_structure_name>
	time = ((<level_struct>.loading_time) * 2.0)
	return level_load_time = <time>
endscript

script load_level_handle_loading_screen 
	GetGameMode
	if isps3
		<loading_spin> = {spin_texture = 'load_wheel' spin_x = 237 spin_y = 328}
	else
		<loading_spin> = {spin_texture = 'load_wheel' spin_x = 292 spin_y = 400}
	endif
	text_texture = 'loading_text'
	text_position = {text_x = 750 text_y = 550}
	if NOT gotparam intro
		loading_screen = 'loadscrn_generic'
	else
		loading_screen = 'loadscrn'
		if isps3
			<loading_spin> = {spin_texture = 'load_wheel_g' spin_x = 133 spin_y = 368}
		else
			<loading_spin> = {spin_texture = 'load_wheel_g' spin_x = 164 spin_y = 448}
		endif
	endif
	if french
		text_texture = (<text_texture> + '_f')
	elseif german
		text_texture = (<text_texture> + '_g')
	elseif italian
		text_texture = (<text_texture> + '_i')
	elseif spanish
		text_texture = (<text_texture> + '_s')
	else
		text_texture = (<text_texture> + '_e')
	endif
	if NOT gotparam force_show
		displayloadingscreen <loading_screen> <loading_spin> if_not_visible localized
	else
		displayloadingscreen <loading_screen> <loading_spin> text_texture = <texture> <text_position> localized
	endif
	change ANY_LEVEL_LOADED_YET = 1
	change loadscreen_last_game_mode = <gamemode>
endscript

script load_level_handle_movie_loading_screen movie = 'movies/bik/cas.bik.xen'
	if screenelementexists id = root_window
		kill_start_key_binding
	endif
	if isps3
		load_level_handle_loading_screen <...>
		return
	endif
	if gotparam level
		printf "level %l" l = <level> channel = ui
		switch <level>
			case Load_Z_Slums
			case z_slums
			<movie> = 'movies/bik/inner_city_philly.bik.xen'
			case Load_Z_FDR
			case z_fdr
			<movie> = 'movies/bik/fdr.bik.xen'
			case Load_Z_Love
			case z_love
			case Load_Z_Bell
			case z_bell
			<movie> = 'movies/bik/downtown_philly.bik.xen'
			case Load_Z_BCity
			case z_bcity
			<movie> = 'movies/bik/baltimore.bik.xen'
			case load_z_harbor
			case z_harbor
			<movie> = 'movies/bik/baltimore_harbor.bik.xen'
			case Load_Z_Lansdowne
			case z_lansdowne
			<movie> = 'movies/bik/lansdowne.bik.xen'
			case Load_Z_Monuments
			case z_monuments
			<movie> = 'movies/bik/freedom_plaza.bik.xen'
			case Load_Z_Museums
			case z_museums
			<movie> = 'movies/bik/dc_monuments.bik.xen'
			case Load_Z_Museum_Int
			case z_museum_int
			<movie> = 'movies/bik/museums.bik.xen'
			case Load_Z_PB_Bridge
			case z_pb_bridge
			<movie> = 'movies/bik/philly_balt_bridge.bik.xen'
			case Load_Z_BW_Bridge
			case z_bw_bridge
			<movie> = 'movies/bik/balt_dc_bridge.bik.xen'
			case Load_Z_WP_Bridge
			case z_wp_bridge
			<movie> = 'movies/bik/subway.bik.xen'
			case load_z_crib
			case z_crib
			<movie> = 'movies/bik/crib.bik.xen'
			case load_z_bedroom
			case z_bedroom
			<movie> = 'movies/bik/cas.bik.xen'
			case Load_Z_Secret
			case Z_SECRET
			default
		endswitch
	endif
	GetGameMode
	if IsInCrib
		crib_kill_bink_immediate
	endif
	hideloadingscreen
	killallmovies
	text_texture = 'loading_text'
	text_position = {text_x = 450 text_y = 550}
	if french
		text_texture = (<text_texture> + '_f')
	elseif german
		text_texture = (<text_texture> + '_g')
	elseif italian
		text_texture = (<text_texture> + '_i')
	elseif spanish
		text_texture = (<text_texture> + '_s')
	else
		text_texture = (<text_texture> + '_e')
	endif
	displayloadingscreen <movie> movie_mem text_texture = <text_texture> <text_position>
	change ANY_LEVEL_LOADED_YET = 1
	change loadscreen_last_game_mode = <gamemode>
endscript
