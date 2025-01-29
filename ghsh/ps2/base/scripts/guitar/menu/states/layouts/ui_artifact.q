
script ui_create_artifact 
	menu_music_on
	get_progression_globals ($current_progression_flag)
	array = []
	GetArraySize \{$levelcareerarray}
	index = 0
	begin
	get_levelcareerarray_checksum index = <index>
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		formatText {
			checksumName = venue_checksum
			'%s_%i'
			s = ($LevelZones.<level_checksum>.Name)
			i = ($instrument_list.($<tier_global>.part).text_nl)
			AddToStringLookup = true
		}
		GetGlobalTags <venue_checksum> param = unlocked
		add_venue = 0
		if (<unlocked> = 1)
			add_venue = 1
		endif
		if (<add_venue> = 1)
			AddArrayElement array = <array> element = <level_checksum>
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	GetArraySize <array>
	CreateScreenElement {
		Type = descinterface
		desc = 'BX_Career_Details'
		id = current_menu_anchor
		parent = root_window
		tags = {
			index = <tier_index>
			level_array = <array>
			level_array_size = <array_Size>
		}
	}
	AssignAlias \{id = current_menu_anchor
		alias = current_menu}
	current_menu :GetTags
	current_menu :se_setprops {
		venue_name_text = ($LevelZones.(<level_array> [<index>]).title)
		event_handlers = [
			{pad_back generic_event_back}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_up ui_artifact_scroll params = {up}}
			{pad_down ui_artifact_scroll params = {down}}
			{pad_left generic_menu_up_or_down_sound params = {up}}
			{pad_right generic_menu_up_or_down_sound params = {down}}
			{pad_left ui_artifact_scroll params = {up}}
			{pad_right ui_artifact_scroll params = {down}}
		]
	}
	bx_calc_career_percent
	current_menu :desc_resolvealias \{Name = alias_artifact}
	GetScreenElementChildren id = <resolved_id>
	artifact_index = 0
	if (<artifact_percent> < 10)
		artifact_index = 0
	elseif (<artifact_percent> < 20)
		artifact_index = 1
	elseif (<artifact_percent> < 30)
		artifact_index = 2
	elseif (<artifact_percent> < 40)
		artifact_index = 3
	elseif (<artifact_percent> < 50)
		artifact_index = 4
	elseif (<artifact_percent> < 60)
		artifact_index = 5
	elseif (<artifact_percent> < 70)
		artifact_index = 6
	elseif (<artifact_percent> < 80)
		artifact_index = 7
	elseif (<artifact_percent> < 90)
		artifact_index = 8
	elseif (<artifact_percent> < 100)
		artifact_index = 9
	else
		artifact_index = 10
	endif
	i = 0
	begin
	if (<i> = <artifact_index>)
		(<children> [<i>]) :se_setprops alpha = 1
	else
		(<children> [<i>]) :se_setprops alpha = 0
	endif
	i = (<i> + 1)
	repeat 11
	formatText TextName = apt qs(0x8bc42fd7) a = <artifact_percent> b = qs(0x0c40a1b2)
	current_menu :se_setprops artefact_percent_text = <apt>
	current_menu :Obj_SpawnScriptNow \{bx_set_tier_songs}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script bx_calc_career_percent 
	get_progression_globals ($current_progression_flag)

	progression_get_total_stars
	<max_songs> = 0
	i = 1
	begin
	formatText checksumName = Tier 'tier%n' n = <i>
	if StructureContains structure = ($<tier_global>.<Tier>) songs
		GetArraySize ($<tier_global>.<Tier>.songs)
		<max_songs> = (<max_songs> + <array_Size>)
	endif
	<i> = (<i> + 1)
	repeat (($<tier_global>).num_tiers)
	artifact_percent = (((<total_stars> * 1.0) / (<max_songs> * 5.0)) * 100)
	CastToInteger \{artifact_percent}
	return artifact_percent = <artifact_percent>
endscript

script bx_set_tier_songs 
	GetTags
	get_progression_globals ($current_progression_flag)
	part = ($<tier_global>.part)
	song_array = []
	song_array_size = 0
	bx_tier_song_played = 0
	formatText checksumName = Tier 'tier%n' n = (<index> + 1)
	if StructureContains structure = ($<tier_global>) <Tier>
		if StructureContains structure = ($<tier_global>.<Tier>) songs
			song_array = ($<tier_global>.<Tier>.songs)
			GetArraySize <song_array>
			song_array_size = <array_Size>
			current_menu :desc_resolvealias \{Name = alias_encore}
			AssignAlias id = <resolved_id> alias = encore_item
			current_menu :desc_resolvealias \{Name = alias_setlist}
			AssignAlias id = <resolved_id> alias = setlist_menu
			GetScreenElementChildren \{id = setlist_menu}
			setlist_menu_children = <children>
			current_menu :se_setprops \{setlist_item_alpha = 0
				encore_alpha = 0}
			j = 0
			begin
			song = (<song_array> [<j>])
			get_song_title song = <song>
			bx_get_song_highscore song = <song> part = <part> savegame = <savegame>
			StringLength string = <song_title>
			if (<str_len> >= 25)
				stringncopy string = <song_title> length = 24
				song_title = (<new_string> + qs(0xb723938a))
			endif
			if (<j> < 6)
				AssignAlias id = (<setlist_menu_children> [<j>]) alias = setlist_item
				setlist_item :se_setprops \{alpha = 1}
				setlist_item :se_setprops {
					no_score_alpha = 0
					song_score_alpha = 1
					song_pourcentage_alpha = 1
					highest_difficulty_alpha = 1
					setlist_b_stars_alpha = 1
					song_title_text = <song_title>
				}
				if ((<song_highscore>.high_score) = 0)
					setlist_item :se_setprops \{no_score_alpha = 0.6
						song_score_alpha = 0
						song_pourcentage_alpha = 0
						highest_difficulty_alpha = 0
						setlist_b_stars_alpha = 0}
				endif
				formatText TextName = listerine qs(0x0bc409e2) a = (<song_highscore>.high_score)
				formatText TextName = percent qs(0x8bc42fd7) a = (<song_highscore>.song_percent) b = qs(0x0c40a1b2)
				setlist_item :se_setprops {
					song_score_text = <listerine>
					song_pourcentage_text = <percent>
					highest_difficulty_texture = (<song_highscore>.highest_difficulty_texture)
				}
				setlist_item :desc_resolvealias \{Name = star_container}
				num_stars = (<song_highscore>.stars)
				<resolved_id> :se_setprops star_texture = song_complete_star star_rgba = [0 0 0 255]
				if (<num_stars> = 0)
					<resolved_id> :se_setprops alpha = 0
				else
					bx_tier_song_played = (<bx_tier_song_played> + 1)
					if ((<song_highscore>.percent100) = 1)
						<resolved_id> :se_setprops star_texture = song_complete_star_perfect star_rgba = [255 255 255 255]
					endif
					<resolved_id> :desc_resolvealias Name = alias_stars
					GetScreenElementChildren id = <resolved_id>
					GetArraySize <children>
					k = 0
					begin
					if (<k> < <num_stars>)
						(<children> [<k>]) :se_setprops alpha = 1
					else
						(<children> [<k>]) :se_setprops alpha = 0
					endif
					k = (<k> + 1)
					repeat <array_Size>
				endif
			else
				encore_item :se_setprops {
					no_score_alpha = 0
					song_score_alpha = 1
					song_pourcentage_alpha = 1
					highest_difficulty_alpha = 1
					setlist_b_stars_alpha = 1
					song_title_text = <song_title>
				}

				if (<bx_tier_song_played> = 6)
					current_menu :se_setprops \{encore_alpha = 1}
				endif
				if ((<song_highscore>.high_score) = 0)
					encore_item :se_setprops \{no_score_alpha = 0.6
						song_score_alpha = 0
						song_pourcentage_alpha = 0
						highest_difficulty_alpha = 0
						setlist_b_stars_alpha = 0}
				endif
				formatText TextName = listerine qs(0x0bc409e2) a = (<song_highscore>.high_score)
				formatText TextName = percent qs(0x8bc42fd7) a = (<song_highscore>.song_percent) b = qs(0x0c40a1b2)
				encore_item :se_setprops {
					song_score_text = <listerine>
					song_pourcentage_text = <percent>
					highest_difficulty_texture = (<song_highscore>.highest_difficulty_texture)
				}
				encore_item :desc_resolvealias \{Name = star_container}
				num_stars = (<song_highscore>.stars)
				<resolved_id> :se_setprops star_texture = song_complete_star star_rgba = [0 0 0 255]
				if (<num_stars> = 0)
					<resolved_id> :se_setprops alpha = 0
				else
					if ((<song_highscore>.percent100) = 1)
						<resolved_id> :se_setprops star_texture = song_complete_star_perfect star_rgba = [255 255 255 255]
					endif
					<resolved_id> :desc_resolvealias Name = alias_stars
					GetScreenElementChildren id = <resolved_id>
					GetArraySize <children>
					k = 0
					begin
					if (<k> < <num_stars>)
						(<children> [<k>]) :se_setprops alpha = 1
					else
						(<children> [<k>]) :se_setprops alpha = 0
					endif
					k = (<k> + 1)
					repeat <array_Size>
				endif
			endif
			j = (<j> + 1)
			repeat <song_array_size>
		endif
	endif
endscript

script bx_get_song_highscore 
	get_song_prefix song = <song>
	stars = 0
	high_score = 0
	percent100 = 0
	song_percent = 0
	new_song_info = 0
	highest_difficulty_texture = 'setlist_B_db_icon_sm'
	diff_array = ['easy_rhythm' 'easy' 'medium' 'hard' 'expert']
	GetArraySize <diff_array>
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song>
	GetGlobalTags <song_checksum> param = double_bass_complete
	index = 0
	difficulty = 'expert'
	begin
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = (<diff_array> [<index>])
	GetGlobalTags <song_checksum> param = score savegame = <savegame>
	if NOT (<score> = 0)
		GetGlobalTags <song_checksum> param = stars savegame = <savegame>
		GetGlobalTags <song_checksum> param = percent100 savegame = <savegame>
		GetGlobalTags <song_checksum> param = song_percent savegame = <savegame>
		GetGlobalTags <song_checksum> param = new_song_info
		if ((<diff_array> [<index>]) = 'easy_rhythm')
			formatText \{checksumName = icon_difficulty
				'icon_difficulty_%s'
				s = 'beginner'}
		elseif (((<diff_array> [<index>]) = 'expert') && <double_bass_complete>)
			formatText \{checksumName = icon_difficulty
				'%s'
				s = 'setlist_B_db_icon_sm'}
		else
			formatText checksumName = icon_difficulty 'icon_difficulty_%s' s = (<diff_array> [<index>])
		endif
		high_score = <score>
		stars = <stars>
		percent100 = <percent100>
		song_percent = <song_percent>
		new_song_info = <new_song_info>
		<highest_difficulty_texture> = <icon_difficulty>
	endif
	index = (<index> + 1)
	repeat <array_Size>
	song_highscore = {
		high_score = <high_score>
		stars = <stars>
		percent100 = <percent100>
		song_percent = <song_percent>
		new_song_info = <new_song_info>
		highest_difficulty_texture = <highest_difficulty_texture>
	}
	return song_highscore = <song_highscore>
endscript

script ui_destroy_artifact 
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	KillSpawnedScript \{Name = bx_set_tier_songs}
	KillSpawnedScript \{Name = bx_get_song_highscore}
	clean_up_user_control_helpers
endscript

script ui_artifact_scroll 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	if GotParam \{down}
		index = (<index> + 1)
		if (<index> >= <level_array_size>)
			index = 0
		endif
	else
		index = (<index> - 1)
		if (<index> < 0)
			index = (<level_array_size> - 1)
		endif
	endif
	current_menu :SetTags index = <index>
	current_menu :Obj_SpawnScriptNow \{bx_set_tier_songs}
	se_setprops {
		venue_name_text = ($LevelZones.(<level_array> [<index>]).title)
	}
	if GotParam \{down}
		se_setprops \{career_more_infos_arrow_1_scale = 1.25
			time = 0.1}
	else
		se_setprops \{career_more_infos_arrow_2_scale = 1.25
			time = 0.1}
	endif
	se_waitprops
	se_setprops \{career_more_infos_arrow_1_scale = 1.0
		arrow_up_scale = 1.0
		time = 0.1}
	se_setprops \{career_more_infos_arrow_2_scale = 1.0
		arrow_up_scale = 1.0
		time = 0.1}
endscript
