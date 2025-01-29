credits_menu_font = text_a4
0xb2299922 = 10

script create_credits_menu 
	if NOT ($end_credits = 1)
		disable_pause
		StopRendering
		Change \{current_level = load_z_credits}
		Load_Venue
		StartRendering
	endif
	PushAssetContext \{context = z_credits}
	if NOT ($end_credits = 1)
		CreateScreenElement \{Type = ContainerElement
			parent = root_window
			id = credits_backdrop_container
			Pos = (0.0, 0.0)
			just = [
				left
				top
			]}
		CreateScreenElement \{Type = SpriteElement
			id = credits_backdrop
			parent = credits_backdrop_container
			texture = endcredits_BG
			rgba = [
				255
				255
				255
				255
			]
			Pos = (640.0, 360.0)
			dims = (1300.0, 740.0)
			just = [
				center
				center
			]
			z_priority = 0
			alpha = 1}
		RunScriptOnScreenElement id = <id> circulator
	endif
	PopAssetContext
	if NOT ($end_credits = 1)
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
		new_menu scrollid = mc_scroll vmenuid = mc_vmenu event_handlers = <event_handlers>
		add_user_control_helper \{text = 'BACK'
			button = red
			z = 1001}
	else
		new_menu \{scrollid = mc_scroll
			vmenuid = mc_vmenu}
	endif
	text_params = {parent = mc_vmenu Type = TextElement font = ($credits_menu_font) rgba = ($menu_unfocus_color)}
	SpawnScriptNow \{scrolling_list_begin}
endscript

script destroy_credits_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = mc_scroll}
	destroy_menu \{menu_id = credits_list_container}
	KillSpawnedScript \{Name = fadein_team_photos}
	KillSpawnedScript \{Name = scrolling_list_begin}
	KillSpawnedScript \{Name = fade_in_credit_item}
	if ScreenElementExists \{id = team_photos_container}
		DestroyScreenElement \{id = team_photos_container}
	endif
	if ScreenElementExists \{id = credits_backdrop_container}
		DestroyScreenElement \{id = credits_backdrop_container}
	endif
endscript

script scrolling_list_begin 
	if ($end_credits = 1)
		Wait \{2
			Seconds}
	endif
	scrolling_list_init_credits
	scrolling_list_add_item <...>
endscript

script scrolling_list_add_item \{i = 0}
	if (<i> = 0)
		if NOT ($end_credits = 1)
			<i> = 5
		endif
	endif
	if ($end_credits = 1)
		z_priority_credits = -1
	else
		z_priority_credits = 1000
	endif
	if StructureContains structure = ($Credits [<i>]) 0x3fc6eda3

		Wait <time> Seconds
		if ScreenElementExists \{id = credits_list_container}
			DestroyScreenElement \{id = credits_list_container}
		endif
		if NOT ($end_credits = 1)
			ui_flow_manager_respond_to_action \{action = go_back}
		endif
		return
	endif
	if StructureContains structure = ($Credits [<i>]) item
		text = (($Credits [<i>]).item)
	else
		text = ' '
	endif
	if StructureContains structure = ($Credits [<i>]) heading
		Scale = <scale_head>
		Color = <color_head>
		color_shadow = [20 10 5 90]
		shadow_offs = (2.0, 2.0)
	else
		Scale = <scale_body>
		Color = <color_body>
		color_shadow = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
	endif
	if StructureContains structure = ($Credits [<i>]) title
		Scale = <scale_title>
		Color = <color_title>
		color_shadow = [20 10 5 90]
		shadow_offs = (2.0, 2.0)
	endif
	if StructureContains structure = ($Credits [<i>]) small
		Scale = <0x920521ef>
		Color = <color_body>
		color_shadow = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
	endif
	formatText checksumName = item_id 'item_%n' n = <i>
	if ScreenElementExists id = <item_id>
		DestroyScreenElement id = <item_id>
	endif

	CreateScreenElement {
		Type = TextBlockElement
		id = <item_id>
		parent = credits_list_container
		font = text_a4
		dims = <dims>
		allow_expansion
		Pos = (0.0, 0.0)
		internal_scale = <Scale>
		text = <text>
		just = [center bottom]
		internal_just = [center bottom]
		rgba = <Color>
		alpha = 0
		Shadow
		shadow_offs = <shadow_offs>
		shadow_rgba = <color_shadow>
		z_priority = <z_priority_credits>
	}
	GetScreenElementDims id = <item_id>
	item_height = (<height> + <spacer>)
	item_pos = (<base_pos> + (<item_height> * (0.0, 1.0)))
	SetScreenElementProps id = <item_id> Pos = <item_pos>
	distance = (<screen_height> + ((<item_pos>.(0.0, 1.0)) - <screen_height>))
	time = (<distance> / <rate>)
	if ScreenElementExists id = <item_id>
		RunScriptOnScreenElement id = <item_id> scrolling_list_move_item params = {<...>}
	endif
endscript

script scrolling_list_move_item 
	SpawnScriptNow scrolling_list_queue_next_item params = {<...>}
	SpawnScriptNow fade_in_credit_item params = {<...>}
	target_pos = (<item_pos> - ((0.0, 1.0) * <distance>))
	alpha_pos_y = (<distance> / <time>)
	<alpha_pos> = (<item_pos> - ((0.0, 1.0) * <alpha_pos_y>))
	DoMorph time = (<time>) Pos = <target_pos>
	if ScreenElementExists id = <item_id>
		DestroyScreenElement id = <item_id>
	endif
endscript

script fade_in_credit_item 
	fade_duration = 15
	item_alpha = 0.0
	begin
	<item_alpha> = (<item_alpha> + (1.0 / <fade_duration>))
	if ScreenElementExists id = <item_id>
		<item_id> :SetProps alpha = <item_alpha>
	endif
	Wait \{4
		gameframes}
	repeat <fade_duration>
endscript

script scrolling_list_queue_next_item 
	begin
	if ScreenElementExists id = <item_id>
		GetScreenElementProps id = <item_id>
	else
		return
	endif
	pos_y = (<Pos>.(0.0, 1.0))
	if (<pos_y> < <screen_height>)
		<i> = (<i> + 1)
		if NOT StructureContains structure = ($Credits [<i>]) 0x3fc6eda3
			if StructureContains structure = ($Credits [<i>]) 0x1d5f30b4
				MathFloor (<rate> * (($Credits [<i>]).0x1d5f30b4))
				<rate> = <floor>
			elseif StructureContains structure = ($Credits [<i>]) 0xc556ce01
				SpawnScriptNow fadein_team_photos params = {team_photos_container = team_photos_container rot_direction = -1 texture_array = ($Credits [<i>].0xc556ce01) Pos = (340.0, 200.0) Frame = 1}
				Wait \{0.25
					Seconds}
				SpawnScriptNow fadein_team_photos params = {team_photos_container = team_photos_container rot_direction = 1 texture_array = ($Credits [<i>].0x3f59f362) Pos = (960.0, 200.0) Frame = 2}
			elseif StructureContains structure = ($Credits [<i>]) dims
				<old_dims> = <dims>
				<dims> = (($Credits [<i>]).dims)
			elseif StructureContains structure = ($Credits [<i>]) 0xc9b089d2
				<dims> = <old_dims>
			else
				scrolling_list_add_item <...>
				return
			endif
		else
			scrolling_list_add_item <...>
			return
		endif
	endif
	Wait \{1
		Frame}
	repeat
endscript

script fadein_team_photos \{Pos = (350.0, 150.0)}
	photo_count = 0
	maximum_rotate = 20
	if ($end_credits = 1)
		photo_wait = 5
	else
		photo_wait = 8
		Wait \{7
			Seconds}
	endif
	0x349ba0ab = 1.75
	GetArraySize $<texture_array>
	begin
	formatText checksumName = team_photo_checksum 'team_photo_%s_%f' s = <photo_count> f = <Frame>
	texture = ($<texture_array> [<photo_count>])
	if ScreenElementExists id = <team_photo_checksum>
		DestroyScreenElement id = <team_photo_checksum>
	endif
	PushAssetContext \{context = z_credits}
	if ($end_credits = 1)
		z_priority_team_photos = -2
	else
		z_priority_team_photos = 25
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <team_photo_checksum>
		parent = <team_photos_container>
		texture = <texture>
		rgba = [255 255 255 255]
		Pos = <Pos>
		alpha = 0
		dims = (200.0, 200.0)
		just = [center center]
		z_priority = <z_priority_team_photos>
	}
	PopAssetContext
	GetRandomValue Name = random_rot a = 10 b = <maximum_rotate> integer
	<random_rot> = (<random_rot> * <rot_direction>)
	Scale = 1.65
	if (<texture> = endcredits_photo_18 || <texture> = endcredits_photo_32
			|| <texture> = endcredits_photo_36 || <texture> = endcredits_photo_37
			|| <texture> = endcredits_photo_39)
		<Scale> = 1.8599999
	endif
	if (<texture> = endcredits_photo_11 || <texture> = endcredits_photo_34 ||
			<texture> = endcredits_photo_13 || <texture> = endcredits_photo_44 ||
			<texture> = endcredits_photo_16)
		<Scale> = 1.7
	endif
	DoScreenElementMorph id = <team_photo_checksum> rot_angle = <random_rot> time = 3 alpha = 1 relative_scale Scale = <Scale> motion = smooth
	Wait <photo_wait> Seconds
	DoScreenElementMorph id = <team_photo_checksum> time = <0x349ba0ab> alpha = 0
	Wait <0x349ba0ab> Seconds
	if ScreenElementExists id = <team_photo_checksum>
		DestroyScreenElement id = <team_photo_checksum>
	endif
	<photo_count> = (<photo_count> + 1)
	repeat <array_Size>
endscript

script scrolling_list_init_credits 
	if ($end_credits = 1)
		rate = 70.0
		column_width = 450
	else
		rate = 51.0
		column_width = 700
	endif
	if ($end_credits = 1)
		screen_height = 375
		base_pos = ((640.0, 0.0) + ((0.0, 1.0) * <screen_height>))
		column_width = 500
	else
		screen_height = 720
		base_pos = ((640.0, 0.0) + ((0.0, 1.0) * <screen_height>))
		column_width = 900
	endif
	spacer = 5
	if ($end_credits = 1)
		scale_head = 0.8
		color_head = [180 165 120 255]
		scale_body = 0.65000004
		color_body = [180 200 200 255]
		scale_title = 0.55
		color_title = [180 165 120 255]
		0x920521ef = 0.6
	else
		scale_head = 1.0
		color_head = [180 165 120 255]
		scale_body = 0.8
		color_body = [180 200 200 255]
		scale_title = 0.7
		color_title = [180 165 120 255]
		0x920521ef = 0.65000004
	endif
	dims = (<column_width> * (1.0, 0.0))
	if ScreenElementExists \{id = credits_list_container}
		DestroyScreenElement \{id = credits_list_container}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = credits_list_container
		Pos = (0.0, 0.0)}
	return <...>
endscript
Credits = [
	{
		title
		item = 'You\'ve unlocked'
	}
	{
		heading
		item = 'Kings and Queens'
	}
	{
		heading
		item = 'Aerosmith, 1977'
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Developed by Budcat Creations'
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
		item = 'Aldin Bilalovic'
	}
	{
		item = 'Brandon Humfleet'
	}
	{
		item = 'Brett Davis'
	}
	{
		item = 'Bryan Andrews'
	}
	{
		item = 'Chris Pitzen'
	}
	{
		item = 'Colin Greenhalgh'
	}
	{
		item = 'Collen Nachtrieb'
	}
	{
		item = 'Dane Munkholm'
	}
	{
		item = 'Dave Gibbons'
	}
	{
		item = 'Gabe Dill'
	}
	{
		item = 'Grant Poock'
	}
	{
		item = 'Harry Romero'
	}
	{
		item = 'Heath Kehoe'
	}
	{
		item = 'Isaac Burns'
	}
	{
		item = 'Jake Winn'
	}
	{
		item = 'Jason Andersen'
	}
	{
		item = 'Jason Fowler'
	}
	{
		item = 'Jeffrey Soldan'
	}
	{
		item = 'Jeremy Andersen'
	}
	{
		item = 'Jesse O\'Brien'
	}
	{
		item = 'Jonathan Ivan'
	}
	{
		item = 'Matt Van Dinter'
	}
	{
		item = 'Mike Schaadt'
	}
	{
		item = 'Nick Covington'
	}
	{
		item = 'Nick Miller'
	}
	{
		item = 'Stephen St. Vincent'
	}
	{
		item = 'Timothy M. Evans'
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
		item = 'With gracious assistance from'
	}
	{
		emptyspace
	}
	{
		item = 'Adam Schneider'
	}
	{
		item = 'Bob Sprentall'
	}
	{
		item = 'Bobby Russell'
	}
	{
		item = 'Brian Lesniak'
	}
	{
		item = 'Chris Hanel'
	}
	{
		item = 'Dan Amato'
	}
	{
		item = 'Jeff Bellio'
	}
	{
		item = 'Ji Li'
	}
	{
		item = 'Jon Bauman'
	}
	{
		item = 'Jordan Lehmiller'
	}
	{
		item = 'Kathy Hayton'
	}
	{
		item = 'Marcus R. Brown'
	}
	{
		item = 'Matt Modaff'
	}
	{
		item = 'Mike Norris'
	}
	{
		item = 'Ou Li'
	}
	{
		item = 'Rob Gibson'
	}
	{
		item = 'Tom Zetty'
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
		emptyspace
	}
	{
		heading
		item = 'And special thanks to'
	}
	{
		emptyspace
	}
	{
		dims = (900.0, 0.0)
	}
	{
		item = 'Gramm & Tommy Nixon, Michelle, Nicole & Elizabeth Stocker'
	}
	{
		item = 'Beth \'\'B.B.\'\' Gregory, Victoria \'\'VV\'\' Wagner'
	}
	{
		item = 'Keith \'\'Chop\'\' Humfleet and family'
	}
	{
		item = 'Holli Poock, Danny Ibarra, Eliseo Perez, Stew \'\'Bort\'\' Cofer'
	}
	{
		item = 'Misha Li Mayfield, Bunny Liu, Christian & Jon Meekins'
	}
	{
		item = 'Kala Slye, Sara Stambaugh, Gracie & Caleb Stammeyer'
	}
	{
		item = 'Angela Young, Linda O\'Brien, Abby Burns'
	}
	{
		item = 'David Soldan, Nick Blazek'
	}
	{
		item = 'Nalani, Jennifer, & Dan Wheeler'
	}
	{
		item = 'Jessica, Drew, & Xander Andersen'
	}
	{
		0xc9b089d2
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
		0x1d5f30b4 = 2.4
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
		item = 'Designed and Developed by Neversoft'
	}
	{
		emptyspace
	}
	{
		item = 'Aaron Habibipour'
	}
	{
		item = 'Aaron Williams'
	}
	{
		item = 'Adam Micciulla'
	}
	{
		item = 'Alan Flores'
	}
	{
		item = 'Andy Gentile'
	}
	{
		item = 'Andy Lee'
	}
	{
		item = 'Andy Marchal'
	}
	{
		item = 'Andy Warwick'
	}
	{
		item = 'Anthony Carotenuto'
	}
	{
		item = 'Anthony Pesch'
	}
	{
		item = 'Anthony Saunders'
	}
	{
		item = 'Benjamin Kutcher'
	}
	{
		item = 'Beth Cowling'
	}
	{
		item = 'Byeong Park'
	}
	{
		item = 'Bill Buckley'
	}
	{
		item = 'Brad Bulkley'
	}
	{
		item = 'Brandon Riggs'
	}
	{
		item = 'Brendan Wiuff'
	}
	{
		item = 'Brian Bright'
	}
	{
		item = 'Brian Marvin'
	}
	{
		item = 'Brian Oles'
	}
	{
		item = 'Cameron Davis'
	}
	{
		item = 'Chad Findley'
	}
	{
		item = 'Chad Sundman'
	}
	{
		item = 'Chris Barnes'
	}
	{
		item = 'Chris Parise'
	}
	{
		item = 'Chris Vance'
	}
	{
		item = 'Chris Ward'
	}
	{
		item = 'Christopher George'
	}
	{
		item = 'Clark Wen'
	}
	{
		item = 'Clive Burdon'
	}
	{
		item = 'Cody Pierson'
	}
	{
		item = 'Colin Crenshaw'
	}
	{
		item = 'Dana Delalla'
	}
	{
		item = 'Daniel Nelson'
	}
	{
		item = 'Daryl Kimoto'
	}
	{
		item = 'Dave Cowling'
	}
	{
		item = 'Dave Rowe'
	}
	{
		item = 'Dave Hernandez'
	}
	{
		item = 'David Hind'
	}
	{
		item = 'David Nilsen'
	}
	{
		item = 'David Stowater'
	}
	{
		item = 'Davidicus Schacher'
	}
	{
		item = 'DongWoo Thomas Shin'
	}
	{
		item = 'Francisco Mora '
	}
	{
		item = 'Garrett Jost'
	}
	{
		item = 'Gary Jesdanun'
	}
	{
		item = 'Gavin Pugh'
	}
	{
		item = 'Genna Habibipour'
	}
	{
		item = 'Geoffrey Inkel'
	}
	{
		item = 'Giancarlo Surla'
	}
	{
		item = 'Gideon Stocek'
	}
	{
		item = 'Greg Lopez'
	}
	{
		item = 'Gregory Kopina'
	}
	{
		item = 'Hari Khalsa'
	}
	{
		item = 'Ili Chiang'
	}
	{
		item = 'Jake Geiger'
	}
	{
		item = 'Jason Greenberg'
	}
	{
		item = 'Jason Maynard'
	}
	{
		item = 'Jason Uyeda'
	}
	{
		item = 'Jeff Morgan'
	}
	{
		item = 'Jeff Swenty'
	}
	{
		item = 'Jeremiah Roa'
	}
	{
		item = 'Jeremy Page'
	}
	{
		item = 'Jeremy Rogers'
	}
	{
		item = 'Jiwon Son'
	}
	{
		item = 'Jody Coglianese'
	}
	{
		item = 'Joe Pease'
	}
	{
		item = 'Joe Kirchoff'
	}
	{
		item = 'Joel Jewett'
	}
	{
		item = 'John \'\'Bunny\'\' Knutson'
	}
	{
		item = 'John Sahas'
	}
	{
		item = 'John Webb'
	}
	{
		item = 'John Zagorski'
	}
	{
		item = 'Johnny Ow'
	}
	{
		item = 'Jon Bailey'
	}
	{
		item = 'Jordan Leckner'
	}
	{
		item = 'Josh Lord'
	}
	{
		item = 'Jun Chang'
	}
	{
		item = 'June Park'
	}
	{
		item = 'Justin Rote'
	}
	{
		item = 'Karl Drown'
	}
	{
		item = 'Kendall Harrison'
	}
	{
		item = 'Kevin Chung'
	}
	{
		item = 'Kevin Mulhall'
	}
	{
		item = 'Kristin Gallagher'
	}
	{
		item = 'Kristina Adelmeyer'
	}
	{
		item = 'Kyle Johnson'
	}
	{
		item = 'Lee Ross'
	}
	{
		item = 'Lisa Davies'
	}
	{
		item = 'Lisa Perez'
	}
	{
		item = 'Lucy Andonian'
	}
	{
		item = 'Marc De Peo'
	}
	{
		item = 'Mario Sanchez'
	}
	{
		item = 'Mark L. Scott'
	}
	{
		item = 'Mark Storie'
	}
	{
		item = 'Mark Wojtowicz'
	}
	{
		item = 'Matt Canale'
	}
	{
		item = 'Matthew Jackowski'
	}
	{
		item = 'Max Davidian'
	}
	{
		item = 'Michael Bilodeau'
	}
	{
		item = 'Michael Esposito'
	}
	{
		item = 'Michael Friedrich'
	}
	{
		item = 'Michael Velasquez'
	}
	{
		item = 'Michelle Pierson'
	}
	{
		item = 'Nathan Sisler'
	}
	{
		item = 'Nolan Nelson'
	}
	{
		item = 'Olin Georgescu'
	}
	{
		item = 'Omar Kendall'
	}
	{
		item = 'Orion Brown'
	}
	{
		item = 'Pam Detrich'
	}
	{
		item = 'Pat Connole'
	}
	{
		item = 'Patrick Hagar'
	}
	{
		item = 'Paul Robinson'
	}
	{
		item = 'Peter Day'
	}
	{
		item = 'Peter Pon'
	}
	{
		item = 'Randy Guillote'
	}
	{
		item = 'Randy Mills'
	}
	{
		item = 'RH Shih'
	}
	{
		item = 'Riley Jewett'
	}
	{
		item = 'Rob T. Miller'
	}
	{
		item = 'Robert Espinoza'
	}
	{
		item = 'Rock Gropper'
	}
	{
		item = 'Rulon Raymond'
	}
	{
		item = 'Ryan Ligon'
	}
	{
		item = 'Ryan Magid'
	}
	{
		item = 'Sam Ware'
	}
	{
		item = 'Sandy Jewett'
	}
	{
		item = 'Scott Pease'
	}
	{
		item = 'Sean Watson'
	}
	{
		item = 'Sergio Gil'
	}
	{
		item = 'Shane Calnan'
	}
	{
		item = 'Simon Ebejer'
	}
	{
		item = 'Simon Ko'
	}
	{
		item = 'Sivarak \'\'Kai\'\' Tawarotip'
	}
	{
		item = 'Skye Kang'
	}
	{
		item = 'Stuart Scandrett'
	}
	{
		item = 'Tae Kuen Kim'
	}
	{
		item = 'Takashi Matsubara'
	}
	{
		item = 'Ted Barber'
	}
	{
		item = 'Thai Tran'
	}
	{
		item = 'Tim Stasica'
	}
	{
		item = 'Timothy Rapp'
	}
	{
		item = 'Tina Stevenson'
	}
	{
		item = 'Tom Parker'
	}
	{
		item = 'Travis Chen'
	}
	{
		item = 'Weichen Wu'
	}
	{
		item = 'Zac Drake'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Additional Development by:'
	}
	{
		item = 'Art Usher'
	}
	{
		item = 'Dan Savage'
	}
	{
		item = 'James Barker'
	}
	{
		item = 'John Dobbie'
	}
	{
		item = 'Justin Parish'
	}
	{
		item = 'Sean Streeter'
	}
	{
		item = 'Steve Gallacher'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Special Thanks To'
	}
	{
		item = 'Bernie Corrigan, Creem,'
	}
	{
		item = 'Erik Tarkiainen, Guitar World,'
	}
	{
		item = 'Guy Burwell, Janna Elias,'
	}
	{
		item = 'Jeff Gaither, Jeff Wood,'
	}
	{
		item = 'Jeral Tidwell, Jim Servis,'
	}
	{
		item = 'Malleus Rock Art Lab,'
	}
	{
		item = 'Rolling Stone, Pete Evick,'
	}
	{
		item = 'SPIN, Village Voice'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Hardcore Testers'
	}
	{
		item = 'Adam Nelson, Andrew Lee,'
	}
	{
		item = 'Chris Self, Chris Watkins,'
	}
	{
		item = 'Clint Baptiste, Craig Baldwin,'
	}
	{
		item = 'Daniel Bancroft, Daniel Farina,'
	}
	{
		item = 'Daniel Lopez, Daniel Wapner,'
	}
	{
		item = 'Derrick Timberlake, Evan Bereny,'
	}
	{
		item = 'Gareth Davies, Greg Larsen,'
	}
	{
		item = 'Jeff Brys, Jennifer Sills,'
	}
	{
		item = 'John Theodore, Lee Ware,'
	}
	{
		item = 'Michael Winte, Neil Cortez,'
	}
	{
		item = 'Pat O\'Riley, Robert Byrd,'
	}
	{
		item = 'Sergio Pacheco'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Thanks to the Aerosmith Crew'
	}
	{
		item = 'Marti Frederiksen, Kerri Smith,'
	}
	{
		item = 'Lauren Cohen, Susan Waterman,'
	}
	{
		item = 'Jimmy Eyers, Keith Garde,'
	}
	{
		item = 'Joe Sagara, Andy Martel,'
	}
	{
		item = 'Jim Survis, Donny Wightman,'
	}
	{
		item = 'John Bionelli, Joe Victoria,'
	}
	{
		item = 'Maghee, Howard Kaufman, Trudy Green,'
	}
	{
		item = 'Danielle Friedman, John Branca,'
	}
	{
		item = 'Karen Langford, Rob Lohr,'
	}
	{
		item = 'John \'\'Magee\'\' McGarry, Jon Lammie'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Data Capture Performers:'
	}
	{
		item = 'Adam Jennings'
	}
	{
		item = 'Brad Whitford'
	}
	{
		item = 'Darryl \'\'DMC\'\' McDaniels'
	}
	{
		item = 'Derek Syverud'
	}
	{
		item = 'Joe Perry'
	}
	{
		item = 'Joey Kramer'
	}
	{
		item = 'Jon Krupp'
	}
	{
		item = 'Judita Wignall'
	}
	{
		item = 'Matt Wignall'
	}
	{
		item = 'Sam Gallagher'
	}
	{
		item = 'Scott Kinnenbrew'
	}
	{
		item = 'Steven Tyler'
	}
	{
		item = 'Tom Hamilton'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Voice Over Actors:'
	}
	{
		item = 'Mark Mintz'
	}
	{
		item = 'Stephen Stanton'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Sponsors'
	}
	{
		item = 'Gibson USA'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Activision Production'
	}
	{
		title
		item = 'Producer'
	}
	{
		item = 'Juan Valdes'
	}
	{
		title
		item = 'Sr. Producer'
	}
	{
		item = 'Jeremiah Maza'
	}
	{
		title
		item = 'Associate Producers'
	}
	{
		item = 'Patrick Bowman'
	}
	{
		item = 'Ted Lange'
	}
	{
		title
		item = 'Production Coordinators'
	}
	{
		item = 'Casimero Agustin, Daniyel Garcia'
	}
	{
		item = 'Alex Ortiz, Raul Renteria'
	}
	{
		title
		item = 'Executive Producer'
	}
	{
		item = 'Jeff Matsushita'
	}
	{
		title
		item = 'Vice President, Production'
	}
	{
		item = 'Steve Ackrich'
	}
	{
		heading
		item = 'RedOctane'
	}
	{
		heading
		item = 'Marketing'
	}
	{
		title
		item = 'VP of Marketing'
	}
	{
		item = 'Stacey Hirata'
	}
	{
		title
		item = 'Global Brand Manager'
	}
	{
		item = 'Doug McCracken'
	}
	{
		item = 'Michael Steiner'
	}
	{
		title
		item = 'Associate Brand Manager'
	}
	{
		item = 'Emily Uyehara'
	}
	{
		title
		item = 'Marketing Assistant'
	}
	{
		item = 'Kyle Rechstiner'
	}
	{
		title
		item = 'Marketing Associate'
	}
	{
		item = 'Megan Ferguson'
	}
	{
		title
		item = 'Marketing Coordinator'
	}
	{
		item = 'Letty Cadena'
	}
	{
		heading
		item = 'PR'
	}
	{
		title
		item = 'PR Director'
	}
	{
		item = 'Ryh-Ming C. Poon'
	}
	{
		title
		item = 'Sr. Publicist'
	}
	{
		item = 'Kehau Rodenhurst'
	}
	{
		title
		item = 'PR Coordinator'
	}
	{
		item = 'Jordan Dodge'
	}
	{
		heading
		item = 'Creative Services'
	}
	{
		title
		item = 'Creative Services Manager'
	}
	{
		item = 'Mike Doan'
	}
	{
		title
		item = 'Graphic Designers'
	}
	{
		item = 'Maly Bun'
	}
	{
		item = 'Minna Hu'
	}
	{
		title
		item = 'Web Designer'
	}
	{
		item = 'Jen Nakamura'
	}
	{
		heading
		item = 'RedOctane'
	}
	{
		title
		item = 'President'
	}
	{
		item = 'Kai Huang'
	}
	{
		title
		item = 'Head of Publishing'
	}
	{
		item = 'Dusty Welch'
	}
	{
		title
		item = 'Executive VP'
	}
	{
		item = 'Charles Huang'
	}
	{
		title
		item = 'General Manager, RedOctane Europe'
	}
	{
		item = 'Zach Fountain'
	}
	{
		title
		item = 'Executive Assistant'
	}
	{
		item = 'Trina Deakin'
	}
	{
		title
		item = 'Licensing Associate'
	}
	{
		item = 'Chris Larkin'
	}
	{
		title
		item = 'VP Finance'
	}
	{
		item = 'Richard Santiago'
	}
	{
		title
		item = 'Controller'
	}
	{
		item = 'Monika Agarwal'
	}
	{
		title
		item = 'Sr. Financial Analyst '
	}
	{
		item = 'Kevin Lurie'
	}
	{
		title
		item = 'Sr. Accountant'
	}
	{
		item = 'Tina Xu'
	}
	{
		title
		item = 'Logistics Manager'
	}
	{
		item = 'Candy Lu'
	}
	{
		title
		item = 'HR Generalist'
	}
	{
		item = 'Kathryn Fernandez'
	}
	{
		heading
		item = 'Hardware'
	}
	{
		title
		item = 'VP Hardware'
	}
	{
		item = 'Lee Guinchard'
	}
	{
		title
		item = 'Director of Hardware'
	}
	{
		item = 'Carter Lee'
	}
	{
		title
		item = 'Hardware Production Coordinator'
	}
	{
		item = 'Mark Johnson'
	}
	{
		title
		item = 'Product Manager'
	}
	{
		item = 'Steve Withers'
	}
	{
		heading
		item = 'E-Commerce'
	}
	{
		title
		item = 'E-commerce Manager '
	}
	{
		item = 'Michael Pan'
	}
	{
		title
		item = 'Online Marketing Specialist'
	}
	{
		item = 'David Hsu'
	}
	{
		title
		item = 'E-commerce Assistant'
	}
	{
		item = 'Amanda Amezcua'
	}
	{
		item = 'Hana Sakamoto'
	}
	{
		title
		item = 'Customer Service Manager'
	}
	{
		item = 'Joe Mijares'
	}
	{
		title
		item = 'Customer Support'
	}
	{
		item = 'Mike Dangerfield'
	}
	{
		item = 'Masai Davis'
	}
	{
		item = 'Melanie Porzio'
	}
	{
		title
		item = 'Shipping'
	}
	{
		item = 'Henry Okamoto'
	}
	{
		title
		item = 'Inventory Analyst'
	}
	{
		item = 'Scott Yang'
	}
	{
		emptyspace
	}
	{
		title
		item = 'The rest at RedOctane, specifically:'
	}
	{
		item = 'John Devecka, Swami Venkat,'
	}
	{
		item = 'and Jack McCauley'
	}
	{
		emptyspace
	}
	{
		title
		item = 'RedOctane would like to thank:'
	}
	{
		item = 'Lillian Qian, Kaylan Huang,'
	}
	{
		item = 'Charley Huang, Simon Huang,'
	}
	{
		item = 'Lilly Huang, Ethan Huang,'
	}
	{
		item = 'Samantha Chien, Joshua Bowman,'
	}
	{
		item = 'Victoria Bowman, Sharon Maza,'
	}
	{
		item = 'Madison \'The Monster\' Maza,'
	}
	{
		item = 'Neil Maza, Sondra Dingcong,'
	}
	{
		item = 'Sung Park, Debbie Alagao,'
	}
	{
		item = 'Brian Alagao, Kevin Barrameda,'
	}
	{
		item = 'Teri Nguyen, Uyen Nguyen, Tug Hunter,'
	}
	{
		item = 'Miko Garcia, Aly Lee, Christine Tu,'
	}
	{
		item = 'Angela Tu, Skye Lang, Dream Lange'
	}
	{
		item = 'Dorothy Yang, Jo-Jessica,'
	}
	{
		item = 'The San Jose Sharks, The Juco Family'
	}
	{
		item = 'The Amezquita Family, M.A.C.,'
	}
	{
		item = 'Teresa Leann Santos, No-Nancy,'
	}
	{
		item = 'Just Peacy, The Larkin Family, Enuts,'
	}
	{
		item = 'Matt Bames, B-Diddy\'s Beard, C-Webb,'
	}
	{
		item = 'Freddie Arnott, Gerabel,'
	}
	{
		item = 'Rooney, Grey Hawke, Dasmexa,'
	}
	{
		item = 'Biljac, Tracy Price, Jon the DSM,'
	}
	{
		item = 'Hunter Watson, Matthew Salutillo'
	}
	{
		item = 'Jace Powerchord, RedOctane India Crew'
	}
	{
		item = 'Dennis Goh, Eskander Matta'
	}
	{
		item = 'Tom Knudsen, Matt Crowley, Plot2Kill,'
	}
	{
		item = 'the Block Family Rockers, Jen Fox,'
	}
	{
		item = 'Ivoline Lee, Nik Marquez'
	}
	{
		heading
		item = 'Activision'
	}
	{
		title
		item = 'Worldwide Executive of Music'
	}
	{
		item = 'Tim Riley'
	}
	{
		title
		item = 'Manager, Music Affairs'
	}
	{
		item = 'Brandon Young'
	}
	{
		title
		item = 'Music Supervisor'
	}
	{
		item = 'Scott McDaniel '
	}
	{
		title
		item = 'Music Coordinators'
	}
	{
		item = 'Jonathan Bodell '
	}
	{
		item = 'David Iscove '
	}
	{
		title
		item = 'VP, Business & Legal Affairs'
	}
	{
		item = 'Greg Deutsch'
	}
	{
		title
		item = 'Director, Government and Legislative Affairs'
	}
	{
		item = 'Philip Terzian'
	}
	{
		title
		item = 'Transactional Attorney'
	}
	{
		item = 'Travis Stansbury'
	}
	{
		title
		item = 'Senior Paralegal'
	}
	{
		item = 'Kap Kang'
	}
	{
		title
		item = 'Senior Director of Production Services'
	}
	{
		item = 'Suzan Rude'
	}
	{
		title
		item = 'Sr. Director, Game Design'
	}
	{
		item = 'Carl Schnurr'
	}
	{
		title
		item = 'Sr. Director, Technology'
	}
	{
		item = 'Matt Wilkinson'
	}
	{
		title
		item = 'Sr. VP of Technology'
	}
	{
		item = 'Steve Pearce'
	}
	{
		title
		item = 'Manager, Central User Testing'
	}
	{
		item = 'Ray Kowalewski'
	}
	{
		title
		item = 'Director, Central Audio'
	}
	{
		item = 'Adam Levenson'
	}
	{
		title
		item = 'Central Audio Coordinator'
	}
	{
		item = 'Noah Sarid'
	}
	{
		title
		item = 'Activision Special Thanks'
	}
	{
		item = 'Mike Griffith, Ron Doornick, Thomas Tippl,'
	}
	{
		item = 'Brian Kelly, Bobby Kotick, Robin Kaminsky,'
	}
	{
		item = 'Brian Ward, Brian Hodous, Laird M. Malamed,'
	}
	{
		item = 'Dave Stohl, Maria Stipp, Joerg Trouvain,'
	}
	{
		item = 'John Watts, Steve Young, Josh Taub,'
	}
	{
		item = 'Laura Hoegler, Jennifer Sullivan,'
	}
	{
		item = 'Wade Pottinger, Sean Dexheimer,'
	}
	{
		item = 'Dan Schaffer, Beverly Liggett,'
	}
	{
		item = 'Molly Hinchey, George Rose, Mary Tuck,'
	}
	{
		item = 'Dani Kim, Dave Anderson, Justin Berenbaum,'
	}
	{
		item = 'Tina Kwon, John Dillulo, Maryanne Lataif, '
	}
	{
		item = 'Michelle Schroder, Blake hennon, Vic Lopez,'
	}
	{
		item = 'Justin Bennett, Jay Komas, Neil Armstrong,'
	}
	{
		item = 'Peter Oey, Steve Wereb, Todd Szalla,'
	}
	{
		item = 'Nikunj Dalal, Kathryn Murray, Chris Cosby, '
	}
	{
		item = 'Frankie Kang, Letam Biira, Mark Lamia,'
	}
	{
		item = '\'Music Guru Dan Block\', Alex Mahlke,'
	}
	{
		item = 'Ric Romero, Vernice Massey, Aaron Grant,'
	}
	{
		item = 'Kelvin Liu, Joshua Selinger,'
	}
	{
		item = 'Activision APAC, and Activision Europe'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Quality Assurance/Customer Support'
	}
	{
		title
		item = 'Lead, QA Functionality'
	}
	{
		item = 'Michael Ryan'
	}
	{
		title
		item = 'Lead, Night Shift'
	}
	{
		item = 'Steve Penate'
	}
	{
		title
		item = 'Sr. Lead, QA Functionality'
	}
	{
		item = 'Paul Williams'
	}
	{
		title
		item = 'Sr. Lead, Night Shift'
	}
	{
		item = 'Frank So'
	}
	{
		title
		item = 'Manager, QA Functionality'
	}
	{
		item = 'John Rosser'
	}
	{
		title
		item = 'Manager, Night Shift'
	}
	{
		item = 'Adam Hartsfield'
	}
	{
		title
		item = 'Director, QA Functionality'
	}
	{
		item = 'Marilena Rixford'
	}
	{
		title
		item = 'Director, QA Compliance & Code Release Group'
	}
	{
		item = 'James Galloway'
	}
	{
		title
		item = 'VP, QA Functionality/CS'
	}
	{
		item = 'Rich Robinson'
	}
	{
		title
		item = 'Technical Requirements Group'
	}
	{
		title
		item = 'TRG Senior Manager'
	}
	{
		item = 'Christopher Wilson'
	}
	{
		title
		item = 'TRG Submissions Lead'
	}
	{
		item = 'Dan Nichols'
	}
	{
		title
		item = 'TRG Platform Lead'
	}
	{
		item = 'Marc Villanueva'
	}
	{
		title
		item = 'TRG Project Lead'
	}
	{
		item = 'Teak Holley'
	}
	{
		title
		item = 'TRG Floor Lead'
	}
	{
		item = 'David Wilkinson'
	}
	{
		item = 'Jared Baca'
	}
	{
		item = 'James Rose'
	}
	{
		title
		item = 'TRG Testers'
	}
	{
		item = 'William Camacho, Pisoth Chham,'
	}
	{
		item = 'Daniel Fehskens, Jason Garza,'
	}
	{
		item = 'Christian Haile, Alex Hirsch,'
	}
	{
		item = 'Rhonda Ramirez, Mark Ruzicka,'
	}
	{
		item = 'Jacob Zwirn, Benjamin Abel'
	}
	{
		title
		item = 'TRG Platform Lead'
	}
	{
		item = 'Kyle Carey'
	}
	{
		title
		item = 'TRG Project Lead'
	}
	{
		item = 'Jason Harris'
	}
	{
		title
		item = 'TRG Floor Lead'
	}
	{
		item = 'Tomo Shikami'
	}
	{
		item = 'Jon Sheltmire'
	}
	{
		item = 'Keith Kodama'
	}
	{
		title
		item = 'TRG Testers'
	}
	{
		item = 'Melvin Allen, Brian Baker'
	}
	{
		item = 'Brian Bensi, Bryan Berri,'
	}
	{
		item = 'Scott Borakove, Paul Carrion,'
	}
	{
		item = 'Kumiko Kashii, Colin Kawakami,'
	}
	{
		item = 'John McCurry, Kirt Sanchez,'
	}
	{
		item = 'Edgar Sunga'
	}
	{
		title
		item = 'TRG Platform Lead'
	}
	{
		item = 'Sasan \'Sauce\' Helmi'
	}
	{
		title
		item = 'TRG Project Lead'
	}
	{
		item = 'Todd Sutton'
	}
	{
		title
		item = 'TRG Floor Lead'
	}
	{
		item = 'Zac Blitz'
	}
	{
		item = 'Menas Kapitsas'
	}
	{
		item = 'Eric Stanzione'
	}
	{
		title
		item = 'TRG Testers'
	}
	{
		item = 'Eddie Fernando Araujo,'
	}
	{
		item = 'Justin Gogue, Lucas Goodman,'
	}
	{
		item = 'Jeff Koyama, Steve Mcllroy'
	}
	{
		item = 'Brian Papa, Joe Pardo'
	}
	{
		item = 'Anthony Rocha, Santiago Salvador'
	}
	{
		emptyspace
	}
	{
		title
		item = 'QA Functionality Test Team'
	}
	{
		title
		item = 'Floor Lead'
	}
	{
		item = 'Lee Cheramie'
	}
	{
		title
		item = 'Nigh Shift Floor Lead'
	}
	{
		item = 'Trevor Page'
	}
	{
		title
		item = 'Database Administrator'
	}
	{
		item = 'Dong Fan'
	}
	{
		title
		item = 'Testers'
	}
	{
		item = 'Ivan Azarte, Jonathan Green,'
	}
	{
		item = 'Josh Mendoza, Kevin Tucker,'
	}
	{
		item = 'Albert Jacobs, Ramon Ramirez,'
	}
	{
		item = 'Ryan Volker, Ciji Thornton,'
	}
	{
		item = 'T\'Challa Jackson, Jonathan Butcher,'
	}
	{
		item = 'Kurt Gutierrez'
	}
	{
		title
		item = 'Night Shift Testers'
	}
	{
		item = 'Jay Menconi, Tiffany Asghary,'
	}
	{
		item = 'Michael Pallares, Jimmie Potts,'
	}
	{
		item = 'Kevin Smith, Scott Winslow,'
	}
	{
		item = 'Wei Zhao, Julius Hipolito,'
	}
	{
		item = 'Jerome Li, Erika Rodriguez,'
	}
	{
		item = 'Caesar Velasco, Jovany Zuniga,'
	}
	{
		emptyspace
	}
	{
		title
		item = 'Customer Support Managers'
	}
	{
		item = 'Mike Hill, Email Support'
	}
	{
		item = 'Gary Bolduc, Phone Support'
	}
	{
		title
		item = 'Network Lab'
	}
	{
		item = 'Chris Keim, Sr. Lead'
	}
	{
		item = 'Francis Jimenez, Network Lead'
	}
	{
		item = 'Sean Olson, Tester'
	}
	{
		title
		item = 'Multiplayer Lab '
	}
	{
		title
		item = 'Multiplayer Lab Lead '
	}
	{
		item = 'Garrett Oshiro'
	}
	{
		title
		item = 'MPL Floor Leads'
	}
	{
		item = 'Jessie Jones'
	}
	{
		item = 'Leonard Rodriguez'
	}
	{
		title
		item = 'MPL Testers'
	}
	{
		item = 'Mario Ibarra, Matthew Fawbush,'
	}
	{
		item = 'Bobby Jones, Jaemin Kang,'
	}
	{
		item = 'Shamen\'e Childress, Julio Medina,'
	}
	{
		item = 'Andrew Bowens, Jonathan Mack'
	}
	{
		item = 'Emmanuel Cruz, Brian Lay'
	}
	{
		emptyspace
	}
	{
		title
		item = 'Burn Room Supervisor '
	}
	{
		item = 'Joule Middleton'
	}
	{
		title
		item = 'Burn Room Technicians'
	}
	{
		item = 'Kai Hsu'
	}
	{
		item = 'Danny Feng'
	}
	{
		item = 'Sean Kim'
	}
	{
		item = 'Christopher Norman'
	}
	{
		title
		item = 'Manager, Resource Administration'
	}
	{
		item = 'Nadine Theuzillot'
	}
	{
		title
		item = 'CS/QA Special Thanks'
	}
	{
		item = 'Jason Levine, Matt McClure,'
	}
	{
		item = 'Glenn ViStante, Thom Denick,'
	}
	{
		item = 'Jason Potter, Brad Saavedra,'
	}
	{
		item = 'Henry Villanueava, Anthony \'Hatch\' Korotko,'
	}
	{
		item = 'Paul Colbert, Indra Yee,'
	}
	{
		item = 'Vyente Ruffin, Dave Garcia-Gomez,'
	}
	{
		item = 'Jeremy Shortell, Dylan Rixford,'
	}
	{
		item = 'Jake Ryan, Kai Kamhout,'
	}
	{
		item = 'Kelly Kapp, Matt Blitz, Jay,'
	}
	{
		item = 'Nikki Guillote, Taka, Teru, and'
	}
	{
		item = 'Shuta from Phaze'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Localization Team'
	}
	{
		title
		item = 'Director of Production Services, Europe'
	}
	{
		item = 'Barry Kehoe'
	}
	{
		title
		item = 'Senior Localization Project Manager'
	}
	{
		item = 'Fiona Ebbs'
	}
	{
		title
		item = 'Localization Coordinator'
	}
	{
		item = 'Jonas Anderson'
	}
	{
		title
		item = 'Localization Consultant'
	}
	{
		item = 'Stephanie O\'Malley Deming'
	}
	{
		title
		item = 'Localization QA Manager'
	}
	{
		item = 'David Hickey'
	}
	{
		title
		item = 'Localization QA Leads'
	}
	{
		item = 'Dominik Hilse'
	}
	{
		item = 'Jack O\'Hara'
	}
	{
		title
		item = 'Localization QA Testers'
	}
	{
		item = 'Didier Canovas, Jill Hyatt,'
	}
	{
		item = 'Declan Carroll, Ruben Palacios Santiago,'
	}
	{
		item = 'Aindreas Kugler, Paul Moore,'
	}
	{
		item = 'Michele Pikassis, Richard Glennon,'
	}
	{
		item = 'Eduardo Maninganbi, Mike Vanacker,'
	}
	{
		item = 'Julien Pierre, Carlos Losada Baena,'
	}
	{
		item = 'Paul Moore, Jose Manuel Rocha,'
	}
	{
		item = 'Loic Brioude'
	}
	{
		title
		item = 'Localization Burn Lab Technician'
	}
	{
		item = 'Derek Brangan'
	}
	{
		title
		item = 'IT Network Techncician'
	}
	{
		item = 'Fergus Lindsay'
	}
	{
		title
		item = 'Localization Tools and Support'
	}
	{
		item = 'Provided by Xloc Inc.'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Demonware'
	}
	{
		item = 'Sean Blánchfield, Morgan Brickley,'
	}
	{
		item = 'Luke Burden, Aaron Burt,'
	}
	{
		item = 'Michael Collins, Brendan Dillon,'
	}
	{
		item = 'Malcom Dowse, Steffen Higel,'
	}
	{
		item = 'Tony Helly, John Kirk, Vladislav Titov,'
	}
	{
		item = 'Craig McInnes, Alex Montgomery,'
	}
	{
		item = 'Eoin O\'Fearghail, Ruaidhrí Power,'
	}
	{
		item = 'Tilman Schaefer, Amy Smith,'
	}
	{
		item = 'Emmanuel Stone, Robert Synnott'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Animated sequences by:'
	}
	{
		heading
		item = 'Titmouse, Inc.'
	}
	{
		title
		item = 'Creative Director'
	}
	{
		item = 'Chris Prynoski'
	}
	{
		title
		item = 'Creative Producer'
	}
	{
		item = 'Keith Fay'
	}
	{
		title
		item = 'Director'
	}
	{
		item = 'Juno Lee'
	}
	{
		title
		item = 'Background Supervisor'
	}
	{
		item = 'Antonio Cannobio'
	}
	{
		title
		item = 'Lead Designer'
	}
	{
		item = 'Junpei Takayama'
	}
	{
		title
		item = 'Lead Animator'
	}
	{
		item = 'Jeremy Polgar'
	}
	{
		title
		item = 'Animator'
	}
	{
		item = 'Tony Andrade'
	}
	{
		title
		item = 'Background Paint and Design'
	}
	{
		item = 'Sung Jin Ahn'
	}
	{
		title
		item = 'Background Painter'
	}
	{
		item = 'Otto Tang'
	}
	{
		title
		item = 'Background Painter'
	}
	{
		item = 'Keyoei Takayama'
	}
	{
		title
		item = 'Background Design'
	}
	{
		item = 'Roger Oda'
	}
	{
		title
		item = 'Ink & Paint'
	}
	{
		item = 'Brian Kim'
	}
	{
		title
		item = 'Assistant Character Design'
	}
	{
		item = 'Gabe Lee'
	}
	{
		title
		item = 'Digital Compositing'
	}
	{
		item = 'Keith Kin Yan'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'WaveGroup Sound'
	}
	{
		title
		item = 'Lead Music Producer and Mixer'
	}
	{
		item = 'Will Littlejohn'
	}
	{
		title
		item = 'Additional Production Services'
	}
	{
		item = 'Nick Gallant'
	}
	{
		title
		item = 'Guitars'
	}
	{
		item = 'Lance Taber'
	}
	{
		title
		item = 'Bass'
	}
	{
		item = 'Nick Gallant'
	}
	{
		title
		item = 'Drums, Keyboards, Programming'
	}
	{
		item = 'Scott Dugdale'
	}
	{
		title
		item = 'Vocals'
	}
	{
		item = 'Nick Gallant'
	}
	{
		title
		item = 'Engineers'
	}
	{
		item = 'Nick Gallant, Bob Marshal'
	}
	{
		title
		item = 'Casting'
	}
	{
		item = 'Leslie Barton'
	}
	{
		title
		item = 'Production Coordinator'
	}
	{
		item = 'Kimberly A. Nieva'
	}
	{
		emptyspace
	}
	{
		heading
		item = 'Steve Ouimette Studios'
	}
	{
		title
		item = 'Music Produced by'
	}
	{
		item = 'Steve Ouimette'
	}
	{
		title
		item = 'Music Engineered and Mixed by'
	}
	{
		item = 'Ryan Greene and Steve Ouimette'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Hard to Handle\'\''
	}
	{
		small
		item = 'Drums: Gary Sanchez'
	}
	{
		small
		item = 'Bass: Dave Henzerling'
	}
	{
		small
		item = 'Guitar: Steve Ouimette'
	}
	{
		small
		item = 'Vocals: Brody Dolyniuk'
	}
	{
		small
		item = 'Keys: Ed Roth'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Personality Crisis\'\''
	}
	{
		small
		item = 'Drums: Gary Sanchez'
	}
	{
		small
		item = 'Bass: Dave Henzerling'
	}
	{
		small
		item = 'Guitar: Steve Ouimette'
	}
	{
		small
		item = 'Vocals: Rich Evans'
	}
	{
		small
		item = 'Keys: Ed Roth'
	}
	{
		emptyspace
	}
	{
		title
		item = 'Music'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'All Day And All Of The Night\'\''
	}
	{
		small
		item = 'As Made Famous by The Kinks'
	}
	{
		small
		item = 'Covered by Wave Group'
	}
	{
		small
		item = 'Written by Ray Davies'
	}
	{
		small
		item = 'Published by Sony ATV Music Publishing LLC'
	}
	{
		small
		item = 'All Rights Reserved.  Used by Permission.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'All The Young Dudes\'\''
	}
	{
		small
		item = 'As Made Famous by Mott The Hoople'
	}
	{
		small
		item = 'Covered by Wave Group'
	}
	{
		small
		item = 'Written by David Bowie'
	}
	{
		small
		item = 'Published by Tintoretto Music administered by RZO Music, Inc. and'
	}
	{
		small
		item = 'Screen Gems-EMI Music Inc. and'
	}
	{
		small
		item = 'Chrysalis Songs (BMI)'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Always On The Run\'\''
	}
	{
		small
		item = 'Performed by Lenny Kravitz'
	}
	{
		small
		item = 'Written by Saul Hudson, Lenny Kravitz'
	}
	{
		small
		item = 'Courtesy of Virgin Records America, Inc.'
	}
	{
		small
		item = 'Under license from EMI Film & Television Music'
	}
	{
		small
		item = 'Published by Dik Hayd Music and'
	}
	{
		small
		item = 'Miss Bessie Music'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Back In The Saddle\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler and Joe Perry'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement with Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1976 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Beyond Beautiful\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler, Joe Perry and Marti Frederiksen'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement with Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 2001 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Demon of Screamin\' Music Publishing/Primary Wave Songs and JuJu Rhythms'
	}
	{
		small
		item = 'and EMI Blackwood Music, Inc. o/b/o Pearl White Music'
	}
	{
		small
		item = 'Demon of Screamin\' Music Publishing/Primary Wave Songs and JuJu Rhythms '
	}
	{
		small
		item = 'Administered by EMI April Music Inc.  Used by Permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Bright Light Fright\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Joe Perry'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement with Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1977 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Cat Scratch Fever\'\''
	}
	{
		small
		item = 'Performed by Ted Nugent'
	}
	{
		small
		item = 'Written by Ted Nugent'
	}
	{
		small
		item = 'Courtesy of Magicland Music'
	}
	{
		small
		item = 'Published by Magicland Music'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Combination\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Joe Perry'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement with Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1976 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Complete Control\'\''
	}
	{
		small
		item = 'Performed by The Clash'
	}
	{
		small
		item = 'Written by Nicholas Headon, Mick Jones, John Mellor, Paul Simonon'
	}
	{
		small
		item = 'Courtesy of Epic Records and Sony BMG Music Entertainment (UK) LTD.'
	}
	{
		small
		item = 'By Arrangement with Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1977 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Universal-Polygram Int. Publ., Inc. '
	}
	{
		small
		item = 'On Behalf Of Nineden LTD'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Draw The Line\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler and Joe Perry'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement with Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1977 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Dream On\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler'
	}
	{
		small
		item = 'Courtesy of Aerodisc Partnership'
	}
	{
		small
		item = 'By Arrangement with Aerodisc Partnership'
	}
	{
		small
		item = '(P) 2007 Aerodisc Partnership'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Dream Police\'\''
	}
	{
		small
		item = 'Performed by Cheap Trick'
	}
	{
		small
		item = 'Written by Rick Nielsen'
	}
	{
		small
		item = 'Courtesy of Epic Records'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1979 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Screen Gems-EMI Music, Inc. o/b/o itself and Adult Music'
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Hard To Handle\'\''
	}
	{
		small
		item = 'As Made Famous by The Black Crowes'
	}
	{
		small
		item = 'Covered by Steve Ouimette'
	}
	{
		small
		item = 'Written by Alvertis Isbell, Allen Jones, Otis Redding'
	}
	{
		small
		item = 'Published by Irving Music, Inc.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'I Hate Myself For Loving You\'\''
	}
	{
		small
		item = 'Performed by Joan Jett and the Blackhearts'
	}
	{
		small
		item = 'Written by Joan Jett, Desmond Child'
	}
	{
		small
		item = 'Courtesy of Blackheart Records Group'
	}
	{
		small
		item = 'Published by Lagunatic Music & Filmworks, Inc.'
	}
	{
		small
		item = 'and EMI April Music, Inc. o/b/o itself and Desmobile Music Co., Inc.'
	}
	{
		small
		item = 'All Rights Reserved.  Used by Permission.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'King Of Rock\'\''
	}
	{
		small
		item = 'Performed by Run DMC'
	}
	{
		small
		item = 'Written by Darryl McDaniels, Joseph Simmons, Lawrence Smith'
	}
	{
		small
		item = 'Courtesy of Arista/Profile Records, Inc.'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1985 Song BMG Music Entertainment'
	}
	{
		small
		item = 'Published by © Rabasse Music LTD (NS) And Rush Groove Music (ASCAP)'
	}
	{
		small
		item = 'All Rights Administered by Warner/Chappell Music, LTD'
	}
	{
		small
		item = 'All Rights Reserved'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Kings And Queens\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler, Tom Hamilton, Joey Kramer, Brad Whitford and Jack Douglas'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1977 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Let The Music Do The Talkin\'\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Joe Perry'
	}
	{
		small
		item = 'Courtesy of Geffen Records under license from Universal Music Enterprises '
	}
	{
		small
		item = '(P) 1985 Geffen Records'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Livin\' On The Edge\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler, Joe Perry and Mark Hudson'
	}
	{
		small
		item = 'Courtesy of Geffen Records under license from Universal Music Enterprises'
	}
	{
		small
		item = '(P) 1993 Geffen Records'
	}
	{
		small
		item = 'Published by Demon of Screamin\' Music Publishing/Primary Wave Songs and JuJu Rhythms'
	}
	{
		small
		item = 'and Universal Music Corp. on behalf of itself and Beef Puppet Music'
	}
	{
		small
		item = 'Demon of Screamin\' Music Publishing/Primary Wave Songs and JuJu Rhythms '
	}
	{
		small
		item = 'Administered by EMI April Music Inc.  Used by Permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Love In An Elevator\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler and Joe Perry'
	}
	{
		small
		item = 'Courtesy of Geffen Records under license from Universal Music Enterprises'
	}
	{
		small
		item = '(P) 1994 Geffen Records'
	}
	{
		small
		item = 'Published by Demon of Screamin\' Music Publishing/Primary Wave Songs and JuJu Rhythms'
	}
	{
		small
		item = 'and Universal Music Corp. on behalf of itself and Beef Puppet Music'
	}
	{
		small
		item = 'Demon of Screamin\' Music Publishing/Primary Wave Songs and JuJu Rhythms '
	}
	{
		small
		item = 'Administered by EMI April Music Inc.  Used by Permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Make It\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler'
	}
	{
		small
		item = 'Courtesy of Aerodisc Partnership'
	}
	{
		small
		item = 'By Arrangement with Aerodisc Partnership'
	}
	{
		small
		item = '(P) 2007 Aerodisc Partnership'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Mama Kin\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler'
	}
	{
		small
		item = 'Courtesy of Aerodisc Partnership'
	}
	{
		small
		item = 'By Arrangement with Aerodisc Partnership'
	}
	{
		small
		item = '(P) 2007 Aerodisc Partnership'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Mercy\'\''
	}
	{
		small
		item = 'Performed by Joe Perry'
	}
	{
		small
		item = 'Written by Joe Perry'
	}
	{
		small
		item = 'Courtesy of Roman Records/Columbia Records'
	}
	{
		small
		item = 'By Arrangement with Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 2005 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by JuJu Rhythms'
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Movin\' Out\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler and Joe Perry'
	}
	{
		small
		item = 'Courtesy of Aerodisc Partnership'
	}
	{
		small
		item = 'By Arrangement with Aerodisc Partnership'
	}
	{
		small
		item = '(P) 2007 Aerodisc Partnership'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'No Surprize\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler and Joe Perry'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1979 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Nobody\'s Fault\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler and Brad Whitford'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1976 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Pandora\'s Box\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler and Joey Kramer'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1974 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Personality Crisis\'\''
	}
	{
		small
		item = 'As Made Famous by New York Dolls'
	}
	{
		small
		item = 'Covered by Steve Ouimette'
	}
	{
		small
		item = 'Written by Johnny Thunders, David Johansen'
	}
	{
		small
		item = 'Published by (C) 1973 (Renewed) WB Music Corp. (ASCAP),'
	}
	{
		small
		item = 'Lipstick Killers (ASCAP) and Seldak Music Corporation (ASCAP)'
	}
	{
		small
		item = 'All Rights Administered by WB Music Corp.'
	}
	{
		small
		item = 'All Rights Reserved'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Pink\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler, Glen Ballard, Richard Supa'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1977 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Demon of Screamin\' Music Publishing/Primary Wave Songs,'
	}
	{
		small
		item = 'Colgems-EMI Music, Inc. o/b/o Super Supa Songs and'
	}
	{
		small
		item = 'Universal Music Corp. on behalf of itself and Aerostation Corp.'
	}
	{
		small
		item = 'Demon of Screamin\' Music Publishing/Primary Wave Songs'
	}
	{
		small
		item = 'Administered by EMI April Music Inc.  Used by Permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Rag Doll\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler, Joe Perry, Holly Knight and James Vallance'
	}
	{
		small
		item = 'Courtesy of Geffen Records under license from Universal Music Enterprises'
	}
	{
		small
		item = '(P) 1987 Geffen Records'
	}
	{
		small
		item = 'Published by Demon of Screamin\' Music Publishing/Primary Wave Songs, Juju Rhythms,'
	}
	{
		small
		item = 'Almo Music Corp. OBO Itself And Testatyme Music'
	}
	{
		small
		item = 'and Primary Wave Knight and Knighty Knight Music and Mike Chapman Publishing Enterprises'
	}
	{
		small
		item = 'Demon of Screamin\' Music Publishing/Primary Wave Songs and Juju Rhythms'
	}
	{
		small
		item = 'Administered by EMI April Music Inc.  Used by Permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Rats In The Cellar\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler and Joe Perry'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement With Song BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1976 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Sex Type Thing\'\''
	}
	{
		small
		item = 'Performed by Stone Temple Pilots'
	}
	{
		small
		item = 'Written by Stone Temple Pilots'
	}
	{
		small
		item = 'Courtesy of Atlantic Recording Corp.'
	}
	{
		small
		item = 'By Arrangement with Warner Music Group Video Game Licensing'
	}
	{
		small
		item = '(P) 1992 Atlantic Recording Group'
	}
	{
		small
		item = 'Published by Universal Music Corp On Behalf Of Milksongs'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Shakin\' My Cage\'\''
	}
	{
		small
		item = 'Performed by Joe Perry'
	}
	{
		small
		item = 'Written by Joe Perry'
	}
	{
		small
		item = 'Courtesy of Roman Records/Columbia Records'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 2005 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Juju Rhythms'
	}
	{
		small
		item = 'Administered by EMI April Music Inc. Used by Permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'She Sells Sanctuary\'\''
	}
	{
		small
		item = 'Performed by The Cult'
	}
	{
		small
		item = 'Written by Antbury, Duffy'
	}
	{
		small
		item = 'Courtesy of Beggars Banquet Records Limited'
	}
	{
		small
		item = 'Published by (R) Screen Choice LTD and Tayminster Astbury Mus (NS)'
	}
	{
		small
		item = 'All Rights Administered by Warner/Chappell Music, LTD'
	}
	{
		small
		item = 'All Rights Reserved'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Sweet Emotion\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler and Tom Hamilton'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1975 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Talk Talkin\'\'\''
	}
	{
		small
		item = 'Performed by Joe Perry'
	}
	{
		small
		item = 'Written by Joe Perry'
	}
	{
		small
		item = 'Courtesy of Roman Records/Columbia Records'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 2005 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by JuJu Rhythms'
	}
	{
		small
		item = 'Administered by EMI April Music Inc.'
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Train Kept A Rollin\'\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Myron Bradshaw, Kay Howie, Nathan Sydney'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement With Song BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1974 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Fort Knox Music, Inc. and'
	}
	{
		small
		item = 'Bienstock Pub. Co.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Toys In The Attic\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler and Joe Perry'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1975 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Uncle Salty\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler and Tom Hamilton'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1975 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Walk This Way\'\''
	}
	{
		small
		item = 'Performed by Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler and Joe Perry'
	}
	{
		small
		item = 'Courtesy of Columbia Records'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1975 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Walk This Way\'\''
	}
	{
		small
		item = 'Performed by Run DMC'
	}
	{
		small
		item = 'Featuring Steven Tyler and Joe Perry of Aerosmith'
	}
	{
		small
		item = 'Written by Steven Tyler and Joe Perry'
	}
	{
		small
		item = 'Courtesy of Arista / Profile Records, Inc.'
	}
	{
		small
		item = 'By Arrangement With Sony BMG Music Entertainment'
	}
	{
		small
		item = '(P) 1986 Sony BMG Music Entertainment'
	}
	{
		small
		item = 'Published by Music of Stage Three (BMI)'
	}
	{
		small
		item = 'Administered by Stage Three Music (U.S.) Inc. '
	}
	{
		small
		item = 'Used by permission. All Rights Reserved.'
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		title
		item = '\'\'Need More Aerosmith?\'\''
	}
	{
		emptyspace
	}
	{
		small
		item = 'Visit www.AeroForceOne.com'
	}
	{
		small
		item = 'The Band\'s Official Fan Club.'
	}
	{
		small
		item = ' Get more Aerosmith here than anywhere!'
	}
	{
		emptyspace
	}
	{
		small
		item = ' Fan Club Mailing Address:'
	}
	{
		small
		item = '4 Brussels Street'
	}
	{
		small
		item = 'Worcester, MA 01610'
	}
	{
		emptyspace
	}
	{
		small
		item = ' Aerosmith.com'
	}
	{
		small
		item = ' Aeroforceone.com'
	}
	{
		small
		item = ' Aerosmith.net'
	}
	{
		0x3fc6eda3
	}
]
