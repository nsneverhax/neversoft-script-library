
script band_builder_decide_on_heaps 
	ScriptAssert \{'band_builder_decide_on_heaps: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
