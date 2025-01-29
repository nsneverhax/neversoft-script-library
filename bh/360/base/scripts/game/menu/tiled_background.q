
script TileSprite \{parent = root_window
		container_type = ContainerElement
		tile_dims = (1280.0, 720.0)
		Pos = (0.0, 0.0)
		sprite_props = {
		}
		container_props = {
		}}
	if NOT GotParam \{texture}
		printf \{qs(0x49b2d7d0)}
		return
	endif
	CreateScreenElement {
		type = <container_type>
		parent = <parent>
		dims = <tile_dims>
		Pos = <Pos>
		just = [left top]
		child_anchor = [left top]
		<container_props>
	}
	<container_id> = <id>
	if NOT GotParam \{dims}
		CreateScreenElement {
			type = SpriteElement
			parent = <parent>
			texture = <texture>
		}
		GetScreenElementDims id = <id>
		if ((<width> < 1) || (<height> < 1))
			printf \{qs(0xd26c6605)}
			DestroyScreenElement id = <container_id>
			return
		endif
		DestroyScreenElement id = <id>
	else
		<width> = (<dims> [0])
		<height> = (<dims> [1])
	endif
	<container_id> :SetTags {
		width = <width>
		height = <height>
		Pos = <Pos>
	}
	if GotParam \{flip_h}
		<container_id> :SetTags {
			flip_h
		}
	endif
	if GotParam \{flip_v}
		<container_id> :SetTags {
			flip_v
		}
	endif
	<x> = 0
	<y> = 0
	<row> = 0
	<column> = 0
	<count> = 0
	begin
	<Flip> = {}
	if GotParam \{flip_h}
		Mod a = <row> b = (2)
		if (<Mod> = 0)
			<Flip> = {flip_h}
		endif
	endif
	if GotParam \{flip_v}
		Mod a = <column> b = (2)
		if (<Mod> = 0)
			<Flip> = {<Flip> flip_v}
		endif
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		texture = <texture>
		dims = <dims>
		just = [left top]
		Pos = (((1.0, 0.0) * <x>) + ((0.0, 1.0) * <y>))
		<sprite_props>
		<Flip>
	}
	<count> = (<count> + 1)
	<x> = (<x> + <width>)
	<column> = (<column> + 1)
	if (<x> > (<tile_dims> [0]))
		<x> = 0
		<y> = (<y> + <height>)
		<row> = (<row> + 1)
		<column> = 0
		if (<y> > (<tile_dims> [1]))
			return {id = <container_id> count = <count>}
		endif
	endif
	repeat
endscript

script TileSpriteLoop \{move_x = 1
		move_y = 0}
	GetTags
	Obj_GetID
	<id> = <objID>
	if GotParam \{flip_v}
		<width> = (<width> * 2)
	endif
	if GotParam \{flip_h}
		<height> = (<height> * 2)
	endif
	if ((<move_x> > <width>) || (<move_x> < (<width> * -1)))
		printf \{qs(0xb1db5e53)}
		return
	endif
	if ((<move_y> > <height>) || (<move_y> < (<height> * -1)))
		printf \{qs(0x352c22c3)}
		return
	endif
	<x> = 0
	<y> = 0
	begin
	<x> = (<x> + <move_x>)
	<y> = (<y> + <move_y>)
	if (<x> > <width>)
		<x> = (<x> - <width>)
		LegacyDoMorph {
			Pos = {((-1.0, 0.0) * <width>) relative}
		}
	endif
	if (<x> < (<width> * -1))
		<x> = (<width> + <x>)
		LegacyDoMorph {
			Pos = {((1.0, 0.0) * <width>) relative}
		}
	endif
	if (<y> > <height>)
		<y> = (<y> - <height>)
		LegacyDoMorph {
			Pos = {((0.0, -1.0) * <height>) relative}
		}
	endif
	if (<y> < (<height> * -1))
		<y> = (<height> + <y>)
		LegacyDoMorph {
			Pos = {((0.0, 1.0) * <height>) relative}
		}
	endif
	LegacyDoMorph {
		Pos = (((1.0, 0.0) * ((<Pos> [0]) + <x>)) + ((0.0, 1.0) * ((<Pos> [1]) + <y>)))
		time = 0.1
	}
	repeat
endscript
