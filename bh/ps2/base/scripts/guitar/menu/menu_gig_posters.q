current_gig_number = 1
current_progression_flag = None
menu_gp_current_selection = 1
menu_gp_stage = 1
menu_gp_last_gignum = 1
should_reset_gig_posters_selection = 0
0x942e23ff = 0

script gig_posters_song_focus \{song = None}
	setsoundbussparams {Music_Setlist = {vol = ($default_BussSet.Music_Setlist.vol)}}
	KillSpawnedScript \{Name = gigposters_cycle_song_previews_spawned}
	0xc337ea4c
	Wait \{2
		gameframes}
	0x2e9b1633 song = <song>
endscript

script get_songs_available_for_create_a_setlist progression_flag = ($current_progression_flag)
	return \{num_songs_available = 0
		unlocked_songs_array = [
		]}
endscript

script wait_for_camera_anim 
	Wait \{5
		gameframes}
	begin
	if is_menu_camera_finished
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript
gig_posters_choose_next = 0x24d8810d
net_gig_posters_choose_next = 0x24d8810d
create_gig_posters_menu = 0x24d8810d
gig_posters_setup_helpers = 0x24d8810d
gig_posters_back = 0x24d8810d
monitor_gig_poster_selection = 0x24d8810d
gigposters_camera_out = 0x24d8810d
update_gigboard_arrows = 0x24d8810d
destroy_gig_posters_menu = 0x24d8810d
gig_posters_focus_popup = 0x24d8810d
gig_posters_unfocus_popup = 0x24d8810d
gig_posters_move_selection = 0x24d8810d
gig_posters_up = 0x24d8810d
gig_posters_down = 0x24d8810d
create_gig_poster_venue_select = 0x24d8810d
gigposter_venue_focus = 0x24d8810d
gigposter_venue_unfocus = 0x24d8810d
create_gig_poster_setlist = 0x24d8810d
gigposters_setlist_item_focus = 0x24d8810d
gigposters_setlist_item_unfocus = 0x24d8810d
gig_posters_setlist_back = 0x24d8810d
debug_output_gigposter_creation_numbers = 0x24d8810d
reset_gigposter_creation_numbers = 0x24d8810d
setup_gigboard_poster = 0x24d8810d
create_gigboard_poster_with_viewport = 0x24d8810d
create_gig_posters_window = 0x24d8810d
destroy_gig_posters_window = 0x24d8810d
debug_complete_gig_cheat = 0x24d8810d
isgigunlocked = 0x24d8810d
gigposters_toggle_with_fire = 0x24d8810d
show_setlist_on_gigboard = 0x24d8810d
get_gigboard_section = 0x24d8810d
destroy_gigboard_setlist_viewport = 0x24d8810d
gigposters_cycle_song_previews = 0x24d8810d
gigposters_cycle_song_previews_spawned = 0x24d8810d
toggle_gigposter_difficulty_texture = 0x24d8810d
debug_yuk = 0x24d8810d
debug_gig_start = 0x24d8810d
kill_all_posters = 0x24d8810d
search_for_tool_in_gig = 0x24d8810d
get_gigposter_pos_in_2d = 0x24d8810d
gig_do_hand_animation = 0x24d8810d
wait_and_do_gigboard_hand_animation = 0x24d8810d
get_gigposter_camera_name = 0x24d8810d
get_gigposter_camera_name_section = 0x24d8810d
replace_texture_on_gig_posters = 0x24d8810d
create_small_gig_poster = 0x24d8810d
gigboard_get_exclusive_controller = 0x24d8810d
ui_create_handslapper = 0x24d8810d
anim_handslapper = 0x24d8810d
