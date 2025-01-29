fake_net = 0
assertonmissingscripts = 0
assertonmissingassets = 1
alwaysdump = 0
next_level_script = nullscript
classicmodenavmeshloaded = 0
dont_call_zone_init_hack = 0
levels_initialize_goals = 1

script zone_init 
	printf "zone_init: %s" s = <zone_string_name>
	if (<zone_string_name> = 'z_viewer')
		printf \{"AssertOnMissingScripts = 0"}
		change \{assertonmissingscripts = 0}
	endif
	mempushcontext \{topdownheap}
	formattext textname = zone_editable_text checksumname = zone_editable_list '%a%b' a = <zone_string_name> b = '_editable_list'
	if globalexists name = <zone_editable_list> type = array
		addeditablelist <zone_editable_list>
	endif
	mempopcontext
	mempushcontext \{bottomupheap}
	parsenodearray {
		queue
		zone_name = <zone_name>
		array_name = <array_name>
	}
	if gotparam \{sfx_array_name}
		parsenodearray {
			queue
			zone_name = <sfx_zone_name>
			array_name = <sfx_array_name>
		}
	endif
	if gotparam \{gfx_array_name}
		parsenodearray {
			queue
			zone_name = <gfx_zone_name>
			array_name = <gfx_array_name>
		}
	endif
	if gotparam \{lfx_array_name}
		parsenodearray {
			queue
			zone_name = <lfx_zone_name>
			array_name = <lfx_array_name>
		}
	endif
	if gotparam \{mfx_array_name}
		parsenodearray {
			queue
			zone_name = <mfx_zone_name>
			array_name = <mfx_array_name>
		}
	endif
	if NOT ($disable_global_pedestrians = 1)
		if NOT innetgame
			if iscoiminited
			endif
		endif
	endif
	mempopcontext
endscript

script zone_init_wait_run_setup 
	begin
	if NOT nodearraybusy
		break
	endif
	wait \{1
		gameframe}
	repeat
	if scriptexists <zone_setup_script>
		<zone_setup_script>
	endif
endscript

script goal_pak_init 
	printf "goal_pak_init: %s" s = <goal_pak_string_name>
	mempushcontext \{topdownheap}
	formattext textname = goal_pak_editable_text checksumname = goal_pak_editable_list '%a%b' a = <goal_pak_string_name> b = '_editable_list'
	if globalexists name = <goal_pak_editable_list> type = array
		addeditablelist <goal_pak_editable_list>
	endif
	mempopcontext
	mempushcontext <heap_name>
	parsenodearray {
		queue
		zone_name = <goal_pak_name>
		array_name = <array_name>
		heap = <heap_name>
	}
	if gotparam \{sfx_array_name}
		parsenodearray {
			queue
			zone_name = <sfx_goal_pak_name>
			array_name = <sfx_array_name>
			heap = <heap_name>
		}
	endif
	if gotparam \{gfx_array_name}
		parsenodearray {
			queue
			zone_name = <gfx_goal_pak_name>
			array_name = <gfx_array_name>
			heap = <heap_name>
		}
	endif
	if gotparam \{lfx_array_name}
		parsenodearray {
			queue
			zone_name = <lfx_goal_pak_name>
			array_name = <lfx_array_name>
			heap = <heap_name>
		}
	endif
	if gotparam \{mfx_array_name}
		parsenodearray {
			queue
			zone_name = <mfx_goal_pak_name>
			array_name = <mfx_array_name>
			heap = <heap_name>
		}
	endif
	mempopcontext
endscript

script zone_deinit 
	printf "zone_deinit: %s" s = <zone_string_name>
	parsenodearray abort array_name = <array_name>
	if gotparam \{sfx_array_name}
		parsenodearray abort array_name = <sfx_array_name>
	endif
	if gotparam \{gfx_array_name}
		parsenodearray abort array_name = <gfx_array_name>
	endif
	if gotparam \{lfx_array_name}
		parsenodearray abort array_name = <lfx_array_name>
	endif
	if gotparam \{mfx_array_name}
		parsenodearray abort array_name = <mfx_array_name>
	endif
	formattext textname = zone_editable_text checksumname = zone_editable_list '%a%b' a = <zone_string_name> b = '_editable_list'
	if globalexists name = <zone_editable_list> type = array
		removeeditablelist <zone_editable_list>
	endif
endscript

script setupcoim 
	pushmemprofile \{'COIM'}
	initcoim {
		size = <size>
		blockalign = $generic_coim_blockalign
		coim_min_scratch_blocks
		$generic_coim_params
	}
	popmemprofile
endscript

script lod_inlevellist 
	getarraysize <level_list>
	<index> = 0
	begin
	formattext checksumname = nameone '%s' s = <name>
	formattext checksumname = nametwo '%s' s = (<level_list> [<index>])
	if (<nameone> = <nametwo>)
		printf "Found %s in LOD list! So using lods..." s = <name>
		return \{true}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{false}
endscript

script loadlodpaks 
	mempushcontext \{bottomupheap}
	printf "LoadLODPaks - %s" s = <name>
	getuppercasestring <name>
	if lod_inlevellist name = <uppercasestring> level_list = <level_list>
		getarraysize <level_list>
		<index> = 0
		begin
		level = (<level_list> [<index>])
		formattext textname = lod_pak 'zones/%s_lod/%s_lod.pak' s = <level>
		printf "Loading - %s" s = <lod_pak>
		formattext checksumname = lod_name '%s_lod' s = <level>
		loadpak <lod_pak>
		parsenodearray
		<index> = (<index> + 1)
		repeat <array_size>
		change lod_loadedpaks = <level_list>
	endif
	mempopcontext
endscript

script unloadlodpaks 
	getarraysize \{$lod_loadedpaks}
	if NOT (<array_size> = 0)
		<index> = 0
		begin
		level = ($lod_loadedpaks [<index>])
		formattext textname = lod_pak 'zones/%s_lod/%s_lod.pak' s = <level>
		printf "Unloading - %s" s = <lod_pak>
		unloadpak <lod_pak>
		<index> = (<index> + 1)
		repeat <array_size>
		change \{lod_loadedpaks = [
			]}
	endif
endscript
