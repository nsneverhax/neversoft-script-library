g_anim_pak_state = startup
g_use_largest_lose_win_anims = 0

script anim_paks_set_state \{async = 1
		state = !q1768515945}
	if ($g_anim_pak_state = <state>)
		return
	endif
	printscriptinfo \{'anim_paks_set_state'}
	printstruct <...>
	switch $g_anim_pak_state
		case startup
		printf \{'Nothing to see here'}
		case frontend
		unloadpakasync async = <async> pak_name = 'pak/anims/frontend/frontend_anims.pak'
		case ingame
		dumppakman
		animloadfreeassets \{group = loop_anims}
		default
		scriptassert 'Unknown old anim pak state %s' s = ($g_anim_pak_state)
	endswitch
	change g_anim_pak_state = <state>
	switch ($g_anim_pak_state)
		case frontend
		loadpakasync async = <async> heap = heap_musician_anim pak_name = 'pak/anims/frontend/frontend_anims.pak' no_vram
		case ingame
		printf \{'nothing to do here'}
		default
		scriptassert 'Unknown new anim pak state %s' s = ($g_anim_pak_state)
	endswitch
endscript

script queue_gh5_anim_loops \{pak_name = !q1768515945
		group = !q1768515945}
	if structurecontains structure = $g_gh5_anim_sets <pak_name>
		<array> = ($g_gh5_anim_sets.<pak_name>)
		getarraysize <array>
		if (<array_size> > 0)
			<i> = 0
			begin
			printf 'queue_gh5_anim_loops - loading %s' s = (<array> [<i>])
			animloadaddrequest {
				group = <group>
				file = (<array> [<i>])
			}
			<i> = (<i> + 1)
			repeat <array_size>
		endif
		return \{true}
	else
		scriptassert 'Pak %s not listed in $g_gh5_anim_sets' s = <pak_name>
		return \{false}
	endif
endscript

script anim_check_win_lose_anim_sizes 
	<total_size> = 0
	animloadgetfourlargestassets \{struct = $win_anims}
	getarraysize <largest_assets>
	<i> = 0
	begin
	animloadgetassetsize file = (<largest_assets> [<i>])
	<total_size> = (<total_size> + <size>)
	<i> = (<i> + 1)
	repeat <array_size>
	animloadgetfourlargestassets \{struct = $lose_anims}
	getarraysize <largest_assets>
	<i> = 0
	begin
	animloadgetassetsize file = (<largest_assets> [<i>])
	<total_size> = (<total_size> + <size>)
	<i> = (<i> + 1)
	repeat <array_size>
	memory_get_heap_sizes
	if ((<total_size> + (6 * 1024)) > <heap_size_win_lose_anim>)
		scriptassert \{'Largest Win-Lose anims are too big!'}
	endif
endscript
