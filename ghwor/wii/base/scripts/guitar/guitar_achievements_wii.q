
script read_my_achievements 
	readachievements \{callBack_Script = read_achievements_callback
		callback_params = {
		}}
endscript

script read_friends_achievements \{friends_uid = [
			0
			0
		]}
	if is_net_id_zero net_id = <friends_uid>
		ScriptAssert \{'you must specify a valid net id when calling this script'}
		return
	endif
	readachievements {
		user_id = <friends_uid>
		callBack_Script = read_achievements_callback
		callback_params = {}
	}
endscript

script read_achievements_callback 
	printf \{'-- read_achievements_callback --'}
	broadcastevent Type = achievements_read_complete data = {success = <success>}
endscript

script parse_achievements_bitmask \{high32 = 0
		low32 = 0
		out_name = unlock_list}
	array = []
	<Field> = <low32>
	begin
	<i> = 1
	begin
	if (<Field> && <i>)
		AddArrayElement array = <array> element = 1
	else
		AddArrayElement array = <array> element = 0
	endif
	<i> = (<i> * 2)
	repeat 32
	<Field> = <high32>
	repeat 2
	struct = {}
	setstructureparam struct_name = struct param = <out_name> value = <array>
	return <struct>
endscript

script update_achievement_global_tags_for_wii \{new_bit_mask = [
			0
			0
		]
		debug_reset = 0}
	GetGlobalTags \{achievement_info
		param = bit_mask}
	if (<debug_reset> = 0)
		SetArrayElement ArrayName = bit_mask index = 0 NewValue = ((<bit_mask> [0]) || (<new_bit_mask> [0]))
		SetArrayElement ArrayName = bit_mask index = 1 NewValue = ((<bit_mask> [1]) || (<new_bit_mask> [1]))
	endif
	push_disable_globaltag_freeplay_check
	SetGlobalTags achievement_info params = {
		bit_mask = <bit_mask>
	}
	pop_disable_globaltag_freeplay_check
endscript

script update_achievement_offline_write_flag \{update_next_time_online = 1}
	push_disable_globaltag_freeplay_check
	SetGlobalTags achievement_info params = {
		write_offline_achievements = <update_next_time_online>
	}
	pop_disable_globaltag_freeplay_check
endscript

script is_achievement_unlocked \{achievement_name = !q1768515945}
	is_unlocked = FALSE
	if getachievementindex achievement_name = <achievement_name>
		if GetGlobalTags \{achievement_info
				param = bit_mask}
			parse_achievements_bitmask {
				high32 = (<bit_mask> [0])
				low32 = (<bit_mask> [1])
			}
			GetArraySize (<unlock_list>)
			if (<array_Size> > 0)
				if (<achievement_index> < <array_Size>)
					if (<unlock_list> [<achievement_index>] = 1)
						<is_unlocked> = true
					endif
				else
					ScriptAssert \{'script is_achievement_unlocked : achievement index out of bounds'}
				endif
			else
				ScriptAssert \{'script is_achievement_unlocked : unlock list has no entries'}
			endif
		endif
	endif
	return <is_unlocked>
endscript
