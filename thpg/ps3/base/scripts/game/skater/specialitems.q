Ped_board_details = {
	pos = (0.0, 0.0, 0.0)
	angles = (0.0, 0.0, 0.0)
	name = psi_board
	class = gameobject
	type = specialitem
	collisionmode = none
	persistent
	skeletonname = sk9_board_ped_skater
	animname = animload_Board
	usemodellights
	random_parts = [
		[
			ped_board
		]
	]
	suspenddistance = $SkateboardSuspendDistance
	lod_dist1 = 10
	lod_dist2 = $SkateboardRenderDistance
}

script SetSpecialItemTag 
	obj_getid
	getsingletag \{parentid}
	<parentid> :settags specialitemid = <objid>
endscript

script Prop_Particles \{particle_wait = 80}
	wait <particle_wait> frames
	createflexibleparticlesystem name = PropFlexSys emitscript = <particles>
endscript

script Prop_Particles2 \{particle_wait = 44}
	wait <particle_wait> frames
endscript

script TurnOnSpecialItem heap = bottomupheap tree = $Skater_StaticAnimTree
	if NOT gotparam specialitem_details
		printf "TurnOnSpecialItem - missing param specialitem_details"
		printstruct <...>
		return
	endif
	obj_getid
	manglechecksums a = (<specialitem_details>.name) b = <objid>
	id = <mangled_id>
	if NOT iscreated <id>
		is_flipped = 0
		if NOT gotparam NotSkater
			printf "TurnOnSpecialItem Skater"
			if flipped
				printf "TurnOnSpecialItem Flipped"
				is_flipped = 1
			endif
		endif
		if NOT gotparam ped
			if (<is_flipped> = 1)
				if structurecontains structure = <specialitem_details> bone_flipped
					bone = (<specialitem_details>.bone_flipped)
				endif
				if structurecontains structure = <specialitem_details> BoneOffset_flipped
					boneoffset = (<specialitem_details>.BoneOffset_flipped)
				endif
			endif
		endif
		mempushcontext <heap>
		if NOT gotparam ped
			my_item_details = (<specialitem_details>)
			if (<is_flipped> = 1)
				if structurecontains flipped_model structure = <specialitem_details>
					addparam name = model structure_name = my_item_details value = (<specialitem_details>.flipped_model)
				endif
			endif
			createspecialitem {
				index = 0
				<my_item_details>
				tree = <tree>
				animeventtablename = skateranimeventtable
				defaultcommandtarget = body
				defaultwaittarget = bodytimer
				checksum = <specialitem_details>
				other_checksum = <other_checksum>
				bone = <bone>
				boneoffset = <boneoffset>
			}
			<id> :init_skater_anim_tree tree = <tree> parent = <objid>
		else
			createspecialitem {
				index = 0
				(<specialitem_details>)
				tree = $ped_staticanimtree
				animeventtablename = PedAnimEventTable
				defaultcommandtarget = pedmainanimparentnode
				defaultwaittarget = bodytimer
				checksum = <specialitem_details>
				bone = <bone>
				boneoffset = <boneoffset>
				animtriggerscript = SkaterPed_PlaySpecialItemAnim
			}
			<id> :ped_initstaticanimtree tree = $ped_staticanimtree
			<id> :ped_adddegenerateblendbranch
		endif
		mempopcontext
	endif
endscript

script TurnOffSpecialItem 
	destroytempspecialitems
endscript
