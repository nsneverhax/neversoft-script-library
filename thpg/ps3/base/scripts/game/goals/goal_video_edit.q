
script goal_video_edit_ui 
	create_dialog_box {
		title = "editor's challenge"
		text = "post your clip on the leaderboard?"
		buttons = [
			{
				text = "yes"
				pad_choose_script = goal_video_edit_leaderboard_yes
			}
			{
				text = "no"
				pad_choose_script = goal_video_edit_leaderboard_no
			}
		]
	}
	block type = event_dialog_ok
endscript

script goal_video_edit_leaderboard_yes 
	gman_setdata \{params = {
			upload_video = 1
		}}
	goal_video_edit_leaderboard_exit
endscript

script goal_video_edit_count_unique_pros 
	getarraysize <clips>
	edit_names = []
	name_add = [""]
	if (<array_size> > 0)
		i = 0
		begin
		if VideoEditorFunc get_clip name = ((<clips> [<i>]).name)
			if gotparam clip
				if structurecontains structure = <clip> team_film_name
					if NOT arraycontains array = <edit_names> contains = (<clip>.team_film_name)
						setarrayelement arrayname = name_add index = 0 newvalue = (<clip>.team_film_name)
						edit_names = (<edit_names> + <name_add>)
					endif
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	printstruct <...>
	getarraysize <edit_names>
	if (<array_size> > 9)
		array_size = 9
	endif
	return unique_pros = <array_size>
endscript

script goal_video_start_editing_new_edit clips = []
	printf 'goal_video_start_editing_new_edit'
	if game_progress_check_valid_save
		VideoEditorFunc get_edit_count
		VideoEditorFunc get_new_edit_id
		manglechecksums a = <new_edit_id> b = 0
		VideoEditorFunc add_edit edit = {
			name = <mangled_id>
			text = "Team Filming Challenge"
			clips = <clips>
			effects = []
			overlays = []
			audio = {music = nirvana_breed music_start = 30.0}
		}
		change ve_current_edit_index = <count>
		change video_editor_dirty_flag = 1
		pause_game_and_create_pause_menu
		generic_ui_destroy
		killallmovies blocking
		if ($video_editor_in_video_editor = 0)
			ve_enter_video_editor
		endif
		ui_change_state state = UIstate_video_editor_Edit_View
	else
		restore_start_key_binding
		setglobalflag flag = $VIDEO_EDIT_CRIB_DONE
		careerfunc func = updateatoms
	endif
endscript

script goal_video_start_editing_new_edit_from_goal_clips goal_id = m_team_film
	if game_progress_has_valid_save
		iAdded = 0
		clips = []
		VideoEditorFunc get_clip_count
		if (<count> > 0)
			i = 0
			begin
			VideoEditorFunc get_clip index = <i>
			if goal_film_clip_from_goal clip = (<clip>.name) goal_id = <goal_id>
				ve_add_clip_to_edit clips = <clips> add_clip = (<clip>.name)
				iAdded = (<iAdded> + 1)
				if (<iAdded> >= 10)
					break
				endif
				ve_get_clips_entire_length clips = <clips>
				if (<entire_length> > ($video_max_length))
					break
				endif
			endif
			i = (<i> + 1)
			repeat <count>
		endif
		if (<iAdded> > 0)
			spawnscriptnow goal_video_spin_and_wait_stuff params = {clips = <clips>}
			return
		endif
	endif
	setglobalflag flag = $VIDEO_EDIT_CRIB_DONE
	careerfunc func = updateatoms
endscript

script goal_video_spin_and_wait_stuff 
	kill_start_key_binding
	wait \{1
		second
		ignoreslomo}
	wait_for_script_to_finish \{name = do_autosave}
	kill_start_key_binding
	wait \{0.25
		seconds
		ignoreslomo}
	WaitUntilScreenClear {callback = goal_video_start_editing_new_edit clips = <clips>}
endscript

script goal_video_edit_leaderboard_no 
	gman_setdata \{params = {
			upload_video = 0
		}}
	goal_video_edit_leaderboard_exit
endscript

script goal_video_edit_leaderboard_exit 
	dialog_box_exit
	broadcastevent \{type = event_dialog_ok}
endscript
