loading_screen_tips = [
	"If you haven't recorded on a 4-track, you aren't a real band"
	"Make sure the crowd is willing to catch you when you stage dive."
	"Do NOT use homemade pyrotechnics"
	"Truck stops have the coolest stage gear."
	"Showing up 30 minutes late to practice is just tradition"
	"Can I get a little less suck out of the monitors?"
	"Never think you were the first band to wear all black on stage."
	"Yes, the stage monitors are in fact, diving boards."
	"Never ever leave the singer in charge of the mix."
	"It can always be much louder."
	"We're a real angry band, but that doesn't mean we don't believe in peace."
	"20 minute free-form jazz odysseys are not O.K."
	"People don't want to pay money to hear you jam"
	"It takes a long time to look like you just woke up."
	"Make sure someone in the band knows how to change a flat tire."
	"Turn that amp up.  My ears are barely even bleeding."
	"I used to freak out when my amp caught on fire.  Now I kinda dig the tone."
	"Smashed guitars just seem to sound better than their unsmashed brethren."
	"You're only as good as your last gig... which sucked."
	"You played great.  I'm sure they were just booing your outfits."
	"Maybe a drum machine would show up to practice on time."
]
g_loading_screen_split_container_id = id

script create_loading_screen mode = play_song
	kill_start_key_binding
	if ($is_changing_levels = 1)
		return
	endif
	change is_changing_levels = 1
	getarraysize ($loading_screen_tips)
	getrandomvalue name = rand_num a = 0 b = (<array_size> - 1) integer
	rand_tip = ($loading_screen_tips [<rand_num>])
	createscreenelement {
		type = textblockelement
		parent = root_window
		id = loading_tip_text
		text = <rand_tip>
		font = text_a10
		scale = 1.1
		just = [center center]
		dims = (350.0, 500.0)
		pos = (900.0, 250.0)
		rot_angle = 5
		rgba = [255 255 255 255]
		z_priority = 4999
		shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
	}
	if (<mode> = play_song || <mode> = play_encore || <mode> = play_boss || <mode> = restart_song)
		killspawnedscript name = jiggle_text_array_elements
		if screenelementexists id = $g_loading_screen_split_container_id
			destroyscreenelement id = $g_loading_screen_split_container_id
		endif
		movie = 'loading_flying'
		if NOT ismovieinbuffer movie = <movie>
			buffer_slot = 0
			freemoviebuffer buffer_slot = <buffer_slot>
			if gotextramemory
				mempushcontext debugheap
			endif
			allocatemoviebuffer buffer_slot = <buffer_slot> movie = 'movies\\bik\\loading_flying.bik.xen'
			if gotextramemory
				mempopcontext
			endif
			loadmovieintobuffer buffer_slot = <buffer_slot> movie = <movie>
		endif
		playmoviefrombuffer {
			buffer_slot = <buffer_slot>
			textureslot = 2
			no_hold
		}
		begin
		if ismovieplaying textureslot = 2
			break
		else
			wait 1 gameframe
		endif
		repeat
		split_text_into_array_elements {
			text = "LOADING"
			text_pos = (400.0, 560.0)
			space_between = (40.0, 0.0)
			flags = {
				rgba = [255 255 255 255]
				scale = 2.0
				z_priority = 500
				font = text_a10
				just = [center center]
				alpha = 1
			}
		}
		change g_loading_screen_split_container_id = <container_id>
		spawnscriptnow jiggle_text_array_elements params = {id = $g_loading_screen_split_container_id time = 1.0 wait_time = 3000 explode = 0}
	else
		killspawnedscript name = destroy_loading_screen_spawned
		createscreenelement {
			type = containerelement
			parent = root_window
			id = loading_screen_container
			pos = (0.0, 0.0)
		}
		createscreenelement {
			type = spriteelement
			parent = loading_screen_container
			texture = loading_flying_static
			pos = (640.0, 360.0)
			just = [center center]
			dims = (1280.0, 720.0)
		}
	endif
endscript

script destroy_loading_screen 
	destroy_menu \{menu_id = loading_tip_text}
	killspawnedscript \{name = jiggle_text_array_elements}
	if screenelementexists \{id = $g_loading_screen_split_container_id}
		destroyscreenelement \{id = $g_loading_screen_split_container_id}
	endif
	if ismovieplaying \{textureslot = 2}
		killmovie \{textureslot = 2}
	endif
	spawnscriptnow \{destroy_loading_screen_spawned}
	hideloadingscreen
	if ($playing_song = 0)
		change \{is_changing_levels = 0}
	endif
endscript

script destroy_loading_screen_spawned \{time = 0.3}
	onexitrun \{destroy_loading_screen_finish}
	if (<time> > 0)
		if screenelementexists \{id = menu_backdrop_container}
			doscreenelementmorph id = menu_backdrop_container alpha = 0 time = <time>
		endif
		if screenelementexists \{id = loading_screen_container}
			doscreenelementmorph id = loading_screen_container alpha = 0 time = <time>
		endif
		wait <time> seconds
	endif
endscript

script destroy_loading_screen_finish 
	if screenelementexists \{id = loading_screen_container}
		destroyscreenelement \{id = loading_screen_container}
	endif
	destroy_menu_backdrop
endscript

script refresh_screen 
	destroy_loading_screen
	create_loading_screen
endscript
