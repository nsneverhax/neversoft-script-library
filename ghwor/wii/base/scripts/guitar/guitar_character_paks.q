g_anim_pak_state = startup
g_use_largest_lose_win_anims = 0

script anim_paks_set_state \{async = 0
		state = !q1768515945}
	if ($g_anim_pak_state = <state>)
		return
	endif
	switch $g_anim_pak_state
		case music_store
		case musicstudio
		case startup
		printf \{'Nothing to see here'}
		case FrontEnd
		UnloadPakAsync async = <async> pak_name = 'pak/anims/frontend/frontend_anims.pak'
		case play_jam
		case ingame
		dumppakman
		animloadfreeassets \{group = loop_anims}
		default
		ScriptAssert 'Unknown old anim pak state %s' s = ($g_anim_pak_state)
	endswitch
	Change g_anim_pak_state = <state>
	switch ($g_anim_pak_state)
		case music_store
		case musicstudio
		printf \{'Nothing to see here'}
		case FrontEnd
		LoadPakAsync async = <async> Heap = quota_animations pak_name = 'pak/anims/frontend/frontend_anims.pak' no_vram
		case play_jam
		case ingame
		printf \{'nothing to do here'}
		default
		ScriptAssert 'Unknown new anim pak state %s' s = ($g_anim_pak_state)
	endswitch
endscript

script queue_gh5_anim_loops \{pak_name = !q1768515945
		group = !q1768515945}
	if StructureContains structure = $g_gh5_anim_sets <pak_name>
		<array> = ($g_gh5_anim_sets.<pak_name>)
		GetArraySize <array>
		if (<array_Size> > 0)
			<i> = 0
			begin
			printf 'queue_gh5_anim_loops - loading %s' s = (<array> [<i>])
			animloadaddrequest {
				group = <group>
				file = (<array> [<i>])
			}
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
		return \{true}
	else
		ScriptAssert 'Pak %s not listed in $g_gh5_anim_sets' s = <pak_name>
		return \{FALSE}
	endif
endscript
