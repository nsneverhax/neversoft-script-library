
script goal_collect_create_object 
	printf "goal_collect_create_object"
	if NOT structurecontains structure = object name
		scriptassert text = "goal collect has no name value specified"
	endif
	if NOT structurecontains structure = object pos
		scriptassert text = "goal collect has no pos value specified"
	endif
	createcompositeobject {
		components = [
			{component = motion}
			{component = model}
			{component = hover}
			{component = suspend}
			{component = objectproximity}
		]
		params = {
			name = (<object>.name)
			model = (<object>.model)
			pos = (<object>.pos)
			suspenddistance = 60
			lod_dist1 = 200
			lod_dist2 = 300
		}
	}
endscript

script goal_collect_destroy_object 
	printf \{"goal_collect_destroy_object"}
	if iscreated (<object>.name)
		if structurecontains structure = <object> model
			(<object>.name) :die
		else
			kill name = (<object>.name)
		endif
	endif
endscript
goal_collect_initing_multiple_objects = false

script goal_collect_init_objects 
	getarraysize objects
	<index> = 0
	begin
	<do_init> = 0
	if gotparam all
		<do_init> = 1
	else
		if (<init_index> = <index>)
			<do_init> = 1
		elseif ($goal_collect_initing_multiple_objects = false)
			if iscreated ((<objects> [<index>]).name)
				spawnscriptlater goal_collect_destroy_object params = {object = (<objects> [<index>])}
			endif
		endif
	endif
	if (<do_init> = 1)
		if NOT iscreated ((<objects> [<index>]).name)
			if structurecontains structure = (<objects> [<index>]) model
				goal_collect_create_object object = (<objects> [<index>])
			else
				create name = ((<objects> [<index>]).name)
			endif
		endif
		runscriptonobject {
			id = ((<objects> [<index>]).name)
			goal_collect_init_object
			params = {
				(<objects> [<index>])
				object_index = <index>
				goal_id = <goal_id>
				checkpoint_id = <checkpoint_id>
				tool_id = <tool_id>
			}
		}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	if ((gotparam show_arrow) && (gotparam init_index))
		goal_collect_create_arrow object_id = (<objects> [<init_index>].name)
	endif
endscript

script goal_collect_init_object 
	if gotparam letter
		settags letter = <letter>
	endif
	if containscomponent name = motion
		obj_stopmoving
		obj_stoprotating
	endif
	if NOT gotparam pos
		obj_getid
		getnode <objid>
		pos = (<node>.pos)
	endif
	obj_setposition position = <pos>
	if NOT gotparam dont_animate
		if containscomponent name = motion
			obj_roty speed = 200
		endif
		if containscomponent name = hover
			obj_hover amp = 0.25 freq = 2
		endif
	endif
	obj_setnosizecull
	obj_visible
	cleareventhandlergroup `default`
	obj_setinnerradius <radius>
	seteventhandler {
		event = anyobjectinradius
		scr = goal_collect_got_object
		response = switch_script
		params = {
			goal_id = <goal_id>
			checkpoint_id = <checkpoint_id>
			tool_id = <tool_id>
			object_id = <name>
			object_index = <object_index>
			fx_type = <fx_type>
			hide_on_event = <hide_on_event>
			required_state = <required_state>
			test_script = <test_script>
		}
	}
endscript

script goal_collect_uninit_objects 
	getarraysize objects
	<index> = 0
	begin
	if iscreated ((<objects> [<index>]).name)
		<do_uninit> = 0
		if gotparam all
			<do_uninit> = 1
		else
			if (<uninit_index> = <index>)
				<do_uninit> = 1
			endif
		endif
		if (<do_uninit> = 1)
			runscriptonobject {
				id = ((<objects> [<index>]).name)
				goal_collect_uninit_object
				params = {
					(<objects> [<index>])
					goal_id = <goal_id>
					checkpoint_id = <checkpoint_id>
					tool_id = <tool_id>
				}
			}
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script goal_collect_uninit_object 
	cleareventhandlergroup \{`default`}
	obj_invisible
	if containscomponent \{name = motion}
		obj_stopmoving
		obj_stoprotating
	endif
	obj_getid
	if NOT gotparam \{pos}
		obj_getid
		getnode <objid>
		pos = (<node>.pos)
	endif
	obj_setposition position = <pos>
	die
endscript

script goal_collect_got_object 
	<got_object> = 1
	if GMan_CollectFunc func = requires_combo goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id>
		<got_object> = 0
		if <colobjid> :islocalskater
			if <colobjid> :isinbail
				return
			endif
		endif
		if <colobjid> :currentscorepotgreaterthan 0
			<got_object> = 1
		else
			if <colobjid> :skating
				if NOT <colobjid> :onground
					<got_object> = 1
				endif
			else
				if <colobjid> :walking
					if <colobjid> :walk_air
						<got_object> = 1
					endif
				endif
			endif
		endif
	endif
	if gotparam required_state
		<got_object> = 0
		if ((gman_getconstant goal = <goal_id> name = skater_state_tool) && (gman_skaterfunc goal = <goal_id> tool = <skater_state_tool> func = is_in_state params = {state = <required_state>}))
			<got_object> = 1
		endif
	endif
	if gotparam test_script
		if <test_script>
			<got_object> = 1
		else
			<got_object> = 0
		endif
	endif
	if (<got_object> = 1)
		goal_collect_got_object_fx fx_type = <fx_type> object_id = <object_id>
		cleareventhandlergroup `default`
		if gotparam hide_on_event
			obj_spawnscriptnow goal_collect_got_object_hide_on_event params = {hide_on_event = <hide_on_event>}
		else
			goal_collect_got_object_hide
		endif
		gman_gotcollectobject goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> object = <object_id> index = <object_index>
	endif
endscript

script goal_collect_got_object_hide 
	obj_invisible
	if containscomponent \{name = motion}
		obj_stopmoving
		obj_stoprotating
	endif
endscript

script goal_collect_got_object_hide_on_event 
	printf \{'goal_collect_got_object_hide_on_event - waiting'}
	block type = <hide_on_event>
	printf \{'goal_collect_got_object_hide_on_event - done'}
	goal_collect_got_object_hide
endscript

script goal_collect_got_object_fx 
	printstruct <...>
	switch <fx_type>
		case skate_letter
		soundevent event = skate_letter_collect_sfx
		screenflash time = 0.4
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		getuniquecompositeobjectid preferredid = classic_skate_letter
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_woodshattersmoke
		case combo_letter
		soundevent event = combo_letter_collect_sfx
		screenflash time = 0.4
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		getuniquecompositeobjectid preferredid = classic_combo_letter
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_woodshattersmoke
		case secret_tape
		if NOT issoundeventplaying medal_am_sfx
			if NOT issoundeventplaying medal_pro_sfx
				if NOT issoundeventplaying medal_sick_sfx
					soundevent event = sk8_collect_cd
					screenflash time = 0.4
					if getnode <object_id>
						<pos> = (<node>.pos)
					else
						<object_id> :obj_getposition
					endif
					getuniquecompositeobjectid preferredid = classic_combo_letter
					createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_woodshattersmoke
				endif
			endif
		endif
		printf "got secret tape sfx here"
		case grind_pellet
		soundevent event = hawkman_get_pellet_grind
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		getuniquecompositeobjectid preferredid = grindpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_grind
		getuniquecompositeobjectid preferredid = grindpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_grind02
		getuniquecompositeobjectid preferredid = grindpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_grind03
		getuniquecompositeobjectid preferredid = grindpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_grind08
		getuniquecompositeobjectid preferredid = manualpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_manual04
		case manual_pellet
		soundevent event = hawkman_get_pellet_man
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		getuniquecompositeobjectid preferredid = manualpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_grind02
		getuniquecompositeobjectid preferredid = manualpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_manual01
		getuniquecompositeobjectid preferredid = manualpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_manual02
		getuniquecompositeobjectid preferredid = manualpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_manual03
		getuniquecompositeobjectid preferredid = manualpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_manual04
		case wallride_pellet
		soundevent event = hawkman_get_pellet_wall
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		getuniquecompositeobjectid preferredid = wallridepelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_grind02
		getuniquecompositeobjectid preferredid = wallridepelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_wallride01
		getuniquecompositeobjectid preferredid = wallridepelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_wallride02
		getuniquecompositeobjectid preferredid = manualpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_manual04
		getuniquecompositeobjectid preferredid = manualpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_grind09
		case transfer_pellet
		soundevent event = hawkman_get_pellet_tran
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		getuniquecompositeobjectid preferredid = transferpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_grind02
		getuniquecompositeobjectid preferredid = transferpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_grind05
		getuniquecompositeobjectid preferredid = transferpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_grind06
		getuniquecompositeobjectid preferredid = transferpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_grind07
		getuniquecompositeobjectid preferredid = manualpelletfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_pellet_manual04
		case smash
		soundevent event = sk9_stamp_rip
		soundevent event = sk8_poster_sfx
		screenflash time = 0.4
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		getuniquecompositeobjectid preferredid = classic_smash
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_woodshattersmoke
		case smash_fdr
		soundevent event = sk9_metal_sign_punch
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		<modified_pos> = (<pos> + (0.0, 1.2, 0.0))
		skater :obj_getvelocity
		normalizevector <vel>
		screenflash time = 0.4
		getuniquecompositeobjectid preferredid = classic_fdr01
		createparticlesystem name = <uniqueid> pos = <modified_pos> params_script = $gp_ph_woodshattersmoke
		getuniquecompositeobjectid preferredid = classic_fdr01
		createparticlesystem name = <uniqueid> pos = <modified_pos> params_script = {$gp_ph_signpieces_white emit_target = <norm>}
		case smash_lansdown
		soundevent event = shoe_stall_sfx
		screenflash time = 0.4
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		getuniquecompositeobjectid preferredid = classic_lansdowne
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_woodshattersmoke
		case smash_slums
		soundevent event = sk9_stamp_rip
		screenflash time = 0.4
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		getuniquecompositeobjectid preferredid = classic_slums01
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_signsmoke01
		soundevent event = sk8_poster_sfx
		case smash_monuments
		soundevent event = skate_letter_collect_sfx
		case smash_museums
		soundevent event = skate_letter_collect_sfx
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		<modified_pos> = (<pos> + (0.0, 1.75, 0.0))
		skater :obj_getvelocity
		normalizevector <vel>
		getuniquecompositeobjectid preferredid = classic_musuems_signshatter01
		createparticlesystem name = <uniqueid> pos = <modified_pos> params_script = {$gp_ph_signpieces_blue emit_target = <norm>}
		getuniquecompositeobjectid preferredid = classic_musuems_signshatter01
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_signsmoke01
		case smash_harbor
		soundevent event = skate_letter_collect_sfx
		screenflash time = 0.4
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		skater :obj_getvelocity
		normalizevector <vel>
		getuniquecompositeobjectid preferredid = crabboxfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_crabsmoke01
		getuniquecompositeobjectid preferredid = crabboxfx
		createparticlesystem name = <uniqueid> pos = <pos> params_script = {$gp_ph_crabwoodpieces01 emit_target = <norm>}
		case smash_wp_bridge
		soundevent event = skate_poster_rip
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		getuniquecompositeobjectid preferredid = classic_musuems_signshatter01
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_woodshattersmoke
		screenflash time = 0.4
		case smash_squid
		soundevent event = natas_squid_sfx
		case jackhammer
		soundevent event = jackhammer_sfx
		if getnode <object_id>
			<pos> = (<node>.pos)
		else
			<object_id> :obj_getposition
		endif
		getuniquecompositeobjectid preferredid = classic_bw_bridge01
		createparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ph_woodshattersmoke
		screenflash time = 0.4
		case race_collect_sfx
		soundevent event = sk9_checkpoint_sfx
		default
		gman_getactivatedgoalid
		if NOT (<activated_goal_id> = m_r1_demo)
			soundevent event = skate_letter_collect_sfx
		endif
	endswitch
endscript

script goal_collect_got_object_msg 
	goal_create_counter {
		initial_count = <num_collected>
		total_number = <num_objects>
		hud_counter_caption = <collect_text>
		time = 5
	}
endscript

script goal_collect_text_style 
	setprops \{rgba = [
			127
			102
			0
			255
		]
		pos = (320.0, 100.0)}
	domorph \{alpha = 1.0
		scale = 0.9}
	wait \{1000}
	die
endscript

script goal_collect_create_arrow 
	goal_create_arrow objecttopointto = <object_id>
endscript

script goal_collect_destroy_arrow 
	goal_destroy_arrow
endscript
