fake_tutorial_script = [
	{
		call = print_random_carp
	}
	{
		time = 5000
		call = print_random_carp
	}
	{
		rel_time = 2000
		call = tutorial_waste_time_test
	}
	{
		call = print_random_carp
	}
	{
		rel_time = 2000
		call = print_random_carp
	}
]

script tutorial_waste_time_test 
	printf \{qs(0x595f0fd2)}
	print_random_carp
	wait \{10
		seconds}
endscript

script print_random_carp 
	printf qs(0xe706c0ff) t = ($current_tutorial_time)
endscript
current_tutorial_script = fake_tutorial_script
current_tutorial_step = 0
current_tutorial_time = 0
last_tutorial_call_time = 0

script set_tutorial_script 
	change current_tutorial_script = <name>
endscript

script tutorialsystem_run 
	if NOT gotparam \{name}
		name = ($current_tutorial_script)
	endif
	change current_tutorial_script = <name>
	change \{current_tutorial_time = 0}
	change \{last_tutorial_call_time = 0}
	tutorial_script = ($current_tutorial_script)
	call_script = (($<tutorial_script> [0]).call)
	<call_script>
	change \{current_tutorial_step = 1}
	if gotparam \{restart_lesson}
		tutorial_create_pause_handler
		search_step = 1
		begin
		getarraysize ($<tutorial_script>)
		if (<search_step> = <array_size>)
			change current_tutorial_step = (<array_size> - 1)
			break
		endif
		tutorial_struct = ($<tutorial_script> [<search_step>])
		if structurecontains structure = (<tutorial_struct>) lesson
			if ((<tutorial_struct>.lesson) = $g_tutorial_last_lesson)
				change current_tutorial_step = <search_step>
				break
			endif
		endif
		search_step = (<search_step> + 1)
		repeat
	else
		change \{g_tutorial_last_lesson = 1}
	endif
	spawnscriptlater \{tutorialsystem_script_update}
endscript

script tutorialsystem_script_update 
	begin
	tutorial_script = ($current_tutorial_script)
	getarraysize ($<tutorial_script>)
	if (($current_tutorial_step) = <array_size>)
		spawnscriptnow \{kill_tutorial_script_system}
	endif
	getdeltatime
	ms_elapsed = (<delta_time> * 1000)
	change current_tutorial_time = (($current_tutorial_time) + <ms_elapsed>)
	tutorial_struct = ($<tutorial_script> [($current_tutorial_step)])
	if structurecontains structure = (<tutorial_struct>) time
		time_to_fire = (<tutorial_struct>.time)
		if (($current_tutorial_time) > <time_to_fire>)
			call_script = (<tutorial_struct>.call)
			spawnscriptnow <call_script> id = tutorial_spawned_script
			change current_tutorial_step = (($current_tutorial_step) + 1)
			change last_tutorial_call_time = ($current_tutorial_time)
		endif
	elseif structurecontains structure = (<tutorial_struct>) rel_time
		time_gap = ($current_tutorial_time - $last_tutorial_call_time)
		time_to_fire = (<tutorial_struct>.rel_time)
		if (<time_gap> > <time_to_fire>)
			call_script = (<tutorial_struct>.call)
			spawnscriptnow <call_script> id = tutorial_spawned_script
			change current_tutorial_step = (($current_tutorial_step) + 1)
			change last_tutorial_call_time = ($current_tutorial_time)
		endif
	else
		old_tutorial_struct = ($<tutorial_script> [($current_tutorial_step - 1)])
		old_script = (<old_tutorial_struct>.call)
		if NOT scriptisrunning <old_script>
			if structurecontains structure = (<tutorial_struct>) lesson
				change g_tutorial_last_lesson = (<tutorial_struct>.lesson)
			endif
			call_script = (<tutorial_struct>.call)
			spawnscriptnow <call_script> id = tutorial_spawned_script
			change current_tutorial_step = (($current_tutorial_step) + 1)
			change last_tutorial_call_time = ($current_tutorial_time)
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script tutorialsystem_kill 
	killspawnedscript \{name = tutorialsystem_script_update}
	killspawnedscript \{id = tutorial_spawned_script}
endscript

script debugstruct 
	printf qs(0x76b3fda7) d = <n>
	printstruct <...>
endscript
