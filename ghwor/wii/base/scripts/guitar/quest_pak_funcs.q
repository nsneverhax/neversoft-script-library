
script load_pak_for_quest_chapter chapter = ($current_chapter) for_song_breakdown = FALSE
	if (<chapter> != None)
		get_quest_chapter_pak chapter = <chapter>
		printf channel = clayton 'load_pak_for_quest_chapter %s' s = <quest_chapter_pak>
		if NOT ispakloaded <quest_chapter_pak> Heap = quota_misc
			LoadPak <quest_chapter_pak> Heap = quota_misc
		endif
	endif
	if (<for_song_breakdown> = FALSE)
		load_pak_for_quest_map_giglist
	endif
endscript

script unload_pak_for_quest_chapter chapter = ($current_chapter) Wait = FALSE
	if (<chapter> != None)
		get_quest_chapter_pak chapter = <chapter>
		printf channel = clayton 'unload_pak_for_quest_chapter %s' s = <quest_chapter_pak>
		if ispakloaded <quest_chapter_pak> Heap = quota_misc
			UnLoadPak <quest_chapter_pak> Heap = quota_misc
			if (<Wait> = true)
				WaitUnloadPak <quest_chapter_pak>
			endif
		endif
	endif
	unload_pak_for_quest_map_giglist Wait = <Wait>
endscript

script get_quest_chapter_pak chapter = ($current_chapter)
	<chapter_name> = ($<chapter>.Name)
	formatText TextName = quest_chapter_pak 'pak/quest_chapter/%s.pak' s = <chapter_name>
	return quest_chapter_pak = <quest_chapter_pak>
endscript

script load_pak_for_quest_map_giglist 
	printf \{channel = clayton
		'load_pak_for_quest_map_giglist'}
	quest_pak_funcs_debug \{text = 'load_pak_for_quest_map_giglist'}
	if NOT ispakloaded \{'pak/quest_chapter/quest_map_giglist.pak'
			Heap = quota_misc}
		LoadPak \{'pak/quest_chapter/quest_map_giglist.pak'
			Heap = quota_misc}
	endif
endscript

script unload_pak_for_quest_map_giglist \{Wait = FALSE}
	printf \{channel = clayton
		'unload_pak_for_quest_map_giglist'}
	quest_pak_funcs_debug \{text = 'unload_pak_for_quest_map_giglist'}
	if ispakloaded \{'pak/quest_chapter/quest_map_giglist.pak'
			Heap = quota_misc}
		UnLoadPak \{'pak/quest_chapter/quest_map_giglist.pak'
			Heap = quota_misc}
		if (<Wait> = true)
			WaitUnloadPak \{'pak/quest_chapter/quest_map_giglist.pak'}
		endif
	endif
endscript

script load_pak_for_quest_map 
	printf \{channel = clayton
		'load_pak_for_quest_map'}
	quest_pak_funcs_debug \{text = 'load_pak_for_quest_map'}
	if NOT ispakloaded \{'pak/quest_chapter/quest_map.pak'
			Heap = quota_misc}
		LoadPak \{'pak/quest_chapter/quest_map.pak'
			Heap = quota_misc}
	endif
endscript

script unload_pak_for_quest_map \{Wait = FALSE}
	printf \{channel = clayton
		'unload_pak_for_quest_map'}
	quest_pak_funcs_debug \{text = 'unload_pak_for_quest_map'}
	if ispakloaded \{'pak/quest_chapter/quest_map.pak'
			Heap = quota_misc}
		UnLoadPak \{'pak/quest_chapter/quest_map.pak'
			Heap = quota_misc}
		if (<Wait> = true)
			WaitUnloadPak \{'pak/quest_chapter/quest_map.pak'}
		endif
	endif
endscript
g_quest_pak_funcs_debug = 0

script quest_pak_funcs_debug \{text = 'quest_pak_funcs_debug'}
	if ($g_quest_pak_funcs_debug = 1)
		stars
		if ispakloaded \{'pak/quest_chapter/quest_map_giglist.pak'
				Heap = quota_misc}
			printf \{channel = clayton
				'IS LOADED: quest_map_giglist.pak'}
		else
			printf \{channel = clayton
				'IS UNLOADED: quest_map_giglist.pak'}
		endif
		if ($current_chapter != None)
			get_quest_chapter_pak chapter = ($current_chapter)
			if ispakloaded <quest_chapter_pak> Heap = quota_misc
				printf channel = clayton 'IS LOADED: %s' s = <quest_chapter_pak>
			else
				printf channel = clayton 'IS UNLOADED: %s' s = <quest_chapter_pak>
			endif
		endif
		ScriptAssert <text>
		stars
	endif
endscript
