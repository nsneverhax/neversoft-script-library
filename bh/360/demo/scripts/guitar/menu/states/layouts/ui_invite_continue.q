
script ui_create_invite_continue 
	printf \{qs(0xa79d5768)}
	requireparams \{[
			controllerid
		]
		all}
	spawnscriptnow do_join_invite_stuff params = {controllerid = <controllerid> accepted_invite}
endscript

script ui_destroy_invite_continue 
endscript
