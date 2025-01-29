credits_menu_font = text_a4

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
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = 0
			alpha = 1}
	endif
	PopAssetContext
	if NOT ($end_credits = 1)
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
		new_menu scrollid = mc_scroll vmenuid = mc_vmenu event_handlers = <event_handlers>
		add_user_control_helper \{text = "BACK"
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
	KillSpawnedScript \{Name = start_team_photos}
	KillSpawnedScript \{Name = fadein_team_photos}
	KillSpawnedScript \{Name = scrolling_list_begin}
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
	SpawnScriptNow \{start_team_photos}
endscript

script scrolling_list_add_item \{i = 0}
	if (<i> = 0)
		if NOT ($end_credits = 1)
			<i> = 6
		endif
	endif
	if ($end_credits = 1)
		z_priority_credits = -1
	else
		z_priority_credits = 1000
	endif
	GetArraySize ($Credits)
	if (<i> = <array_Size>)
		printf \{"** END OF CREDITS **"}
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
		text = " "
	endif
	if StructureContains structure = ($Credits [<i>]) heading
		Scale = <scale_head>
		Color = <color_head>
		color_shadow = [20 10 5 90]
		shadow_offs = (3.0, 3.0)
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
		shadow_offs = (3.0, 3.0)
	endif
	if StructureContains structure = ($Credits [<i>]) small
		Scale = 0.5
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
	target_pos = (<item_pos> - ((0.0, 1.0) * <distance>))
	alpha_pos_y = (<distance> / <time>)
	<alpha_pos> = (<item_pos> - ((0.0, 1.0) * <alpha_pos_y>))
	DoMorph time = 1 Pos = <alpha_pos> alpha = 1
	DoMorph time = (<time> - 1) Pos = <target_pos>
	if ScreenElementExists id = <item_id>
		DestroyScreenElement id = <item_id>
	endif
endscript

script scrolling_list_queue_next_item 
	begin
	if ScreenElementExists id = <item_id>
		GetScreenElementProps id = <item_id>
	endif
	pos_y = (<Pos>.(0.0, 1.0))
	if (<pos_y> < <screen_height>)
		<i> = (<i> + 1)
		scrolling_list_add_item <...>
		return
	endif
	Wait \{1
		Frame}
	repeat
endscript
team_photo_textures_l = [
	endcredits_photo_01
	endcredits_photo_02
	endcredits_photo_03
	endcredits_photo_04
	endcredits_photo_05
	endcredits_photo_06
	endcredits_photo_07
	endcredits_photo_08
	endcredits_photo_09
	endcredits_photo_10
	endcredits_photo_11
	endcredits_photo_12
	endcredits_photo_13
	endcredits_photo_14
	endcredits_photo_15
	endcredits_photo_16
	endcredits_photo_17
	endcredits_photo_18
	endcredits_photo_19
	endcredits_photo_20
	endcredits_photo_21
	endcredits_photo_22
	endcredits_photo_45
]
team_photo_textures_r = [
	endcredits_photo_24
	endcredits_photo_25
	endcredits_photo_26
	endcredits_photo_27
	endcredits_photo_28
	endcredits_photo_29
	endcredits_photo_30
	endcredits_photo_31
	endcredits_photo_32
	endcredits_photo_33
	endcredits_photo_34
	endcredits_photo_35
	endcredits_photo_36
	endcredits_photo_37
	endcredits_photo_38
	endcredits_photo_39
	endcredits_photo_40
	endcredits_photo_46
	endcredits_photo_41
	endcredits_photo_42
	endcredits_photo_43
	endcredits_photo_44
	endcredits_photo_23
]

script start_team_photos 
	formatText \{checksumName = team_photos_container
		'team_photos_container'}
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = <team_photos_container>
		just = [left top]
		Pos = (0.0, 0.0)
	}
	Wait \{5
		Seconds}
	SpawnScriptNow fadein_team_photos params = {team_photos_container = <team_photos_container> rot_direction = -1 texture_array = team_photo_textures_l Pos = (395.0, 200.0) Frame = 1}
	Wait \{0.25
		Seconds}
	SpawnScriptNow fadein_team_photos params = {team_photos_container = <team_photos_container> rot_direction = 1 texture_array = team_photo_textures_r Pos = (905.0, 200.0) Frame = 2}
endscript

script fadein_team_photos \{Pos = (350.0, 150.0)}
	photo_count = 0
	maximum_rotate = 20
	photo_wait = 5
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
		Scale = 0.7
		just = [center center]
		z_priority = <z_priority_team_photos>
	}
	PopAssetContext
	GetRandomValue Name = random_rot a = 10 b = <maximum_rotate> integer
	<random_rot> = (<random_rot> * <rot_direction>)
	Scale = 1.15
	if (<texture> = endcredits_photo_18 || <texture> = endcredits_photo_32
			|| <texture> = endcredits_photo_36 || <texture> = endcredits_photo_37
			|| <texture> = endcredits_photo_39)
		<Scale> = 1.3
	endif
	if (<texture> = endcredits_photo_11 || <texture> = endcredits_photo_34 ||
			<texture> = endcredits_photo_13 || <texture> = endcredits_photo_44 ||
			<texture> = endcredits_photo_16)
		<Scale> = 1.2
	endif
	DoScreenElementMorph id = <team_photo_checksum> rot_angle = <random_rot> time = 2 alpha = 1 Scale = <Scale>
	Wait <photo_wait> Seconds
	DoScreenElementMorph id = <team_photo_checksum> time = 2 alpha = 0
	Wait \{2
		Seconds}
	if ScreenElementExists id = <team_photo_checksum>
		DestroyScreenElement id = <team_photo_checksum>
	endif
	<photo_count> = (<photo_count> + 1)
	repeat <array_Size>
endscript

script scrolling_list_init_credits 
	if ($end_credits = 1)
		rate = 94.0
	else
		rate = 40.0
	endif
	if ($end_credits = 1)
		screen_height = 375
		base_pos = ((640.0, 0.0) + ((0.0, 1.0) * <screen_height>))
		column_width = 500
	else
		screen_height = 720
		base_pos = ((640.0, 0.0) + ((0.0, 1.0) * <screen_height>))
		column_width = 500
	endif
	spacer = 5
	column_width = 450
	if ($end_credits = 1)
		scale_head = 0.65000004
		color_head = [180 165 120 255]
		scale_body = 0.55
		color_body = [180 200 200 255]
		scale_title = 0.55
		color_title = [180 165 120 255]
	else
		scale_head = 0.65000004
		color_head = [180 165 120 255]
		scale_body = 0.55
		color_body = [180 200 200 255]
		scale_title = 0.55
		color_title = [180 165 120 255]
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
		item = "You've unlocked"
	}
	{
		heading
		item = "Through The Fire and Flames"
	}
	{
		heading
		item = "Dragonforce, 2006"
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
		item = "Designed and Developed by Neversoft"
	}
	{
		emptyspace
	}
	{
		item = "Aaron Habibipour"
	}
	{
		item = "Aaron Williams"
	}
	{
		item = "Adam Micciulla"
	}
	{
		item = "Alan Flores"
	}
	{
		item = "Andy Gentile"
	}
	{
		item = "Andy Lee"
	}
	{
		item = "Andy Marchal"
	}
	{
		item = "Andy Warwick"
	}
	{
		item = "Anthony Carotenuto"
	}
	{
		item = "Anthony Pesch"
	}
	{
		item = "Anthony Saunders"
	}
	{
		item = "Art Usher"
	}
	{
		item = "Ben Kutcher"
	}
	{
		item = "Beth Cowling"
	}
	{
		item = "Bill Buckley"
	}
	{
		item = "Brad Bulkley"
	}
	{
		item = "Brandon Riggs"
	}
	{
		item = "Brendan Wiuff"
	}
	{
		item = "Brian Bright"
	}
	{
		item = "Brian Marvin"
	}
	{
		item = "Brian Oles"
	}
	{
		item = "Cameron Davis"
	}
	{
		item = "Chad Findley"
	}
	{
		item = "Chris Barnes"
	}
	{
		item = "Chris George"
	}
	{
		item = "Chris Parise"
	}
	{
		item = "Chris Peacock"
	}
	{
		item = "Chris Vance"
	}
	{
		item = "Chris Ward"
	}
	{
		item = "Clark Wen"
	}
	{
		item = "Clive Burdon"
	}
	{
		item = "Cody Pierson"
	}
	{
		item = "Dana Delalla"
	}
	{
		item = "Daniel Nelson"
	}
	{
		item = "Darren Thorne"
	}
	{
		item = "Daryl Kimoto"
	}
	{
		item = "Dave Cowling"
	}
	{
		item = "Dave Rowe"
	}
	{
		item = "Dave Hernandez"
	}
	{
		item = "David Hind"
	}
	{
		item = "David Nilsen"
	}
	{
		item = "David Stowater"
	}
	{
		item = "Davidicus Schacher"
	}
	{
		item = "Francisco Mora "
	}
	{
		item = "Garrett Jost"
	}
	{
		item = "Gary Jesdanun"
	}
	{
		item = "Gary Kroll"
	}
	{
		item = "Gavin Pugh"
	}
	{
		item = "Genna Habibipour"
	}
	{
		item = "Geoffrey Inkel"
	}
	{
		item = "Giancarlo Surla"
	}
	{
		item = "Gideon Stocek"
	}
	{
		item = "Greg Kopina"
	}
	{
		item = "Greg Lopez"
	}
	{
		item = "Hari Khalsa"
	}
	{
		item = "Henry Ji "
	}
	{
		item = "Jake Geiger"
	}
	{
		item = "James Slater "
	}
	{
		item = "Jason Greenberg"
	}
	{
		item = "Jason Maynard"
	}
	{
		item = "Jason Uyeda"
	}
	{
		item = "Jeff Morgan"
	}
	{
		item = "Jeff Swenty"
	}
	{
		item = "Jeremiah Roa"
	}
	{
		item = "Jeremy Page"
	}
	{
		item = "Jeremy Rogers"
	}
	{
		item = "Jody Coglianese"
	}
	{
		item = "Joe Pease"
	}
	{
		item = "Joe Kirchoff"
	}
	{
		item = "Joel Jewett"
	}
	{
		item = "John Dobbie"
	}
	{
		item = "John ''Bunny'' Knutson"
	}
	{
		item = "John Sahas"
	}
	{
		item = "John Walter"
	}
	{
		item = "John Webb"
	}
	{
		item = "John Zagorski"
	}
	{
		item = "Johnny Ow"
	}
	{
		item = "Jon Bailey"
	}
	{
		item = "Jordan Leckner"
	}
	{
		item = "Jun Chang"
	}
	{
		item = "June Park"
	}
	{
		item = "Justin Rote"
	}
	{
		item = "Karl Drown"
	}
	{
		item = "Kee Chang"
	}
	{
		item = "Kendall Harrison"
	}
	{
		item = "Kevin Mulhall"
	}
	{
		item = "Kristin Gallagher"
	}
	{
		item = "Kristina Adelmeyer"
	}
	{
		item = "Kurt Gutierrez"
	}
	{
		item = "Lee Ross"
	}
	{
		item = "Lisa Davies"
	}
	{
		item = "Lucy Topjian"
	}
	{
		item = "Marc De Peo"
	}
	{
		item = "Mario Sanchez"
	}
	{
		item = "Mark Scott"
	}
	{
		item = "Mark Storie"
	}
	{
		item = "Mark Wojtowicz"
	}
	{
		item = "Matt Canale"
	}
	{
		item = "Max Davidian"
	}
	{
		item = "Michael Bilodeau"
	}
	{
		item = "Michael Esposito"
	}
	{
		item = "Michelle Pierson"
	}
	{
		item = "Mike Friedrich"
	}
	{
		item = "Nolan Nelson"
	}
	{
		item = "Olin Georgescu"
	}
	{
		item = "Omar Kendall"
	}
	{
		item = "Pam Detrich"
	}
	{
		item = "Pat Connole"
	}
	{
		item = "Patrick Hagar"
	}
	{
		item = "Paul Robinson"
	}
	{
		item = "Peter Day"
	}
	{
		item = "Peter Pon"
	}
	{
		item = "Randy Guillote"
	}
	{
		item = "Randy Mills"
	}
	{
		item = "Rob Miller"
	}
	{
		item = "Robert Espinoza"
	}
	{
		item = "Rock Gropper"
	}
	{
		item = "Rulon Raymond"
	}
	{
		item = "Ryan Ligon"
	}
	{
		item = "Ryan Magid"
	}
	{
		item = "Sam Ware"
	}
	{
		item = "Sandy Newlands-Jewett"
	}
	{
		item = "Scott Pease"
	}
	{
		item = "Sean Streeter"
	}
	{
		item = "Sergio Gil"
	}
	{
		item = "Shane Calnan"
	}
	{
		item = "Simon Ebejer"
	}
	{
		item = "Sivarak ''Kai'' Tawarotip"
	}
	{
		item = "Skye Kang"
	}
	{
		item = "Steve Gallacher"
	}
	{
		item = "Stuart Scandrett"
	}
	{
		item = "Tae Kuen Kim"
	}
	{
		item = "Takashi Matsubara"
	}
	{
		item = "Ted Barber"
	}
	{
		item = "Thai Tran"
	}
	{
		item = "Tim Stasica"
	}
	{
		item = "Timothy Rapp"
	}
	{
		item = "Tina Stevenson"
	}
	{
		item = "Thomas Shin"
	}
	{
		item = "Tom Parker"
	}
	{
		item = "Travis Chen"
	}
	{
		item = "Zac Drake"
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = "Additional Development by:"
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		item = "Allan Lee"
	}
	{
		item = "Andrew Firth"
	}
	{
		item = "Becki Halloway"
	}
	{
		item = "Bobby Russell"
	}
	{
		item = "Fred Wang"
	}
	{
		item = "Haroon Piracha"
	}
	{
		item = "James Barker"
	}
	{
		item = "James Slater"
	}
	{
		item = "Jorge Lopez"
	}
	{
		item = "The Funk Hole"
	}
	{
		item = "Matt Chaney"
	}
	{
		item = "Matt Piersall"
	}
	{
		item = "Michael Veroni"
	}
	{
		item = "Mike Hall"
	}
	{
		item = "Patrick Morrison"
	}
	{
		item = "Okratron5000"
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = "Special Thanks To"
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		item = "Adam Day"
	}
	{
		item = "Bernie Corrigan"
	}
	{
		item = "Bret Michaels"
	}
	{
		item = "Erik Tarkiainen"
	}
	{
		item = "Janna Elias"
	}
	{
		item = "Paco Trinidad"
	}
	{
		item = "Pete Evick"
	}
	{
		item = "Slash"
	}
	{
		item = "Tom Morello"
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = "Hardcore Testers"
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		item = "Adam Nelson, Bryan Alcorn,"
	}
	{
		item = "Brian Lee, Bryan Berri, "
	}
	{
		item = "Catherine Lefebvre, Chad Sundman, "
	}
	{
		item = "Chris Self, Chris Watkins, "
	}
	{
		item = "Craig Baldwin, Daniel Farina, "
	}
	{
		item = "Danny Wapner, Dante Falcone, "
	}
	{
		item = "David Vandersmith, Derrick Timberlake, "
	}
	{
		item = "Gareth Davies, George Owens, "
	}
	{
		item = "Hao Huang, Ivan Van Norman,"
	}
	{
		item = "James Fenley, Jeff Brys, "
	}
	{
		item = "Jennifer Sills, Jerimiah Donofrio,"
	}
	{
		item = "John Theodore, Kevin Rosenberg,"
	}
	{
		item = "Kevin Quezada, Lee Ware,"
	}
	{
		item = "Matthew J. Ryan, Michael Winte,"
	}
	{
		item = "Neil Cortez, Nicholas Chavez,"
	}
	{
		item = "Orion Brown, Paul Yanez,"
	}
	{
		item = "Robert Byrd, Robert Keating,"
	}
	{
		item = "Ron Williams, Scott Tester,"
	}
	{
		item = "Sean Nagasawa, Sergio Pacheco,"
	}
	{
		item = "Tony Artino, Triston Wall"
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = "Motion Capture Performers:"
	}
	{
		item = "Adam Jennings"
	}
	{
		item = "America Young"
	}
	{
		item = "Bret Michaels"
	}
	{
		item = "Colin Day"
	}
	{
		item = "Derek Syverud"
	}
	{
		item = "Jerod Edington"
	}
	{
		item = "Jon Krupp"
	}
	{
		item = "Judita Wignall"
	}
	{
		item = "Matt Wignall"
	}
	{
		item = "Rick Irvin"
	}
	{
		item = "Sam Gallagher"
	}
	{
		item = "Scott Kinnenbrew"
	}
	{
		item = "Slash"
	}
	{
		item = "Tom Morello"
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = "Sponsors"
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		item = "Alternative Press"
	}
	{
		emptyspace
	}
	{
		item = "Audio-Technica"
	}
	{
		item = "(c)2007 Audio-Technica U.S., Inc.,"
	}
	{
		item = "the Audio-Technica name"
	}
	{
		item = "and logo are trademarks of"
	}
	{
		item = "Audio-Technica U.S., Inc."
	}
	{
		item = "All Rights Reserved."
	}
	{
		emptyspace
	}
	{
		item = "Axe"
	}
	{
		item = "AXE(R) is a registered trademark of Unilever"
	}
	{
		emptyspace
	}
	{
		item = "Crate:"
	}
	{
		item = "'Crate', 'Flexwave' and the Crate logo"
	}
	{
		item = "are registered trademarks"
	}
	{
		item = "of Loud Technologies, Inc"
	}
	{
		emptyspace
	}
	{
		item = "Decibel Magazine"
	}
	{
		emptyspace
	}
	{
		item = "Endemics"
	}
	{
		emptyspace
	}
	{
		item = "Ernie Ball"
	}
	{
		emptyspace
	}
	{
		item = "Gibson USA"
	}
	{
		emptyspace
	}
	{
		item = "Guitar Center"
	}
	{
		item = "Guitar Center(r) and the Guitar Center(r)"
	}
	{
		item = "logo are registered trademarks"
	}
	{
		item = "of Guitar Center, Inc. and are "
	}
	{
		item = "used by permission,"
	}
	{
		item = "all rights reserved"
	}
	{
		emptyspace
	}
	{
		item = "Guitar Player Magazine"
	}
	{
		emptyspace
	}
	{
		item = "Kerrang"
	}
	{
		emptyspace
	}
	{
		item = "Krank"
	}
	{
		item = "Krank Amplification is a registered trandemark of Krank Amplification L.L.C."
	}
	{
		emptyspace
	}
	{
		item = "Mackie"
	}
	{
		item = "Mackie is a registered trademark"
	}
	{
		item = "of LOUD Technologies Inc. in the"
	}
	{
		item = "United States and all other countries."
	}
	{
		emptyspace
	}
	{
		item = "Paste"
	}
	{
		emptyspace
	}
	{
		item = "Pontiac"
	}
	{
		item = "Pontiac, Pontiac arrowhead emblem,"
	}
	{
		item = "and Pontiac Garage are trademarks of"
	}
	{
		item = "General Motors Corporation, used under"
	}
	{
		item = "license to Activision Publishing Inc."
	}
	{
		emptyspace
	}
	{
		item = "Red Bull"
	}
	{
		item = "The RED BULL trademark and DOUBLE BULL"
	}
	{
		item = "DEVICE are trademarks of Red Bull"
	}
	{
		item = "GmbH and used under license."
	}
	{
		item = "Red Bull GmbH reserves all rights therein"
	}
	{
		item = "and unauthorized uses are prohibited."
	}
	{
		emptyspace
	}
	{
		item = "Wrigley's"
	}
	{
		item = "5(tm) is a trademark of Wm. Wrigley Jr. Company"
	}
	{
		emptyspace
	}
	{
		item = "Zildjian"
	}
	{
		item = "Zildjian, and the stylized"
	}
	{
		item = "Zildjian logo are registered"
	}
	{
		item = "trademarks of the"
	}
	{
		item = "Avedis Zildjian Company."
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = "RedOctane Credits"
	}
	{
		title
		item = "Software Production"
	}
	{
		title
		item = "Executive Producer"
	}
	{
		item = "Jeff Matsushita"
	}
	{
		title
		item = "Associate Producers"
	}
	{
		item = "Ted Lange, Patrick Bowman"
	}
	{
		title
		item = "QA Lead"
	}
	{
		item = "Daniyel Garcia"
	}
	{
		title
		item = "QA Analysts"
	}
	{
		item = "Casimero Agustin, Mark Johnson,"
	}
	{
		item = "Raul Renteria, Amanda Amezcua"
	}
	{
		title
		item = "Publishing"
	}
	{
		title
		item = "VP of Marketing"
	}
	{
		item = "Stacey Hirata"
	}
	{
		title
		item = "Global Brand Manager"
	}
	{
		item = "Doug McCracken"
	}
	{
		title
		item = "Associate Brand Manager"
	}
	{
		item = "Emily Uyehara"
	}
	{
		title
		item = "Licensing Associate"
	}
	{
		item = "Chris Larkin"
	}
	{
		title
		item = "Marketing Assistant"
	}
	{
		item = "Kyle Rechsteiner"
	}
	{
		title
		item = "Sr. PR Specialist"
	}
	{
		item = "Bryan Lam "
	}
	{
		title
		item = "PR Coordinator"
	}
	{
		item = "Jordan Dodge "
	}
	{
		title
		item = "Creative Services Manager "
	}
	{
		item = "Mike Doan"
	}
	{
		title
		item = "Graphic Designers"
	}
	{
		item = "Maly Bun, Minna Hu "
	}
	{
		title
		item = "President"
	}
	{
		item = "Kai Huang"
	}
	{
		title
		item = "Head of Publishing "
	}
	{
		item = "Dusty Welch "
	}
	{
		title
		item = "Executive VP"
	}
	{
		item = "Charles Huang "
	}
	{
		title
		item = "Executive Assistant"
	}
	{
		item = "Trina Kratz "
	}
	{
		title
		item = "Controller"
	}
	{
		item = "Richard Santiago"
	}
	{
		title
		item = "Sr. Financial Analyst "
	}
	{
		item = "Kevin Lurie"
	}
	{
		title
		item = "Sr. Accountant"
	}
	{
		item = "Tina Xu"
	}
	{
		title
		item = "Logistics Manager"
	}
	{
		item = "Candy Lu"
	}
	{
		title
		item = "Logistics Specialist "
	}
	{
		item = "Scott Yang"
	}
	{
		title
		item = "HR Generalist"
	}
	{
		item = "Kathryn Fernandez"
	}
	{
		title
		item = "Hardware Group VP of Accessories"
	}
	{
		item = "Lee Guinchard"
	}
	{
		title
		item = "Director of R&D"
	}
	{
		item = "Jack McCauley"
	}
	{
		title
		item = "Product Manager "
	}
	{
		item = "Steve Withers"
	}
	{
		title
		item = "Production engineering manager "
	}
	{
		item = "Jared Chan"
	}
	{
		title
		item = "Product Designer "
	}
	{
		item = "Cody Lee"
	}
	{
		title
		item = "E-commerce Manager "
	}
	{
		item = "Michael Pan"
	}
	{
		title
		item = "General Manager, RedOctane Europe"
	}
	{
		item = "Zach Fountain"
	}
	{
		title
		item = "Production Coordinator"
	}
	{
		item = "Phillip Greenspan "
	}
	{
		title
		item = "The rest at RedOctane, specifically:"
	}
	{
		item = "Henry Okamoto, Hana Sakamoto,"
	}
	{
		item = "Masai Davis, David Hsu, Joe Mijares"
	}
	{
		item = "John Devecka, Swami Venkat,"
	}
	{
		item = "and Jennifer Fox."
	}
	{
		title
		item = "All of the folks at Activision corporate, specifically: "
	}
	{
		item = "Mike Griffith, Ron Doornink,"
	}
	{
		item = "Thomas Tippl, Brian Kelly, Bobby Kotick,"
	}
	{
		item = "Robin Kaminsky, Brian Hodous, Maria Stipp,"
	}
	{
		item = "Joerg Trouvain, John Watts,"
	}
	{
		item = "Steve Young, Josh Taub,"
	}
	{
		item = "Laura Hoegler, Jennifer Sullivan,"
	}
	{
		item = "Wade Pottinger, Sean Dexheimer,"
	}
	{
		item = "Dan Schaffer, Molly Hinchey,"
	}
	{
		item = "George Rose, Greg Deutsch,"
	}
	{
		item = "Mary Tuck, Kap Kang, "
	}
	{
		item = "Dani Kim, Dave Anderson, "
	}
	{
		item = "Justin Berenbaum, Tina Kwon, "
	}
	{
		item = "Susan Rude, John Dillulo, "
	}
	{
		item = "Ami Sheth, Maryanne Lataif, "
	}
	{
		item = "Michelle Schroder,"
	}
	{
		item = "Steve Rosenthal, Blake Hennon,"
	}
	{
		item = "Vic Lopez, Justin Bennett,"
	}
	{
		item = "Jamie Bafus, Phil Terzian,"
	}
	{
		item = "Jay Komas, Neil Armstrong,"
	}
	{
		item = "Peter Oey, Steve Wereb, "
	}
	{
		item = "Todd Szalla, Nikunj Dalal, "
	}
	{
		item = "Christopher Wilson,"
	}
	{
		item = "Kathryn Murray, Chris Cosby,"
	}
	{
		item = "Frankie Kang, Mark Lamia,"
	}
	{
		item = "Dave Stohl, Steve Pearce,"
	}
	{
		item = "''Music Guru Dan Block'', "
	}
	{
		item = "Activision APAC and Activision Europe."
	}
	{
		title
		item = "Activision Music Department"
	}
	{
		title
		item = "Worldwide Executive of Music"
	}
	{
		item = "Tim Riley"
	}
	{
		title
		item = "Manager, Music Affairs"
	}
	{
		item = "Brandon Young"
	}
	{
		title
		item = "Music Supervisor"
	}
	{
		item = "Scott McDaniel "
	}
	{
		title
		item = "Music Dept Coordinator"
	}
	{
		item = "Jonathan Bodell "
	}
	{
		title
		item = "Special Thanks"
	}
	{
		item = "Rachel Dizon, Teri Nguyen, "
	}
	{
		item = "Christine Tu, Miko Garcia,"
	}
	{
		item = "BlackOut, VampireMoon, "
	}
	{
		item = "Skye Lange, Dream Lange, "
	}
	{
		item = "Dorothy Yang, Jordoan, "
	}
	{
		item = "Virginia Lu, The Lam and Fujikawa family,"
	}
	{
		item = "Jo-Jessica, AMI & JO,"
	}
	{
		item = "Bender Helper Impact,"
	}
	{
		item = "The San Jose Sharks, "
	}
	{
		item = "The Juco Family, M.A.C., "
	}
	{
		item = "Teresa Leann Santos, "
	}
	{
		item = "The Larkin Family, No-Nancy,"
	}
	{
		item = "Just Peachy, Enuts,"
	}
	{
		item = "Matt Barnes, B-Diddy, "
	}
	{
		item = "Barons Beard, Freddie Arnott, "
	}
	{
		item = "GeraBel, Rooney, "
	}
	{
		item = "Grey Hawke, Dasmexa,"
	}
	{
		item = "Biljac, Jon the DSM,"
	}
	{
		item = "Tracy Price, Tug Hunter,"
	}
	{
		item = "Hunter Watson, Matthew Salutillo,"
	}
	{
		item = "Lillian Qian, Kaylan Huang, "
	}
	{
		item = "Charley Huang, Simon Huang,"
	}
	{
		item = "Lily Huang, RedOctane India crew,"
	}
	{
		item = "Dennis Goh, Eskander "
	}
	{
		item = "Matta, Tom Knudsen, "
	}
	{
		item = "Matt Crowley, Eric Johnson"
	}
	{
		emptyspace
	}
	{
		heading
		item = "Quality Assurance/Customer Support"
	}
	{
		title
		item = "Lead, QA Functionality"
	}
	{
		item = "Michael Ryan"
	}
	{
		title
		item = "Lead, Night Shift,"
	}
	{
		item = "Graham Hagmaier"
	}
	{
		title
		item = "Sr. Lead, QA Functionality"
	}
	{
		item = "Paul Williams"
	}
	{
		title
		item = "Sr. Lead, Night Shift"
	}
	{
		item = "Frank So"
	}
	{
		title
		item = "Manager, QA Functionality"
	}
	{
		item = "John Rosser"
	}
	{
		title
		item = "Manager, Night Shift"
	}
	{
		item = "Adam Hartsfield"
	}
	{
		title
		item = "Sr. Manager, Technical Requirements Group"
	}
	{
		item = "Christopher Wilson"
	}
	{
		title
		item = "Director, QA Functionality"
	}
	{
		item = "Marilena Rixford"
	}
	{
		title
		item = "Director, QA Compliance & Code Release Group"
	}
	{
		item = "James Galloway"
	}
	{
		title
		item = "VP, QA Functionality/CS"
	}
	{
		item = "Rich Robinson"
	}
	{
		title
		item = "Sr. Leads, Technical Requirements Group"
	}
	{
		item = "Marc Villanueva"
	}
	{
		item = "Kyle Carey"
	}
	{
		item = "Sasan ''Sauce'' Helmi"
	}
	{
		empty
	}
	{
		title
		item = "Activision Technical Requirements Group"
	}
	{
		title
		item = "QA Director"
	}
	{
		item = "James Galloway"
	}
	{
		title
		item = "TRG Senior Manager"
	}
	{
		item = "Christopher Wilson"
	}
	{
		title
		item = "TRG Submissions Lead"
	}
	{
		item = "Dan Nichols"
	}
	{
		title
		item = "TRG Platform Lead"
	}
	{
		item = "Kyle Carey"
	}
	{
		title
		item = "TRG Project Lead"
	}
	{
		item = "Jason Harris"
	}
	{
		title
		item = "TRG Floor Leads"
	}
	{
		item = "Scott Soltero, Tomo Shikami,"
	}
	{
		item = "Jon Sheltmire"
	}
	{
		title
		item = "TRG Leads"
	}
	{
		item = "Todd Sutton"
	}
	{
		item = "Teak Holley "
	}
	{
		item = "David Wilkinson"
	}
	{
		item = "Jared Baca"
	}
	{
		item = "Zac Blitz "
	}
	{
		item = "Eric Stanzione "
	}
	{
		item = "Menas Kapitsas"
	}
	{
		emptyspace
	}
	{
		title
		item = "TRG Testers"
	}
	{
		item = "Brian Bensi, Colin Kawakami,"
	}
	{
		item = "Kirt Sanchez, Robert Riter,"
	}
	{
		item = "Scott Borakove, Melvin Allen,"
	}
	{
		item = "Ryan McCullough, Mark Ruzicka,"
	}
	{
		item = "Keith Kodama, Marc Villanueva,"
	}
	{
		item = "Sasan Helmi, Brian Baker"
	}
	{
		item = "Adam Azami, John McCurry, Edgar Sunga"
	}
	{
		emptyspace
	}
	{
		title
		item = "QA Functionality Test Team"
	}
	{
		title
		item = "Floor Lead"
	}
	{
		item = "Albert Yao"
	}
	{
		title
		item = "Floor Lead"
	}
	{
		item = "Guy Selga"
	}
	{
		title
		item = "Database Administrator"
	}
	{
		item = "Dong Fan"
	}
	{
		emptyspace
	}
	{
		title
		item = "Testers"
	}
	{
		item = "Jonathan Green"
	}
	{
		item = "Kevin Tucker"
	}
	{
		item = "Michael Tousey"
	}
	{
		item = "Albert Jacobs"
	}
	{
		item = "Calvin Mendoza"
	}
	{
		item = "Ramon Ramirez"
	}
	{
		item = "Alex Krivulin"
	}
	{
		item = "Jacob Goldman"
	}
	{
		item = "Enrique Roland"
	}
	{
		item = "Matt Ryder"
	}
	{
		item = "Danny Fehskens"
	}
	{
		item = "Brian Post"
	}
	{
		item = "James Stickley"
	}
	{
		item = "Jonathan Atkinson"
	}
	{
		item = "Abtin Gramian"
	}
	{
		item = "Emmanuel Salvacruz"
	}
	{
		item = "Jason Livergood"
	}
	{
		item = "Elias Jimenez"
	}
	{
		item = "Trevor Page"
	}
	{
		item = "Wei Zhao"
	}
	{
		item = "Viet Pham"
	}
	{
		item = "Julius Hipolito"
	}
	{
		item = "Rodrigo Magana"
	}
	{
		item = "Eric Burson"
	}
	{
		item = "Dee Gibson"
	}
	{
		item = "Erika Rodriguez"
	}
	{
		item = "Ian Page"
	}
	{
		item = "Joseph Zhou"
	}
	{
		item = "Joel Smith "
	}
	{
		item = "Michael Pallares "
	}
	{
		emptyspace
	}
	{
		title
		item = "Customer Support Managers"
	}
	{
		item = "Mike Hill, Email Support"
	}
	{
		title
		item = "Network Lab"
	}
	{
		item = "Chris Keim, Sr. Lead"
	}
	{
		item = "Francis Jimenez, Network Lead"
	}
	{
		item = "Sean Olsen, Tester"
	}
	{
		title
		item = "Multiplayer Lab "
	}
	{
		title
		item = "Lead "
	}
	{
		item = "Garrett Oshiro"
	}
	{
		title
		item = "Acting Floor Lead"
	}
	{
		item = "Michael Thomsen"
	}
	{
		title
		item = "Acting Floor Lead"
	}
	{
		item = "Matt Ryan"
	}
	{
		emptyspace
	}
	{
		title
		item = "Testers"
	}
	{
		item = " Leonard Rodriguez"
	}
	{
		item = "Dov Carson"
	}
	{
		item = "Michael Ashton"
	}
	{
		item = "Jessie Jones"
	}
	{
		item = "Bobby Jones "
	}
	{
		item = "Charlie Barkhorn"
	}
	{
		item = "Matthew Fawbush"
	}
	{
		item = "Kagan Maevers"
	}
	{
		item = "Mario Ibarra"
	}
	{
		item = "Franco Fernandez"
	}
	{
		item = "Jonathan Sadka"
	}
	{
		item = "Jan Erickson "
	}
	{
		title
		item = "Burn Room Supervisor "
	}
	{
		item = "Joule Middleton"
	}
	{
		title
		item = "Burn Room Technicians"
	}
	{
		item = "Kai Hsu"
	}
	{
		item = "Danny Feng"
	}
	{
		item = "Sean Kim"
	}
	{
		item = "Christopher Norman"
	}
	{
		title
		item = "Manager, Resource Administration"
	}
	{
		item = "Nadine Theuzillot"
	}
	{
		title
		item = "CS/QA Special Thanks"
	}
	{
		item = "Jason Levine, Matt McClure,"
	}
	{
		item = "Indra Yee, Todd Komesu, "
	}
	{
		item = "Vyente Ruffin, Dave Garcia-Gomez,"
	}
	{
		item = "Chris Keim, Francis Jimenez,"
	}
	{
		item = "Neil Barizo, Chris Neal,"
	}
	{
		item = "Willie Bolton, Jennifer Vitiello,"
	}
	{
		item = "Jeremy Shortell, Nikki Guillote,"
	}
	{
		item = "Jake Ryan"
	}
	{
		emptyspace
	}
	{
		heading
		item = "Activision would like to thank:"
	}
	{
		item = "Joshua Bowman, Victoria Bowman,"
	}
	{
		item = "Teri Nguyen, Uyen Nguyen,"
	}
	{
		item = "Miko Garcia, 10:58, BeastMan,"
	}
	{
		item = "Skye Lange, Dream Lange,"
	}
	{
		item = "Dorothy Yang, Jordoan,"
	}
	{
		item = "Virginia Lu, Jo-Jessica,"
	}
	{
		item = "The Lam and Fujikawa family,"
	}
	{
		item = "AMI & JO, The Bender,"
	}
	{
		item = "Helper Team, The San Jose Sharks,"
	}
	{
		item = "The Juco Family, M.A.C.,"
	}
	{
		item = "Teresa Leann Santos, No-Nancy,"
	}
	{
		item = "Da Bears: MB&GB, Just Peachy,"
	}
	{
		item = "The Larkin Family, Enuts,"
	}
	{
		item = "Matt Barnes, B-Diddy,"
	}
	{
		item = "Barens Beard, Freddie Arnott,"
	}
	{
		item = "GeraBel, Rooney, Grey Hawke,"
	}
	{
		item = "Dasmexa, Biljac, Tracy Price, "
	}
	{
		item = "Jon the DSM, Tug Hunter,"
	}
	{
		item = "Hunter Watson, Matthew Salutillo,"
	}
	{
		item = "Jace Powerchord, Lillian Qian,"
	}
	{
		item = "Kaylan Huang, Charley Huang,"
	}
	{
		item = "Simon Huang, Lily Huang,"
	}
	{
		item = "RedOctane India crew, Dennis Goh,"
	}
	{
		item = "Eskander Matta, Tom Knudsen,"
	}
	{
		item = "Matt Crowley"
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = "Animated sequences by:"
	}
	{
		heading
		item = "Titmouse, Inc."
	}
	{
		title
		item = "Creative Director"
	}
	{
		item = "Chris Prynoski"
	}
	{
		title
		item = "Producer"
	}
	{
		item = "Keith Fay"
	}
	{
		title
		item = "Director"
	}
	{
		item = "Juno Lee"
	}
	{
		title
		item = "Background Supervisor"
	}
	{
		item = "Antonio Cannobio"
	}
	{
		title
		item = "Lead Designer"
	}
	{
		item = "Junpei Takayama"
	}
	{
		title
		item = "Lead Animator"
	}
	{
		item = "David Vandervort"
	}
	{
		title
		item = "Animator"
	}
	{
		item = "Travis Blaise"
	}
	{
		title
		item = "Background Painter"
	}
	{
		item = "Sung Jin Ahn"
	}
	{
		title
		item = "Background Painter"
	}
	{
		item = "Rozalina Tchouchev"
	}
	{
		title
		item = "Background Design"
	}
	{
		item = "Keyoei Takayama"
	}
	{
		title
		item = "Background Design"
	}
	{
		item = "Paul Harmon"
	}
	{
		title
		item = "Ink & Paint"
	}
	{
		item = "Brian Kim"
	}
	{
		title
		item = "Assistant Background Design"
	}
	{
		item = "Kirk Shinmoto"
	}
	{
		title
		item = "Assistant Animator"
	}
	{
		item = "Ryan Deluca"
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = "WaveGroup Sound"
	}
	{
		emptyspace
	}
	{
		title
		item = "Lead Music Producer and Mixer"
	}
	{
		item = "Will Littlejohn"
	}
	{
		title
		item = "Additional Mixing"
	}
	{
		item = "Nick Gallant"
	}
	{
		title
		item = "Additional Production Services"
	}
	{
		item = "Scott Dugdale, Ric Fierabracci,"
	}
	{
		item = "Nick Gallant, Lance Taber,"
	}
	{
		item = "Joel Taylor"
	}
	{
		title
		item = "Guitar"
	}
	{
		item = "Nick Gallant, Lance Taber"
	}
	{
		title
		item = "Bass"
	}
	{
		item = "Ric Fierabracci, Nick Gallant"
	}
	{
		title
		item = "Drums, Percussion"
	}
	{
		item = "Scott Dugdale, Joel Taylor"
	}
	{
		title
		item = "Keyboards, Piano, Organ"
	}
	{
		item = "Scott Dugdale"
	}
	{
		title
		item = "Vocalists"
	}
	{
		item = "Moorea Dickason, Scott Dugdale,"
	}
	{
		item = "Mark Edwards, Nick Gallant,"
	}
	{
		item = "Kid Beyond, Danny, Shorago,"
	}
	{
		item = "David Dees Urrutia"
	}
	{
		title
		item = "Engineers"
	}
	{
		item = "Lindsay A. Bauer, Scott Dugdale,"
	}
	{
		item = "Paul Barros Bessone, Bill Frank,"
	}
	{
		item = "Nick Gallant, John Honore,"
	}
	{
		item = "Mark David Lee, Will Littlejohn,"
	}
	{
		item = "Bob Marshall, Sue Pelmulder,"
	}
	{
		item = "Ray J. Sutton, David Dees Urrutia"
	}
	{
		title
		item = "Programmers"
	}
	{
		item = "Scott Dugdale"
	}
	{
		title
		item = "Casting"
	}
	{
		item = "Leslie Barton"
	}
	{
		title
		item = "Production Coordinator"
	}
	{
		item = "Kimberly A. Nieva"
	}
	{
		emptyspace
	}
	{
		heading
		item = "Steve Ouimette Studios"
	}
	{
		title
		item = "Music Produced by"
	}
	{
		item = "Ryan Greene, Steve Ouimette"
	}
	{
		emptyspace
	}
	{
		title
		item = "Schools Out"
	}
	{
		small
		item = "Vocals: Todd Davis"
	}
	{
		small
		item = "Bass: Dave Henzerling"
	}
	{
		small
		item = "Drums: Troy Luccketta"
	}
	{
		small
		item = "Girl Choir: Skylar Hopkins, Hana Goldroot,"
	}
	{
		small
		item = "Isabel Cooper and Abby Woldman, "
	}
	{
		small
		item = "Gillian Cooper"
	}
	{
		small
		item = "Guitar/Keys: Steve Ouimette"
	}
	{
		emptyspace
	}
	{
		title
		item = "Hit Me With Your Best Shot"
	}
	{
		small
		item = "Vocals: Lizann Warner"
	}
	{
		small
		item = "Bass: Steve Ouimette"
	}
	{
		small
		item = "Drums: Gary Sanchez"
	}
	{
		small
		item = "Guitar: Steve Ouimette"
	}
	{
		emptyspace
	}
	{
		title
		item = "Mississippi Queen"
	}
	{
		small
		item = "Vocals: Brody Dolyniuk"
	}
	{
		small
		item = "Bass: Steve Ouimette"
	}
	{
		small
		item = "Drums: John Covington"
	}
	{
		small
		item = "Guitar: Steve Ouimette"
	}
	{
		small
		item = "Keys: Steve Ouimette"
	}
	{
		emptyspace
	}
	{
		title
		item = "Talk Dirty To Me"
	}
	{
		small
		item = "Vocals: Brody Dolyniuk"
	}
	{
		small
		item = "Bass: Steve Ouimette"
	}
	{
		small
		item = "Drums: Gary Sanchez"
	}
	{
		small
		item = "Guitar: Steve Ouimette"
	}
	{
		emptyspace
	}
	{
		title
		item = "Barracuda"
	}
	{
		small
		item = "Vocals: Lizann Warner"
	}
	{
		small
		item = "Bass: Steve Ouimette"
	}
	{
		small
		item = "Drums: Gary Sanchez"
	}
	{
		small
		item = "Guitar: Steve Ouimette"
	}
	{
		emptyspace
	}
	{
		title
		item = "Rock You like A Hurricane"
	}
	{
		small
		item = "Vocals: Brody Dolyniuk"
	}
	{
		small
		item = "Bass: Steve Ouimette"
	}
	{
		small
		item = "Drums: Gary Sanchez"
	}
	{
		small
		item = "Guitar: Steve Ouimette"
	}
	{
		emptyspace
	}
	{
		title
		item = "Cities On Flame"
	}
	{
		small
		item = "Vocals: Chris Powers"
	}
	{
		small
		item = "Bass: Steve Ouimette"
	}
	{
		small
		item = "Drums: Gary Sanchez"
	}
	{
		small
		item = "Guitar: Steve Ouimette"
	}
	{
		small
		item = "Keys: Brody Dolyniuk/Steve Ouimette"
	}
	{
		emptyspace
	}
	{
		title
		item = "Devil Went Down to Georgia"
	}
	{
		small
		item = "Vocals: Chris Powers"
	}
	{
		small
		item = "Bass: Steve Ouimette"
	}
	{
		small
		item = "Drums: Bruce Weitz"
	}
	{
		small
		item = "Guitars: Steve Ouimette"
	}
	{
		small
		item = "Satan: Steve Ouimette"
	}
	{
		small
		item = "Johnny: Ed Degenaro and Geoff Tyson"
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
		title
		item = "Music"
	}
	{
		title
		item = "Opening sequence and menu music"
	}
	{
		small
		item = "Performed by Slash"
	}
	{
		small
		item = "Produced by Jed Leiber"
	}
	{
		small
		item = "Engineered by Jason Fleming and Dave LaBrel"
	}
	{
		small
		item = "Recorded at The Studio @ the Sunset Marquis"
	}
	{
		emptyspace
	}
	{
		title
		item = "''3's & 7's''"
	}
	{
		small
		item = "Performed by Queens Of The Stone Age"
	}
	{
		small
		item = "Written by Joey Castillo, Josh Homme,"
	}
	{
		small
		item = "Troy Van Leeuwen"
	}
	{
		small
		item = "Courtesy of Interscope Records under license from Universal Music Enterprises"
	}
	{
		small
		item = "Published by Magic Bullet Music (ASCAP)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Anarchy In The UK''"
	}
	{
		small
		item = "Performed by The Sex Pistols"
	}
	{
		small
		item = "Written by Paul Cook,"
	}
	{
		small
		item = "Steve Jones, Glen Matlock,"
	}
	{
		small
		item = "Johnny Rotten(c)(P) Sex Pistols Residuals."
	}
	{
		small
		item = "Controlled exclusively by Sex Pistols Residuals in US/Canada;  under exclusive license outside of US/Canada to Virgin Music Ltd."
	}
	{
		small
		item = "Published by Careers-BMG Music Publishing, Inc. (BMI), Three Shadows Music c/o Cherry Lane Music Publishing, Warner/Chappell Music Publishing (ASCAP)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Avalancha''"
	}
	{
		small
		item = "Performed by Heroes del Silencio"
	}
	{
		small
		item = "Written by Pedro Andreu, Alan Boguslavsky, Enrique Bunbury, Joaquin Cardiel, Janet Valdivia"
	}
	{
		small
		item = "Courtesy of EMI Film & TV Music"
	}
	{
		small
		item = "Published by EMI Music Publishing, Inc."
	}
	{
		emptyspace
	}
	{
		title
		item = "''Barracuda''"
	}
	{
		small
		item = "Written by Michael DeRosier, Sue Ennis, Roger Fisher, Ann Wilson, Nancy Wilson"
	}
	{
		small
		item = "Published by BMG Songs, Inc. (ASCAP) and Universal Music Publishing Group"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Before I Forget''"
	}
	{
		small
		item = "Performed by Slipknot"
	}
	{
		small
		item = "Courtesy of Roadrunner Records"
	}
	{
		small
		item = "Published by EMI Music Publishing"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Black Magic Woman'' "
	}
	{
		small
		item = "Written by Peter Green"
	}
	{
		small
		item = "Published by Murbo Music Publishing, Inc."
	}
	{
		small
		item = "Courtesy of Line 6, Inc. and GuitarPort Online"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Black Sunshine'' "
	}
	{
		small
		item = "Written by Peter De Prume, Shauna Reynolds, Jay Yuenger, Rob Zombie"
	}
	{
		small
		item = "Published by Psychohead Music (ASCAP) and Warner/Chappell Music, Inc."
	}
	{
		emptyspace
	}
	{
		title
		item = "''Bulls On Parade'' "
	}
	{
		small
		item = "Performed by Rage Against The Machine"
	}
	{
		small
		item = "Written by Tim Commerford, Zack De La Rocha,"
	}
	{
		small
		item = "Tom Morello, Brad Wilk"
	}
	{
		small
		item = "Courtesy of Epic Records"
	}
	{
		small
		item = "by arrangement with "
	}
	{
		small
		item = "SONY BMG MUSIC ENTERTAINMENT"
	}
	{
		small
		item = "Published by Retribution Music (BMI)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Can't Be Saved''"
	}
	{
		small
		item = "Performed by Senses Fail"
	}
	{
		small
		item = "Courtesy of Vagrant Records"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Cherub Rock''"
	}
	{
		small
		item = "Performed by Smashing Pumpkins"
	}
	{
		small
		item = "Written by Billy Corgan"
	}
	{
		small
		item = "Courtesy of EMI Music"
	}
	{
		small
		item = "Published by Chrysalis Music Publishing"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Cities On Flame With Rock And Roll'' "
	}
	{
		small
		item = "Written by Eric Bloom, Albert Bouchard,"
	}
	{
		small
		item = "Joseph Bouchard, Allen Lanier,"
	}
	{
		small
		item = "Samuel Pearlman, Donald Roeser"
	}
	{
		small
		item = "Published by Sony/ATV Music Publishing"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Cliffs of Dover''"
	}
	{
		small
		item = "Written by Eric Johnson"
	}
	{
		small
		item = "Published by Eric Johnson"
	}
	{
		small
		item = "dba Amerita Music (BMI)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Closer''"
	}
	{
		small
		item = "Performed by Lacuna Coil"
	}
	{
		small
		item = "Written by Cristiano Migliore, Andrea Ferro,"
	}
	{
		small
		item = "Cristina Scabbia, Marco Biazzi,"
	}
	{
		small
		item = "Marco Coti Zelati, Cristiano Mozzati"
	}
	{
		small
		item = "Courtesy of Century Media Records"
	}
	{
		small
		item = "Published by Magic Arts Publishing (ASCAP)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Cult of Personality''"
	}
	{
		small
		item = "Performed by Living Colour"
	}
	{
		small
		item = "Written by William Calhoun, Corey Glover,"
	}
	{
		small
		item = "Vernon Reid, Muzz Skillings"
	}
	{
		small
		item = "Courtesy of Living Colour"
	}
	{
		small
		item = "Published by Dare to Dream"
	}
	{
		small
		item = "c/o Famous Music, Inc."
	}
	{
		emptyspace
	}
	{
		title
		item = "''Devil Went Down to Georgia''"
	}
	{
		small
		item = "Written by Tom Crain, Charlie Daniels,"
	}
	{
		small
		item = "Taz DeGregorio, Fred Edwards,"
	}
	{
		small
		item = "Charlie Hayward, James Marshall"
	}
	{
		small
		item = "Published by Universal Music Publishing Group"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Don't Hold Back''"
	}
	{
		small
		item = "Performed by the Sleeping"
	}
	{
		small
		item = "Courtesy of Victory Records"
	}
	{
		small
		item = "Published by Another Victory, Inc."
	}
	{
		emptyspace
	}
	{
		title
		item = "''Down and Dirty''"
	}
	{
		small
		item = "Performed by L.A. Slumlords"
	}
	{
		small
		item = "Written by Patty Hearse,"
	}
	{
		small
		item = "James Kross, and Chris Lord"
	}
	{
		small
		item = "Courtesy of James Kross"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Even Flow'' "
	}
	{
		small
		item = "Performed by Pearl Jam"
	}
	{
		small
		item = "Written by Stone Gossard, Eddie Vedder "
	}
	{
		small
		item = "Courtesy of Epic Records"
	}
	{
		small
		item = "by arrangement with"
	}
	{
		small
		item = "SONY BMG MUSIC ENTERTAINMENT"
	}
	{
		small
		item = "Published by Innocent Bystander and Universal Music Publishing Group "
	}
	{
		emptyspace
	}
	{
		title
		item = "''F.C.P.R.E.M.I.X.''"
	}
	{
		small
		item = "Performed by The Fall of Troy"
	}
	{
		small
		item = "Courtesy Equal Vision Records"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Generation Rock''"
	}
	{
		small
		item = "Performed by Revolverheld"
	}
	{
		small
		item = "courtesy of SONY BMG MUSIC"
	}
	{
		small
		item = "ENTERTAINMENT (Germany) GmbH"
	}
	{
		small
		item = "by arrangement with"
	}
	{
		small
		item = "SONY BMG MUSIC ENTERTAINMENT"
	}
	{
		small
		item = "Published by Universal Music Publishing Group"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Go That Far''"
	}
	{
		small
		item = "The Brett Michaels Band"
	}
	{
		small
		item = "Courtesy of Courtesy of Michaels"
	}
	{
		small
		item = "Entertainment Group, Inc."
	}
	{
		emptyspace
	}
	{
		title
		item = "''Helicopter''"
	}
	{
		small
		item = "Performed by Bloc Party"
	}
	{
		small
		item = "Written by Kele Okereke, Peter Moakes,"
	}
	{
		small
		item = "Russell Lissack, Matt Tong"
	}
	{
		small
		item = "Courtesy of Warner Music Group"
	}
	{
		small
		item = "and V2 Records"
	}
	{
		small
		item = "Publishing courtesy of the Coalition Group"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Hier Kommt Alex''"
	}
	{
		small
		item = "Performed by Die Toten Hosen"
	}
	{
		small
		item = "Written by Andreas Frege, Andreas Meurer"
	}
	{
		small
		item = "Courtesy of JKP - Jochens kleine"
	}
	{
		small
		item = "Plattenfirma GmbH & Co. KG"
	}
	{
		small
		item = "Published by T.O.T. Schallplatten GmbH"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Hit Me With Your Best Shot''"
	}
	{
		small
		item = "Written by Eddie Schwartz"
	}
	{
		small
		item = "Published by Sony/ATV Tunes LLC (ASCAP)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Holiday in Cambodia''"
	}
	{
		small
		item = "Written by Jello Biafra, East Bay Ray, Klaus Flouride, Darren Henley, Bruce Slesinger"
	}
	{
		small
		item = "Published by Decay Music (BMI)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''I'm In The Band'' "
	}
	{
		small
		item = "Performed by The Hellacopters"
	}
	{
		small
		item = "Written by Anders Andersson, Jens Dahlqvist,"
	}
	{
		small
		item = "Matz Eriksson, Dick Hakansson, Anders Lindstrom"
	}
	{
		small
		item = "Courtesy Of Universal Music AB under license from Universal Music Enterprises"
	}
	{
		small
		item = "Published by Universal Music Publishing (ASCAP)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Impulse''"
	}
	{
		small
		item = "Endless Sporadic"
	}
	{
		small
		item = "Courtesy of Andy Gentile and Zach Kamins"
	}
	{
		emptyspace
	}
	{
		title
		item = "''In Love''"
	}
	{
		small
		item = "Performed by Scouts of St. Sebastian"
	}
	{
		small
		item = "Courtesy of Judita Wignall"
	}
	{
		emptyspace
	}
	{
		title
		item = "''In the Belly of a Shark''"
	}
	{
		small
		item = "Performed by the Gallows"
	}
	{
		small
		item = "Courtesy of Epitaph Records"
	}
	{
		small
		item = "and Warner Music UK"
	}
	{
		small
		item = "Published by Gallows licensed by arrangement with Raw Power Management"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Knights of Cydonia''"
	}
	{
		small
		item = "Performed by Muse"
	}
	{
		small
		item = "Written by Matthew Bellamy"
	}
	{
		small
		item = "Courtesy of Warner Music Group"
	}
	{
		small
		item = "Published by Warner Brothers, Inc."
	}
	{
		emptyspace
	}
	{
		title
		item = "''Kool Thing''"
	}
	{
		small
		item = "Performed by Sonic Youth"
	}
	{
		small
		item = "Written by Kim Gordon, Thurston Moore,"
	}
	{
		small
		item = "Lee Renaldo, Steven Shelley"
	}
	{
		small
		item = "Courtesy of Geffen Records under license from Universal Music Enterprises "
	}
	{
		small
		item = "Published by Sonik Tooth Music (BMI), administered by Zomba Songs (BMI)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''La Grange''"
	}
	{
		small
		item = "written by Billy F Gibbons, Dusty Hill"
	}
	{
		small
		item = "and Frank Beard"
	}
	{
		small
		item = "(c)1973 Stage Three Songs (ASCAP)"
	}
	{
		small
		item = "Courtesy of Line 6, Inc. and GuitarPort Online"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Lay Down''"
	}
	{
		small
		item = "Performed By Priestess"
	}
	{
		small
		item = "From the album ''Hello Master''"
	}
	{
		small
		item = "Used courtesy of RCA Records by arrangement with SONY BMG MUSIC ENTERTAINMENT"
	}
	{
		small
		item = "Published by Chrysalis Music Publishing "
	}
	{
		emptyspace
	}
	{
		title
		item = "''Mauvais Garcon''"
	}
	{
		small
		item = "Performed by NAAST"
	}
	{
		small
		item = "Written by Nicolas Naast, Gustave Naast,"
	}
	{
		small
		item = "Laka Naast, Clod Naast"
	}
	{
		small
		item = "Courtesy of EMI Film & TV Music"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Metal Heavy Lady''"
	}
	{
		small
		item = "Performed by the Lions"
	}
	{
		small
		item = "Written by Matt Drenik, Jake Perlman,"
	}
	{
		small
		item = "Austin Calman, Trevor Sutcliffe"
	}
	{
		small
		item = "Courtesy of Rock Booking & Management"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Minus Celsius'' "
	}
	{
		small
		item = "Performed by Backyard Babies"
	}
	{
		small
		item = "courtesy of SONY BMG MUSIC"
	}
	{
		small
		item = "ENTERTAINMENT (Sweden) AB  "
	}
	{
		small
		item = "by arrangement with"
	}
	{
		small
		item = "SONY BMG MUSIC ENTERTAINMENT"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Miss Murder'' "
	}
	{
		small
		item = "Performed by AFI "
	}
	{
		small
		item = "Written by Hunter Burgan, Adam Carson,"
	}
	{
		small
		item = "Davey Havock, Jade Puget "
	}
	{
		small
		item = "Courtesy of Interscope Records under license from Universal Music Enterprises "
	}
	{
		small
		item = "Published by Ex Noctem Nacimur Music "
	}
	{
		emptyspace
	}
	{
		title
		item = "''Mississippi Queen''"
	}
	{
		small
		item = "Written by Corky Laing, Felix Pappalardi,"
	}
	{
		small
		item = "David Rea, Leslie West"
	}
	{
		small
		item = "Published by BMG Songs, Inc. (ASCAP) "
	}
	{
		emptyspace
	}
	{
		title
		item = "''Monsters''"
	}
	{
		small
		item = "Performed by Matchbook Romance"
	}
	{
		small
		item = "Written by Andrew Jordan, Ryan Depaolo,"
	}
	{
		small
		item = "Ryan Kienle, Aaron Stern"
	}
	{
		small
		item = "Courtesy of Epitaph Records"
	}
	{
		small
		item = "Published by Donkington, Home Is Anywhere"
	}
	{
		small
		item = "You Hang Your Head, Mammak Kienle's Meatballs,"
	}
	{
		small
		item = "Poundtown, all c/o FS Management"
	}
	{
		emptyspace
	}
	{
		title
		item = "''My Curse''"
	}
	{
		small
		item = "Performed by Killswitch Engage"
	}
	{
		small
		item = "Courtesy of Roadrunner Records"
	}
	{
		small
		item = "Published by Warner/Chappell Music Publishing"
	}
	{
		emptyspace
	}
	{
		title
		item = "''My Name Is Jonas''"
	}
	{
		small
		item = "Written by Jason Cropper,"
	}
	{
		small
		item = "Rivers Cuomo, Patrick Wilson "
	}
	{
		small
		item = "Published by Jason Cropper"
	}
	{
		small
		item = "and EO Smith Music (BMI), FIE (BMI)"
	}
	{
		small
		item = "administered by Wixen Music Publishing "
	}
	{
		emptyspace
	}
	{
		title
		item = "''Nothing For Me Here''"
	}
	{
		small
		item = "Performed by Dope"
	}
	{
		small
		item = "Courtesy of Edsel Ebejer"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Number Of The Beast''"
	}
	{
		small
		item = "Written by Steve Harris"
	}
	{
		small
		item = "Performed by Iron Maiden"
	}
	{
		small
		item = "Courtesy of EMI Music and Sanctuary Records"
	}
	{
		small
		item = "Published by Zomba Enterprises Inc. (ASCAP)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''One''"
	}
	{
		small
		item = "Performed by Metallica"
	}
	{
		small
		item = "Written by Cliff Burton, Kirk Hammett,"
	}
	{
		small
		item = "James Hetfield, Lars Ulrich"
	}
	{
		small
		item = "Courtesy of Warner Music Group"
	}
	{
		small
		item = "Published by Creeping Death Music (ASCAP)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Paint It Black''"
	}
	{
		small
		item = "Written by Mick Jagger and Keith Richards"
	}
	{
		small
		item = "Performed by The Rolling Stones"
	}
	{
		small
		item = "Courtesy of ABKCO Music & Records, Inc."
	}
	{
		emptyspace
	}
	{
		title
		item = "''Paranoid''"
	}
	{
		small
		item = "Written by Geezer Butler, Tony Iomni,"
	}
	{
		small
		item = "Ozzy Osbourne, Bill Ward"
	}
	{
		small
		item = "Published by Essex Music International, Inc. c/o The Richmond Organization (ASCAP)"
	}
	{
		small
		item = "Courtesy of Line 6, Inc. and GuitarPort Online"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Prayer Of The Refugee''"
	}
	{
		small
		item = "Performed by Rise Against"
	}
	{
		small
		item = "Courtesy of Geffen Records under license from Universal Music Enterprises"
	}
	{
		small
		item = "Published by Sony/ATV Tunes LLC (ASCAP),"
	}
	{
		small
		item = "Do It To Win Music (ASCAP)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Pride and Joy''"
	}
	{
		small
		item = "Written by Stevie Ray Vaughan"
	}
	{
		small
		item = "Published by RAY VAUGHAN MUSIC (ASCAP) administered by Bug Music"
	}
	{
		small
		item = "Courtesy of Line 6, Inc. and GuitarPort Online"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Radio Song''"
	}
	{
		small
		item = "Performed by Superbus"
	}
	{
		small
		item = "Written by Jennifer Ayache"
	}
	{
		small
		item = "Courtesy of Mercury France under license from Universal Music Enterprises"
	}
	{
		small
		item = "Published by WB Music Corp. (ASCAP)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Raining Blood''"
	}
	{
		small
		item = "Written by Jeff Hanneman, Kerry King"
	}
	{
		small
		item = "Performed by Slayer"
	}
	{
		small
		item = "Courtesy of Warner Music Group"
	}
	{
		small
		item = "Published by BMG Songs, Inc. (ASCAP)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Reptilia''"
	}
	{
		small
		item = "Performed by The Strokes"
	}
	{
		small
		item = "Courtesy of The RCA Records Label"
	}
	{
		small
		item = "by arrangement with"
	}
	{
		small
		item = "SONY BMG MUSIC ENTERTAINMENT"
	}
	{
		small
		item = "Published by The Strokes Band Music"
	}
	{
		small
		item = "and Universal Music Publishing"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Rock and Roll All Night''"
	}
	{
		small
		item = "Written by Gene Simmons, Paul Stanley"
	}
	{
		small
		item = "Published by Universal Music Publishing Group"
	}
	{
		small
		item = "Courtesy of Line 6, Inc. and GuitarPort Online"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Rock You Like A Hurricane''"
	}
	{
		small
		item = "Written by Klaus Meine, Herman Rarebell,"
	}
	{
		small
		item = "Rudolf Schenker"
	}
	{
		small
		item = "Published by BMG Songs, Inc. (ASCAP)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Ruby''"
	}
	{
		small
		item = "Performed by Kaiser Chiefs"
	}
	{
		small
		item = "Courtesy of B-Unique Records/Universal Records under license from Universal Music Enterprises"
	}
	{
		small
		item = "and Courtesy of Natural Energy Labs"
	}
	{
		small
		item = "Published by Almo Music Corp"
	}
	{
		small
		item = "c/o Rondor Music International, Inc."
	}
	{
		emptyspace
	}
	{
		title
		item = "''Sabotage''"
	}
	{
		small
		item = "Performed by the Beastie Boys"
	}
	{
		small
		item = "Written by Mike Diamond, Adam Yauch,"
	}
	{
		small
		item = "Adam Horowitz, Rick Rubin"
	}
	{
		small
		item = "Courtesy of Capitol Records by arrangement with EMI Film & Television Music"
	}
	{
		small
		item = "Published by Universal Music Publishing Group"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Same Old Song And Dance''"
	}
	{
		small
		item = "Performed by Aerosmith"
	}
	{
		small
		item = "Courtesy of Columbia Records"
	}
	{
		small
		item = "by arrangement with"
	}
	{
		small
		item = "SONY BMG MUSIC ENTERTAINMENT"
	}
	{
		small
		item = "Written by Tyler/Perry"
	}
	{
		small
		item = "(c)1974 Music of Stage Three (BMI)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''School's Out''"
	}
	{
		small
		item = "Written by Michael Bruce, Glen Buxton, Alice Cooper, Dennis Dunaway, Neil Smith"
	}
	{
		small
		item = "Published by Ezra Music Corp (BMI),"
	}
	{
		small
		item = "and Third Palm Music (BMI)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''She Bangs The Drums''"
	}
	{
		small
		item = "Written by Ian Brown, John Squire"
	}
	{
		small
		item = "Performed by Stone Roses"
	}
	{
		small
		item = "Published by Zomba Enterprises Inc. (ASCAP) "
	}
	{
		emptyspace
	}
	{
		title
		item = "''Slow Ride''"
	}
	{
		small
		item = "Written by Lonesome Dave Peverett"
	}
	{
		small
		item = "Published by Warner/Chappell Music Publishing"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Story of My Life''"
	}
	{
		small
		item = "Written by Mike Ness"
	}
	{
		small
		item = "Published by Rebel Waltz Music"
	}
	{
		small
		item = "c/o Sony/ATV Tunes LLC"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Stricken''"
	}
	{
		small
		item = "Performed by Disturbed"
	}
	{
		small
		item = "Courtesy of Warner Music Group"
	}
	{
		small
		item = "Published by Warner/Chappell Music Publishing"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Suck My Kiss''"
	}
	{
		small
		item = "Performed by Red Hot Chili Peppers"
	}
	{
		small
		item = "Written by Flea, John Frusciante,"
	}
	{
		small
		item = "Anthony Kiedis, Chad Smith"
	}
	{
		small
		item = "Courtesy of Warner Music Group"
	}
	{
		small
		item = "Published by Moebetoblame Music (BMI)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Sunshine of Your Love''"
	}
	{
		small
		item = "Performed by Cream"
	}
	{
		small
		item = "Written by Peter Brown, Jack Bruce, Eric Clapton"
	}
	{
		small
		item = "Published by Warner/Chappell Music Publishing"
	}
	{
		small
		item = "Courtesy of Line 6, Inc. and GuitarPort Online"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Take This Life''"
	}
	{
		small
		item = "Performed by In Flames"
	}
	{
		small
		item = "Courtesy of Ferret Music"
	}
	{
		small
		item = "Published by Warner/Chappell Music Publishing"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Talk Dirty To Me''"
	}
	{
		small
		item = "Written by Bobby Dall, CC De Ville, Bret Michaels, Rikki Rockett"
	}
	{
		small
		item = "Published by Zomba Songs (BMI),"
	}
	{
		small
		item = "Cyanide Publishing (BMI)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''The Metal''"
	}
	{
		small
		item = "Performed by Tenacious D"
	}
	{
		small
		item = "Courtesy of Epic Records"
	}
	{
		small
		item = "by arrangement with"
	}
	{
		small
		item = "SONY BMG MUSIC ENTERTAINMENT"
	}
	{
		small
		item = "Published by Buttflap Music (ASCAP), Time For My Breakfast Jackass, Inc. (ASCAP),"
	}
	{
		small
		item = "Universal Music Corp. (ASCAP)"
	}
	{
		emptyspace
	}
	{
		title
		item = "''The Seeker''"
	}
	{
		small
		item = "Written by Pete Townsend"
	}
	{
		small
		item = "Published by Towser Tunes Inc. (BMI) o/b/o itself and Abkco Music Inc., Fabulous Music, administered by"
	}
	{
		small
		item = "Careers-BMG Music Publishing, Inc. (BMI)"
	}
	{
		small
		item = "Courtesy of Line 6, Inc. and GuitarPort Online"
	}
	{
		emptyspace
	}
	{
		title
		item = "''The Way It Ends''"
	}
	{
		small
		item = "Performed by Prototype"
	}
	{
		small
		item = "Courtesy of Vincent Levalois"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Through Fire & Flames''"
	}
	{
		small
		item = "Performed by Dragonforce"
	}
	{
		small
		item = "Courtesy of Sanctuary Records and Roadrunner Records"
	}
	{
		small
		item = "Published by EMI Music Publishing"
	}
	{
		emptyspace
	}
	{
		title
		item = "''Welcome To The Jungle''"
	}
	{
		small
		item = "Performed by Guns N' Roses"
	}
	{
		small
		item = "Courtesy of Geffen Records under license from Universal Music Enterprises"
	}
	{
		small
		item = "Published by Guns N' Roses Music"
	}
	{
		emptyspace
	}
	{
		title
		item = "''When You Were Young''"
	}
	{
		small
		item = "Performed by The Killers"
	}
	{
		small
		item = "Courtesy of The Island Def Jam Music Group under license from Universal Music Enterprises"
	}
	{
		small
		item = "Published by Universal Music Publishing Group"
	}
]
