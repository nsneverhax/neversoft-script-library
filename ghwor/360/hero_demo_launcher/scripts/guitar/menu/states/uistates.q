
script registeruistates 
	printf \{qs(0x7e56de1f)}
	mempushcontext \{frontendheap}
	registerstate \{name = uistate_null
		task = {
			name = task_menu
			params = {
				base_name = 'null'
			}
		}}
	registeruistates_boot
	mempopcontext
endscript

script registeruistates_boot 
	registerstate \{name = uistate_boot_legal
		task = {
			name = task_menu
			params = {
				base_name = 'boot_legal'
			}
		}}
	registerstate \{name = uistate_boot_movie_atvi
		task = {
			name = task_menu
			params = {
				base_name = 'boot_movie_ATVI'
			}
		}}
	registerstate \{name = uistate_boot_movie_red_octane
		task = {
			name = task_menu
			params = {
				base_name = 'boot_movie_red_octane'
			}
		}}
	registerstate \{name = uistate_boot_movie_neversoft
		task = {
			name = task_menu
			params = {
				base_name = 'boot_movie_neversoft'
			}
		}}
	registerstate \{name = uistate_boot_movie_beenox
		task = {
			name = task_menu
			params = {
				base_name = 'boot_movie_beenox'
			}
		}}
	registerstate \{name = uistate_mainmenu
		task = {
			name = task_menu
			params = {
				base_name = 'mainmenu'
			}
		}}
	registerstate \{name = uistate_mainmenu_intro
		task = {
			name = task_menu
			params = {
				base_name = 'mainmenu_intro'
			}
		}}
endscript
