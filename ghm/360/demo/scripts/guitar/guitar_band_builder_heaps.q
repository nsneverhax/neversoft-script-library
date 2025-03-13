
script band_builder_decide_on_heaps 
	score_table = [
		[-1.0 -1.0 -1.0 -1.0]
		[-1.0 -1.0 -1.0 -1.0]
		[-1.0 -1.0 -1.0 -1.0]
		[-1.0 -1.0 -1.0 -1.0]
	]
	getarraysize \{$musician_heaps}
	if NOT (<array_size> = 4)
		scriptassert \{'Erm!'}
	endif
	getarraysize \{$band_builder_current_setup}
	if (<array_size> > 0)
		i = 0
		begin
		profile_scores = [-1.0 -1.0 -1.0 -1.0]
		savegame = (($band_builder_current_setup [<i>]).savegame)
		get_musician_profile_struct_by_id id = (($band_builder_current_setup [<i>]).character_id) savegame = <savegame>
		heap_index = 0
		begin
		heap_name = ($musician_heaps [<heap_index>])
		get_appearance_heap_score appearance = (<profile_struct>.appearance) heap_name = <heap_name>
		setarrayelement arrayname = profile_scores index = <heap_index> newvalue = <score>
		heap_index = (<heap_index> + 1)
		repeat 4
		setarrayelement arrayname = score_table index = <i> newvalue = <profile_scores>
		i = (<i> + 1)
		repeat <array_size>
		begin
		band_builder_get_highest_score score_table = <score_table>
		band_builder_kill_entries kill_heap = <best_heap> kill_character = <best_character> score_table = <score_table>
		old_setup = ($band_builder_current_setup [<best_character>])
		setarrayelement arrayname = band_builder_current_setup globalarray index = <best_character> newvalue = {
			<old_setup>
			asset_heap = ($musician_heaps [<best_heap>])
		}
		repeat <array_size>
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
	if NOT gotparam \{best_heap}
		scriptassert \{'No highscore entry found'}
	endif
	return best_heap = <best_heap> best_character = <best_character>
endscript

script band_builder_kill_entries 
	icharacter = 0
	begin
	scores = (<score_table> [<icharacter>])
	setarrayelement arrayname = scores index = <kill_heap> newvalue = -1.0
	setarrayelement arrayname = score_table index = <icharacter> newvalue = <scores>
	icharacter = (<icharacter> + 1)
	repeat 4
	setarrayelement arrayname = score_table index = <kill_character> newvalue = [-1.0 -1.0 -1.0 -1.0]
	return score_table = <score_table>
endscript
