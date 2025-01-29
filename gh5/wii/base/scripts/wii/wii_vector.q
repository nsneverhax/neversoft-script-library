
script vector_push_back 
	RequireParams \{[
			vector_name
			element
		]
		all}
	vector_get_size vector_name = <vector_name>
	assignchecksum checksum_name = vector_index value = (<vector_size> + 1)
	setstructureparam struct_name = <vector_name> param = <vector_index> value = <element>
	setstructureparam struct_name = <vector_name> param = size value = (<vector_size> + 1)
endscript

script vector_pop_front 
	RequireParams \{[
			vector_name
		]
		all}
	vector_remove vector_name = <vector_name> index = 0
	return popped_element = <removed_element>
endscript

script vector_remove 
	RequireParams \{[
			vector_name
			index
		]
		all}
	vector_get_size vector_name = <vector_name>
	if (<vector_size> <= <index>)
		ScriptAssert {
			qs(0xa84b0e2f)
			q = <vector_name>
			i = <index>
			s = <vector_size>
			donotresolve
		}
	endif
	assignchecksum checksum_name = removed_index value = (<index> + 1)
	removed_element = ($<vector_name>.<removed_index>)
	i = <index>
	loop_times = (<vector_size> - <index> - 1)
	if (<loop_times> > 0)
		begin
		assignchecksum checksum_name = next_index value = (<i> + 2)
		assignchecksum checksum_name = current_index value = (<i> + 1)
		setstructureparam struct_name = <vector_name> param = <current_index> value = ($<vector_name>.<next_index>)
		<i> = (<i> + 1)
		repeat <loop_times>
	endif
	setstructureparam struct_name = <vector_name> param = size value = (<vector_size> - 1)
	return removed_element = <removed_element>
endscript

script vector_get_front 
	vector_get_element vector_name = <vector_name> index = 0
	return front_element = <element>
endscript

script vector_set_element 
	RequireParams \{[
			vector_name
			index
			element
		]
		all}
	assignchecksum checksum_name = vector_index value = (<index> + 1)
	if NOT StructureContains structure = $<vector_name> <vector_index>
		ScriptAssert {
			qs(0x1c2f98b6)
			q = <vector_name>
			i = <index>
			donotresolve
		}
	endif
	setstructureparam struct_name = <vector_name> param = <vector_index> value = <element>
endscript

script vector_get_element 
	RequireParams \{[
			vector_name
			index
		]
		all}
	assignchecksum checksum_name = vector_index value = (<index> + 1)
	if NOT StructureContains structure = $<vector_name> <vector_index>
		ScriptAssert {
			qs(0x1c2f98b6)
			q = <vector_name>
			i = <index>
			donotresolve
		}
	endif
	return element = ($<vector_name>.<vector_index>)
endscript

script vector_get_size 
	RequireParams \{[
			vector_name
		]
		all}
	vector_size = 0
	if StructureContains structure = $<vector_name> size
		<vector_size> = ($<vector_name>.size)
	endif
	return vector_size = <vector_size>
endscript

script vector_is_empty 
	RequireParams \{[
			vector_name
		]
		all}
	vector_get_size vector_name = <vector_name>
	if (<vector_size> > 0)
		return \{FALSE}
	endif
	return \{true}
endscript

script vector_clear 
	RequireParams \{[
			vector_name
		]
		all}
	clearstruct struct = <vector_name> globalstruct
endscript

script vector_sort \{compare_func = vector_numeric_compare}
	RequireParams \{[
			vector_name
		]
		all}
	vector_get_size vector_name = <vector_name>
	i = 1
	if (<vector_size> <= 1)
		return
	endif
	begin
	vector_get_element vector_name = <vector_name> index = <i>
	i_element = <element>
	j = <i>
	begin
	if (<j> > 0)
		vector_get_element vector_name = <vector_name> index = (<j> - 1)
		j_element = <element>
		if <compare_func> a = <j_element> b = <i_element>
			vector_set_element {
				vector_name = <vector_name>
				index = <j>
				element = <j_element>
			}
			<j> = (<j> - 1)
		else
			break
		endif
	else
		break
	endif
	repeat
	vector_set_element {
		vector_name = <vector_name>
		index = <j>
		element = <i_element>
	}
	<i> = (<i> + 1)
	repeat (<vector_size> - 1)
endscript

script vector_numeric_compare 
	RequireParams \{[
			a
			b
		]
		all}
	if (<a> > <b>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script vector_print 
	RequireParams \{[
			vector_name
		]
		all}
	vector_get_size vector_name = <vector_name>
	i = 0
	printf {
		'Printing contents of vector %v (%s elements)'
		v = <vector_name>
		s = <vector_size>
		donotresolve
	}
	if (<vector_size> > 0)
		begin
		vector_get_element vector_name = <vector_name> index = <i>
		printf '%i=' i = <i>
		printstruct <element>
		<i> = (<i> + 1)
		repeat <vector_size>
	endif
endscript
