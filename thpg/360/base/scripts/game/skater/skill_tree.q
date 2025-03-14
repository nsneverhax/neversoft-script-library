skill_default_1st_upgrade_cost = 50
skill_default_2nd_upgrade_cost = 100
skilltree = [
	{
		id = ntt
		name = "Nail The Trick"
		description = "flip your board with total control to create your own tech tricks!"
		traits = [
			career_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = ntt_on
			}
		]
		prerequisites = [
		]
	}
	{
		id = ntt_perfect_flips
		name = "Perfect Flips"
		description = "time your Flips exactly to get PERFECT FLIPS for extra points."
		traits = [
			career_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = ntt_perfect_flips
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = ntt
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_1st_upgrade_cost
			}
		]
	}
	{
		id = ntt_body_spin
		name = "Body Spin"
		description = "perform body spins while in Nail the Trick."
		traits = [
			career_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = ntt_body_spin
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = ntt
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_2nd_upgrade_cost
			}
		]
	}
	{
		id = ntg
		name = "Nail The Grab"
		description = "grab your board with total control to create your own tech tricks!"
		traits = [
			career_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = ntg_on
			}
		]
		prerequisites = [
		]
	}
	{
		id = ntg_perfect_grabs
		name = "Perfect Grabs"
		description = "time your Grabs exactly to get PERFECT GRABS for extra points."
		traits = [
			career_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = ntg_perfect_grabs
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = ntg
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_1st_upgrade_cost
			}
		]
	}
	{
		id = ntg_trucks_up
		name = "Trucks Up Branching"
		description = "do a Grab when the board is TRUCKS UP for bonus points."
		traits = [
			career_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = ntg_trucksup_grabs
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = ntg
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_2nd_upgrade_cost
			}
		]
	}
	{
		id = ntm
		name = "Nail The Manual"
		description = "MANUAL your board with Total Control to link Nail the Tricks and Nail the Grabs together in one Combo!"
		traits = [
			career_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = ntm_on
			}
		]
		prerequisites = [
		]
	}
	{
		id = ntm_perfect_ollies
		name = "Perfect Ollies"
		description = "time your Ollies exactly to get PERFECT OLLIES for extra points."
		traits = [
			career_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = ntm_perfect_ollie
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = ntm
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_1st_upgrade_cost
			}
		]
	}
	{
		id = ntm_trucks_up
		name = "Trucks Up Branching"
		description = "go into a Manual when the board is TRUCKS UP for bonus points."
		traits = [
			career_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = ntm_trucksup_branching
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = ntm
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_2nd_upgrade_cost
			}
		]
	}
	{
		id = boost
		name = "Aggro Kick"
		description = "use the Aggro Kick to push faster and faster."
		traits = [
			hardcore_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = aggro_kick
			}
		]
		prerequisites = [
		]
	}
	{
		id = boost_pull
		name = "Aggro Push"
		description = "use walls to push yourself for extra speed while in a manual."
		traits = [
			hardcore_upgrade
		]
		effects = [
			{
				type = ability
				ability = aggro_push
			}
		]
		prerequisites = [
		]
	}
	{
		id = skitch_boost_skill
		name = "Aggro Skitch Boost"
		description = "use cars to pull yourself for extra speed."
		traits = [
			hardcore_upgrade
		]
		effects = [
			{
				type = ability
				ability = aggro_skitch
			}
		]
		prerequisites = [
		]
	}
	{
		id = boost_speed
		name = "Perfect Window"
		description = "unlocks the ability to more easily hit the perfect kick window."
		traits = [
			hardcore_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = aggro_perfect_window
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = boost
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_1st_upgrade_cost
			}
		]
	}
	{
		id = boost_combo
		name = "Aggro Score"
		description = "unlocks the ability to get a score from aggro-kicking."
		traits = [
			hardcore_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = aggro_score
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = boost
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_2nd_upgrade_cost
			}
		]
	}
	{
		id = checking
		name = "Skate Checking"
		description = "knock down anyone that gets in your way!"
		traits = [
			hardcore_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = bodycheck_on
			}
		]
		prerequisites = [
		]
	}
	{
		id = checking_uppercut
		name = "Power Check"
		description = "send your enemies flying even further."
		traits = [
			hardcore_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = bodycheck_uppercut
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = checking
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_1st_upgrade_cost
			}
		]
	}
	{
		id = checking_charge
		name = "Multi-Check"
		description = "hit multiple people with one attack."
		traits = [
			hardcore_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = bodycheck_charge_check
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = checking
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_2nd_upgrade_cost
			}
		]
	}
	{
		id = bowl
		name = "Bowl Skating"
		description = "carve and slash-grind Bowls for more Points and Speed"
		traits = [
			hardcore_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = bowl_carve
			}
		]
		prerequisites = [
		]
	}
	{
		id = bowl_slash_switchup_skill
		name = "Alternate Grinds"
		description = "unlocks the ability to perform switch ups between 50-50 and boardslide slashes while in slash grinds."
		traits = [
			hardcore_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = bowl_slash_switchup
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = bowl
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_1st_upgrade_cost
			}
		]
	}
	{
		id = bowl_grinds
		name = "Bowl Combo Window"
		description = "unlocks a window that allows the player to continue a combo by carving again or going into a non-carve trick."
		traits = [
			hardcore_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = bowl_slash_switchup
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = bowl
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_2nd_upgrade_cost
			}
		]
	}
	{
		id = rigger_menu
		name = "Rigger Menu"
		description = "Now you can build kickers anywhere, freeskating and in goals!"
		traits = [
			rigger_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = rigger_mode
			}
		]
		prerequisites = [
		]
	}
	{
		id = rig_pieces_kicker
		name = "Rigger Piece: Kickers"
		description = "reach new heights with these kicker ramps!"
		traits = [
			rigger_upgrade
		]
		effects = [
			{
				type = rigger_piece
				rigger_piece = Small_Kicker
			}
		]
		prerequisites = [
		]
	}
	{
		id = rig_pieces_curved_rails
		name = "Rigger Piece: Curved Rails"
		description = "use rails with bends and u-turns to shape your lines!"
		traits = [
			foo
		]
		effects = [
			{
				type = rigger_piece
				rigger_piece = Corner_Rail
			}
			{
				type = rigger_piece
				rigger_piece = UTurn_Rail
			}
		]
		prerequisites = [
		]
	}
	{
		id = rig_pieces_qps_and_rails
		name = "Rigger Pieces: QPs and Rails"
		description = "lay out QPs and rails to create your own lines!"
		traits = [
			rigger_upgrade
		]
		effects = [
			{
				type = rigger_piece
				rigger_piece = Small_Quarterpipe
			}
			{
				type = rigger_piece
				rigger_piece = Small_Rail
			}
		]
		prerequisites = [
		]
	}
	{
		id = rig_pieces_spine_and_platform
		name = "Rigger Pieces: Spines, Platforms, Curved Rails, Bowl Pieces"
		description = "spines, bowl pieces, platforms, rails with bends and u-turns"
		traits = [
			rigger_upgrade
		]
		effects = [
			{
				type = rigger_piece
				rigger_piece = spine
			}
			{
				type = rigger_piece
				rigger_piece = Funbox
			}
			{
				type = rigger_piece
				rigger_piece = Corner_Rail
			}
			{
				type = rigger_piece
				rigger_piece = UTurn_Rail
			}
			{
				type = rigger_piece
				rigger_piece = Small_Quarterpipe_45
			}
			{
				type = rigger_piece
				rigger_piece = Small_Quarterpipe_90
			}
		]
		prerequisites = [
		]
	}
	{
		id = rig_pieces_large
		name = "Large Pieces"
		description = "access to larger pieces in each category.  longer rails, wider QPs and kickers."
		traits = [
			rigger_upgrade
			menu
		]
		effects = [
			{
				type = rigger_piece
				rigger_piece = Large_Rail
			}
			{
				type = rigger_piece
				rigger_piece = Large_Kicker
			}
			{
				type = rigger_piece
				rigger_piece = Large_Quarterpipe
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = rigger_menu
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_1st_upgrade_cost
			}
		]
	}
	{
		id = rig_pieces_boost
		name = "Boost Pieces"
		description = "access to boost pieces in each category."
		traits = [
			rigger_upgrade
			menu
		]
		effects = [
			{
				type = rigger_piece
				rigger_piece = Boost_Rail
			}
			{
				type = rigger_piece
				rigger_piece = Boost_Kicker
			}
			{
				type = rigger_piece
				rigger_piece = Boost_Quarterpipe
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = rigger_menu
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_2nd_upgrade_cost
			}
		]
	}
	{
		id = camera
		name = "Camera"
		description = "take pictures anywhere at any time.  saved pictures will be saved in your photo album."
		traits = [
			rigger_upgrade
		]
		effects = [
			{
				type = ability
				ability = rigger_camera
			}
		]
		prerequisites = [
		]
	}
	{
		id = climbing
		name = "Climbing"
		description = "allows climbing fences, walls, etc."
		traits = [
			rigger_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = climb_wall
			}
		]
		prerequisites = [
		]
	}
	{
		id = climbing_speed
		name = "Faster Climbing"
		description = "increases climbing speed."
		traits = [
			rigger_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = climb_wall_fast
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = climbing
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_1st_upgrade_cost
			}
		]
	}
	{
		id = climbing_poles
		name = "Pole Climbing"
		description = "allows you to climb poles."
		traits = [
			rigger_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = climb_pole
			}
		]
		prerequisites = [
			{
				type = skill_learned
				skill = climbing
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_2nd_upgrade_cost
			}
		]
	}
	{
		id = Wrench
		name = "Mod Tool"
		description = "allows modifying of city objects.  alters level 1 objects."
		traits = [
			rigger_upgrade
			menu
		]
		effects = [
			{
				type = ability
				ability = rigger_wrench
			}
		]
		prerequisites = [
		]
	}
	{
		id = wrench_2
		name = "Mod Level 2"
		description = "allows modifying of level 2 city objects."
		traits = [
			rigger_upgrade
			menu
		]
		effects = [
		]
		prerequisites = [
			{
				type = skill_learned
				skill = Wrench
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_1st_upgrade_cost
			}
		]
	}
	{
		id = wrench_3
		name = "Mod Level 3"
		description = "allows modifying of level 3 city objects."
		traits = [
			rigger_upgrade
			menu
		]
		effects = [
		]
		prerequisites = [
			{
				type = skill_learned
				skill = Wrench
			}
			{
				type = skill_point_cost
				point_type = generic
				num_points = $skill_default_2nd_upgrade_cost
			}
		]
	}
	{
		id = CRIB_UNLOCK_C101
		name = "Skate Lounge Pieces: Demo Pieces"
		description = "all the cool pieces you skated in the demo!"
		traits = [
			crib
			career
		]
		effects = [
			{
				type = crib_piece
				crib_piece = crib_middle_fountain
			}
			{
				type = crib_piece
				crib_piece = crib_metal_barrier
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_C102
		name = "Skate Lounge Pieces: Video Fountain"
		description = "the fountain that you skated for the Video and the stretch Limo!"
		traits = [
			crib
			career
		]
		effects = [
			{
				type = crib_piece
				crib_piece = z_museums_fountain
			}
			{
				type = crib_piece
				crib_piece = car_stretchlimo
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_C201
		name = "Skate Lounge Pieces: Lansdowne Park Pieces"
		description = "some of the pieces from the Lansdowne Skate Park!"
		traits = [
			crib
			career
		]
		effects = [
			{
				type = crib_piece
				crib_piece = crib_lansdowne_funbox_large
			}
			{
				type = crib_piece
				crib_piece = crib_lansdowne_funbox_small
			}
			{
				type = crib_piece
				crib_piece = crib_lansdowne_picnic
			}
			{
				type = crib_piece
				crib_piece = crib_lansdowne_tables
			}
			{
				type = crib_piece
				crib_piece = crib_lansdowne_spine
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_C202
		name = "Skate Lounge Pieces: Tri-City Comp Pieces"
		description = "the Ericmobile and the best pieces from the Tri-City Competition!"
		traits = [
			crib
			career
		]
		effects = [
			{
				type = crib_piece
				crib_piece = tacky_sportscar
			}
			{
				type = crib_piece
				crib_piece = crib_comp_funbox_wood_01
			}
			{
				type = crib_piece
				crib_piece = crib_hubba_funbox
			}
			{
				type = crib_piece
				crib_piece = crib_funbox_hubbas02
			}
			{
				type = crib_piece
				crib_piece = crib_funbox_hubba_03
			}
			{
				type = crib_piece
				crib_piece = crib_funbox_pyramid
			}
			{
				type = crib_piece
				crib_piece = crib_funbox_stairs
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_C301
		name = "Skate Lounge Pieces: Philly Benches"
		description = "great grindable benches straight from your hometown!"
		traits = [
			crib
			career
		]
		effects = [
			{
				type = crib_piece
				crib_piece = z_love_bench
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_C302
		name = "Skate Lounge Pieces: THPS Love Sign"
		description = "the THPS logo at Love Park!"
		traits = [
			crib
			career
		]
		effects = [
			{
				type = crib_piece
				crib_piece = z_love_thps_sign
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_R101
		name = "Skate Lounge Pieces: Baltimore Bench"
		description = "Balitmore bench used in the Demo."
		traits = [
			crib
			rigger
		]
		effects = [
			{
				type = crib_piece
				crib_piece = crib_harbor_box
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_R102
		name = "Skate Lounge Pieces: Downtown Showdown Pieces"
		description = "seven of the best items from the Downtown Showdown!"
		traits = [
			crib
			rigger
		]
		effects = [
			{
				type = crib_piece
				crib_piece = Field_Goal_Post
			}
			{
				type = crib_piece
				crib_piece = crib_episode_r1_funbox
			}
			{
				type = crib_piece
				crib_piece = crib_jeep_kicker_gap
			}
			{
				type = crib_piece
				crib_piece = crib_mini_mega
			}
			{
				type = crib_piece
				crib_piece = comp_wavy_rails
			}
			{
				type = crib_piece
				crib_piece = crib_metal_barrier
			}
			{
				type = crib_piece
				crib_piece = crib_small_comp_spine
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_R201
		name = "Skate Lounge Pieces: Aircraft from the Space and Air"
		description = "A Helo and Airplane from the Space and Air Museum!"
		traits = [
			crib
			rigger
		]
		effects = [
			{
				type = crib_piece
				crib_piece = z_museums_INT_helicopter
			}
			{
				type = crib_piece
				crib_piece = z_museums_INT_Plane
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_R202
		name = "Skate Lounge Pieces: Subway Pieces"
		description = "mementos from screwing up Bam's show and getting your own!"
		traits = [
			crib
			rigger
		]
		effects = [
			{
				type = crib_piece
				crib_piece = z_wp_bridge_train
			}
			{
				type = crib_piece
				crib_piece = z_wp_bridge_hanging_light
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_R301
		name = "Skate Lounge Pieces: Mod Pieces Learned"
		description = "<TODO> "
		traits = [
			crib
			rigger
		]
		effects = [
			{
				type = crib_piece
				crib_piece = z_museums_geiger_kicker
			}
			{
				type = crib_piece
				crib_piece = crib_bent_sign
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_R302
		name = "Skate Lounge Pieces: Rest of Mod Pieces"
		description = "<TODO> "
		traits = [
			crib
			rigger
		]
		effects = [
			{
				type = crib_piece
				crib_piece = z_slums_billboard
			}
			{
				type = crib_piece
				crib_piece = z_love_lamp_post
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_H101
		name = "Skate Lounge Pieces: Philly Plaza Objects"
		description = "the Waterfall and Spine from your epic spine and epic gap goals!"
		traits = [
			crib
			hardcore
		]
		effects = [
			{
				type = crib_piece
				crib_piece = z_love_waterfall
			}
			{
				type = crib_piece
				crib_piece = z_love_small_spine
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_H102
		name = "Skate Lounge Pieces: Jeep"
		description = "the Jeep that you launched over for the video!"
		traits = [
			crib
			hardcore
		]
		effects = [
			{
				type = crib_piece
				crib_piece = crib_jeep_liberty
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_H201
		name = "Skate Lounge Pieces: FDR Fence"
		description = "with FDR clear, here's a fence taken straight from it!"
		traits = [
			crib
			hardcore
		]
		effects = [
			{
				type = crib_piece
				crib_piece = crib_fence_climb
			}
			{
				type = crib_piece
				crib_piece = car_bulldozer_yourcrib
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_H202
		name = "Skate Lounge Pieces: The fountain statue you saved from the Crazy Two-One!"
		description = "DC is now free to skate again, here's the fountain statue."
		traits = [
			crib
			hardcore
		]
		effects = [
			{
				type = crib_piece
				crib_piece = z_museums_center_statue
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_H301
		name = "Skate Lounge Pieces: FDR Funbox"
		description = "the FDR funbox straight from the competition!"
		traits = [
			crib
			hardcore
		]
		effects = [
			{
				type = crib_piece
				crib_piece = crib_fdr_funbox
			}
		]
		prerequisites = [
		]
	}
	{
		id = CRIB_UNLOCK_H302
		name = "Skate Lounge Pieces: City Pools"
		description = "here's the pools you skated with Lance!"
		traits = [
			crib
			hardcore
		]
		effects = [
			{
				type = crib_piece
				crib_piece = z_crib_z_harbor_roof_bowl
			}
			{
				type = crib_piece
				crib_piece = z_crib_z_harbor_pool_bowl
			}
		]
		prerequisites = [
		]
	}
]
