g_tutorial_last_lesson = 1
g_in_tutorial = 0

script safe_show \{time = 0.0}
	if ScreenElementExists id = <id>
		<id> :se_setprops alpha = 1 time = <time>
	endif
endscript

script safe_hide \{time = 0.0}
	if ScreenElementExists id = <id>
		<id> :se_setprops alpha = 0 time = <time>
	endif
endscript

script safe_destroy 
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
endscript
