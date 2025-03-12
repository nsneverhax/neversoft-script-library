g_memory_check_fragmentation = 0
g_memory_check_leaks = 0
g_heaps_allowed_fragmentation = [
	{
		heap = heap_thread_local_storage
		amount = 16
	}
	{
		heap = heap_script_cache_small_allocs
	}
	{
		heap = heap_script_cache_big_allocs
	}
	{
		heap = heap_script
	}
	{
		heap = heap_frontend
	}
	{
		heap = heap_renderdata
		amount = 128
	}
	{
		heap = heap_frag
	}
	{
		heap = heap_network
	}
	{
		heap = heap_nodearray
	}
	{
		heap = heap_skeleton
	}
	{
		heap = heap_audio
	}
	{
		heap = heap_animnode
	}
	{
		heap = heap_debug
	}
	{
		heap = heap_debug_rsx
	}
	{
		heap = heap_flxparticles
	}
	{
		heap = heap_avatar1
	}
	{
		heap = heap_avatar2
	}
	{
		heap = heap_avatar3
	}
	{
		heap = heap_avatar4
	}
]
g_anim_pool_params = {
	anim_node_pools = [
		{
			element_size = 72
			max_elements = 600
		}
		{
			element_size = 160
			max_elements = 64
		}
		{
			element_size = 512
			max_elements = 32
		}
		{
			element_size = 1200
			max_elements = 128
		}
		{
			element_size = 1872
			max_elements = 30
		}
		{
			element_size = 18016
			max_elements = 4
		}
	]
	num_degen_blend_child_states = 512
	num_blend_functions = 256
	num_curve_blend_arrays = 200
	num_poses = 12
}

script memory_get_heap_sizes 
	heap_inner_overhead = (1 * 1024)
	if isps3
		main_heap_overhead = (384)
		vram_heap_overhead = ((40 * 1024) + <main_heap_overhead>)
	else
		main_heap_overhead = (384)
		vram_heap_overhead = (0)
	endif
	atoms_size = (85 * 1024)
	ghtunes_cache_size = (1 * 1024 * 1024)
	get_num_savegames
	<heap_size_skeleton> = (180 * 1024)
	<heap_size_animnode> = (512 * 1024)
	<heap_size_ms_notes> = (2 * 1024 * 1024)
	<heap_size_save_file> = ((2 * 1024 * 1024) + <heap_inner_overhead>)
	<heap_size_song> = ((9 * 1024 * 1024) + (20 * 1024))
	<heap_size_atoms> = (<atoms_size> * <num_savegames>)
	<heap_size_frag> = (320 * 1024)
	<heap_size_lightortho> = (10 * 1024)
	<heap_size_player_info> = (32 * 1024)
	<heap_size_gameplay> = (1100 * 1024)
	<heap_size_gameplay_per_player> = (256 * 1024)
	<heap_size_nodearray> = (768 * 1024)
	<heap_size_songstat_pak> = (410 * 1024)
	<heap_size_musician_anim> = (19156 * 1024)
	<heap_size_win_lose_anim> = (860 * 1024)
	<heap_size_crowd> = (120 * 1024)
	<heap_size_musicstore> = ((1 * 1024 * 1024) + (256 * 1024))
	if isxenonorwindx
		<heap_size_ui_shared> = (13892 * 1024)
		<heap_size_ui_shared_vram> = 0
		<heap_size_in_game> = (12890 * 1024)
		<heap_size_in_game_vram> = 0
		<heap_size_jam> = 0
		<heap_size_jam_vram> = 0
		<heap_size_audio> = ((13 * 1024 * 1024) + (256 * 1024))
		<heap_size_global_sfx> = ((7 * 1024 * 1024) + (310 * 1024))
		<heap_size_global_sfx_vram> = 0
		<heap_size_musicstudio_guitar> = ((21 * 1024 * 1024) + (658 * 1024))
		<heap_size_musicstudio_guitar_vram> = 0
		<heap_size_musicstudio_bass> = ((4 * 1024 * 1024) + (618 * 1024))
		<heap_size_musicstudio_bass_vram> = 0
		<heap_size_musicstudio_keyboard> = ((2 * 1024 * 1024) + (512 * 1024))
		<heap_size_musicstudio_keyboard_vram> = 0
		<heap_size_drumkitaudio> = ((1 * 1024 * 1024) + (512 * 1024))
		<heap_size_drumkitaudio_vram> = 0
		<heap_size_drumkitaudio_percussion> = ((1 * 1024 * 1024) + (512 * 1024))
		<heap_size_drumkitaudio_percussion_vram> = 0
		<heap_size_musician> = (13500 * 1024)
		<heap_size_musician_vram> = (0 * 1024)
		<heap_size_downloads> = (1 * 1024 * 1024)
		<heap_size_downloads_vram> = (0 * 1024)
		<heap_size_cas_build> = ((4 * 1024 * 1024) + (256 * 1024))
		<heap_size_cas_build_vram> = (0 * 1024 * 1024)
		<heap_size_cas_global> = ((17 * 1024 * 1024) + (140 * 1024))
		<heap_size_cas_global_vram> = (0 * 1024 * 1024)
		<heap_size_cas_cache> = (<heap_size_musicstudio_guitar> + <main_heap_overhead> +
			<heap_size_musicstudio_bass> + <main_heap_overhead> +
			<heap_size_musicstudio_keyboard> + <main_heap_overhead> +
			<heap_size_drumkitaudio> + <main_heap_overhead> +
			<heap_size_drumkitaudio_percussion> + <main_heap_overhead> +
			<heap_size_song> + <main_heap_overhead>)
		<heap_size_cas_cache_vram> = (0 * 1024)
		if ($cas_pieces_is_a_reference_archive = 1)
			<cas_building_cache_size> = (30 * 1024 * 1024)
			<cas_ui_precache_size> = (0 * 1024 * 1024)
		else
			<cas_building_cache_size> = (6 * 1024 * 1024)
			<cas_ui_precache_size> = ((34 * 1024 * 1024) + (512 * 1024))
		endif
		<heap_size_zones> = ((31 * 1024 * 1024) + (900 * 1024))
		<heap_size_zones_vram> = (0 * 1024 * 1024)
		<heap_size_zone_slop_space_req> = (50 * 1024)
		<heap_size_drumkits> = (1 * 1024)
		<heap_size_ui_pak_slot> = ((9 * 1024 * 1024) + (512 * 1024))
		<heap_size_ghtunes_cache> = (1 * 1024 * 1024)
		<heap_size_ghtunes_cache_vram> = (0 * 1024)
		<heap_size_bink> = ((<heap_size_save_file> + <main_heap_overhead>) +
			(<heap_size_ghtunes_cache> + <main_heap_overhead>) +
			(16 * 1024) +
			(4 * 1024 * 1024) + (256 * 1024)
		)
		<heap_size_bink_vram> = 0
		<heap_size_downloadpaks> = (600 * 1024)
		<heap_size_massive_ads> = (1 * 1024 * 1024)
		<heap_size_massive_ads_vram> = (0)
		<heap_size_stash> = ((7 * 1024 * 1024) + (24 * 1024))
		<heap_size_stash_vram> = (0 * 1024 * 1024)
		<heap_size_ref_archive_names> = (576 * 1024)
		<bottomup_runtime_size_required> = (770 * 1024)
		if globalexists \{name = g_extra_zone_memory}
			if ($g_extra_zone_memory = 1)
				<heap_size_stash> = 0
				<heap_size_zones> = (<heap_size_zones> + (8 * 1024 * 1024))
			endif
		endif
		if iswindx
			<heap_size_drumkitaudio> = (3 * 1024 * 1024)
			<heap_size_drumkitaudio_percussion> = (3 * 1024 * 1024)
			<heap_size_cas_cache> = (2 * <heap_size_cas_cache>)
			<heap_size_global_sfx> = (10 * 1024 * 1024)
			<heap_size_zones> = (36 * 1024 * 1024)
		endif
	else
		<heap_size_ui_shared> = (2420 * 1024)
		<heap_size_ui_shared_vram> = (13344 * 1024)
		<heap_size_in_game> = (576 * 1024)
		<heap_size_in_game_vram> = (9057 * 1024)
		<heap_size_jam> = ((0 * 1024))
		<heap_size_jam_vram> = ((7 * 1024 * 1024) + (64 * 1024))
		<heap_size_audio> = ((12 * 1024 * 1024) + (256 * 1024))
		<heap_size_global_sfx> = (20 * 1024)
		<heap_size_global_sfx_vram> = ((4 * 1024 * 1024) + (512 * 1024))
		<heap_size_musicstudio_guitar> = (56 * 1024)
		<heap_size_musicstudio_guitar_vram> = ((17 * 1024 * 1024) + (0 * 1024))
		<heap_size_musicstudio_bass> = (16 * 1024)
		<heap_size_musicstudio_bass_vram> = ((5 * 1024 * 1024) + (0 * 1024))
		<heap_size_musicstudio_keyboard> = (32 * 1024)
		<heap_size_musicstudio_keyboard_vram> = ((2 * 1024 * 1024) + (320 * 1024))
		<heap_size_cdnpools> = (900 * 1024)
		<heap_size_drumkitaudio> = (32 * 1024)
		<heap_size_drumkitaudio_vram> = ((2 * 1024 * 1024) + (256 * 1024))
		<heap_size_drumkitaudio_percussion> = (32 * 1024)
		<heap_size_drumkitaudio_percussion_vram> = ((1 * 1024 * 1024) + (512 * 1024))
		<heap_size_musician> = (2300 * 1024)
		<heap_size_musician_vram> = (10500 * 1024)
		<heap_size_downloads> = (1 * 1024 * 1024)
		<heap_size_downloads_vram> = (1 * 1024 * 1024)
		<heap_size_cas_build> = ((1 * 1024 * 1024) + (512 * 1024))
		<heap_size_cas_build_vram> = (4 * 1024 * 1024)
		<heap_size_cas_global> = (80 * 1024)
		<heap_size_cas_global_vram> = ((16 * 1024 * 1024) + (0 * 1024))
		<heap_size_cas_cache> = ((10 * 1024 * 1024) - (50 * 1024) - <heap_size_skeleton>)
		<intro_movie_vram_extra_space> = (3288 * 1024)
		<additional_vram_for_cas_precache> = (6 * 1024 * 1024)
		<additional_vram_for_cas_building> = (2 * 1024 * 1024)
		<heap_size_cas_cache_vram> = (<heap_size_musicstudio_guitar_vram> +
			<heap_size_musicstudio_bass_vram> +
			<heap_size_musicstudio_keyboard_vram> +
			<heap_size_drumkitaudio_vram> +
			<heap_size_drumkitaudio_percussion_vram> +
			<intro_movie_vram_extra_space> +
			<additional_vram_for_cas_precache> +
			<additional_vram_for_cas_building>)
		if ($cas_pieces_is_a_reference_archive = 1)
			<cas_building_cache_size> = (9 * 1024 * 1024)
			<cas_building_cache_size_vram> = (20 * 1024 * 1024)
			<cas_ui_precache_size> = (0 * 1024 * 1024)
			<cas_ui_precache_size_vram> = (0 * 1024 * 1024)
		else
			<cas_building_cache_size> = (1 * 1024 * 1024)
			<cas_building_cache_size_vram> = ((6 * 1024 * 1024) + <additional_vram_for_cas_building>)
			<cas_ui_precache_size> = ((8 * 1024 * 1024) + (512 * 1024))
			<cas_ui_precache_size_vram> = ((22 * 1024 * 1024) + <intro_movie_vram_extra_space> + <additional_vram_for_cas_precache>)
		endif
		<heap_size_zones> = ((3 * 1024 * 1024) + (768 * 1024))
		<heap_size_zones_vram> = ((27 * 1024 * 1024) + (256 * 1024))
		<heap_size_ui_pak_slot> = (850 * 1024)
		<heap_size_ui_pak_slot_vram> = ((10 * 1024 * 1024) + (0 * 1024))
		<heap_size_ghtunes_cache> = (1 * 1024)
		<heap_size_ghtunes_cache_vram> = (<ghtunes_cache_size>)
		<heap_size_bink> = (
			(<heap_size_save_file> + <main_heap_overhead>) +
			(<heap_size_ghtunes_cache> + <main_heap_overhead> + <vram_heap_overhead>) +
			(16 * 1024) +
			(1300 * 1024)
		)
		<heap_size_bink_vram> = (
			(<heap_size_ghtunes_cache_vram>) +
			((3 * 1024 * 1024) + (430 * 1024) + (2200 * 1024))
		)
		<heap_size_downloadpaks> = (400 * 1024)
		<heap_size_downloadpaks_vram> = (3 * 128 * 1024)
		<heap_size_massive_ads> = (20 * 1024)
		<heap_size_massive_ads_vram> = (128 * 1024)
		<heap_size_stash> = ((2 * 1024 * 1024) + (580 * 1024))
		<heap_size_stash_vram> = ((8 * 1024 * 1024) + (512 * 1024))
		<heap_size_ref_archive_names> = (1152 * 1024)
		<bottomup_runtime_size_required> = (320 * 1024)
		<bottomup_vram_runtime_size_required> = (2386 * 1024)
		if NOT isps3 \{testkit}
			if NOT finalbuild
				if NOT retailbuild
					<heap_size_stash> = (<heap_size_stash> + (370 * 1024))
				endif
			endif
		endif
	endif
	return <...>
endscript

script create_bink_sub_heaps 
	if NOT gotparam \{no_save_heap}
		memory_destroy_save_heap_at_boot
	endif
	memory_get_heap_sizes
	mempushcontext \{heap_bink}
	if NOT gotparam \{no_save_heap}
		if NOT memheapexists \{name = heap_save_file}
			meminitheap name = 'heap_save_file' size = <heap_size_save_file> vram_size = <heap_size_save_file_vram>
		endif
	endif
	if NOT memheapexists \{name = heap_ghtunes_cache}
		meminitheap name = 'heap_ghtunes_cache' size = <heap_size_ghtunes_cache> vram_size = <heap_size_ghtunes_cache_vram>
	endif
	mempopcontext
endscript

script destroy_bink_sub_heaps 
	change \{save_heap_created_at_boot = 0}
	if memheapexists \{name = heap_save_file}
		memdeleteheap \{name = heap_save_file}
	endif
	if memheapexists \{name = heap_ghtunes_cache}
		jamclearmemcache
		memdeleteheap \{name = heap_ghtunes_cache}
	endif
	if isps3
		if memheapexists \{name = heap_ghtunes_cache_vram}
			memdeleteheap \{name = heap_ghtunes_cache_vram}
		endif
	endif
endscript

script memory_create_save_heap_at_boot 
	memory_get_heap_sizes
	change \{save_heap_created_at_boot = 1}
	mempushcontext \{heap_frontend}
	if NOT memheapexists \{name = heap_save_file}
		meminitheap name = 'heap_save_file' size = <heap_size_save_file> vram_size = <heap_size_save_file_vram>
	endif
	mempopcontext
endscript

script memory_destroy_save_heap_at_boot 
	if ($save_heap_created_at_boot = 1)
		change \{save_heap_created_at_boot = 0}
		if memheapexists \{name = heap_save_file}
			memdeleteheap \{name = heap_save_file}
		endif
	endif
endscript

script memory_create_song_heap 
	if NOT memheapexists \{name = heap_song}
		memory_get_heap_sizes
		mempushcontext \{heap_cas_cache}
		meminitheap name = 'heap_song' size = <heap_size_song>
		mempopcontext
	endif
endscript

script create_song_and_musicstudio_heaps 
	memory_create_song_heap
	musicstudio_instrument_createheaps
endscript

script destroy_song_and_musicstudio_heaps 
	if gotparam \{do_unloads}
		musicstudio_instrument_unloadall
		unloaddrumkitall
		unload_songqpak
	endif
	memdeleteheap \{name = heap_song}
	musicstudio_instrument_deleteheaps
endscript

script memory_get_replay_heap 
	if isps3
		return \{replay_heap = heap_debug}
	endif
	return \{replay_heap = bottomupheap}
endscript

script memory_should_put_zones_on_debug_heap 
	if isps3
		if NOT finalbuild
			if gotextramemory
				if globalexists \{name = zones_on_debugheap}
					if ($zones_on_debugheap = 1)
						return \{true}
					endif
				endif
			endif
		endif
	endif
	return \{false}
endscript

script memory_create_zone_maps 
	memory_get_heap_sizes
	slop_heap = heap_zones
	main_mem_heap = heap_zones
	vram_heap = heap_zones
	if memory_should_put_zones_on_debug_heap
		main_mem_heap = heap_debug_rsx
		slop_heap = heap_debug
	endif
	if isps3
		change \{extra_memory_zones = {
			}}
	else
		if globalexists \{name = g_extra_zone_memory}
			if ($g_extra_zone_memory = 0)
				change \{extra_memory_zones = {
					}}
			endif
		else
			change \{extra_memory_zones = {
				}}
		endif
	endif
	if demobuild
		<links> = g_demo_gh_zones
	else
		<links> = ghzones
	endif
	printf \{qs(0xd8517ff0)}
	mempushcontext <slop_heap>
	if ($ps2_venues = 1)
		createpakmanmap map = zones links = <links> folder = 'zones_ps2/' allocheap = <main_mem_heap> vramheap = <vram_heap> processingheap = <slop_heap>
	else
		createpakmanmap map = zones links = <links> folder = 'zones/' allocheap = <main_mem_heap> vramheap = <vram_heap> processingheap = <slop_heap>
	endif
	mempopcontext
	if isxenon
		getfreememoryonheap heap = <slop_heap>
		if (<free_memory> < <heap_size_zone_slop_space_req>)
			scriptassert 'Zone pak allocation is too big. See above this assert for details of the largest (and thus the problem) zone: %a/%b' a = <free_memory> b = <heap_size_zone_slop_space_req>
		endif
	endif
endscript

script memory_create_ref_archive_names_heap 
	memory_get_heap_sizes
	mempushcontext \{bottomupheap}
	meminitheap name = 'heap_ref_archive_names' size = <heap_size_ref_archive_names>
	mempopcontext
endscript

script memory_check_bottomup_space 
	if NOT retailbuild
		memory_get_heap_sizes
		getfreememoryonheap \{heap = bottomupheap}
		finalprintf 'Free bottomup %a' a = <free_memory>
		if (<free_memory> < <bottomup_runtime_size_required>)
			finalprintf '%a Free memory on bottomup, %b required!' a = <free_memory> b = <bottomup_runtime_size_required>
			scriptassert '%a Free memory on bottomup, %b required!' a = <free_memory> b = <bottomup_runtime_size_required>
		endif
		if isps3
			getfreememoryonheap \{heap = bottomup_vram}
			finalprintf 'Free bottomupvram %a' a = <free_memory>
			if (<free_memory> < <bottomup_vram_runtime_size_required>)
				finalprintf '%a Free memory on bottomup*VRAM*, %b required!' a = <free_memory> b = <bottomup_vram_runtime_size_required>
				scriptassert '%a Free memory on bottomup*VRAM*, %b required!' a = <free_memory> b = <bottomup_vram_runtime_size_required>
			endif
		endif
	endif
endscript
