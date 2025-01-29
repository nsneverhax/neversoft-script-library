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
	Wait \{10
		Seconds}
endscript

script print_random_carp 
	printf qs(0xe706c0ff) t = ($current_tutorial_time)
endscript
current_tutorial_script = fake_tutorial_script
current_tutorial_step = 0
current_tutorial_time = 0
last_tutorial_call_time = 0

script set_tutorial_script 
	Change current_tutorial_script = <Name>
endscript

script tutorialsystem_run 
	if NOT GotParam \{Name}
		Name = ($current_tutorial_script)
	endif
	Change current_tutorial_script = <Name>
	Change \{current_tutorial_time = 0}
	Change \{last_tutorial_call_time = 0}
	tutorial_script = ($current_tutorial_script)
	call_script = (($<tutorial_script> [0]).call)
	<call_script>
	Change \{current_tutorial_step = 1}
	if GotParam \{Restart_Lesson}
		tutorial_create_pause_handler
		search_step = 1
		begin
		GetArraySize ($<tutorial_script>)
		if (<search_step> = <array_Size>)
			Change current_tutorial_step = (<array_Size> - 1)
			break
		endif
		tutorial_struct = ($<tutorial_script> [<search_step>])
		if StructureContains structure = (<tutorial_struct>) lesson
			if ((<tutorial_struct>.lesson) = $g_tutorial_last_lesson)
				Change current_tutorial_step = <search_step>
				break
			endif
		endif
		search_step = (<search_step> + 1)
		repeat
	else
		Change \{g_tutorial_last_lesson = 1}
	endif
	SpawnScriptLater \{tutorialsystem_script_update}
endscript

script tutorialsystem_script_update 
	begin
	tutorial_script = ($current_tutorial_script)
	GetArraySize ($<tutorial_script>)
	if (($current_tutorial_step) = <array_Size>)
		SpawnScriptNow \{kill_tutorial_script_system}
	endif
	GetDeltaTime
	ms_elapsed = (<delta_time> * 1000)
	Change current_tutorial_time = (($current_tutorial_time) + <ms_elapsed>)
	tutorial_struct = ($<tutorial_script> [($current_tutorial_step)])
	if StructureContains structure = (<tutorial_struct>) time
		time_to_fire = (<tutorial_struct>.time)
		if (($current_tutorial_time) > <time_to_fire>)
			call_script = (<tutorial_struct>.call)
			SpawnScriptNow <call_script> id = tutorial_spawned_script
			Change current_tutorial_step = (($current_tutorial_step) + 1)
			Change last_tutorial_call_time = ($current_tutorial_time)
		endif
	elseif StructureContains structure = (<tutorial_struct>) rel_time
		time_gap = ($current_tutorial_time - $last_tutorial_call_time)
		time_to_fire = (<tutorial_struct>.rel_time)
		if (<time_gap> > <time_to_fire>)
			call_script = (<tutorial_struct>.call)
			SpawnScriptNow <call_script> id = tutorial_spawned_script
			Change current_tutorial_step = (($current_tutorial_step) + 1)
			Change last_tutorial_call_time = ($current_tutorial_time)
		endif
	else
		old_tutorial_struct = ($<tutorial_script> [($current_tutorial_step - 1)])
		old_script = (<old_tutorial_struct>.call)
		if NOT ScriptIsRunning <old_script>
			if StructureContains structure = (<tutorial_struct>) lesson
				Change g_tutorial_last_lesson = (<tutorial_struct>.lesson)
			endif
			call_script = (<tutorial_struct>.call)
			SpawnScriptNow <call_script> id = tutorial_spawned_script
			Change current_tutorial_step = (($current_tutorial_step) + 1)
			Change last_tutorial_call_time = ($current_tutorial_time)
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script tutorialsystem_kill 
	KillSpawnedScript \{Name = tutorialsystem_script_update}
	KillSpawnedScript \{id = tutorial_spawned_script}
endscript

script debugstruct 
	printf qs(0x76b3fda7) d = <n>
	printstruct <...>
endscript
