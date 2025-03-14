debugcomplexstreams = 0
allstreamsets = {
	templates = {
		`default` = [
			{
				'%a%b'
			}
			{
				'%a%b?'
			}
		]
	}
	substitutions = {
		a = [
			'Bonk'
			'Grind'
			'Land'
			'Ollie'
			'Roll'
			'Slide'
		]
		b = [
			'Car'
			'Metal'
			'Pipe'
			'Plastic'
			'Wood'
			'Wire'
			'Water'
			'Tile'
			'Snow'
			'Skylights'
			'Sand'
			'Sidewalk'
			'Rock'
			'Plexiglass'
			'Mulch'
			'Mud'
			'Leaves'
			'Ice'
			'Gravel'
			'Grass'
			'Glass'
		]
	}
	streamparams = {
		vol = 150
		dropoff = 100
		id = PedVOStream
	}
	streamsets = [
		{
			'Shotgun_vx_tohell??'
		}
	]
	Killed = {
		streamparams = {
			vol = 350
			dropoff = 500
			id = PedVOStream2
		}
		streamsets = [
			{
				'Shotgun_vx_tohell??'
				weight = 31
			}
		]
		Miner = {
			streamparams = {
				vol = 238
				dropoff = 100
				id = PedVOStream
			}
			streamsets = [
				{
					'Miner_VX_Ouch_?'
				}
			]
			Apache = {
				streamparams = {
					vol = 200
					dropoff = 100
					id = PedVOStream
				}
				streamsets = [
					{
						'Miner_VX_Shouts_?'
					}
					{
						'Miner_VX_Shouts_??'
					}
					{
						'Miner_VX_Shouts_21'
						weight = 0
					}
					{
						'Shotgun_vx_tohell??'
					}
					{
						'Shotgun_vx_tohell02'
					}
				]
			}
		}
	}
}
