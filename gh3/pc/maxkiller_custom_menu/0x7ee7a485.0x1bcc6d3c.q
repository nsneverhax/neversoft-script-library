0xb9b1474c = [
	{
		title
		item = "This text will not showed (7 first entries only shown on end credits)"
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = "Guitar Hero 3 File Formats"
	}
	{
		emptyspace
	}
	{
		item = "dgendreau"
	}
	{
		item = "YMS"
	}
	{
		item = "tma"
	}
	{
		item = "debr5836"
	}
	{
		item = "GameZelda"
	}
	{
		emptyspace
	}
	{
		heading
		item = "Guitar Hero 3 for PC Custom Songs"
	}
	{
		emptyspace
	}
	{
		item = "Invo"
	}
	{
		item = "TomPudding"
	}
	{
		item = "MaXKilleR"
	}
	{
		emptyspace
	}
	{
		heading
		item = "Guitar Hero 3 for PS2 Custom Songs"
	}
	{
		emptyspace
	}
	{
		item = "GameZelda"
	}
	{
		item = "tttttttt"
	}
	{
		emptyspace
	}
	{
		heading
		item = "Guitar Hero 3 for Wii Custom Songs"
	}
	{
		emptyspace
	}
	{
		item = "GameZelda"
	}
	{
		item = "elmerohueso"
	}
	{
		item = "varneymi"
	}
	{
		emptyspace
	}
	{
		heading
		item = "Guitar Hero Three Control Panel"
	}
	{
		emptyspace
	}
	{
		item = "MaXKilleR"
	}
	{
		item = "TomPudding"
	}
	{
		item = "LocalH"
	}
	{
		item = "Leff"
	}
	{
		item = "Jaguar"
	}
	{
		item = "John Reilly"
	}
	{
		item = "Idael Cardoso"
	}
	{
		item = "bytes.com Community"
	}
	{
		item = "codeproject.com Community"
	}
	{
		item = "ScoreHero Community"
	}
	{
		emptyspace
	}
	{
		heading
		item = "The Custom Menu"
	}
	{
		emptyspace
	}
	{
		item = "???"
	}
	{
		item = "MaXKilleR"
	}
	{
		item = "bi0hacker"
	}
	{
		item = "GameZelda"
	}
	{
		emptyspace
	}
	{
		heading
		item = "First Custom Song Ever"
	}
	{
		emptyspace
	}
	{
		item = "Riff"
	}
	{
		emptyspace
	}
	{
		heading
		item = "Sorry if I forgot to credit someone..."
	}
	{
		emptyspace
	}
	{
		heading
		item = "...because I probably did"
	}
	{
		emptyspace
	}
]
0x9febfd68 = {
	create = create_credits_menu
	destroy = destroy_credits_menu
	actions = [
		{
			action = continue
			flow_state = 0x303ae628
		}
		{
			action = go_back
			flow_state = 0x303ae628
		}
	]
}
0xd4e9be3f = 0

script 0x9f8c9843 
	change 0xd4e9be3f = 1
	ui_flow_manager_respond_to_action action = 0x6952dc52
endscript
