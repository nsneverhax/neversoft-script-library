default_player_appearance = {
	struct = appearance_custom_skater_CAREER_01
	name = "Chris"
	voice = male1
}
sp_str_unassigned = 'Unassigned'
skater_using_temporary_appearance = 0

script init_pro_skaters 
	foreachin \{$master_skater_list
		do = addskaterprofile}
	AddTemporaryProfile \{name = cas_preview_temp_profile}
	AddTemporaryProfile \{name = skater_profile_temp_profile}
	AddTemporaryProfile \{name = video_editor_temp_profile}
endscript

script cas_post_load 
	printf \{'cas_post_load'}
	selectcurrentskater \{name = custom_story}
	change \{cas_skater_invalid = 1}
endscript

script skater_get_index_from_appearance 
	if NOT gotparam appearance
		script_assert "skater_get_index_from_appearance expects appearance param"
	endif
	getarraysize $master_skater_list
	<index> = 0
	begin
	if structurecontains structure = ($master_skater_list [<index>]) default_appearance
		if checksumequals a = ($master_skater_list [<index>].default_appearance) b = <appearance>
			return skater_index = <index>
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	printstruct <appearance>
	script_assert "Couldn't find profile with appearance %n in $master_skater_list" n = <appearance>
endscript

script SkaterSwapInTemporaryAppearance 
	GetCurrentSkaterProfileIndex
	if ($skater_using_temporary_appearance = 0)
		RememberTemporaryAppearance {
			player = <currentskaterprofileindex>
			name = skater_profile_temp_profile
		}
		change \{skater_using_temporary_appearance = 1}
	endif
	if gotparam \{appearance}
		SetPlayerAppearance player = <currentskaterprofileindex> appearance_structure = <appearance>
		if NOT gotparam \{no_refresh}
			RefreshSkaterModel skater = 0 profile = <currentskaterprofileindex>
		endif
	endif
endscript

script SkaterRestoreAfterTemporaryAppearance 
	if ($skater_using_temporary_appearance = 1)
		GetCurrentSkaterProfileIndex
		RestoreTemporaryAppearance {
			player = <currentskaterprofileindex>
			name = skater_profile_temp_profile
		}
		if NOT gotparam \{no_refresh}
			RefreshSkaterModel skater = 0 profile = <currentskaterprofileindex>
		endif
		change \{skater_using_temporary_appearance = 0}
	endif
endscript

script SkaterDiscardTemporaryAppearance 
	if ($skater_using_temporary_appearance = 1)
		change \{skater_using_temporary_appearance = 0}
	endif
endscript
master_skater_list = [
	{
		display_name = "Skater"
		select_icon = sel_you
		file_name = 'Unimplemented'
		default_appearance = appearance_custom_skater_CAREER_01
		name = custom_story
		stance = regular
		age = 16
		hometown = "Philadelphia, PA"
		is_pro = 0
		is_male = 1
		character_type = CAS_CAREER
		is_locked = 0
		air = 3
		spin = 3
		rail_balance = 3
		lip_balance = 3
		manual_balance = 3
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			carreer = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = StartingTricks
		max_specials = 12
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_The900
				}
				{
					trickslot = SpMan_U_D_Triangle
					trickname = Trick_NosegrabManual
				}
				{
					trickslot = SpGrind_L_R_Triangle
					trickname = Trick_Darkslide
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		voice = male1
	}
	{
		display_name = "Guest Skater 1"
		select_icon = sel_you
		file_name = 'Unimplemented'
		default_appearance = appearance_custom_skater_CAREER_01
		name = custom_2p_1
		stance = regular
		age = 16
		hometown = "Philadelphia, PA"
		skater_loaded = 0
		is_pro = 1
		is_male = 1
		character_type = CAS_CAREER
		is_locked = 0
		air = 3
		spin = 3
		rail_balance = 3
		lip_balance = 3
		manual_balance = 3
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			carreer = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = StartingTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_The900
				}
				{
					trickslot = SpAir_U_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpAir_L_R_Square
					trickname = Trick_Flamingo
				}
				{
					trickslot = SpMan_D_U_Triangle
					trickname = Trick_NTMSpecial
				}
				{
					trickslot = SpAir_D_U_Circle
					trickname = Trick_NTTSpecial
				}
				{
					trickslot = SpAir_U_D_Square
					trickname = Trick_QuadKickflip
				}
				{
					trickslot = SpGrind_L_R_Triangle
					trickname = Trick_Darkslide
				}
				{
					trickslot = SpGrind_U_D_Triangle
					trickname = Trick_OneFootSmith
				}
				{
					trickslot = SpMan_U_D_Triangle
					trickname = Trick_DogWalk
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		voice = male1
	}
	{
		display_name = "Guest Skater 2"
		select_icon = sel_you
		file_name = 'Unimplemented'
		default_appearance = appearance_custom_skater_CAREER_01
		name = custom_2p_2
		stance = regular
		age = 16
		hometown = "Philadelphia, PA"
		skater_loaded = 0
		is_pro = 1
		is_male = 1
		character_type = CAS_CAREER
		is_locked = 0
		air = 3
		spin = 3
		rail_balance = 3
		lip_balance = 3
		manual_balance = 3
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			carreer = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = StartingTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_The900
				}
				{
					trickslot = SpAir_U_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpAir_L_R_Square
					trickname = Trick_Flamingo
				}
				{
					trickslot = SpMan_D_U_Triangle
					trickname = Trick_NTMSpecial
				}
				{
					trickslot = SpAir_D_U_Circle
					trickname = Trick_NTTSpecial
				}
				{
					trickslot = SpAir_U_D_Square
					trickname = Trick_QuadKickflip
				}
				{
					trickslot = SpGrind_L_R_Triangle
					trickname = Trick_Darkslide
				}
				{
					trickslot = SpGrind_U_D_Triangle
					trickname = Trick_OneFootSmith
				}
				{
					trickslot = SpMan_U_D_Triangle
					trickname = Trick_DogWalk
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		voice = male1
	}
	{
		display_name = "Tony Hawk"
		select_icon = sel_thawk
		default_appearance = appearance_Hawk
		name = hawk
		stance = goofy
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = HawkTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpGrind_R_D_Triangle
					trickname = Trick_SmithtoSmith
				}
				{
					trickslot = SpLip_D_U_Triangle
					trickname = Trick_Losi
				}
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_The900
				}
				{
					trickslot = SpAir_R_U_Square
					trickname = Trick_BackfootHeel
				}
				{
					trickslot = SpAir_L_R_Square
					trickname = Trick_FingerflipAirwalk
				}
				{
					trickslot = SpAir_L_R_Circle
					trickname = Trick_Flamingo
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_hawk
		]
	}
	{
		display_name = "Bob Burnquist"
		select_icon = sel_bburnquist
		default_appearance = appearance_Burnquist
		name = Burnquist
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 8
		spin = 9
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			bling = 0
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpGrind_R_D_Triangle
					trickname = Trick_BoardslideBodyVarial
				}
				{
					trickslot = SpAir_R_U_Square
					trickname = Trick_BackfootHeel
				}
				{
					trickslot = SpAir_L_R_Circle
					trickname = Trick_Flamingo
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_burnquist
		]
	}
	{
		display_name = "Dustin Dollin"
		select_icon = sel_ddollin
		default_appearance = appearance_Dollin
		name = Dollin
		stance = goofy
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_L_R_Square
					trickname = Trick_QuadKickflip
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpGrind_R_D_Triangle
					trickname = Trick_OneFootSmith
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_dollin
		]
	}
	{
		display_name = "Nyjah Huston"
		select_icon = sel_nhuston
		default_appearance = appearance_Huston
		name = Huston
		stance = goofy
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_L_Square
					trickname = Trick_BackfootHeel
				}
				{
					trickslot = SpAir_L_R_Square
					trickname = Trick_FingerflipAirwalk
				}
				{
					trickslot = SpGrind_R_U_Triangle
					trickname = Trick_CrossfootBoard
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_huston
		]
	}
	{
		display_name = "Bryce kanights"
		select_icon = sel_jking
		default_appearance = appearance_kanights
		name = Kanights
		stance = goofy
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_L_Square
					trickname = Trick_BackfootHeel
				}
				{
					trickslot = SpAir_L_R_Square
					trickname = Trick_FingerflipAirwalk
				}
				{
					trickslot = SpGrind_R_U_Triangle
					trickname = Trick_CrossfootBoard
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_kanights
		]
	}
	{
		display_name = "Jeff King"
		select_icon = sel_jking
		default_appearance = appearance_King
		name = king
		stance = goofy
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_L_Square
					trickname = Trick_BackfootHeel
				}
				{
					trickslot = SpAir_L_R_Square
					trickname = Trick_FingerflipAirwalk
				}
				{
					trickslot = SpGrind_R_U_Triangle
					trickname = Trick_CrossfootBoard
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_king
		]
	}
	{
		display_name = "Bam Margera"
		select_icon = sel_bmargera
		default_appearance = appearance_Margera
		name = Margera
		stance = goofy
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 8
		spin = 8
		rail_balance = 9
		lip_balance = 9
		manual_balance = 8
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_RocketBackflip
				}
				{
					trickslot = SpAir_R_U_Square
					trickname = Trick_BackfootHeel
				}
				{
					trickslot = SpAir_D_L_Circle
					trickname = Trick_RoastBeef
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_margera
		]
		no_edit_groups = [
			head_options
		]
	}
	{
		display_name = "Lance Mountain"
		select_icon = sel_lmountain
		default_appearance = appearance_Mountain
		name = Mountain
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 8
		spin = 8
		rail_balance = 9
		lip_balance = 9
		manual_balance = 8
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_RocketBackflip
				}
				{
					trickslot = SpAir_R_U_Square
					trickname = Trick_BackfootHeel
				}
				{
					trickslot = SpAir_D_L_Circle
					trickname = Trick_RoastBeef
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_mountain
		]
		no_edit_groups = [
			head_options
		]
	}
	{
		display_name = "Rodney Mullen"
		select_icon = sel_rmullen
		default_appearance = appearance_Mullen
		name = mullen
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 7
		spin = 9
		rail_balance = 10
		lip_balance = 7
		manual_balance = 11
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpMan_D_U_Triangle
					trickname = Trick_DogWalk
				}
				{
					trickslot = SpMan_R_U_Triangle
					trickname = Trick_NosegrabManual
				}
				{
					trickslot = SpAir_L_R_Square
					trickname = Trick_FingerflipAirwalk
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_mullen
		]
		no_edit_groups = [
			head_options
		]
	}
	{
		display_name = "Jereme Rogers"
		select_icon = sel_jrogers
		default_appearance = appearance_Rogers
		name = Rogers
		stance = goofy
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 7
		spin = 9
		rail_balance = 10
		lip_balance = 7
		manual_balance = 11
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpMan_D_U_Triangle
					trickname = Trick_DogWalk
				}
				{
					trickslot = SpMan_R_U_Triangle
					trickname = Trick_NosegrabManual
				}
				{
					trickslot = SpAir_L_R_Square
					trickname = Trick_FingerflipAirwalk
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_rogers
		]
		no_edit_groups = [
			head_options
		]
	}
	{
		display_name = "Arto Saari"
		select_icon = sel_asari
		default_appearance = appearance_Saari
		name = Saari
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Square
					trickname = Trick_BodyFlipKickflip
				}
				{
					trickslot = SpGrind_R_D_Triangle
					trickname = Trick_OneFootSmith
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_saari
		]
	}
	{
		display_name = "Ryan Sheckler"
		select_icon = sel_rsheckler
		default_appearance = appearance_Sheckler
		name = Sheckler
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Square
					trickname = Trick_BodyFlipKickflip
				}
				{
					trickslot = SpGrind_R_D_Triangle
					trickname = Trick_OneFootSmith
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_sheckler
		]
	}
	{
		display_name = "Daewon Song"
		select_icon = sel_dsong
		default_appearance = appearance_Song
		name = song
		stance = goofy
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpGrind_R_D_Triangle
					trickname = Trick_Nose3flipFiveO
				}
				{
					trickslot = SpMan_R_U_Triangle
					trickname = Trick_NosegrabManual
				}
				{
					trickslot = SpAir_R_U_Square
					trickname = Trick_BackfootHeel
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_song
		]
	}
	{
		display_name = "Vanessa Torres"
		select_icon = sel_vtorres
		default_appearance = appearance_Torres
		name = Torres
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpGrind_R_D_Triangle
					trickname = Trick_Nose3flipFiveO
				}
				{
					trickslot = SpMan_R_U_Triangle
					trickname = Trick_NosegrabManual
				}
				{
					trickslot = SpAir_R_U_Square
					trickname = Trick_BackfootHeel
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_torres
		]
	}
	{
		display_name = "Mike Vallely"
		select_icon = sel_mvallely
		default_appearance = appearance_Vallely
		name = vallely
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 8
		spin = 8
		rail_balance = 8
		lip_balance = 8
		manual_balance = 8
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpMan_D_U_Triangle
					trickname = Trick_RussianBoneless
				}
				{
					trickslot = SpLip_U_R_Triangle
					trickname = Trick_MillerFlip
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_FSInvert
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
	}
	{
		display_name = "Stevie Williams"
		select_icon = sel_swilliams
		default_appearance = appearance_Williams
		name = Williams
		stance = goofy
		is_pro = 1
		is_locked = 1
		is_male = 1
		character_type = CAS_CAREER
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Square
					trickname = Trick_StevieShove
				}
				{
					trickslot = SpMan_R_U_Triangle
					trickname = Trick_NosegrabManual
				}
				{
					trickslot = SpAir_L_R_Square
					trickname = Trick_FingerflipAirwalk
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_williams
		]
	}
	{
		display_name = "MCA"
		select_icon = sel_secskater
		default_appearance = appearance_MCA
		name = MCA
		stance = goofy
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_MCA
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "El Patinador"
		select_icon = sel_secskater
		default_appearance = appearance_luchador
		name = luchador
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_THE_LUCHADOR
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "Judy Nails"
		select_icon = sel_secskater
		default_appearance = appearance_Judy
		name = judy
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_JUDY_NAILS
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "Rube"
		select_icon = sel_secskater
		default_appearance = appearance_Rube
		name = Rube
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_RUBE
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "Spencer"
		select_icon = sel_secskater
		default_appearance = appearance_Spence
		name = Spence
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_SPENCE
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "Cooper"
		select_icon = sel_secskater
		default_appearance = appearance_Cooper
		name = cooper
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_COOPER
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "Bosco"
		select_icon = sel_secskater
		default_appearance = appearance_bosco
		name = Bosco
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_BOSCO
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "Boneman"
		select_icon = sel_secskater
		default_appearance = appearance_boneman
		name = Boneman
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_BONEMAN
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "Cam"
		select_icon = sel_secskater
		default_appearance = appearance_Cam
		name = cam
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_CAM
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "Eric"
		select_icon = sel_secskater
		default_appearance = appearance_eric
		name = ERIC
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_ERIC
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "Eddie X"
		select_icon = sel_secskater
		default_appearance = appearance_eddiex
		name = eddie_x
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_EDDIE_X
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "Mad Dog"
		select_icon = sel_secskater
		default_appearance = appearance_maddog
		name = mad_dog
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_MAD_DOG
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "Mel"
		select_icon = sel_secskater
		default_appearance = appearance_Mel
		name = Mel
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_MEL
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "Shayne"
		select_icon = sel_secskater
		default_appearance = appearance_Shayne
		name = Shayne
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_SHAYNE
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
	{
		display_name = "TV Producer"
		select_icon = sel_secskater
		default_appearance = appearance_tvproducer
		name = tv_producer
		stance = regular
		is_pro = 1
		is_locked = 1
		is_male = 1
		is_secret = 1
		character_type = CAS_CAREER
		lock_flag = $SKATER_UNLOCKED_TV_PRODUCER
		air = 11
		spin = 11
		rail_balance = 9
		lip_balance = 9
		manual_balance = 7
		special = 3
		wall = 3
		trick_mapping = {
		}
		skill_points = {
			generic = 0
			career = 4
			hardcore = 5
			rigger = 2
		}
		default_trick_mapping = DefaultTricks
		max_specials = 9
		specials = {
			[
				{
					trickslot = SpAir_R_D_Circle
					trickname = Trick_MetalHorns
				}
				{
					trickslot = SpGrind_L_D_Triangle
					trickname = Trick_TailblockSlide
				}
				{
					trickslot = SpLip_L_U_Triangle
					trickname = Trick_Eggplant
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
				{
					trickslot = unassigned
					trickname = unassigned
				}
			]
		}
		lockout_flags = [
			is_barker
		]
	}
]
default_classic_stats = {
	air = 7
	spin = 7
	rail_balance = 7
	lip_balance = 7
	manual_balance = 7
	special = 7
	wall = 7
}
default_classic_stats_collectors = {
	air = 6
	spin = 6
	rail_balance = 6
	lip_balance = 6
	manual_balance = 6
	special = 3
	wall = 3
}
