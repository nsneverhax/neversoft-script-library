
script fsm_set \{replacement = child}
	Fsm_Replace {
		hierarchy = current
		replacement = <replacement>
		state = <state>
		params = <params>
	}
endscript
