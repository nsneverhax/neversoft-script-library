
script freestyle_create_characters 
	Player = 0
	0xcb0276c2 \{load = true
		Heap = quota_samples}
	begin
	instrument = ($freestyle_player_data [<Player>].instrument)
	character = ($freestyle_player_data [<Player>].character)
	gh_player = ($freestyle_player_data [<Player>].gh_player)
	ExtendCrc <character> '_info' out = musician_info
	switch (<instrument>)
		case guitar
		newbody = {}
		if miiisfemale index = ($freestyle_player_data [<Player>].mii_index) database = ($freestyle_player_data [<Player>].mii_database)
			newbody = {desc_id = mii_guitarist_female}
			printf \{'Guitarist is female'}
		else
			newbody = {desc_id = mii_guitarist_male}
			printf \{'Guitarist is male'}
		endif
		profile_struct = ($preset_mii_guitarist_profile)
		appearance = (<profile_struct>.appearance)
		updatestructelement struct = <appearance> element = cas_male_base_torso value = <newbody>
		appearance = <newstruct>
		profile_struct = {<profile_struct> appearance = <appearance>}
		Change structurename = <musician_info> anim_set = mii_anims_set
		Change structurename = <musician_info> stance = Stance_C
		Change structurename = <musician_info> next_stance = Stance_C
		Change structurename = <musician_info> current_anim = Idle
		Change structurename = <musician_info> cycle_anim = FALSE
		Change structurename = <musician_info> next_anim = None
		Change structurename = <musician_info> playing_missed_note = FALSE
		Change structurename = <musician_info> position = GUITARIST
		create_band_member {
			id = mii
			profile_struct = <profile_struct>
			savegame = 0
			Name = <character>
			loading_into_song = ($freestyle_song)
			Player = <gh_player>
			create_mii
			freestyle_player = <Player>
			instrument = guitar
		}
		<character> :mii_matchhandtexturecolortoface oldtexturename = `tex\models\characters\guitarists\mii\mii_hands.png` texsize = (16.0, 16.0)
		freestyle_try_fret_anims event_triggered = 0 Player = <Player>
		bandmanager_addguitarist Name = <character> Player = <gh_player>
		case bass
		newbody = {}
		if miiisfemale index = ($freestyle_player_data [<Player>].mii_index) database = ($freestyle_player_data [<Player>].mii_database)
			newbody = {desc_id = mii_bassist_female}
			printf \{'Bassist is female'}
		else
			newbody = {desc_id = mii_bassist_male}
			printf \{'Bassist is male'}
		endif
		profile_struct = ($preset_mii_guitarist_profile)
		appearance = (<profile_struct>.appearance)
		updatestructelement struct = <appearance> element = cas_male_base_torso value = <newbody>
		appearance = <newstruct>
		profile_struct = {<profile_struct> appearance = <appearance>}
		Change structurename = <musician_info> anim_set = mii_anims_set
		Change structurename = <musician_info> stance = Stance_C
		Change structurename = <musician_info> next_stance = Stance_C
		Change structurename = <musician_info> current_anim = Idle
		Change structurename = <musician_info> cycle_anim = FALSE
		Change structurename = <musician_info> next_anim = None
		Change structurename = <musician_info> playing_missed_note = FALSE
		Change structurename = <musician_info> position = BASSIST
		create_band_member {
			id = mii
			profile_struct = <profile_struct>
			savegame = 0
			Name = <character>
			loading_into_song = ($freestyle_song)
			Player = <gh_player>
			create_mii
			freestyle_player = <Player>
			instrument = bass
		}
		<character> :mii_matchhandtexturecolortoface oldtexturename = `tex\models\characters\guitarists\mii\mii_hands.png` texsize = (16.0, 16.0)
		freestyle_try_fret_anims event_triggered = 0 Player = <Player>
		bandmanager_addbassist Name = <character> Player = <gh_player>
		case drums
		newbody = {}
		if miiisfemale index = ($freestyle_player_data [<Player>].mii_index) database = ($freestyle_player_data [<Player>].mii_database)
			newbody = {desc_id = mii_drummer_female}
			printf \{'Drummer is female'}
		else
			newbody = {desc_id = mii_drummer_male}
			printf \{'Drummer is male'}
		endif
		profile_struct = ($preset_mii_drummer_profile)
		appearance = (<profile_struct>.appearance)
		updatestructelement struct = <appearance> element = cas_male_base_torso value = <newbody>
		appearance = <newstruct>
		profile_struct = {<profile_struct> appearance = <appearance>}
		drummer_stance = ($freestyle_mii_anim_set.drummer_stance)
		Change structurename = <musician_info> anim_set = mii_drummer_anims_set
		Change structurename = <musician_info> stance = <drummer_stance>
		Change structurename = <musician_info> next_stance = <drummer_stance>
		Change structurename = <musician_info> current_anim = Idle
		Change structurename = <musician_info> cycle_anim = FALSE
		Change structurename = <musician_info> next_anim = None
		Change structurename = <musician_info> playing_missed_note = FALSE
		Change structurename = <musician_info> position = drummer
		create_band_member {
			id = mii_drummer
			profile_struct = <profile_struct>
			savegame = 0
			Name = <character>
			loading_into_song = ($freestyle_song)
			Player = <gh_player>
			create_mii
			freestyle_player = <Player>
			instrument = drum
		}
		<character> :mii_matchhandtexturecolortoface oldtexturename = `tex\models\characters\guitarists\mii\mii_hands_drummer.png` texsize = (16.0, 16.0)
		SpawnScriptNow freestyle_drummer_play_idle_right_hand params = {character = <character>}
		SpawnScriptNow freestyle_drummer_play_idle_left_hand params = {character = <character>}
		bandmanager_adddrummer Name = <character> Player = <gh_player>
	endswitch
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	0xcb0276c2 \{load = FALSE
		0xc28bbbd1 = FALSE
		Heap = quota_samples}
	band_builder_assign_aliases
endscript

script freestyle_create_crowd 
	printf \{'Loading freestyle_crowd_anims pak'}
	LoadPak \{'Pak\\anims\\freestyle\\freestyle_crowd_anims.pak'
		Heap = heap_perm_anims}
	create_mii_crowd_models
	populatecrowd
endscript

script freestyle_destroy_crowd 
	destroy_crowd_models
	printf \{'Unloading freestyle_crowd_anims pak'}
	unload_pak_and_wait \{pak = 'Pak\\anims\\freestyle\\freestyle_crowd_anims.pak'}
endscript
