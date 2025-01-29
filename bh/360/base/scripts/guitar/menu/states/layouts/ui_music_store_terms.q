g_music_store_terms_window_width = 920
g_music_store_terms_window_height = 376

script ui_create_music_store_terms 
	SoundEvent \{event = GHTunes_UI_Select}
	get_musicstore_legal_text
	if songlist :Desc_ResolveAlias \{name = alias_music_store_terms}
		AssignAlias id = <resolved_id> alias = music_store_terms
	else
		ScriptAssert \{qs(0xd57c1736)}
	endif
	songlist :SE_SetProps \{songlist_title_text_text = qs(0xecebefc1)}
	music_store_terms :SE_SetProps \{Pos = (0.0, 0.0)}
	songlist_slider_nub_cont :SE_SetProps \{Pos = (-14.0, 60.0)}
	music_store_terms :SetTags slider_pos = <slider_pos>
	songlist :SE_SetProps \{music_store_terms_window_alpha = 1.0}
	music_store_terms :SE_SetProps {
		text = <legal_text>
	}
	Songlist_detail :SE_SetProps \{alpha = 0.0}
	songlist_hilight_bar_cont :SE_SetProps \{alpha = 0.0}
	music_store_terms :SE_SetProps {
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
	GetScreenElementDims \{id = music_store_terms}
	<height_diff> = (<height> - ($g_music_store_terms_window_height))
	if (<height_diff> > 0)
		songlist :SE_SetProps \{music_store_slider_cont_alpha = 1.0}
		<slider_nub_res> = (346.0 / <height_diff>)
		music_store_terms :SE_SetProps {
			event_handlers = [
				{pad_up music_store_terms_scroll params = {Dir = up height = <height> slider_nub_res = <slider_nub_res>}}
				{pad_down music_store_terms_scroll params = {Dir = down height = <height> slider_nub_res = <slider_nub_res>}}
			]
			replace_handlers
		}
	endif
	SetMenuAutoRepeatTimes \{(0.3, 0.001)}
	LaunchEvent \{type = focus
		target = music_store_terms}
	music_store_terms_create_default_user_control_helpers exclusive_device = <exclusive_device>
endscript

script music_store_terms_create_default_user_control_helpers 
	RequireParams \{[
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
	songlist :SE_SetProps \{music_store_terms_window_alpha = 0.0
		music_store_slider_cont_alpha = 1.0}
	Songlist_detail :SE_SetProps \{alpha = 1.0}
	music_store_terms :SE_SetProps {
		dims = ((($g_music_store_terms_window_width) * (1.0, 0.0)) + (($g_music_store_terms_window_height) * (0.0, 1.0)))
	}
	songlist :SE_SetProps {
		songlist_title_text_text = ($g_music_store_title)
	}
	songlist_hilight_bar_cont :SE_SetProps \{alpha = 1.0}
	music_store_terms :GetSingleTag \{slider_pos}
	if GotParam \{slider_pos}
		songlist_slider_nub_cont :SE_SetProps Pos = <slider_pos>
	endif
	SetMenuAutoRepeatTimes \{(0.3, 0.1)}
	LaunchEvent \{type = unfocus
		target = music_store_terms}
endscript

script music_store_terms_decline 
	generic_event_back
endscript

script music_store_terms_accept 
	ui_event event = menu_replace data = {state = UIstate_music_store_purchase is_popup exclusive_device = <exclusive_device> purchase_struct = <purchase_struct>}
endscript

script music_store_terms_scroll \{Dir = down
		speed = 2}
	RequireParams \{[
			height
			slider_nub_res
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = music_store_terms}
		GetScreenElementPosition \{id = music_store_terms}
	else
		return
	endif
	if (<Dir> = down)
		if ((<ScreenElementPos>.(0.0, 1.0)) >= (-1 * (<height> - ($g_music_store_terms_window_height))))
			Music_Store_Scroll_SFX \{down = 2}
			music_store_terms :SE_SetProps Pos = {relative ((0.0, -1.0) * <speed>)}
			songlist_slider_nub_cont :SE_SetProps Pos = {relative ((0.0, 1.0) * <slider_nub_res> * <speed>)}
		endif
	else
		if ((<ScreenElementPos>.(0.0, 1.0)) < 0)
			Music_Store_Scroll_SFX \{up = 1}
			music_store_terms :SE_SetProps Pos = {relative ((0.0, 1.0) * <speed>)}
			songlist_slider_nub_cont :SE_SetProps Pos = {relative ((0.0, -1.0) * <slider_nub_res> * <speed>)}
		endif
	endif
endscript
