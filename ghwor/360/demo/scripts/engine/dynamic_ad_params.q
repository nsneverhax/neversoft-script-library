massive_build = 0
massive_sku = 'atvi_guitar_hero_6_x360'
g_dynamic_ad_support_venue_ads = 0
g_dynamic_ad_support_menu_ads = 1
g_dynamic_ad_mark_all_2d_subscribers_as_downloaded = 0
g_dynamic_ad_debug_2dsubscriber_images = 0
g_dynamic_ad_debug_2dsubscriber_image_scale = 1.0
g_dynamic_ad_debug_2dsubscriber_bounce_around_the_screen = 0
g_dynamic_ad_friends_feed_ui_create_first_time = 1
g_dynamic_ad_debug_replacetexturefailurepassthroughflag = 0
massive_log_level = none
g_dynamic_ad_2d_subscribers = [
	{
		id = ad_friendfeed_ad1_468x60
		zone = z_friendfeed
		ie = 'ad_friendfeed_ad1_468x60'
		type = image
		width = 468
		height = 60
		texdict = `pak/menu_ad_tex/menu_ad_tex.tex`
		texturename = 'tex/ads/ad_friendfeed_ad1_468x60.dds'
		texturechecksum = `tex/ads/ad_friendfeed_ad1_468x60.dds`
		uicreatecallback = dynamic_ad_friendsfeed_uicreate_callback
		uidestroycallback = dynamic_ad_friendsfeed_uidestroy_callback
	}
	{
		id = ad_friendfeed_ad2_468x60
		zone = z_friendfeed
		ie = 'ad_friendfeed_ad2_468x60'
		type = image
		width = 468
		height = 60
		texdict = `pak/menu_ad_tex/menu_ad_tex.tex`
		texturename = 'tex/ads/ad_friendfeed_ad2_468x60.dds'
		texturechecksum = `tex/ads/ad_friendfeed_ad2_468x60.dds`
		uicreatecallback = dynamic_ad_friendsfeed_uicreate_callback
		uidestroycallback = dynamic_ad_friendsfeed_uidestroy_callback
	}
	{
		id = ad_friendfeed_ad3_468x60
		zone = z_friendfeed
		ie = 'ad_friendfeed_ad3_468x60'
		type = image
		width = 468
		height = 60
		texdict = `pak/menu_ad_tex/menu_ad_tex.tex`
		texturename = 'tex/ads/ad_friendfeed_ad3_468x60.dds'
		texturechecksum = `tex/ads/ad_friendfeed_ad3_468x60.dds`
		uicreatecallback = dynamic_ad_friendsfeed_uicreate_callback
		uidestroycallback = dynamic_ad_friendsfeed_uidestroy_callback
	}
	{
		id = ad_friendfeed_ad4_468x60
		zone = z_friendfeed
		ie = 'ad_friendfeed_ad4_468x60'
		type = image
		width = 468
		height = 60
		texdict = `pak/menu_ad_tex/menu_ad_tex.tex`
		texturename = 'tex/ads/ad_friendfeed_ad4_468x60.dds'
		texturechecksum = `tex/ads/ad_friendfeed_ad4_468x60.dds`
		uicreatecallback = dynamic_ad_friendsfeed_uicreate_callback
		uidestroycallback = dynamic_ad_friendsfeed_uidestroy_callback
	}
]
massive_zones = {
	z_friendfeed = {
		name = 'z_friendfeed'
		texdict = `pak/menu_ad_tex/menu_ad_tex.tex`
	}
}
massive_camera_names_exclude_list = [
	moment01
	moment02
	moment03
	moment04
	moment05
	moment06
	moment07
	moment08
	moment09
	moment10
	guitarist_mocap01
	guitarist_mocap02
	bassist_mocap01
	bassist_mocap02
	singer_mocap01
	singer_mocap02
	drummer_mocap01
	drummer_mocap02
]
g_dynamic_ad_started = 0
g_dynamic_ad_started_mode = 0x00000000
g_dynamic_ad_started_zone = 0x00000000
g_dynamic_ad_ok_for_venue_ad_override = 0
disable_ad_manager = 0
dynamicaddebugoverlay_container_pos = (50.0, 10.0)
dynamicaddebugoverlay_backgroundsize = (1180.0, 660.0)
dynamicaddebugoverlay_text_font = fontgrid_text_a1
dynamicaddebugoverlay_text_color1 = [
	255
	255
	255
	255
]
dynamicaddebugoverlay_text_color2 = [
	255
	255
	255
	255
]
dynamicaddebugoverlay_text_scale1 = (0.5, 0.5)
dynamicaddebugoverlay_text_scale2 = (0.5, 0.5)
dynamicaddebugoverlay_just = [
	left
	top
]

script dynamic_ad_friendsfeed_uicreate_callback \{id = !q1768515945}
	if dynamicadmanagercommand \{func = get_2d_subscriber_downloaded_id_array
			out = checksum_id_array}
		changeglobalarray global_name = g_valid_ad_ids new_value = <checksum_id_array>
	else
	endif
	if ($g_dynamic_ad_friends_feed_ui_create_first_time = 1)
		fastgetarraysize array = ($g_valid_ad_ids)
		if newsfeedmanager func = check_ad_threshold current_num_ads = <array_size>
			change \{g_dynamic_ad_friends_feed_ui_create_first_time = 0}
			ff_refresh_feed
		endif
	endif
endscript

script dynamic_ad_friendsfeed_uidestroy_callback \{id = !q1768515945}
	fastgetarraysize array = ($g_valid_ad_ids)
	if (0 < <array_size>)
		if arraycontains array = ($g_valid_ad_ids) contains = <id>
			removearrayelement array = ($g_valid_ad_ids) element = <id>
			changeglobalarray global_name = g_valid_ad_ids new_value = <array>
		endif
	endif
endscript

script dynamic_ad_destroy_2d_subscriber \{id = !q1768515945}
	dynamicadmanagercommand func = destroy2dsubscriber id = <id>
endscript
g_dynamic_ad_debug_ulx = 1180
g_dynamic_ad_debug_uly = 100

script dynamic_ad_2dsubscriber_downloaded \{id = !q1768515945}
	if dynamic_ad_get_2d_subscriber_info id = (<id>)
		if structurecontains structure = (<item>) uicreatecallback
			uicreatecallback = (<item>.uicreatecallback)
			if (<uicreatecallback> != nullcchecksum)
				spawnscriptnow <uicreatecallback> params = {id = <id>}
			endif
		endif
		if (($g_dynamic_ad_debug_2dsubscriber_images) != 0)
			tempwidth = (<item>.width)
			tempheight = (<item>.height)
			tempwidth = (<tempwidth> * ($g_dynamic_ad_debug_2dsubscriber_image_scale))
			tempheight = (<tempheight> * ($g_dynamic_ad_debug_2dsubscriber_image_scale))
			tempid = (<item>.id)
			tempdims = (((<tempwidth>) * (1.0, 0.0)) + ((<tempheight>) * (0.0, 1.0)))
			tempulx = (($g_dynamic_ad_debug_ulx) - (<tempwidth>))
			temppos = (((<tempulx>) * (1.0, 0.0)) + (($g_dynamic_ad_debug_uly) * (0.0, 1.0)))
			ttmp = (($g_dynamic_ad_debug_uly) + (<tempheight>) + 6)
			change g_dynamic_ad_debug_uly = <ttmp>
			if (($g_dynamic_ad_debug_2dsubscriber_bounce_around_the_screen) != 0)
				createscreenelement {
					type = dynamicadspriteelement
					parent = root_window
					id = <tempid>
					texture = (<item>.texturechecksum)
					dims = <tempdims>
					pos = <temppos>
					scale = (1.0, 1.0)
					just = [left , top]
					rgba = [255 255 255 255]
					alpha = 1.0
					z_priority = 10005
					dynamicad2dsubscriberid = (<item>.id)
					destroyelementif2dsubscriberdestroyed
					debugbouncearoundthescreen
				}
			else
				createscreenelement {
					type = dynamicadspriteelement
					parent = root_window
					id = <tempid>
					texture = (<item>.texturechecksum)
					dims = <tempdims>
					pos = <temppos>
					scale = (1.0, 1.0)
					just = [left , top]
					rgba = [255 255 255 255]
					alpha = 1.0
					z_priority = 10005
					dynamicad2dsubscriberid = (<item>.id)
					destroyelementif2dsubscriberdestroyed
				}
			endif
		endif
	endif
endscript

script dynamic_ad_2dsubscriber_destroycallback 
	if dynamic_ad_get_2d_subscriber_info id = (<id>)
		if structurecontains structure = (<item>) uidestroycallback
			uidestroycallback = (<item>.uidestroycallback)
			if (<uidestroycallback> != nullcchecksum)
				spawnscriptnow <uidestroycallback> params = {id = <id>}
			endif
		endif
	endif
endscript

script dynamic_ad_get_2d_subscriber_info 
	if NOT gotparam \{id}
		return \{false}
	endif
	getarraysize \{$g_dynamic_ad_2d_subscribers}
	if (<array_size> > 0)
		index = 0
		begin
		item = ($g_dynamic_ad_2d_subscribers [<index>])
		if ((<item>.id) = <id>)
			return true item = (<item>)
		endif
		index = (<index> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script dynamic_ad_start_friends_feed 
	spawnscriptnow \{dynamic_ad_start
		params = {
			mode = menu
			zone = z_friendfeed
		}}
endscript

script dynamic_ad_pump_watchdogs 
	begin
	dynamicadmanagercommand \{func = pumpallwatchdogs}
	wait \{0.05
		seconds}
	repeat
endscript

script dynamic_ad_friendfeed_watchdog_callback 
	killspawnedscript \{name = dynamic_ad_pump_watchdogs}
	dynamicadmanagercommand \{func = trace
		msg = 'dynamic_ad_friendfeed_watchdog_callback : Called'}
	dynamicadmanagercommand \{func = destroyallwatchdogs}
	pos = (1200.0, 16.0)
	getarraysize <ids>
	if (<array_size> > 0)
		index = 0
		begin
		item_id = (<ids> [<index>])
		if dynamic_ad_get_2d_subscriber_info id = (<item_id>)
			denominator = 1.0
			if ((<item>.width) <= 128.0)
				denominator = 0.5
			endif
			tempwidth = ((<item>.width) / <denominator>)
			tempheight = ((<item>.height) / <denominator>)
			tempid = (<item>.id)
			dims = (((<tempwidth>) * (1.0, 0.0)) + ((<tempheight>) * (0.0, 1.0)))
			temp_x = ((<pos> [0]) - (<tempwidth>))
			temp_y = (<pos> [1])
			pos2 = (((<temp_x>) * (1.0, 0.0)) + ((<temp_y>) * (0.0, 1.0)))
			createscreenelement {
				type = dynamicadspriteelement
				parent = root_window
				id = <tempid>
				texture = (<item>.texturechecksum)
				dims = <dims>
				pos = <pos2>
				scale = (1.0, 1.0)
				just = [left , top]
				rgba = [255 255 255 255]
				alpha = 1.0
				z_priority = 10005
				dynamicad2dsubscriberid = (<item>.id)
				destroyelementif2dsubscriberdestroyed
				debugbouncearoundthescreen
			}
			dims = (((0) * (1.0, 0.0)) + ((<tempheight>) * (0.0, 1.0)))
			pos = (<pos> + <dims>)
			dims = (((0) * (1.0, 0.0)) + ((16) * (0.0, 1.0)))
			pos = (<pos> + <dims>)
		endif
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script dynamic_ad_enter_menu 
	dynamicadmanagercommand \{func = trace
		msg = 'dynamic_ad_enter_menu : Called'}
	dynamicadmanagercommand \{func = destroyall2dsubscribers}
	if NOT gotparam \{zone}
		return
	endif
	idlist = []
	change \{g_dynamic_ad_friends_feed_ui_create_first_time = 1}
	change \{g_dynamic_ad_debug_ulx = 1180}
	change \{g_dynamic_ad_debug_uly = 100}
	getarraysize \{$g_dynamic_ad_2d_subscribers}
	if (<array_size> > 0)
		index = 0
		begin
		item = ($g_dynamic_ad_2d_subscribers [<index>])
		if ((<item>.zone) = <zone>)
			dynamicadmanagercommand func = create2dsubscriber id = (<item>.id) zone = (<item>.zone) ie = (<item>.ie) type = (<item>.type) width = (<item>.width) height = (<item>.height) texdict = (<item>.texdict) texturename = (<item>.texturename) texturechecksum = (<item>.texturechecksum) downloadedcallback = dynamic_ad_2dsubscriber_downloaded destroycallback = dynamic_ad_2dsubscriber_destroycallback replacetexturefailurepassthroughflag = ($g_dynamic_ad_debug_replacetexturefailurepassthroughflag)
			if ($g_dynamic_ad_mark_all_2d_subscribers_as_downloaded != 0)
				dynamicadmanagercommand func = debugmark2dsubscriberdownloaded id = (<item>.id) value = 1
			endif
			addarrayelement array = <idlist> element = (<item>.id)
			<idlist> = <array>
		endif
		index = (<index> + 1)
		repeat <array_size>
	endif
	dynamicadmanagercommand \{func = trace
		msg = 'dynamic_ad_enter_menu : Done'}
endscript

script dynamic_ad_replace_2d_ad_test 
	dynamicadmanagercommand \{func = load2dtexturefromdisc
		filename = 'ad_friendfeed_ad2_468x60.xdds'
		id = ad_friendfeed_ad2_468x60}
endscript

script dynamic_ad_leave_menu 
	change \{g_dynamic_ad_friends_feed_ui_create_first_time = 0}
	dynamicadmanagercommand \{func = trace
		msg = 'dynamic_ad_leave_menu : Called'}
	dynamicadmanagercommand \{func = destroyall2dsubscribers}
	dynamicadmanagercommand \{func = trace
		msg = 'dynamic_ad_leave_menu : Done'}
endscript

script dynamic_ad_get_current_camera_name_checksum 
	current_camera_name_checksum = nullchecksum
	if NOT ($cameracuts_init = true)
	else
		if getarraysize ($cameracuts_lastarray) noassert = 1
			index = ($cameracuts_lastindex)
			if (<index> < 0)
			elseif (<index> >= <array_size>)
			else
				if structurecontains structure = (($cameracuts_lastarray) [<index>]) name
					current_camera_name_checksum = ($cameracuts_lastarray [<index>].name)
				else
					if structurecontains structure = (($cameracuts_lastarray) [<index>]) params
						if structurecontains structure = (($cameracuts_lastarray) [<index>].params) name
							current_camera_name_checksum = ($cameracuts_lastarray [<index>].params.name)
						endif
					endif
				endif
			endif
		endif
	endif
	if (current_camera_name_checksum = nullchecksum)
		return \{false
			current_camera_name_checksum = nullchecksum}
	endif
	return true current_camera_name_checksum = <current_camera_name_checksum>
endscript

script ok_for_venue_ad_on 
	change \{g_dynamic_ad_ok_for_venue_ad_override = 1}
endscript

script ok_for_venue_ad_off 
	change \{g_dynamic_ad_ok_for_venue_ad_override = 0}
endscript

script dynamic_ad_find_out_if_camera_ok_for_venue_ad_flag 
	requireparams \{[
			camera_name_checksum
		]
		all}
	if ($g_dynamic_ad_ok_for_venue_ad_override != 0)
		return \{true}
	endif
	if (<camera_name_checksum> = nullchecksum)
		return \{true}
	endif
	getarraysize \{$massive_camera_names_exclude_list}
	num_camera_names = <array_size>
	if (<num_camera_names> <= 0)
		return \{true}
	endif
	index = 0
	begin
	camera_name_checksum2 = ($massive_camera_names_exclude_list [<index>])
	if (<camera_name_checksum> = <camera_name_checksum2>)
		return \{false}
	endif
	index = (<index> + 1)
	repeat <num_camera_names>
	return \{true}
endscript

script dynamic_ad_update_camera_ok_for_venue_ad_flag 
	dynamic_ad_get_current_camera_name_checksum
	if dynamic_ad_find_out_if_camera_ok_for_venue_ad_flag camera_name_checksum = <current_camera_name_checksum>
		setcurrentviewportcameraokforvenuead \{ok_for_venue_ad = 1}
	else
		setcurrentviewportcameraokforvenuead \{ok_for_venue_ad = 0}
	endif
endscript

script should_we_record_dynamic_ads_for_this_song 
	if (disable_ad_manager != 0)
		return \{false}
	endif
	gamemode_gettype
	if (<type> = freeplay)
		return \{false}
	endif
	if NOT structurecontains \{structure = $levelzones
			$current_level}
		return \{false}
	endif
	getnumplayersingame \{on_screen
		out = num_players}
	if (<num_players> <= 0)
		return \{false}
	endif
	getnumplayersingame \{remote
		out = num_remote_players}
	if (<num_remote_players> > 0)
		return \{false}
	endif
	numhighways = 0
	numvocalists = 0
	getfirstplayer \{on_screen
		out = player}
	begin
	getplayerinfo <player> part
	if ((<part> = drum) || (<part> = guitar) || (<part> = bass))
		numhighways = (<numhighways> + 1)
	elseif (<part> = vocals)
		numvocalists = (<numvocalists> + 1)
	endif
	getnextplayer player = <player> on_screen out = player
	repeat <num_players>
	if (<numhighways> > 1)
		return \{false}
	elseif (<numhighways> = 1)
	else
		if (<numvocalists> > 1)
			return \{false}
		endif
	endif
	return \{true}
endscript

script dynamic_ad_get_current_venue_zone_checksum 
	zonechecksum = (($levelzones.$current_level).zone)
	return zone = <zonechecksum>
endscript

script dynamic_ad_start 
	if NOT gotparam \{mode}
		<mode> = venue
	endif
	if NOT gotparam \{zone}
		dynamic_ad_get_current_venue_zone_checksum
	endif
	if NOT gotparam \{zone}
		return
	endif
	formattext textname = msgtext 'dynamic_ad_start : Called.  mode=%a zone=%b' a = <mode> b = <zone> dontassertforchecksums
	dynamicadmanagercommand func = trace msg = <msgtext>
	if (<mode> = venue)
		if (($g_dynamic_ad_support_venue_ads) = 0)
			return
		endif
	elseif (<mode> = menu)
		if (($g_dynamic_ad_support_menu_ads) = 0)
			return
		endif
	endif
	if (($g_dynamic_ad_started_mode = <mode>) && ($g_dynamic_ad_started_zone = <zone>))
		return
	endif
	dynamicadmanagercommand \{func = breakpoint
		msg = 'ENTER'}
	if (<mode> = venue)
		dynamic_ad_stop
		if should_we_record_dynamic_ads_for_this_song
			dynamicadmanagercommand \{func = issuecue
				cue = connect}
			wait \{2
				frames}
			dynamicadmanagercommand func = enterzone zone = <zone>
			change g_dynamic_ad_started_mode = <mode>
			change g_dynamic_ad_started_zone = <zone>
			change \{g_dynamic_ad_started = 1}
		else
			dynamicadmanagercommand \{func = leavezone}
		endif
	elseif (<mode> = menu)
		dynamic_ad_stop
		dynamicadmanagercommand \{func = issuecue
			cue = connect}
		wait \{2
			frames}
		dynamic_ad_enter_menu zone = <zone>
		dynamicadmanagercommand func = enterzone zone = <zone>
		change g_dynamic_ad_started_mode = <mode>
		change g_dynamic_ad_started_zone = <zone>
		change \{g_dynamic_ad_started = 1}
	else
	endif
endscript

script dynamic_ad_stop 
	if (($g_dynamic_ad_started_mode = venue) || ($g_dynamic_ad_started_mode = menu))
		dynamicadmanagercommand \{func = breakpoint
			msg = 'EXIT'}
		dynamicadmanagercommand \{func = destroyall2dsubscribers}
		dynamicadmanagercommand \{func = issuecue
			cue = disconnect}
		wait \{2
			frames}
		change \{g_dynamic_ad_started = 0}
		change \{g_dynamic_ad_started_mode = 0x00000000}
		change \{g_dynamic_ad_started_zone = 0x00000000}
	endif
endscript

script dynamic_ad_reset 
	if ($g_dynamic_ad_started_mode != 0x00000000)
		tempmode = $g_dynamic_ad_started_mode
		tempzone = $g_dynamic_ad_zone
		dynamic_ad_stop
		dynamic_ad_start mode = (<tempmode>) zone = (<tempzone>)
	endif
endscript

script dynamicaddebugoverlay 
	spawnscript \{dynamicaddebugoverlay_create}
endscript

script flushalldebugimpressioncounters 
	dynamicadmanagercommand \{func = flushalldebugimpressioncounters}
endscript

script dynamicaddebugoverlay_create 
	dynamicaddebugoverlay_destroy
	createscreenelement \{type = containerelement
		parent = root_window
		pos = $dynamicaddebugoverlay_container_pos
		just = $dynamicaddebugoverlay_just
		id = dynamicaddebugoverlay_root_id}
	createscreenelement \{type = spriteelement
		parent = dynamicaddebugoverlay_root_id
		texture = white
		dims = (1180.0, 660.0)
		rgba = [
			0
			0
			0
			0
		]
		pos = (590.0, 30.0)
		z_priority = 10000
		id = dynamicaddebugoverlay_background_id}
	createscreenelement \{type = textelement
		parent = dynamicaddebugoverlay_root_id
		font = $dynamicaddebugoverlay_text_font
		text = qs(0x00000000)
		scale = $dynamicaddebugoverlay_text_scale2
		just = $dynamicaddebugoverlay_just
		pos = (0.0, 10.0)
		dims = (1180.0, 660.0)
		z_priority = 10001
		rgba = $dynamicaddebugoverlay_text_color2
		id = dynamicaddebugoverlay_text1_id
		single_line = false}
	runscriptonscreenelement \{id = dynamicaddebugoverlay_root_id
		dynamicaddebugoverlay_task}
endscript

script dynamicaddebugoverlay_destroy 
	if screenelementexists \{id = dynamicaddebugoverlay_root_id}
		destroyscreenelement \{id = dynamicaddebugoverlay_root_id}
	endif
endscript

script dynamicaddebugoverlay_loop 
	begin
	if screenelementexists \{id = dynamicaddebugoverlay_root_id}
		dynamicaddebugoverlay_root_id :se_setprops \{alpha = 1.0
			time = 0.5}
		dynamic_ad_get_current_camera_name_checksum
		if dynamicadmanagercommand func = getdebugoverlayinfo camera_name_checksum = <current_camera_name_checksum>
		else
			<text> = qs(0x00000000)
		endif
		if NOT gotparam \{text}
			<text> = qs(0x00000000)
		endif
		if screenelementexists \{id = dynamicaddebugoverlay_text1_id}
			dynamicaddebugoverlay_text1_id :se_setprops text = <text>
		endif
	endif
	wait \{0.05
		seconds}
	repeat
endscript

script dynamicaddebugoverlay_task 
	dynamicaddebugoverlay_loop
	dynamicaddebugoverlay_destroy
endscript
