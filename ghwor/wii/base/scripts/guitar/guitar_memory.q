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
	]
	num_degen_blend_child_states = 512
	num_blend_functions = 256
	num_curve_blend_arrays = 200
	num_poses = 12
}

script memory_get_heap_sizes 
	atoms_size = (65 * 1024)
	get_num_savegames
	GetPlatform
	switch <Platform>
		case ngc
		<heap_size_globalpak_vram> = (0 * 1024)
		<heap_size_audio_vram> = (0 * 1024)
		<heap_size_audio> = (0 * 1024)
		<heap_size_musician> = (840 * 1024)
		<heap_size_musician_vram> = (0 * 1024)
		<heap_size_animnode> = (205 * 1024)
		<heap_size_car_musician> = (0 * 1024)
		<heap_size_car_musician_vram> = (0 * 1024)
		<heap_size_perm_anims> = (1974 * 1024)
		<heap_size_cas> = ((18 * 128 * 1024) + (150 * 1024))
		<heap_size_cas_vram> = (0 * 1024 * 1024)
		<heap_size_game> = (3 * 1024 * 1024)
		<heap_size_lightshow> = (448 * 1024)
		<heap_size_ui_pak_slot> = (2450 * 1024)
		<heap_size_ui_pak_slot_vram> = (0 * 1024 * 1024)
		<heap_size_downloads> = (75 * 1024)
		<heap_size_downloads_vram> = (0 * 1024)
		<heap_size_drumkit> = (200 * 1024)
		<heap_size_atoms> = (<atoms_size> * <num_savegames>)
		<heap_size_ref_archive_names> = (220 * 1024)
		default
		ScriptAssert \{qs(0xfb3c58ff)}
	endswitch
	return <...>
endscript

script create_song_and_musicstudio_heaps 
endscript

script destroy_song_and_musicstudio_heaps 
endscript

script memory_create_ref_archive_names_heap 
	memory_get_heap_sizes
	MemPushContext \{BottomUpHeap}
	MemInitHeap Name = 'heap_ref_archive_names' size = <heap_size_ref_archive_names> arena = 1
	MemPopContext
endscript
