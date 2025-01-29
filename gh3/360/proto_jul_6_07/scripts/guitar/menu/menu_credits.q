credits_menu_font = text_a4

script create_credits_menu 
	new_menu \{scrollid = mc_scroll
		vmenuid = mc_vmenu
		use_backdrop = 1
		name = "Credits - coming soon"}
	text_params = {parent = mc_vmenu type = textelement font = ($credits_menu_font) rgba = ($menu_unfocus_color)}
	scrolling_list_begin
endscript

script destroy_credits_menu 
	destroy_menu \{menu_id = mc_scroll}
	destroy_menu \{menu_id = credits_list_container}
	killspawnedscript \{name = start_team_photos}
	killspawnedscript \{name = fadein_team_photos}
	if screenelementexists \{id = team_photos_container}
		destroyscreenelement \{id = team_photos_container}
	endif
endscript

script scrolling_list_begin 
	if ($end_credits = 1)
		wait \{2
			seconds}
	endif
	scrolling_list_init_credits
	scrolling_list_add_item <...>
	spawnscriptnow \{start_team_photos}
endscript

script scrolling_list_add_item i = 0
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
	getarraysize <credits>
	if (<i> = <array_size>)
		printf "** END OF CREDITS **"
		wait <time> seconds
		if screenelementexists id = credits_list_container
			destroyscreenelement id = credits_list_container
		endif
		return
	endif
	if structurecontains structure = (<credits> [<i>]) item
		text = ((<credits> [<i>]).item)
	else
		text = ""
	endif
	if structurecontains structure = (<credits> [<i>]) heading
		scale = <scale_head>
		color = <color_head>
		color_shadow = [20 10 5 90]
	else
		scale = <scale_body>
		color = <color_body>
		color_shadow = [0 0 0 0]
	endif
	if structurecontains structure = (<credits> [<i>]) title
		scale = <scale_title>
		color = <color_title>
		color_shadow = [20 10 5 90]
	endif
	if structurecontains structure = (<credits> [<i>]) small
		scale = 0.55
		color = <color_body>
		color_shadow = [0 0 0 0]
	endif
	formattext checksumname = item_id 'item_%n' n = <i>
	if screenelementexists id = <item_id>
		destroyscreenelement id = <item_id>
	endif
	createscreenelement {
		type = textblockelement
		id = <item_id>
		parent = credits_list_container
		font = text_a1
		dims = <dims>
		allow_expansion
		pos = (0.0, 0.0)
		internal_scale = <scale>
		text = <text>
		just = [center bottom]
		internal_just = [center bottom]
		rgba = <color>
		alpha = 0
		shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = <color_shadow>
		z_priority = <z_priority_credits>
	}
	getscreenelementdims id = <item_id>
	item_height = (<height> + <spacer>)
	item_pos = (<base_pos> + (<item_height> * (0.0, 1.0)))
	setscreenelementprops id = <item_id> pos = <item_pos>
	distance = (<screen_height> + ((<item_pos>.(0.0, 1.0)) - <screen_height>))
	time = (<distance> / <rate>)
	if screenelementexists id = <item_id>
		runscriptonscreenelement id = <item_id> scrolling_list_move_item params = {<...>}
	endif
endscript

script scrolling_list_move_item 
	spawnscriptnow scrolling_list_queue_next_item params = {<...>}
	target_pos = (<item_pos> - ((0.0, 1.0) * <distance>))
	alpha_pos_y = (<distance> / <time>)
	<alpha_pos> = (<item_pos> - ((0.0, 1.0) * <alpha_pos_y>))
	domorph time = 1 pos = <alpha_pos> alpha = 1
	domorph time = (<time> - 1) pos = <target_pos>
	if screenelementexists id = <item_id>
		destroyscreenelement id = <item_id>
	endif
endscript

script scrolling_list_queue_next_item 
	begin
	if screenelementexists id = <item_id>
		getscreenelementprops id = <item_id>
	endif
	pos_y = (<pos>.(0.0, 1.0))
	if (<pos_y> < <screen_height>)
		<i> = (<i> + 1)
		scrolling_list_add_item <...>
		return
	endif
	wait \{1
		frame}
	repeat
endscript
0x4e399894 = [
	icon_attack_deth_boss_slash
	icon_attack_deth_boss_morello
	icon_attack_deth_128
]

script start_team_photos 
	wait 5 seconds
	formattext checksumname = team_photos_container 'team_photos_container'
	createscreenelement {
		type = containerelement
		parent = root_window
		id = <team_photos_container>
		just = [left top]
		pos = (0.0, 0.0)
	}
	spawnscriptnow fadein_team_photos params = {team_photos_container = <team_photos_container> pos = (345.0, 150.0) frame = 1}
	spawnscriptnow fadein_team_photos params = {team_photos_container = <team_photos_container> pos = (935.0, 150.0) frame = 2}
	spawnscriptnow fadein_team_photos params = {team_photos_container = <team_photos_container> pos = (355.0, 400.0) frame = 3}
	spawnscriptnow fadein_team_photos params = {team_photos_container = <team_photos_container> pos = (925.0, 400.0) frame = 4}
endscript

script fadein_team_photos pos = (350.0, 150.0)
	begin
	photo_count = 0
	maximum_rotate = 20
	photo_wait = 10
	getarraysize $0x4e399894
	begin
	formattext checksumname = team_photo_checksum 'team_photo_%s_%f' s = <photo_count> f = <frame>
	texture = ($0x4e399894 [<photo_count>])
	if screenelementexists id = <team_photo_checksum>
		destroyscreenelement id = <team_photo_checksum>
	endif
	createscreenelement {
		type = spriteelement
		id = <team_photo_checksum>
		parent = <team_photos_container>
		texture = <texture>
		rgba = [255 255 255 255]
		pos = <pos>
		alpha = 0
		dims = (128.0, 128.0)
		just = [center center]
		z_priority = 25
	}
	getrandomvalue name = random_rot a = (<maximum_rotate> * -1) b = <maximum_rotate> integer
	doscreenelementmorph id = <team_photo_checksum> rot_angle = <random_rot> time = 2 alpha = 1 scale = 1.3
	wait <photo_wait> seconds
	doscreenelementmorph id = <team_photo_checksum> time = 2 alpha = 0
	wait 2 seconds
	if screenelementexists id = <team_photo_checksum>
		destroyscreenelement id = <team_photo_checksum>
	endif
	<photo_count> = (<photo_count> + 1)
	repeat <array_size>
	repeat
endscript

script scrolling_list_init_credits 
	rate = 38.0
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
	scale_head = 0.8
	color_head = [180 165 120 255]
	scale_body = 0.65000004
	color_body = [200 200 200 255]
	scale_title = 0.55
	color_title = [180 165 120 255]
	dims = (<column_width> * (1.0, 0.0))
	if screenelementexists id = credits_list_container
		destroyscreenelement id = credits_list_container
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = credits_list_container
		pos = (0.0, 0.0)
	}
	credits = [
		{title item = "You've unlocked"}
		{heading item = "Thru Fire and Flames"}
		{heading item = "Dragonforce, 2006"}
		{emptyspace}
		{emptyspace}
		{emptyspace}
		{emptyspace}
		{heading item = "- NEVERSOFT is -"}
		{emptyspace}
		{item = "Aaron Habibipour"}
		{item = "Aaron Williams"}
		{item = "Adam Micciulla"}
		{item = "Alan Flores"}
		{item = "Andy Gentile"}
		{item = "Andy Lee"}
		{item = "Andy Marchal"}
		{item = "Andy Warwick"}
		{item = "Anthony Carotenuto"}
		{item = "Anthony Pesch"}
		{item = "Anthony Saunders"}
		{item = "Art Usher"}
		{item = "Becki Halloway"}
		{item = "Ben Kutcher"}
		{item = "Beth Cowling"}
		{item = "Bill Buckley"}
		{item = "Brad Bulkley"}
		{item = "Brandon Riggs"}
		{item = "Brendan Wiuff"}
		{item = "Brian Bright"}
		{item = "Brian Marvin"}
		{item = "Brian Oles"}
		{item = "Cameron Davis"}
		{item = "Carlo Surla"}
		{item = "Chad Findley"}
		{item = "Chris Barnes"}
		{item = "Chris George"}
		{item = "Chris Parise"}
		{item = "Chris Peacock"}
		{item = "Chris Vance"}
		{item = "Chris Ward"}
		{item = "Clark Wen"}
		{item = "Clive Burdon"}
		{item = "Cody Pierson"}
		{item = "Dana Delalla"}
		{item = "Daniel Nelson"}
		{item = "Darren Thorne"}
		{item = "Daryl Kimoto"}
		{item = "Dave Cowling"}
		{item = "Dave Rowe"}
		{item = "Dave Hernandaz"}
		{item = "David Hind"}
		{item = "David Nilsen"}
		{item = "David Stowater"}
		{item = "Davidicus Schacher"}
		{item = "Francisco Mora "}
		{item = "Garrett Jost"}
		{item = "Gary Jesdanun"}
		{item = "Gavin Pugh"}
		{item = "Genna Habibipour"}
		{item = "Geoffrey Inkel"}
		{item = "Gideon Stocek"}
		{item = "Greg Kopina"}
		{item = "Greg Lopez"}
		{item = "Hari Khalsa"}
		{item = "Haroon Piracha"}
		{item = "Henry Ji "}
		{item = "Jake Geiger"}
		{item = "James Slater "}
		{item = "Jason Greenberg  "}
		{item = "Jason Maynard "}
		{item = "Jason Uyeda "}
		{item = "Jeff Morgan "}
		{item = "Jeff Swenty "}
		{item = "Jeremiah Roa "}
		{item = "Jeremy Page "}
		{item = "Jeremy Rogers "}
		{item = "Jody Coglianese "}
		{item = "Joe Pease "}
		{item = "Joe Kirchoff "}
		{item = "Joel Jewett "}
		{item = "John Dobbie "}
		{item = "John Bunny Knutson "}
		{item = "John Sahas "}
		{item = "John Walter "}
		{item = "John Webb "}
		{item = "John Zagorski "}
		{item = "Johnny Ow "}
		{item = "Jon Bailey "}
		{item = "Jordan Leckner "}
		{item = "Jun Chang "}
		{item = "June Park "}
		{item = "Justin Rote "}
		{item = "Karl Drown "}
		{item = "Kee Chang "}
		{item = "Kendall Harrison "}
		{item = "Kevin Mulhall "}
		{item = "Kristin Gallagher "}
		{item = "Kristina Adelmeyer "}
		{item = "Kurt Gutierrez "}
		{item = "Lee Ross "}
		{item = "Lisa Davies "}
		{item = "Lucy Topjian "}
		{item = "Marc De Peo "}
		{item = "Mark Scott "}
		{item = "Mark Wojtowicz "}
		{item = "Matt Canale "}
		{item = "Max Davidian "}
		{item = "Michael Bilodeau "}
		{item = "Michael Esposito "}
		{item = "Michelle Pierson "}
		{item = "Mike Friedrich "}
		{item = "Nolan Nelson "}
		{item = "Olin Georgescu "}
		{item = "Omar Kendall "}
		{item = "Pam Detrich "}
		{item = "Pat Connole "}
		{item = "Patrick Hagar "}
		{item = "Paul Robinson "}
		{item = "Peter Day "}
		{item = "Peter Pon "}
		{item = "Randy Guillote "}
		{item = "Randy Mills "}
		{item = "Rob Miller "}
		{item = "Robert Espinoza "}
		{item = "Rock Gropper "}
		{item = "Rulon Raymond "}
		{item = "Ryan Ligon "}
		{item = "Ryan Magid "}
		{item = "Sam Ware "}
		{item = "Sandy Newlands-Jewett "}
		{item = "Scott Pease "}
		{item = "Sean Streeter "}
		{item = "Sergio Gil "}
		{item = "Shane Calnan "}
		{item = "Simon Ebejer "}
		{item = "Sivarak Kai Tawarotip "}
		{item = "Skye Kang "}
		{item = "Steve Gallacher "}
		{item = "Stuart Scandrett "}
		{item = "Tae Kuen Kim "}
		{item = "Takashi Matsubara "}
		{item = "Ted Barber "}
		{item = "Thai Tran "}
		{item = "Tim Stasica "}
		{item = "Tina Stevenson "}
		{item = "Thomas Shin "}
		{item = "Tom Parker "}
		{item = "Travis Chen "}
		{item = "Zac Drake "}
		{emptyspace}
		{heading item = "RedOctane CREDITS"}
		{emptyspace}
		{heading item = "Software Production"}
		{title item = "Executive Producer"}
		{item = "Jeff Matsushita"}
		{title item = "Associate Producer"}
		{item = "Ted Lange"}
		{title item = "QA Lead"}
		{item = "Daniyel Garcia"}
		{title item = "QA Analysts"}
		{item = "Casimero Agustin, Mark Johnson,"}
		{item = "Raul Renteria, Amanda Amezcua"}
		{title item = "Song Selection Team"}
		{item = "Ted Lange, Chris Larkin"}
		{title item = "Song Asset Manager"}
		{item = "Pat Bowman"}
		{emptyspace}
		{heading item = "Publishing"}
		{title item = "VP of Marketing"}
		{item = "Stacey Hirata"}
		{title item = "Global Brand Manager"}
		{item = "Doug McCracken"}
		{title item = "Licensing Associate"}
		{item = "Chris Larkin"}
		{title item = "Marketing Assistant"}
		{item = "Kyle Rechsteiner"}
		{title item = "Sr. PR Specialist"}
		{item = "Bryan Lam"}
		{title item = "PR Coordinator"}
		{item = "Jordan Dodge"}
		{title item = "Creative Services Manager"}
		{item = "Mike Doan"}
		{title item = "Graphic Designers"}
		{item = "Maly Bun, Minna Hu"}
		{title item = "President"}
		{item = "Kai Huang"}
		{title item = "Head of Publishing"}
		{item = "Dusty Welch"}
		{title item = "COO"}
		{item = "Charles Huang"}
		{title item = "Controller"}
		{item = "Richard Santiago"}
		{title item = "Accounting"}
		{item = "Tina Xu"}
		{title item = "Logistics Manager"}
		{item = "Candy Lu"}
		{title item = "Logistics Specialist"}
		{item = "Scott Yang"}
		{title item = "HR Generalist"}
		{item = "Kathryn Fernandez"}
		{title item = "Hardware Group VP of Accessories"}
		{item = "Lee Guinchard"}
		{title item = "Director of R&D"}
		{item = "Jack McCauley"}
		{title item = "Product Manager"}
		{item = "Steve Withers"}
		{title item = "Production engineering manager"}
		{item = "Jared Chan"}
		{title item = "Product Designer"}
		{item = "Cody Lee"}
		{title item = "General Manager, RedOctane Europe"}
		{item = "Zach Fountain"}
		{emptyspace}
		{title item = "The rest at RedOctane, specifically:"}
		{item = "Hana Sakamoto, Trina Kratz,"}
		{item = "Henry Okamoto, Michael Pan,"}
		{item = "Patty Simoneli, Masai Davis,"}
		{item = "John Devecka and Swami Venkat."}
		{emptyspace}
		{emptyspace}
		{heading item = "All of the folks at Activision"}
		{heading item = "corporate, specifically:"}
		{item = "Mike Griffith, Ron Doornink,"}
		{item = "Thomas Tippl, Brian Kelly,"}
		{item = "Bobby Kotick, Robin Kaminsky,"}
		{item = "Maria Stipp, Steve Young,"}
		{item = "Josh Taub, Laura Hoegler,"}
		{item = "Jennifer Sullivan, Wade Pottinger,"}
		{item = "Sean Dexheimer, Dan Schaffer,"}
		{item = "Molly Hinchey, George Rose,"}
		{item = "Greg Deutsch, Mary Tuck,"}
		{item = "Kap Kang, Dani Kim,"}
		{item = "Dave Anderson, Justin Berenbaum,"}
		{item = "Tina Kwon, Susan Rude,"}
		{item = "John Dillulo, Ami Sheth,"}
		{item = "Maryanne Lataif, Michelle Schroder,"}
		{item = "Chris Wilson, Steve Rosenthal,"}
		{item = "Blake Hennon, Vic Lopez,"}
		{item = "Justin Bennett, Jamie Bafus,"}
		{item = "Phil Terzian, Jay Komas,"}
		{item = "Neil Armstrong, Peter Oey,"}
		{item = "Steve Wereb, Todd Szalla,"}
		{item = "Nikunj Dalal, Christopher Wilson,"}
		{item = "Kathryn Murray, Chris Cosby,"}
		{item = "Frankie Kang, Mark Lamia,"}
		{item = "Dave Stohl, Steve Pearce,"}
		{item = "Music Guru Dan Block,"}
		{item = "Activision APAC, Activision Europe."}
		{emptyspace}
		{emptyspace}
		{title item = "Worldwide Executive of Music"}
		{item = "Tim Riley"}
		{title item = "Manager, Music Affairs"}
		{item = "Brandon Young"}
		{emptyspace}
		{emptyspace}
		{heading item = "Activision Technical Requirements Group"}
		{emptyspace}
		{title item = "QA Director"}
		{item = "James Galloway"}
		{title item = "TRG Senior Manager"}
		{item = "Christopher Wilson"}
		{title item = "TRG Submissions Lead"}
		{item = "Dan Nichols"}
		{title item = "TRG Platform Lead"}
		{item = "Kyle Carey"}
		{title item = "TRG Project Lead"}
		{item = "Jason Harris"}
		{title item = "TRG Floor Lead"}
		{item = "Scott Soltero, Tomo Shikami,"}
		{item = "Jon Sheltmire"}
		{title item = "TRG Testers"}
		{item = "Brian Bensi, Colin Kawakami,"}
		{item = "Kirt Sanchez, Robert Riter,"}
		{item = "Scott Borakove, Ryan McCullough,"}
		{item = "Mark Ruzicka, Keith Kodama,"}
		{item = "Marc Villanueva, Sasan Helmi"}
		{emptyspace}
		{heading item = "Special Thanks"}
		{item = "Joshua Bowman, Victoria Bowman,"}
		{item = "Teri Nguyen, Uyen Nguyen,"}
		{item = "Miko Garcia, 10:58, BeastMan,"}
		{item = "Skye Lange, Dream Lange,"}
		{item = "Dorothy Yang, Jordoan,"}
		{item = "Virginia Lu, Jo-Jessica,"}
		{item = "The Lam and Fujikawa family,"}
		{item = "AMI & JO, The Bender,"}
		{item = "Helper Team, The San Jose Sharks,"}
		{item = "The Juco Family, M.A.C.,"}
		{item = "Teresa Leann Santos, No-Nancy,"}
		{item = "Da Bears: MB&GB, Just Peachy,"}
		{item = "The Larkin Family, Enuts,"}
		{item = "Matt Barnes, B-Diddy,"}
		{item = "Barens Beard, Freddie Arnott,"}
		{item = "GeraBel, Rooney, Grey Hawke,"}
		{item = "Dasmexa, Biljac, Tracy Price, "}
		{item = "Jon the DSM, Tug Hunter,"}
		{item = "Hunter Watson, Matthew Salutillo,"}
		{item = "Jace Powerchord, Lillian Qian,"}
		{item = "Kaylan Huang, Charley Huang,"}
		{item = "Simon Huang, Lily Huang,"}
		{item = "RedOctane India crew, Dennis Goh,"}
		{item = "Eskander Matta, Tom Knudsen,"}
		{item = "Matt Crowley"}
		{emptyspace}
		{emptyspace}
		{heading item = "Animated sequences by:"}
		{item = "Titmouse, Inc."}
		{emptyspace}
		{emptyspace}
		{heading item = "Motion Capture Performers:"}
		{item = "Adam Jennings"}
		{item = "Judita Wignall"}
		{item = "Matt Wignall"}
		{emptyspace}
		{emptyspace}
		{heading item = "Credits for"}
		{heading item = "WaveGroup Sound"}
		{emptyspace}
		{title item = "Lead Music Producer and Mixer"}
		{item = "Will Littlejohn"}
		{title item = "Additional Mixing"}
		{item = "Nick Gallant"}
		{title item = "Additional Production Services"}
		{item = "Scott Dugdale, Ric Fierabracci,"}
		{item = "Nick Gallant, Lance Taber,"}
		{item = "Joel Taylor"}
		{title item = "Guitar"}
		{item = "Nick Gallant, Lance Taber"}
		{title item = "Bass"}
		{item = "Ric Fierabracci, Nick Gallant"}
		{title item = "Drums, Percussion"}
		{item = "Scott Dugdale, Joel Taylor"}
		{title item = "Keyboards, Piano, Organ"}
		{item = "Scott Dugdale"}
		{title item = "Vocalists"}
		{item = "Moorea Dickason, Scott Dugdale,"}
		{item = "Mark Edwards, Nick Gallant,"}
		{item = "Kid Beyond, Danny, Shorago,"}
		{item = "David Dees Urrutia"}
		{title item = "Engineers"}
		{item = "Lindsay A. Bauer, Scott Dugdale,"}
		{item = "Paul Barros Bessone, Bill Frank,"}
		{item = "Nick Gallant, John Honor,"}
		{item = "Mark David Lee, Will Littlejohn,"}
		{item = "Bob Marshall, Sue Pelmulder,"}
		{item = "Ray J. Sutton, David Dees Urrutia"}
		{title item = "Programmers"}
		{item = "Scott Dugdale"}
		{title item = "Casting"}
		{item = "Leslie Barton"}
		{title item = "Production Coordinator"}
		{item = "Kimberly A. Nieva"}
		{emptyspace}
		{emptyspace}
		{title item = "Some songs were Performed"}
		{title item = "by the following:"}
		{emptyspace}
		{title item = "Schools Out"}
		{small item = "Vocals: Todd Davis"}
		{small item = "Bass: Dave Henzerling"}
		{small item = "Drums: Troy Luccketta"}
		{small item = "Girl Choir: Skylar Hopkins, Hana Goldroot,"}
		{small item = "Isabel Cooper and Abby Woldman, "}
		{small item = "Gillian Cooper"}
		{small item = "Guitar/Keys: Steve Ouimette"}
		{emptyspace}
		{title item = "Hit Me With Your Best Shot"}
		{small item = "Vocals: Lizann Warner"}
		{small item = "Bass: Steve Ouimette"}
		{small item = "Drums: Gary Sanchez"}
		{small item = "Guitar: Steve Ouimette"}
		{emptyspace}
		{title item = "Mississippi Queen"}
		{small item = "Vocals: Brody Dolyniuk"}
		{small item = "Bass: Steve Ouimette"}
		{small item = "Drums: John Covington"}
		{small item = "Guitar: Steve Ouimette"}
		{small item = "Keys: Steve Ouimette"}
		{emptyspace}
		{title item = "Talk Dirty"}
		{small item = "Vocals: Brody Dolyniuk"}
		{small item = "Bass: Steve Ouimette"}
		{small item = "Drums: Gary Sanchez"}
		{small item = "Guitar: Steve Ouimette"}
		{emptyspace}
		{title item = "Barracuda"}
		{small item = "Vocals: Lizann Warner"}
		{small item = "Bass: Steve Ouimette"}
		{small item = "Drums: Gary Sanchez"}
		{small item = "Guitar: Steve Ouimette"}
		{emptyspace}
		{title item = "Hurricane"}
		{small item = "Vocals: Brody Dolyniuk"}
		{small item = "Bass: Steve Ouimette"}
		{small item = "Drums: Gary Sanchez"}
		{small item = "Guitar: Steve Ouimette"}
		{emptyspace}
		{title item = "Cities On Flame"}
		{small item = "Vocals: Chris Powers"}
		{small item = "Bass: Steve Ouimette"}
		{small item = "Drums: Gary Sanchez"}
		{small item = "Guitar: Steve Ouimette"}
		{small item = "Keys: Brody Dolyniuk/Steve Ouimette"}
		{emptyspace}
		{title item = "Same Old Song And Dance"}
		{small item = "Vocals: Jay Basinger"}
		{small item = "Bass: Steve Ouimette"}
		{small item = "Drums: Gary Sanchez"}
		{small item = "Guitar: Steve Ouimette"}
		{emptyspace}
		{title item = "Devil Went Down to Georgia"}
		{small item = "Vocals: Chris Powers"}
		{small item = "Bass: Steve Ouimette"}
		{small item = "Drums: Bruce Weitz"}
		{small item = "Guitars: Steve Ouimette"}
		{small item = "Satan: Steve Ouimette"}
		{small item = "Johnny: Ed Degenaro and Geoff Tyson"}
	]
	return <...>
endscript
