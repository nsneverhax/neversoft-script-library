
script RegisterUIStates 
	printf \{qs("\LUIState: RegisterUIStates")}
	MemPushContext \{FrontEndHeap}
	RegisterState \{name = UIstate_Null
		task = {
			name = Task_Menu
			params = {
				base_name = 'null'
			}
		}}
	RegisterUIStates_Boot
	MemPopContext
endscript

script RegisterUIStates_Boot 
	RegisterState \{name = UIstate_boot_legal
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_legal'
			}
		}}
	RegisterState \{name = UIstate_boot_movie_atvi
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_movie_ATVI'
			}
		}}
	RegisterState \{name = UIstate_boot_movie_red_octane
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_movie_red_octane'
			}
		}}
	RegisterState \{name = UIstate_boot_movie_neversoft
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_movie_neversoft'
			}
		}}
	RegisterState \{name = UIstate_boot_movie_beenox
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_movie_beenox'
			}
		}}
	RegisterState \{name = UIstate_mainmenu
		task = {
			name = Task_Menu
			params = {
				base_name = 'mainmenu'
			}
		}}
	RegisterState \{name = uistate_mainmenu_intro
		task = {
			name = Task_Menu
			params = {
				base_name = 'mainmenu_intro'
			}
		}}
endscript
