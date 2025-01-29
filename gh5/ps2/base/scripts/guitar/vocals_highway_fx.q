vocals_comet_particle_effects = {
	scrolling = [
		{
			Base = {
				start_color = [
					255
					128
					0
					255
				]
				end_color = [
					255
					0
					0
					0
				]
			}
			miss = {
				start_color = [
					128
					0
					255
					255
				]
				end_color = [
					0
					0
					255
					0
				]
			}
		}
	]
	scrolling_sp = [
		{
			Base = {
				start_color = [
					64
					128
					128
					255
				]
				end_color = [
					0
					0
					0
					0
				]
			}
		}
		{
			Base = {
				start_color = [
					255
					255
					255
					255
				]
				end_color = [
					255
					255
					255
					128
				]
			}
		}
		{
			Base = {
				start_color = [
					255
					255
					255
					255
				]
				end_color = [
					255
					255
					255
					0
				]
			}
		}
		{
			Base = {
				start_color = [
					128
					255
					255
					255
				]
				end_color = [
					0
					255
					255
					0
				]
			}
		}
	]
	static = [
		{
			Base = {
				start_color = [
					255
					128
					0
					255
				]
				end_color = [
					255
					0
					0
					0
				]
			}
			miss = {
				start_color = [
					128
					0
					255
					255
				]
				end_color = [
					0
					0
					255
					0
				]
			}
		}
	]
	static_sp = [
		{
			Base = {
				start_color = [
					64
					128
					128
					255
				]
				end_color = [
					0
					0
					0
					0
				]
			}
		}
		{
			Base = {
				start_color = [
					255
					255
					255
					255
				]
				end_color = [
					255
					255
					255
					128
				]
			}
		}
		{
			Base = {
				start_color = [
					255
					255
					255
					255
				]
				end_color = [
					255
					255
					255
					0
				]
			}
		}
		{
			Base = {
				start_color = [
					128
					255
					255
					255
				]
				end_color = [
					0
					255
					255
					0
				]
			}
		}
	]
}
vocal_cheat_fireball_start_color = [
	255
	0
	200
	255
]
vocal_cheat_fireball_end_color = [
	255
	0
	200
	64
]

script vocalshighway_getmaterial 

	formatText {
		checksumName = vocals_highway_material
		TextName = vocals_highway_material_text
		'VocalEKGMaterial_p%p'
		p = <Player>
		AddToStringLookup
	}
	return vocals_highway_material = <vocals_highway_material> vocals_highway_material_text = <vocals_highway_material_text>
endscript

script vocals_setup_paint_material \{Player = 1}
	vocalshighway_getid Player = <Player>
	vocalshighway_getmaterial Player = <Player>
	vocals_getvocalistnum Player = <Player>
	destroymaterial Name = <vocals_highway_material>
	if ScreenElementExists id = {<vocals_highway_id> child = ekgelement}
		DestroyScreenElement id = {<vocals_highway_id> child = ekgelement}
	endif
	creatematerial {
		Name = <vocals_highway_material>
		template = waveform_ui
		technique = Default
		BlendMode = blend
		AlphaCutoff = 1
		MaterialProps = [
			{Name = m_sampnoise textureproperty = `tex\_______default_m_____.dds`}
			{Name = m_pscolors0 vectorproperty = [2.0 1.0 0.0 1.0]}
			{Name = m_pscolors1 vectorproperty = [1.2 0.8 0.0 5.0]}
			{Name = m_pscolors2 vectorproperty = [1.0 0.75 0.120000005 0.8]}
			{Name = m_pscolors3 vectorproperty = [0.0 0.0 0.0 0.8]}
			{Name = m_pscolors4 vectorproperty = [2.0 1.0 0.0 1.2]}
			{Name = m_pscolors5 vectorproperty = [0.0 0.0 0.1 0.8]}
			{Name = m_pscolors6 vectorproperty = [1.0 0.6 0.2 1.0]}
			{Name = m_pscolors7 vectorproperty = [1.0 1.0 0.3 1.0]}
			{Name = m_noisescale floatproperty = 0.8}
			{Name = m_noisebias floatproperty = 0.0}
			{Name = m_noisepower floatproperty = 0.25}
			{Name = m_noise1speedx floatproperty = 0.2}
			{Name = m_noise1speedy floatproperty = 0.25}
			{Name = m_noise2speedx floatproperty = 0.2}
			{Name = m_noise2speedy floatproperty = -0.25}
			{Name = m_splinefadedistance floatproperty = 5.0}
			{Name = m_playerIndex floatproperty = <vocalist_num>}
		]
	}
	CreateScreenElement {
		parent = <vocals_highway_id>
		local_id = ekgelement
		Type = SpriteElement
		Pos = (0.0, 0.0)
		dims = (512.0, 128.0)
		Scale = 1.0
		material = <vocals_highway_material>
		texture = white
		z_priority = 10
	}
endscript

script vocals_end_phrase_good_comet_fx 
	Obj_GetID
	vocalshighway_getid Player = <Player>
	<vocals_highway_id> :desc_resolvealias Name = alias_pitch_indicator param = pitch_indicator
	if (($current_num_players) > 1)
		Pos = (0.0, 8.0)
	else
		Pos = (0.0, 8.0)
	endif
	if ScreenElementExists \{id = 0xa4a4627e}
		DestroyScreenElement \{id = 0xa4a4627e}
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = 0xa4a4627e
		parent = <pitch_indicator>
		material = vocal_phrase
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.04
		num_uv_frames = (6.0, 1.0)
		rgba = [0 255 0 255]
		Pos = <Pos>
		Scale = 0.75
		z_priority = 19.0
	}
	Wait \{12
		frames}
	DestroyScreenElement \{id = 0xa4a4627e}
endscript

script vocals_end_phrase_bad_comet_fx 
	Obj_GetID
	vocalshighway_getid Player = <Player>
	<vocals_highway_id> :desc_resolvealias Name = alias_pitch_indicator param = pitch_indicator
	if (($current_num_players) > 1)
		Pos = (0.0, 8.0)
	else
		Pos = (0.0, 8.0)
	endif
	if ScreenElementExists \{id = 0xa4a4627e}
		DestroyScreenElement \{id = 0xa4a4627e}
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = 0xa4a4627e
		parent = <pitch_indicator>
		material = vocal_phrase
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.04
		num_uv_frames = (6.0, 1.0)
		rgba = [255 0 0 255]
		Pos = <Pos>
		Scale = 0.5
		z_priority = 19.0
	}
	Wait \{12
		frames}
	DestroyScreenElement \{id = 0xa4a4627e}
endscript

script vocals_paint_star_power_on \{Player = 1}
	vocalshighway_getid Player = <Player>
	if NOT ScreenElementExists id = {<vocals_highway_id> child = ekgelement}
		return
	endif
	vocalshighway_getmaterial Player = <Player>
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors0' X = 0.0 y = 1.0 z = 2.0 w = 1.0
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors1' X = 0.0 y = 0.4 z = 0.6 w = 5.0
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors2' X = 0.120000005 y = 0.75 z = 1.0 w = 1.0
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors3' X = 0.0 y = 0.0 z = 0.0 w = 1.0
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors4' X = 0.0 y = 1.4 z = 1.4 w = 2.0
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors5' X = 0.0 y = 0.0 z = 0.1 w = 1.0
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors6' X = 0.2 y = 0.6 z = 1.0 w = 1.0
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors7' X = 0.3 y = 1.0 z = 1.0 w = 1.0
endscript

script vocals_paint_star_power_off \{Player = 1}
	vocalshighway_getid Player = <Player>
	if NOT ScreenElementExists id = {<vocals_highway_id> child = ekgelement}
		return
	endif
	vocalshighway_getmaterial Player = <Player>
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors0' X = 2.0 y = 1.0 z = 0.0 w = 1.0
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors1' X = 1.2 y = 0.8 z = 0.0 w = 5.0
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors2' X = 1.0 y = 0.75 z = 0.120000005 w = 0.8
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors3' X = 0.0 y = 0.0 z = 0.0 w = 0.8
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors4' X = 2.0 y = 1.0 z = 0.0 w = 1.2
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors5' X = 0.0 y = 0.0 z = 0.1 w = 0.8
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors6' X = 1.0 y = 0.6 z = 0.2 w = 1.0
	setmaterialproperty mat = <vocals_highway_material_text> prop = 'm_psColors7' X = 1.0 y = 1.0 z = 0.3 w = 1.0
endscript
