
script ui_create_customize_character_greatestoutfit 
	make_generic_menu \{vmenu_id = create_customize_character_greatestoutfit_vmenu
		back_state = uistate_customize_character_appearance
		title = qs(0x0a038968)
		num_icons = 1
		show_history
		pad_back_script = restoreoutfit}
	cas_set_object_node_pos Player = ($cas_current_player) node = $cas_node_name
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_greatestoutfit_vmenu
		camera_list = [
			'customize_character_outfit'
			'customize_character_R'
			'customize_character_B'
			'customize_character_L'
		]
		zoom_camera = 'customize_character_Zoom'}
	pushtemporarycasappearance
	get_progression_globals ($current_progression_flag)
	array = []
	GetArraySize \{$levelcareerarray}
	level_zone_array_size = <array_Size>
	index = 0
	begin
	get_levelcareerarray_checksum index = <index>
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		formatText {
			checksumName = venue_checksum
			'venue_%s'
			s = ($LevelZones.<level_checksum>.Name)
			AddToStringLookup = true
		}
		GetGlobalTags <venue_checksum> param = unlocked
		printf 'venue_checksum = %v .. unlocked = %u' v = <venue_checksum> u = <unlocked>
		add_venue = 0
		if (<unlocked> = 1)
			add_venue = 1
		endif
		if (<add_venue> = 1)
			AddArrayElement array = <array> element = <venue_checksum>
			printf channel = array qs(0xda6602f1) v = <venue_checksum>
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	add_generic_menu_text_item \{text = qs(0x926d03a6)
		additional_focus_script = wearspecialoutfit
		additional_focus_params = {
			genre = qs(0x3d07b9c9)
		}
		pad_choose_script = savespecialoutfit
		pad_choose_params = {
			genre = qs(0x3d07b9c9)
		}}
	if ArrayContains array = <array> contains = venue_z_canyon
		add_generic_menu_text_item \{text = qs(0x4f1fbfa2)
			additional_focus_script = wearspecialoutfit
			additional_focus_params = {
				genre = qs(0x94b4a7da)
			}
			pad_choose_script = savespecialoutfit
			pad_choose_params = {
				genre = qs(0x94b4a7da)
			}}
	else
		add_generic_menu_text_item \{text = qs(0x24a08263)
			pad_choose_script = nullscript
			pad_choose_sound = ui_bonus_videos_negative_sfx
			item_height = 40}
	endif
	if ArrayContains array = <array> contains = venue_z_icecap
		add_generic_menu_text_item \{text = qs(0x89d8a6b0)
			additional_focus_script = wearspecialoutfit
			additional_focus_params = {
				genre = qs(0xb1cfeac1)
			}
			pad_choose_script = savespecialoutfit
			pad_choose_params = {
				genre = qs(0xb1cfeac1)
			}}
	else
		add_generic_menu_text_item \{text = qs(0x24a08263)
			pad_choose_script = nullscript
			pad_choose_sound = ui_bonus_videos_negative_sfx
			item_height = 40}
	endif
	if ArrayContains array = <array> contains = venue_z_london
		add_generic_menu_text_item \{text = qs(0xf6522a5e)
			additional_focus_script = wearspecialoutfit
			additional_focus_params = {
				genre = qs(0x47a1195d)
			}
			pad_choose_script = savespecialoutfit
			pad_choose_params = {
				genre = qs(0x47a1195d)
			}}
	else
		add_generic_menu_text_item \{text = qs(0x24a08263)
			pad_choose_script = nullscript
			pad_choose_sound = ui_bonus_videos_negative_sfx
			item_height = 40}
	endif
	if ArrayContains array = <array> contains = venue_z_sphinx
		add_generic_menu_text_item \{text = qs(0xd3d0eefe)
			additional_focus_script = wearspecialoutfit
			additional_focus_params = {
				genre = qs(0x315d795e)
			}
			pad_choose_script = savespecialoutfit
			pad_choose_params = {
				genre = qs(0x315d795e)
			}}
	else
		add_generic_menu_text_item \{text = qs(0x24a08263)
			pad_choose_script = nullscript
			pad_choose_sound = ui_bonus_videos_negative_sfx
			item_height = 40}
	endif
	if ArrayContains array = <array> contains = venue_z_greatwall
		add_generic_menu_text_item \{text = qs(0x5f0bad1a)
			additional_focus_script = wearspecialoutfit
			additional_focus_params = {
				genre = qs(0x5f69a85b)
			}
			pad_choose_script = savespecialoutfit
			pad_choose_params = {
				genre = qs(0x5f69a85b)
			}}
	else
		add_generic_menu_text_item \{text = qs(0x24a08263)
			pad_choose_script = nullscript
			pad_choose_sound = ui_bonus_videos_negative_sfx
			item_height = 40}
	endif
	menu_finish \{car_helper_text}
endscript

script savespecialoutfit 
	setcasappearancepartinstance \{part = cas_greatest_outfit
		part_instance = {
			desc_id = true
		}}
	StopRendering
	casblockforloading
	cas_queue_block
	StartRendering
	hide_glitch \{num_frames = 2}
	ui_event \{event = menu_back}
endscript

script wearspecialoutfit 
	GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_greatestoutfit
	if (<visit_greatestoutfit> = 0)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_greatestoutfit = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_helper_dialogue
				is_popup
				life = 30
				text = qs(0x138b4cde)
			}}
		return
	endif
	printf \{channel = outfit
		qs(0x85728974)}
	printf channel = outfit qs(0x883ba8d6) p = <genre>
	cas_get_is_female Player = ($cas_current_player)
	printf channel = outfit qs(0xf793edc7) p = <is_female>
	if (<genre> = qs(0xb1cfeac1))
		<outfit> = load_z_icecap
		if (<is_female>)
			printf channel = outfit qs(0xf9939dd8) p = <genre>
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hat_hair
					desc_id = f_folk_hair_icspikyhair_hathair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_face
					desc_id = f_folk_acc_icsnowgoggles
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_ears
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hat
					desc_id = f_folk_acc_icearmuffs
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hair
					desc_id = f_folk_hair_icspikyhair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_torso
					desc_id = f_folk_torso_ichairycamisole
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_legs
					desc_id = f_folk_legs_ictwinterbikini
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_shoes
					desc_id = f_folk_icinuiticeclimber
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_left
					desc_id = f_folk_acc_l_ichandsomebangle
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_right
					desc_id = f_folk_acc_r_ichandsomebangle
				}}
		else
			printf channel = outfit qs(0xfd10f60a) p = <genre>
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_face
					desc_id = m_folk_acc_icskigoggle
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_ears
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_hat
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_hat_hair
					desc_id = m_folk_hair_icicedhair_hathair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_hair
					desc_id = m_folk_hair_icicedhair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_torso
					desc_id = m_folk_torso_icthundercoat
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_legs
					desc_id = m_folk_pants_ickitpants
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_shoes
					desc_id = m_folk_shoes_icclawsboots
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_left
					desc_id = m_folk_acc_l_icspikeglove
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_right
					desc_id = m_folk_acc_r_icspikeglove
				}}
		endif
	elseif (<genre> = qs(0x3d07b9c9))
		<outfit> = load_z_amazon
		if (<is_female>)
			printf channel = outfit qs(0xf9939dd8) p = <genre>
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hat_hair
					desc_id = f_folk_hair_amdreads_hathair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_face
					desc_id = f_folk_acc_amjadegreen
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_ears
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hat
					desc_id = f_folk_hat_amboartusk
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hair
					desc_id = f_folk_hair_amdreads
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_torso
					desc_id = f_folk_torso_amslyamazon
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_legs
					desc_id = f_folk_legs_amplumageskirt
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_shoes
					desc_id = f_folk_shoes_amjunglestick
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_left
					desc_id = f_folk_acc_l_amtitiglove
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_right
					desc_id = f_folk_acc_r_amtitiglove
				}}
		else
			printf channel = outfit qs(0x2d105566) p = <genre>
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_hat_hair
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_face
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_ears
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_hat
					desc_id = m_folk_hat_amskulljaguar
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_hat_hair
					desc_id = m_folk_hair_amponytail_hathair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_hair
					desc_id = m_folk_hair_amponytail
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_torso
					desc_id = m_folk_torso_amwarcollar
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_legs
					desc_id = m_folk_legs_amritualskirt
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_shoes
					desc_id = m_folk_shoes_amskullhead
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_left
					desc_id = m_folk_acc_amfurglove
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_right
					desc_id = m_folk_acc_ambangle
				}}
		endif
	elseif (<genre> = qs(0x315d795e))
		<outfit> = load_z_sphinx
		if (<is_female>)
			printf channel = outfit qs(0xf9939dd8) p = <genre>
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hat_hair
					desc_id = f_folk_hair_spegyptianhair_hathair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_face
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_ears
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hat
					desc_id = f_folk_acc_spegyptiandiadem
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hair
					desc_id = f_folk_hair_spegyptianhair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_torso
					desc_id = f_folk_torso_spdresstop
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_legs
					desc_id = f_folk_legs_spegyptianskirt
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_shoes
					desc_id = f_folk_shoes_sprockboots
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_left
					desc_id = f_folk_acc_l_spbracer
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_right
					desc_id = f_folk_acc_r_spbracer
				}}
		else
			printf channel = outfit qs(0xfd10f60a) p = <genre>
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_hat_hair
					desc_id = m_folk_hat_spsphinxhat_hathair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_face
					desc_id = m_folk_glasses_sphinxglasses
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_ears
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_hat
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_hair
					desc_id = m_folk_hat_spsphinxhat
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_torso
					desc_id = m_folk_torso_spsphinxcollar
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_legs
					desc_id = m_folk_pants_spsphinxdress
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_shoes
					desc_id = m_folk_boots_spsphinxboots
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_left
					desc_id = m_folk_acc_l_spgoldenbracer
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_right
					desc_id = m_folk_acc_r_spgoldenbracer
				}}
		endif
	elseif (<genre> = qs(0x47a1195d))
		<outfit> = load_z_london
		if (<is_female>)
			printf channel = outfit qs(0xf9939dd8) p = <genre>
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hat_hair
					desc_id = f_folk_hair_lsblackhair_hathair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_face
					desc_id = f_folk_acc_lsmask
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_ears
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hat
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hair
					desc_id = f_folk_hair_lsblackhair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_torso
					desc_id = f_folk_torso_lsratstop
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_legs
					desc_id = f_folk_legs_lsdirtydolllegs
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_shoes
					desc_id = f_folk_shoes_lsdirtyboots
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_left
					desc_id = f_folk_acc_l_lsglove
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_right
					desc_id = f_folk_acc_r_lsglove
				}}
		else
			printf channel = outfit qs(0xfd10f60a) p = <genre>
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_hair
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_face
					desc_id = m_folk_acc_lssewermask
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_ears
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_hat
					desc_id = m_folk_hat_lshightplatformhat
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_hat_hair
					desc_id = m_folk_hair_lstailhair_hat
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_torso
					desc_id = m_folk_torso_lsratspunkcoat
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_legs
					desc_id = m_folk_legs_lssewerpants
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_shoes
					desc_id = m_folk_shoes_lssewerboots
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_left
					desc_id = m_folk_acc_l_lsspikygloves
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_right
					desc_id = m_folk_acc_r_lsspikygloves
				}}
		endif
	elseif (<genre> = qs(0x94b4a7da))
		<outfit> = load_z_canyon
		if (<is_female>)
			printf channel = outfit qs(0xf9939dd8) p = <genre>
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_face
					desc_id = f_folk_acc_cnavajoloopears
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_ears
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hat
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hat_hair
					desc_id = f_folk_hair_gcnavajohair_hathair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hair
					desc_id = f_folk_hair_gcnavajohair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_torso
					desc_id = f_folk_torso_gcnavajotop
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_legs
					desc_id = f_folk_legs_gcnavajooverskirt
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_shoes
					desc_id = f_folk_shoes_gcnavajoboots
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_left
					desc_id = f_folk_acc_l_gcnavajobracer
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_right
					desc_id = f_folk_acc_r_gcnavajogloves
				}}
		else
			printf channel = outfit qs(0xfd10f60a) p = <genre>
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_face
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_ears
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_hat
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_hair
					desc_id = m_folk_hair_gwtwosidehair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_hat_hair
					desc_id = folk_hair_navajoheadband_hathair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_torso
					desc_id = m_folk_torso_gcnavajoarmor
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_legs
					desc_id = m_folk_pants_navajoleather
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_shoes
					desc_id = m_folk_shoe_gcnavajoshoe
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_left
					desc_id = m_folk_acc_l_gcnavajogauntlet
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_right
					desc_id = m_folk_acc_r_gcnavajogauntlet
				}}
		endif
	elseif (<genre> = qs(0x5f69a85b))
		<outfit> = load_z_greatwall
		if (<is_female>)
			printf channel = outfit qs(0xf9939dd8) p = <genre>
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_face
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_ears
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hat
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hat_hair
					desc_id = f_folk_hair_gwwithbow_hathair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_hair
					desc_id = f_folk_hair_gwwithbow
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_torso
					desc_id = f_folk_torso_gwkimonotop
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_legs
					desc_id = f_folk_legs_gwkimono
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_shoes
					desc_id = f_folk_shoes_gwshiny
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_left
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_female_acc_right
					desc_id = None
				}}
		else
			printf channel = outfit qs(0xfd10f60a) p = <genre>
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_face
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_ears
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_hat
					desc_id = None
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_hair
					desc_id = m_folk_hair_gwtwosidehair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_hat_hair
					desc_id = m_folk_hair_gwtwosidehair_hathair
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_torso
					desc_id = m_folk_torso_gwvinylcoat
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_legs
					desc_id = m_folk_legs_gwstapspant
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_shoes
					desc_id = m_folk_shoes_gwplatform
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_left
					desc_id = m_folk_acc_l_icspikeglove
				}}
			editcasappearance \{target = setpart
				targetparams = {
					part = cas_male_acc_right
					desc_id = m_folk_acc_r_icspikeglove
				}}
		endif
	endif
	rebuildcurrentcasmodel
endscript

script ui_return_customize_character_greatestoutfit 
	clean_up_user_control_helpers
	menu_finish \{car_helper_text}
endscript

script restoreoutfit 
	StopRendering
	restoretoptemporarycasappearance
	casblockforloading
	cas_queue_block
	StartRendering
	hide_glitch \{num_frames = 2}
	ui_event \{event = menu_back}
endscript

script ui_destroy_customize_character_greatestoutfit 
	destroy_generic_menu
endscript

script is_greatestoutfit 
	getcasappearancepartinstance \{part = cas_greatest_outfit}
	if (<part_instance>.desc_id = true)
		printstruct channel = is_greatestoutfit qs(0xc6530254) p = <part_instance>
		return \{true}
	elseif (<part_instance>.desc_id = FALSE)
		printstruct channel = is_greatestoutfit qs(0xc6530254) p = <part_instance>
		return \{FALSE}
	endif
endscript
