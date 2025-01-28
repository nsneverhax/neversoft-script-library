
script ui_initialize 
	if objectexists \{id = ui}
		return
	endif
	<com_disabled> = 0
	if NOT iscompositeobjectmanagerenabled
		<com_disabled> = 1
		compositeobjectmanagersetenable \{on}
	endif
	createcompositeobject \{params = {
			name = ui
			permanent
		}
		components = [
			{
				component = eventcache
			}
			{
				component = statemachinemanager
			}
		]
		heap = frontend}
	if (<com_disabled> = 1)
		compositeobjectmanagersetenable \{off}
	endif
endscript
