default_first_zone = Load_Z_Slums
Area_List = [
	{
		name = Area_DC
		text = "Washington DC"
		abbrev = "DC"
		zones = [
			z_monuments
			z_museums
			z_museum_int
		]
	}
	{
		name = Area_Baltimore
		text = "Baltimore"
		abbrev = "BAL"
		zones = [
			z_bcity
			z_lansdowne
			z_harbor
		]
	}
	{
		name = Area_Philly
		text = "Philadelphia"
		abbrev = "PHI"
		zones = [
			z_fdr
			z_love
			z_bell
			z_slums
		]
	}
	{
		name = Area_Crib
		text = "Your Skate Lounge"
		abbrev = "PAD"
		zones = [
			z_crib
		]
	}
	{
		name = Area_Bridges
		text = "City Transport"
		abbrev = "TRA"
		zones = [
			z_pb_bridge
			z_bw_bridge
			z_wp_bridge
		]
	}
	{
		name = Area_Other
		text = "Other Area"
		abbrev = "NA"
	}
]
SkaterCareerParams = {
	level_table = [
		{
			names = [
				'z_mainmenu'
				'mainmenu'
			]
			include_in_all_gaps_check = 0
			is_frontend = 1
		}
		{
			names = [
				'z_bedroom'
			]
			include_in_all_gaps_check = 0
			is_frontend = 1
		}
		{
			names = [
				'Z_TestLevel'
				'testlevel'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'Z_TestLevel_Peds'
				'testlevel_peds'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_viewer'
				'viewer'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_ambientscenes'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_storyselect'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_TestLevel_A1'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_TestLevel_Climbing'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_anim'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_FDR'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_Slums'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_Bell'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_Love'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_crib'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_Museums'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_Monuments'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_Museum_Int'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_BCity'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_Harbor'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_Lansdowne'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_PB_Bridge'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_BW_Bridge'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_WP_Bridge'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
		{
			names = [
				'z_secret'
			]
			include_in_all_gaps_check = 0
			is_frontend = 0
		}
	]
}
lod_loadedpaks = [
]
LOD_Skate9_LevelList = [
	'Z_MONUMENTS'
	'Z_MUSEUMS'
	'Z_BCITY'
	'Z_HARBOR'
	'Z_LANSDOWNE'
	'Z_LOVE'
	'Z_BELL'
	'Z_FDR'
	'Z_SLUMS'
	'Z_PB_BRIDGE'
	'Z_WP_BRIDGE'
	'Z_BW_BRIDGE'
	'Z_SECRET'
]

script load_z_mainmenu 
	load_level \{$level_Z_Mainmenu}
endscript

script load_z_bedroom 
	load_level \{$Level_Z_Bedroom}
endscript

script Load_Z_TestLevel 
	load_level \{$Level_Z_TestLevel}
endscript

script load_z_testlevel_peds 
	load_level \{$Level_Z_TestLevel_Peds}
endscript

script viewer 
	load_level \{$level_z_viewer}
endscript

script Load_Z_TestLevel_A1 
	load_level \{$Level_Z_TestLevel_A1}
endscript

script Load_Z_TestLevel_Climbing 
	load_level \{$Level_Z_TestLevel_Climbing}
endscript

script Load_Z_AmbientScenes 
	load_level \{$Level_Z_AmbientScenes}
endscript

script Load_Z_Anim 
	load_level \{$Level_Z_Anim}
endscript

script Load_Z_Peds 
	load_level \{$Level_Z_Peds}
endscript

script Load_Z_Vehicles 
	load_level \{$Level_Z_Vehicles}
endscript

script Load_Z_FDR 
	load_level \{$Level_Z_FDR}
endscript

script Load_Z_Slums 
	load_level \{$Level_Z_Slums}
endscript

script Load_Z_Bell 
	load_level \{$Level_Z_Bell}
endscript

script Load_Z_Love 
	load_level \{$Level_Z_Love}
endscript

script load_z_crib 
	load_level \{$level_z_crib}
endscript

script Load_Z_BCity 
	load_level \{$Level_Z_BCity}
endscript

script load_z_harbor 
	load_level \{$Level_Z_Harbor}
endscript

script Load_Z_Lansdowne 
	load_level \{$Level_Z_Lansdowne}
endscript

script Load_Z_Monuments 
	load_level \{$Level_Z_Monuments}
endscript

script Load_Z_Museums 
	load_level \{$Level_Z_Museums}
endscript

script Load_Z_Museum_Int 
	load_level \{$Level_Z_Museum_Int}
endscript

script Load_Z_PB_Bridge 
	load_level \{$Level_Z_PB_Bridge}
endscript

script Load_Z_BW_Bridge 
	load_level \{$Level_Z_BW_Bridge}
endscript

script Load_Z_WP_Bridge 
	load_level \{$Level_Z_WP_Bridge}
endscript

script Load_Z_Secret 
	load_level \{$Level_Z_Secret}
endscript

script whole_world 
	unload_net_area_pak
endscript
level_z_viewer = {
	structure_name = level_z_viewer
	load_script = viewer
	name = "Viewer"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Viewer'
	setup_script = z_viewer_setup
	default_stats = 10
	default_stats_classic = 10
	pedlife_allowed = 0
	shadow_texture = white
}
Level_Z_TestLevel = {
	structure_name = Level_Z_TestLevel
	load_script = Load_Z_TestLevel
	name = "TestLevel"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_TestLevel'
	setup_script = Z_TestLevel_setup
	default_stats = 10
	default_stats_classic = 10
	peds = 40
	pedlife_allowed = 0
	shadow_texture = white
}
Level_Z_TestLevel_Peds = {
	structure_name = Level_Z_TestLevel_Peds
	load_script = load_z_testlevel_peds
	name = "TestLevel Peds"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_TestLevel_Peds'
	setup_script = z_testlevel_peds_setup
	default_stats = 10
	default_stats_classic = 10
	peds = 40
	pedlife_allowed = 0
	shadow_texture = white
}
level_Z_Mainmenu = {
	structure_name = level_Z_Mainmenu
	load_script = load_z_mainmenu
	name = "Main Menu"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 6.75
	level_name = 'z_mainmenu'
	level = 'z_mainmenu'
	setup_script = z_mainmenu_setup
	pause_movie = 'MainMenu'
	default_stats = 8
	pedlife_allowed = 1
	shadow_texture = white
}
Level_Z_Bedroom = {
	structure_name = Level_Z_Bedroom
	load_script = load_z_bedroom
	name = "Bedroom"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Bedroom'
	goals_script = Z_Bedroom_Goals
	setup_script = Z_Bedroom_setup
	pause_movie = "CASHipHop"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = white
}
Level_Z_TestLevel_A1 = {
	structure_name = Level_Z_TestLevel_A1
	load_script = Load_Z_TestLevel_A1
	name = "TestLevel A1"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_TestLevel_A1'
	setup_script = Z_TestLevel_A1_setup
	default_stats = 10
	default_stats_classic = 10
	peds = 40
	pedlife_allowed = 1
	shadow_texture = white
}
Level_Z_TestLevel_Climbing = {
	structure_name = Level_Z_TestLevel_Climbing
	load_script = Load_Z_TestLevel_Climbing
	name = "TestLevel Climbing"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_TestLevel_Climbing'
	setup_script = Z_TestLevel_Climbing_setup
	default_stats = 10
	default_stats_classic = 10
	peds = 40
	pedlife_allowed = 1
	shadow_texture = white
}
Level_Z_AmbientScenes = {
	structure_name = Level_Z_AmbientScenes
	load_script = Load_Z_AmbientScenes
	name = "Z_AmbientScenes"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_ambientscenes'
	setup_script = Z_AmbientScenes_Setup
	default_stats = 10
	default_stats_classic = 10
	peds = 40
	pedlife_allowed = 1
	shadow_texture = white
}
Level_Z_Anim = {
	structure_name = Level_Z_Anim
	load_script = Load_Z_Anim
	name = "Z_Anim"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Anim'
	setup_script = Z_Anim_setup
	pause_movie = 'FunPark'
	default_stats = 10
	default_stats_classic = 10
	peds = 40
	pedlife_allowed = 1
	shadow_texture = white
}
Level_Z_Peds = {
	structure_name = Level_Z_Peds
	load_script = Load_Z_Peds
	name = "Z_Peds"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Peds'
	setup_script = Z_Peds_setup
	pause_movie = 'FunPark'
	default_stats = 10
	default_stats_classic = 10
	peds = 40
	pedlife_allowed = 1
	shadow_texture = white
}
Level_Z_Vehicles = {
	structure_name = Level_Z_Vehicles
	load_script = Load_Z_Vehicles
	name = "Z_Vehicles"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Vehicles'
	setup_script = Z_Vehicles_setup
	pause_movie = 'FunPark'
	default_stats = 10
	default_stats_classic = 10
	peds = 40
	pedlife_allowed = 1
	shadow_texture = white
}
Level_Z_FDR = {
	structure_name = Level_Z_FDR
	load_script = Load_Z_FDR
	name = "FDR Skatepark"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_FDR'
	goals_script = nullscript
	setup_script = Z_FDR_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = sk8_world_shadowmap
}
Level_Z_Slums = {
	structure_name = Level_Z_Slums
	load_script = Load_Z_Slums
	name = "North Philly"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Slums'
	goals_script = nullscript
	setup_script = Z_Slums_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = sk8_world_shadowmap
}
Level_Z_Bell = {
	structure_name = Level_Z_Bell
	load_script = Load_Z_Bell
	name = "Liberty Bell Plaza"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Bell'
	goals_script = nullscript
	setup_script = Z_Bell_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = sk8_world_shadowmap
}
Level_Z_Love = {
	structure_name = Level_Z_Love
	load_script = Load_Z_Love
	name = "Love Park"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Love'
	goals_script = nullscript
	setup_script = Z_Love_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = sk8_world_shadowmap
}
level_z_crib = {
	structure_name = level_z_crib
	load_script = load_z_crib
	name = "Your Skate Lounge"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Crib'
	goals_script = nullscript
	setup_script = Z_Crib_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = white
}
Level_Z_BCity = {
	structure_name = Level_Z_BCity
	load_script = Load_Z_BCity
	name = "Baltimore City"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_BCity'
	goals_script = nullscript
	setup_script = Z_BCity_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = white
}
Level_Z_Harbor = {
	structure_name = Level_Z_Harbor
	load_script = load_z_harbor
	name = "Balt Harbor"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Harbor'
	goals_script = nullscript
	setup_script = z_harbor_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = sk8_world_shadowmap
}
Level_Z_Lansdowne = {
	structure_name = Level_Z_Lansdowne
	load_script = Load_Z_Lansdowne
	name = "Balt Lansdowne"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Lansdowne'
	goals_script = nullscript
	setup_script = Z_Lansdowne_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = sk8_world_shadowmap
}
Level_Z_Monuments = {
	structure_name = Level_Z_Monuments
	load_script = Load_Z_Monuments
	name = "DC Monuments"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Monuments'
	goals_script = nullscript
	setup_script = Z_Monuments_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = sk8_world_shadowmap
}
Level_Z_Museums = {
	structure_name = Level_Z_Museums
	load_script = Load_Z_Museums
	name = "DC Museums"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Museums'
	goals_script = nullscript
	setup_script = Z_Museums_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = sk8_world_shadowmap
}
Level_Z_Museum_Int = {
	structure_name = Level_Z_Museum_Int
	load_script = Load_Z_Museum_Int
	name = "DC Museum Interior"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Museum_Int'
	goals_script = nullscript
	setup_script = Z_Museum_Int_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = white
}
Level_Z_PB_Bridge = {
	structure_name = Level_Z_PB_Bridge
	load_script = Load_Z_PB_Bridge
	name = "Philly Balt Bridge"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_PB_Bridge'
	goals_script = nullscript
	setup_script = Z_PB_Bridge_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = white
}
Level_Z_BW_Bridge = {
	structure_name = Level_Z_BW_Bridge
	load_script = Load_Z_BW_Bridge
	name = "Balt DC Bridge"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_BW_Bridge'
	goals_script = nullscript
	setup_script = Z_BW_Bridge_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = sk8_world_shadowmap
}
Level_Z_WP_Bridge = {
	structure_name = Level_Z_WP_Bridge
	load_script = Load_Z_WP_Bridge
	name = "DC Philly Bridge"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_WP_Bridge'
	goals_script = nullscript
	setup_script = Z_WP_Bridge_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = white
}
Level_Z_Secret = {
	structure_name = Level_Z_Secret
	load_script = Load_Z_Secret
	name = "Sewer"
	loading_screen_default = 'loadscrn_generic'
	loading_time = 9.5
	level = 'Z_Secret'
	goals_script = nullscript
	setup_script = Z_Secret_setup
	pause_movie = "CityCenter"
	default_stats = 10
	default_stats_classic = 10
	peds = 0
	pedlife_allowed = 1
	shadow_texture = white
}

script Get_Area_Data 
	getarraysize \{$Area_List}
	area_count = <array_size>
	iArea = 0
	begin
	if (($Area_List) [<iArea>].name = <area>)
		return area_data = (($Area_List) [<iArea>])
	endif
	iArea = (<iArea> + 1)
	repeat <area_count>
endscript

script Get_Area_From_Zone 
	appendsuffixtochecksum base = <zone> suffixstring = '_params'
	params_struct = (($SkateZoneParams).<appended_id>)
	if gotparam \{params_struct}
		if structurecontains structure = (<params_struct>) area
			return area = ((<params_struct>).area)
		endif
	endif
	return \{area = Area_Other}
endscript

script Get_Current_Area 
	if getpakmancurrentname \{map = zones}
		formattext checksumname = current_zone '%s' s = <pakname>
		Get_Area_From_Zone zone = <current_zone>
		return area = <area>
	endif
endscript

script Get_Zones_In_Area 
	Get_Area_Data area = <area>
	return zones = (<area_data>.zones)
endscript

script Verify_Area_Data 
	getarraysize $Area_List
	area_count = <array_size>
	iArea = 0
	begin
	if ((<iArea> + 1) < <area_count>)
		area_name = (($Area_List) [<iArea>].name)
		Get_Zones_In_Area area = <area_name>
		Get_Area_Data area = <area_name>
		getarraysize (<zones>)
		zone_count = <array_size>
		iZone = 0
		begin
		zone_entry = ((<zones>) [<iZone>])
		Get_Area_From_Zone zone = <zone_entry>
		if NOT (<area> = <area_name>)
			scriptassert "Param data for %z says area is %a, but area data says %b" z = <zone_entry> a = <area> b = <area_name>
		endif
		iZone = (<iZone> + 1)
		repeat <zone_count>
	endif
	iArea = (<iArea> + 1)
	repeat <area_count>
endscript
