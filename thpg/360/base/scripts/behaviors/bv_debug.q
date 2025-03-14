
script registerbehaviors_debug 
	registerstate {
		name = Bv_Assert
		task = {name = Task_Assert params = {text = "Behavior Assertion"}}
	}
	registerstate {
		name = Bv_Debug
		task = {name = task_debug
			params = {label = Bv_Debug}
		}
	}
	registerstate {
		name = bv_message
		task = {name = task_debug
			params = {label = bv_message
				message = "blank message"}
		}
	}
	registerstate {
		name = Bv_Print
		task = {name = task_debug
			params = {label = Bv_Print
				print_params}
		}
	}
	registerstate {
		name = Bv_PrintHierarchy
		task = {name = task_debug
			params = {label = Bv_PrintHierarchy
				hierarchy = logic}
		}
	}
endscript
