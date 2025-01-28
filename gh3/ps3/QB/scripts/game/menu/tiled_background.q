
script TileSprite \{PARENT = root_window
		container_type = ContainerElement
		tile_dims = (1280.0, 720.0)
		Pos = (0.0, 0.0)
		sprite_props = {
		}
		container_props = {
		}}
	if NOT GotParam \{texture}
		Printf \{"TileSprite needs a texture"}
		return
	endif
	CreateScreenElement {
		Type = <container_type>
		PARENT = <PARENT>
		Dims = <tile_dims>
		Pos = <Pos>
		just = [LEFT Top]
		child_anchor = [LEFT Top]
		<container_props>
	}
	<container_id> = <Id>
	if NOT GotParam \{Dims}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <PARENT>
			texture = <texture>
		}
		GetScreenElementDims Id = <Id>
		if ((<width> < 1) || (<Height> < 1))
			Printf \{"why is the width or height not positive?"}
			DestroyScreenElement Id = <container_id>
			return
		endif
		DestroyScreenElement Id = <Id>
	else
		<width> = (<Dims> [0])
		<Height> = (<Dims> [1])
	endif
	<container_id> :SetTags {
		width = <width>
		Height = <Height>
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
	<X> = 0
	<Y> = 0
	<Row> = 0
	<column> = 0
	<count> = 0
	begin
	<Flip> = {}
	if GotParam \{flip_h}
		Mod A = <Row> B = (2)
		if (<Mod> = 0)
			<Flip> = {flip_h}
		endif
	endif
	if GotParam \{flip_v}
		Mod A = <column> B = (2)
		if (<Mod> = 0)
			<Flip> = {<Flip> flip_v}
		endif
	endif
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		texture = <texture>
		Dims = <Dims>
		just = [LEFT Top]
		Pos = (((1.0, 0.0) * <X>) + ((0.0, 1.0) * <Y>))
		<sprite_props>
		<Flip>
	}
	<count> = (<count> + 1)
	<X> = (<X> + <width>)
	<column> = (<column> + 1)
	if (<X> > (<tile_dims> [0]))
		<X> = 0
		<Y> = (<Y> + <Height>)
		<Row> = (<Row> + 1)
		<column> = 0
		if (<Y> > (<tile_dims> [1]))
			return {Id = <container_id> count = <count>}
		endif
	endif
	repeat
endscript

script TileSpriteLoop \{move_x = 1
		move_y = 0}
	GetTags
	if GotParam \{flip_v}
		<width> = (<width> * 2)
	endif
	if GotParam \{flip_h}
		<Height> = (<Height> * 2)
	endif
	if ((<move_x> > <width>) || (<move_x> < (<width> * -1)))
		Printf \{"move_x is greater then the width of the image"}
		return
	endif
	if ((<move_y> > <Height>) || (<move_y> < (<Height> * -1)))
		Printf \{"move_y is greater then the height of the image"}
		return
	endif
	<X> = 0
	<Y> = 0
	begin
	<X> = (<X> + <move_x>)
	<Y> = (<Y> + <move_y>)
	if (<X> > <width>)
		<X> = (<X> - <width>)
		DoMorph {
			Pos = {((-1.0, 0.0) * <width>) Relative}
		}
	endif
	if (<X> < (<width> * -1))
		<X> = (<width> + <X>)
		DoMorph {
			Pos = {((1.0, 0.0) * <width>) Relative}
		}
	endif
	if (<Y> > <Height>)
		<Y> = (<Y> - <Height>)
		DoMorph {
			Pos = {((0.0, -1.0) * <Height>) Relative}
		}
	endif
	if (<Y> < (<Height> * -1))
		<Y> = (<Height> + <Y>)
		DoMorph {
			Pos = {((0.0, 1.0) * <Height>) Relative}
		}
	endif
	DoMorph {
		Pos = (((1.0, 0.0) * ((<Pos> [0]) + <X>)) + ((0.0, 1.0) * ((<Pos> [1]) + <Y>)))
		Time = 0.1
	}
	repeat
endscript
