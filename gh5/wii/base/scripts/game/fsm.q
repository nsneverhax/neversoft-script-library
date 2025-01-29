
script fsm_set \{replacement = child}
	Fsm_Replace {
		hierarchy = current
		replacement = <replacement>
		state = <state>
		params = <params>
	}
endscript

script Register_Fsm_States 
	ScriptAssert \{'Register_Fsm_States: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
