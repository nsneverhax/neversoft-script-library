g_music_store_terms_window_width = 920
g_music_store_terms_window_height = 376

script ui_create_music_store_terms 
	get_musicstore_legal_text
	if songlist :desc_resolvealias \{name = alias_music_store_terms}
		assignalias id = <resolved_id> alias = music_store_terms
	else
		scriptassert \{qs(0xd57c1736)}
	endif
	songlist :se_setprops \{songlist_title_text_text = qs(0xecebefc1)}
	music_store_terms :se_setprops \{pos = (0.0, 0.0)}
	songlist_slider_nub_cont :se_setprops \{pos = (-14.0, 60.0)}
	music_store_terms :settags slider_pos = <slider_pos>
	songlist :se_setprops \{music_store_terms_window_alpha = 1.0}
	music_store_terms :se_setprops {
		text = <legal_text>
	}
	songlist_detail :se_setprops \{alpha = 0.0}
	songlist_hilight_bar_cont :se_setprops \{alpha = 0.0}
	music_store_terms :se_setprops {
		event_handlers = [
			{pad_back music_store_back_sfx}
			{pad_back music_store_terms_decline}
			{pad_choose music_store_select_sfx}
			{pad_choose music_store_terms_accept params = {exclusive_device = <exclusive_device> purchase_struct = <purchase_struct>}}
			{pad_up nullscript}
			{pad_down nullscript}
		]
		replace_handlers
		exclusive_device = <exclusive_device>
	}
	getscreenelementdims \{id = music_store_terms}
	<height_diff> = (<height> - ($g_music_store_terms_window_height))
	if (<height_diff> > 0)
		songlist :se_setprops \{music_store_slider_cont_alpha = 1.0}
		<slider_nub_res> = (346.0 / <height_diff>)
		music_store_terms :se_setprops {
			event_handlers = [
				{pad_up music_store_terms_scroll params = {dir = up height = <height> slider_nub_res = <slider_nub_res>}}
				{pad_down music_store_terms_scroll params = {dir = down height = <height> slider_nub_res = <slider_nub_res>}}
			]
			replace_handlers
		}
	endif
	setmenuautorepeattimes \{(0.3, 0.001)}
	launchevent \{type = focus
		target = music_store_terms}
	music_store_terms_create_default_user_control_helpers exclusive_device = <exclusive_device>
endscript

script music_store_terms_create_default_user_control_helpers 
	requireparams \{[
			exclusive_device
		]
		all}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <exclusive_device>
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0x0bbc9ad9)
		button = red
		z = 100000}
endscript

script ui_destroy_music_store_terms 
	songlist :se_setprops \{music_store_terms_window_alpha = 0.0
		music_store_slider_cont_alpha = 1.0}
	songlist_detail :se_setprops \{alpha = 1.0}
	music_store_terms :se_setprops {
		dims = ((($g_music_store_terms_window_width) * (1.0, 0.0)) + (($g_music_store_terms_window_height) * (0.0, 1.0)))
	}
	songlist :se_setprops {
		songlist_title_text_text = ($g_music_store_title)
	}
	songlist_hilight_bar_cont :se_setprops \{alpha = 1.0}
	music_store_terms :getsingletag \{slider_pos}
	if gotparam \{slider_pos}
		songlist_slider_nub_cont :se_setprops pos = <slider_pos>
	endif
	setmenuautorepeattimes \{(0.3, 0.1)}
	launchevent \{type = unfocus
		target = music_store_terms}
endscript

script music_store_terms_decline 
	generic_event_back
endscript

script music_store_terms_accept 
	ui_event event = menu_replace data = {state = uistate_music_store_purchase is_popup exclusive_device = <exclusive_device> purchase_struct = <purchase_struct>}
endscript

script music_store_terms_scroll \{dir = down
		speed = 2}
	requireparams \{[
			height
			slider_nub_res
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if screenelementexists \{id = music_store_terms}
		getscreenelementposition \{id = music_store_terms}
	else
		return
	endif
	if (<dir> = down)
		if ((<screenelementpos>.(0.0, 1.0)) >= (-1 * (<height> - ($g_music_store_terms_window_height))))
			music_store_scroll_sfx \{down = 2}
			music_store_terms :se_setprops pos = {relative ((0.0, -1.0) * <speed>)}
			songlist_slider_nub_cont :se_setprops pos = {relative ((0.0, 1.0) * <slider_nub_res> * <speed>)}
		endif
	else
		if ((<screenelementpos>.(0.0, 1.0)) < 0)
			music_store_scroll_sfx \{up = 1}
			music_store_terms :se_setprops pos = {relative ((0.0, 1.0) * <speed>)}
			songlist_slider_nub_cont :se_setprops pos = {relative ((0.0, -1.0) * <slider_nub_res> * <speed>)}
		endif
	endif
endscript
