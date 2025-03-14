in_bus = 0
minimum_zone_load_time = 3500
last_welcome_text = ""
welcome_text_show_time = 5.0
welcome_text_cooldown_time = 2.0
rendermetricszonenames = [
	'General'
	'houses'
	'ghetto'
	'cartoon'
	'shops'
	'school'
	'inschool'
	'outschool'
	'parking'
	'funpark'
	'citypark'
	'cretepark'
	'center'
	'factory'
	'skin'
	'z_bcity'
	'z_harbor'
	'z_lansdowne'
	'z_bw_bridge'
	'z_monuments'
	'z_museum_int'
	'z_museums'
	'z_wp_bridge'
	'z_bell'
	'z_love'
	'z_slums'
	'z_fdr'
	'z_pb_bridge'
]
SkateZoneParams = {
	z_slums_params = {
		prefix = 'Z_Slums'
		name = "North Philly"
		welcome_text = "Inner-city Philly"
		area = Area_Philly
	}
	z_fdr_params = {
		prefix = 'Z_FDR'
		name = "FDR Skatepark"
		welcome_text = ""
		area = Area_Philly
	}
	z_love_params = {
		prefix = 'Z_Love'
		name = "Philly Love Park"
		welcome_text = "Downtown Philly"
		area = Area_Philly
	}
	z_bell_params = {
		prefix = 'Z_Bell'
		name = "Philly Liberty Bell"
		welcome_text = "Downtown Philly"
		area = Area_Philly
	}
	z_bcity_params = {
		prefix = 'Z_BCity'
		name = "City of Baltimore"
		welcome_text = "Downtown Baltimore"
		area = Area_Baltimore
	}
	z_harbor_params = {
		prefix = 'Z_Harbor'
		name = "Baltimore Harbor"
		welcome_text = "Baltimore Inner Harbor"
		area = Area_Baltimore
	}
	z_lansdowne_params = {
		prefix = 'Z_Lansdowne'
		name = "Lansdowne"
		welcome_text = "Baltimore Lansdowne"
		area = Area_Baltimore
	}
	z_monuments_params = {
		prefix = 'Z_Monuments'
		name = "The Monuments"
		welcome_text = "Freedom Plaza"
		area = Area_DC
	}
	z_museums_params = {
		prefix = 'Z_Museums'
		name = "Museums"
		welcome_text = "D.C. National Mall"
		area = Area_DC
	}
	z_museum_int_params = {
		prefix = 'Z_Museum_Int'
		name = "Museum Interior"
		welcome_text = "Air and Space Museum"
		area = Area_DC
	}
	z_pb_bridge_params = {
		prefix = 'Z_PB_Bridge'
		name = "P.B. Bridge"
		welcome_text = "Bay Bridge-Tunnel"
		area = Area_Bridges
	}
	z_bw_bridge_params = {
		prefix = 'Z_BW_Bridge'
		name = "B.W. Bridge"
		welcome_text = "Harbor Bridge"
		area = Area_Bridges
	}
	z_wp_bridge_params = {
		prefix = 'Z_WP_Bridge'
		name = "W.P. Bridge"
		welcome_text = "Metro"
		area = Area_Bridges
	}
	Z_Secret_Params = {
		prefix = 'Z_Secret'
		name = "the Underground"
		welcome_text = "J.R. Interchange"
		area = Area_Bridges
	}
	Z_Crib_Params = {
		prefix = 'Z_Crib'
		name = "Your Skate Lounge"
		welcome_text = "YOUR SKATE LOUNGE"
		area = Area_Crib
	}
}

script Zone_LoadLastPlayed 
	if NOT careerfunc \{func = getlastlevelplayed}
		scriptassert \{"no last level recorded!"}
	endif
	spawnscriptlater noqbid change_level params = {level = <last_level>}
endscript

script zone_changed 
	if NOT (($SkateZoneParams.<newzoneparamsstruct>.welcome_text) = "")
		killspawnedscript name = Zone_Changed_New_Text
		spawnscriptnow Zone_Changed_New_Text params = {
			welcome_text = ($SkateZoneParams.<newzoneparamsstruct>.welcome_text)
		}
	endif
	if NOT gotparam newzoneparamsstruct
		return
	endif
	if NOT gamemodeequals is_career
		return
	endif
	refresh_map_data
	GetLevelStructureName level = ($SkateZoneParams.<newzoneparamsstruct>.prefix)
	<load_script> = (<level_structure_name>.load_script)
	if careerfunc func = getlastlevelplayed
		if (<last_level> = <load_script>)
			return
		endif
	endif
	CareerStartLevel structure_name = <level_structure_name>
	spawnscriptlater game_progress_process_status params = {wait_time = 1}
endscript

script Zone_Changed_New_Text 
	wait_for_script_to_finish \{name = Zone_Changed_Show_Text}
	if NOT (<welcome_text> = $last_welcome_text)
		spawnscriptnow Zone_Changed_Show_Text params = {welcome_text = <welcome_text>}
	endif
endscript

script Zone_Changed_Show_Text 
	change last_welcome_text = <welcome_text>
	if NOT gman_getactivatedgoalid
		hud_message type = alert_signpost text = <welcome_text> time = ($welcome_text_show_time)
	endif
	wait ($welcome_text_show_time) seconds
	wait ($welcome_text_cooldown_time) seconds
endscript

script get_current_zone_as_checksum 
	getpakmancurrentname \{map = zones}
	formattext checksumname = current_zone '%s' s = <pakname>
	return current_zone = <current_zone>
endscript

script get_zone_params 
	requireparams \{[
			zone
		]
		all}
	if structurecontains structure = $WWWZones <zone>
		<zone_params_id> = ($WWWZones.<zone>.params_struct)
		if gotparam \{zone_params_id}
			return zone_params = ($SkateZoneParams.<zone_params_id>)
		endif
	elseif checksumequals a = <zone> b = z_crib
		<zone_params_id> = ($CribZones.z_crib.params_struct)
		if gotparam \{zone_params_id}
			return zone_params = ($SkateZoneParams.<zone_params_id>)
		endif
	endif
endscript

script get_zone_ui_name 
	requireparams [zone] all
	get_zone_params zone = <zone>
	if gotparam zone_params
		if (<zone_params>.welcome_text = "")
			return zone_ui_name = (<zone_params>.name)
		else
			return zone_ui_name = (<zone_params>.welcome_text)
		endif
	else
		printf "WARNING: Missing zone_params for %z!" z = <zone>
		return zone_ui_name = ""
	endif
endscript

script Does_Zone_Change_Require_Pak_Load 
	requireparams [start_zone dest_zone] all
	if NOT structurecontains structure = $WWWZones <start_zone>
		softassert 'start_zone %z not in $WWWZones' z = <start_zone>
		return true
	endif
	if NOT structurecontains structure = $WWWZones <dest_zone>
		softassert 'dest_zone %z not in $WWWZones' z = <dest_zone>
		return true
	endif
	<start_zone_links> = ($WWWZones.<start_zone>.zones)
	<dest_zone_links> = ($WWWZones.<dest_zone>.zones)
	<start_zones_loaded> = {<start_zone>}
	begin
	if getnextarrayelement <start_zone_links> index = <index>
		<start_zones_loaded> = {<start_zones_loaded> <element>}
	else
		break
	endif
	repeat
	<dest_zones_loaded> = {<dest_zone>}
	begin
	if getnextarrayelement <dest_zone_links> index = <index>
		<dest_zones_loaded> = {<dest_zones_loaded> <element>}
	else
		break
	endif
	repeat
	if comparestructs struct1 = <dest_zones_loaded> struct2 = <dest_zones_loaded>
		printf 'zone %s -> %d does not require pak loads' s = <start_zone> d = <dest_zone>
		return false
	else
		printf 'zone %s -> %d requires pak loads' s = <start_zone> d = <dest_zone>
		return true
	endif
endscript

script Zone_SetAppropriateMap 
	<zone_folder> = 'zones/'
	mempushcontext heap_scenes
	createpakmanmap map = scenes links = SceneLinks folder = <zone_folder>
	mempopcontext
	formattext checksumname = zone_id '%s' s = <level>
	switch (<zone_id>)
		case z_mainmenu
		createpakmanmap map = zones links = mainmenuzones folder = <zone_folder>
		case z_bedroom
		createpakmanmap map = zones links = bedroomzones folder = <zone_folder>
		case z_crib
		DisablePakManStreaming
		createpakmanmap map = zones links = CribZones folder = <zone_folder>
		createpakmanmap map = crib_themes links = CribThemes folder = <zone_folder>
		case z_viewer
		if isps3
			createpakmanmap {
				map = zones
				links = ViewerZones
				folder = <zone_folder>
				size = (10 * 1024)
				vram_size = (65 * 1024)
			}
		else
			createpakmanmap {
				map = zones
				links = ViewerZones
				folder = <zone_folder>
				size = (75 * 1024)
			}
		endif
		default
		GetGameMode
		career_game = 0
		if gamemodeequals is_career
			career_game = 1
		elseif gamemodeequals is_singlesession
			career_game = 1
		endif
		if (<career_game> = 1)
			EnablePakManStreaming
			createpakmanmap map = zones links = WWWZones folder = <zone_folder> uselinkslots
		else
			if innetgame
				EnablePakManStreaming
			else
				DisablePakManStreaming
			endif
			pakman_struct = WWWZones
			if structurecontains structure = <...> pakman
				pakman_struct = <pakman>
			endif
			createpakmanmap map = zones links = <pakman_struct> folder = <zone_folder> uselinkslots
		endif
		UpdateRailNodeAssetTable
	endswitch
	return career_game = <career_game>
endscript

script GetPakSizes 
	getplatform
	switch <platform>
		case xenon
		return \{pak_sizes_array = pak_sizes_xen}
		case ps3
		return \{pak_sizes_array = pak_sizes_ps3}
		default
		scriptassert \{"Unknown platform"}
	endswitch
endscript
g_desired_average = 20
g_low_average_threshold = 0.95
g_high_average_threshold = 1.5
g_forced_catch_up_average = 1.3

script setup_gs_idle_proc_params 
	SetGSIdleProcParams \{desired_average = $g_desired_average
		low_average_threshold = $g_low_average_threshold
		high_average_threshold = $g_high_average_threshold
		forced_catch_up_average = $g_forced_catch_up_average}
endscript
