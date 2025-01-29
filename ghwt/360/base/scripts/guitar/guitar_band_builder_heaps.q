
script band_builder_decide_on_heaps 
	score_table = [
		[-1.0 -1.0 -1.0 -1.0]
		[-1.0 -1.0 -1.0 -1.0]
		[-1.0 -1.0 -1.0 -1.0]
		[-1.0 -1.0 -1.0 -1.0]
	]
	GetArraySize \{$musician_heaps}
	if NOT (<array_Size> = 4)
		ScriptAssert \{'Erm!'}
	endif
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		i = 0
		begin
		profile_scores = [-1.0 -1.0 -1.0 -1.0]
		savegame = (($band_builder_current_setup [<i>]).savegame)
		get_musician_profile_struct_by_id id = (($band_builder_current_setup [<i>]).character_id) savegame = <savegame>
		heap_index = 0
		begin
		heap_name = ($musician_heaps [<heap_index>])
		get_appearance_heap_score appearance = (<profile_struct>.appearance) heap_name = <heap_name>
		SetArrayElement ArrayName = profile_scores index = <heap_index> NewValue = <score>
		heap_index = (<heap_index> + 1)
		repeat 4
		SetArrayElement ArrayName = score_table index = <i> NewValue = <profile_scores>
		i = (<i> + 1)
		repeat <array_Size>
		begin
		band_builder_get_highest_score score_table = <score_table>
		band_builder_kill_entries kill_heap = <best_heap> kill_character = <best_character> score_table = <score_table>
		old_setup = ($band_builder_current_setup [<best_character>])
		SetArrayElement ArrayName = band_builder_current_setup globalarray index = <best_character> NewValue = {
			<old_setup>
			asset_heap = ($musician_heaps [<best_heap>])
		}
		repeat <array_Size>
	endif
endscript

script band_builder_get_highest_score 
	best = -1.0
	icharacter = 0
	begin
	scores = (<score_table> [<icharacter>])
	iheap = 0
	begin
	specific_score = (<scores> [<iheap>])
	if (<specific_score> > <best>)
		best = <specific_score>
		best_heap = <iheap>
		best_character = <icharacter>
	endif
	iheap = (<iheap> + 1)
	repeat 4
	icharacter = (<icharacter> + 1)
	repeat 4
	if NOT GotParam \{best_heap}
		ScriptAssert \{'No highscore entry found'}
	endif
	return best_heap = <best_heap> best_character = <best_character>
endscript

script band_builder_kill_entries 
	icharacter = 0
	begin
	scores = (<score_table> [<icharacter>])
	SetArrayElement ArrayName = scores index = <kill_heap> NewValue = -1.0
	SetArrayElement ArrayName = score_table index = <icharacter> NewValue = <scores>
	icharacter = (<icharacter> + 1)
	repeat 4
	SetArrayElement ArrayName = score_table index = <kill_character> NewValue = [-1.0 -1.0 -1.0 -1.0]
	return score_table = <score_table>
endscript
