terrain_types = [
	{
		checksum = terrain_default
		desc = 'Default'
	}
	{
		checksum = terrain_concsmooth
		desc = 'ConcSmooth'
	}
	{
		checksum = terrain_concrough
		desc = 'ConcRough'
	}
	{
		checksum = terrain_metalsmooth
		desc = 'MetalSmooth'
	}
	{
		checksum = terrain_metalrough
		desc = 'MetalRough'
	}
	{
		checksum = terrain_metalcorrugated
		desc = 'MetalCorrugated'
	}
	{
		checksum = terrain_metalgrating
		desc = 'MetalGrating'
	}
	{
		checksum = terrain_metaltin
		desc = 'MetalTin'
	}
	{
		checksum = terrain_wood
		desc = 'Wood'
	}
	{
		checksum = terrain_woodmasonite
		desc = 'WoodMasonite'
	}
	{
		checksum = terrain_woodplywood
		desc = 'WoodPlywood'
	}
	{
		checksum = terrain_woodflimsy
		desc = 'WoodFlimsy'
	}
	{
		checksum = terrain_woodshingle
		desc = 'WoodShingle'
	}
	{
		checksum = terrain_woodpier
		desc = 'WoodPier'
	}
	{
		checksum = terrain_brick
		desc = 'Brick'
	}
	{
		checksum = terrain_tile
		desc = 'Tile'
	}
	{
		checksum = terrain_asphalt
		desc = 'Asphalt'
	}
	{
		checksum = terrain_rock
		desc = 'Rock'
	}
	{
		checksum = terrain_gravel
		desc = 'Gravel'
	}
	{
		checksum = terrain_sidewalk
		desc = 'Sidewalk'
	}
	{
		checksum = terrain_grass
		desc = 'Grass'
	}
	{
		checksum = terrain_grassdried
		desc = 'GrassDried'
	}
	{
		checksum = terrain_dirt
		desc = 'Dirt'
	}
	{
		checksum = terrain_dirtpacked
		desc = 'DirtPacked'
	}
	{
		checksum = terrain_water
		desc = 'Water'
	}
	{
		checksum = terrain_ice
		desc = 'Ice'
	}
	{
		checksum = terrain_snow
		desc = 'Snow'
	}
	{
		checksum = terrain_sand
		desc = 'Sand'
	}
	{
		checksum = terrain_plexiglass
		desc = 'Plexiglass'
	}
	{
		checksum = terrain_fiberglass
		desc = 'Fiberglass'
	}
	{
		checksum = terrain_carpet
		desc = 'Carpet'
	}
	{
		checksum = terrain_conveyor
		desc = 'Conveyor'
	}
	{
		checksum = terrain_chainlink
		desc = 'Chainlink'
	}
	{
		checksum = terrain_metalfuture
		desc = 'MetalFuture'
	}
	{
		checksum = terrain_generic1
		desc = 'Generic1'
	}
	{
		checksum = terrain_generic2
		desc = 'Generic2'
	}
	{
		checksum = terrain_wheels
		desc = 'Wheels'
	}
	{
		checksum = terrain_wetconc
		desc = 'WetConc'
	}
	{
		checksum = terrain_metalfence
		desc = 'MetalFence'
	}
	{
		checksum = terrain_grindtrain
		desc = 'GrindTrain'
	}
	{
		checksum = terrain_grindrope
		desc = 'GrindRope'
	}
	{
		checksum = terrain_grindwire
		desc = 'Grindwire'
	}
	{
		checksum = terrain_grindconc
		desc = 'GrindConc'
	}
	{
		checksum = terrain_grindroundmetalpole
		desc = 'GrindRoundMetalPole'
	}
	{
		checksum = terrain_grindchainlink
		desc = 'GrindChainLink'
	}
	{
		checksum = terrain_grindmetal
		desc = 'GrindMetal'
	}
	{
		checksum = terrain_grindwoodrailing
		desc = 'GrindWoodRailing'
	}
	{
		checksum = terrain_grindwoodlog
		desc = 'GrindWoodLog'
	}
	{
		checksum = terrain_grindwood
		desc = 'GrindWood'
	}
	{
		checksum = terrain_grindplastic
		desc = 'GrindPlastic'
	}
	{
		checksum = terrain_grindelectricwire
		desc = 'GrindElectricWire'
	}
	{
		checksum = terrain_grindcable
		desc = 'GrindCable'
	}
	{
		checksum = terrain_grindchain
		desc = 'GrindChain'
	}
	{
		checksum = terrain_grindplasticbarrier
		desc = 'GrindPlasticBarrier'
	}
	{
		checksum = terrain_grindneonlight
		desc = 'GrindNeonLight'
	}
	{
		checksum = terrain_grindglassmonster
		desc = 'GrindGlassMonster'
	}
	{
		checksum = terrain_grindbanyontree
		desc = 'GrindBAnyOnTree'
	}
	{
		checksum = terrain_grindbrassrail
		desc = 'GrindBrassRail'
	}
	{
		checksum = terrain_grindcatwalk
		desc = 'GrindCatwalk'
	}
	{
		checksum = terrain_grindtankturret
		desc = 'GrindTankTurret'
	}
]
terrain_actions = [
]

script setterraindefault 
	loadterrainsounds \{terrain = terrain_default}
endscript

script 0x0736b8d5 
	loadterrainsounds \{terrain = terrain_metalsmooth}
endscript
standard_terrain_default = {
	soundactions = {
		soundassets = terrain_default_soundassets
		0x61b6260a = 0xeee771c9
		0x36d0c957 = 0x34320b0a
		0x3f5389d1 = 0x2a8b465a
		0xb0652e41 = 0xb287ec1c
		0xca9b69e9 = 0xc879abb4
		0x81688606 = 0x94b0498d
		0x71bfb3fd = 0xf528f846
		0x7e0c6033 = 0xfa9b2b88
		0x29264ff4 = 0x3cfe807f
		0x7559894f = 0xf1cec2f4
		0x7aea5a81 = 0xfe7d113a
		0x27e6bdd3 = 0x5d993fb4
		0xf593f7df = 0x67028679
		0xc0fdcadd = 0xffda5d71
		0x32c8ceec = 0xed9706b8
		0x46482dcb = 0x796fba67
		0x3cb66a63 = 0x0391fdcf
		0x8cf3c13b = 0x53ac096f
		0xea2f27a8 = 0x1ab3f67b
		0xe59cf466 = 0x150025b5
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				0x85a892bd
			}
		]
	}
}
standard_terrain_concsmooth = {
	soundactions = {
		soundassets = terrain_concsmooth_soundassets
		0x36d0c957 = 0x93c0d9cb
		0x81688606 = 0x78744979
		0xb0652e41 = 0x15753edd
		0xca9b69e9 = 0x6f8b7975
		0x71bfb3fd = 0xfa06c5af
		0x7e0c6033 = 0xf5b51661
		0x29264ff4 = 0xd03a808b
		0x7559894f = 0xfee0ff1d
		0x7aea5a81 = 0xf1532cd3
		0x27e6bdd3 = 0xe7a5cdb1
	}
}
standard_terrain_concrough = {
	soundactions = {
		soundassets = terrain_concrough_soundassets
		0x36d0c957 = 0xdc18c4a8
		0x81688606 = 0xac80a186
		0xb0652e41 = 0x5aad23be
		0xca9b69e9 = 0x20536416
		0x71bfb3fd = 0x729c7032
		0x7e0c6033 = 0x7d2fa3fc
		0x29264ff4 = 0x04ce6874
		0x7559894f = 0x767a4a80
		0x7aea5a81 = 0x79c9994e
		0x27e6bdd3 = 0xca73d6d4
	}
}
standard_terrain_brick = {
	soundactions = {
		soundassets = terrain_default_soundassets
		0x36d0c957 = 0x79892839
		0x81688606 = 0x2b2d93b8
		0xb0652e41 = 0xff3ccf2f
		0xca9b69e9 = 0x85c28887
		0x71bfb3fd = 0x2df21a79
		0x7e0c6033 = 0x2241c9b7
		0x29264ff4 = 0x83635a4a
		0x7559894f = 0x291420cb
		0x7aea5a81 = 0x26a7f305
		0x27e6bdd3 = 0x0b95664d
	}
}
standard_terrain_asphalt = {
	soundactions = {
		soundassets = terrain_asphalt_soundassets
		0x36d0c957 = 0x94300ab7
		0x81688606 = 0x21c084bd
		0xb0652e41 = 0x1285eda1
		0xca9b69e9 = 0x687baa09
		0x71bfb3fd = 0x08403b01
		0x7e0c6033 = 0x07f3e8cf
		0x29264ff4 = 0x898e4d4f
		0x7559894f = 0x0ca601b3
		0x7aea5a81 = 0x0315d27d
		0x27e6bdd3 = 0x7bf57fd5
	}
}
standard_terrain_sidewalk = {
	soundactions = {
		soundassets = terrain_sidewalk_soundassets
		0x36d0c957 = 0xde517235
		0x81688606 = 0x223c07c9
		0xb0652e41 = 0x58e49523
		0xca9b69e9 = 0x221ad28b
		0x71bfb3fd = 0x2e6e5618
		0x7e0c6033 = 0x21dd85d6
		0x29264ff4 = 0x8a72ce3b
		0x7559894f = 0x2a886caa
		0x7aea5a81 = 0x253bbf64
		0x27e6bdd3 = 0x2c9e3673
	}
}
0x1dcb8412 = {
	soundactions = {
		soundassets = 0x83b4901e
		0x36d0c957 = 0x262e43bc
		0x81688606 = 0xb6a0437c
		0xb0652e41 = 0xa09ba4aa
		0xca9b69e9 = 0xda65e302
		0x71bfb3fd = 0x59c75fe7
		0x7e0c6033 = 0x56748c29
		0x29264ff4 = 0x1eee8a8e
		0x7559894f = 0x5d216555
		0x7aea5a81 = 0x5292b69b
		0x27e6bdd3 = 0x9701ed34
	}
}
0x403c5e4f = {
	soundactions = {
		soundassets = 0x4883da65
		0x36d0c957 = 0x5c385592
		0x3f5389d1 = 0xd4375772
		0xb0652e41 = 0xda8db284
		0xca9b69e9 = 0xa073f52c
		0x27e6bdd3 = 0x68d22b5f
	}
}
0xb9553858 = {
	soundactions = {
		soundassets = 0xfd7206bb
		0x36d0c957 = 0x9e01049e
		0x3f5389d1 = 0xdd432208
		0xb0652e41 = 0x18b4e388
		0xca9b69e9 = 0x624aa420
		0x27e6bdd3 = 0xd80bc708
	}
}
0x83ae2d19 = {
	soundactions = {
		soundassets = 0xc1e6a06f
		0x36d0c957 = 0x7da67129
		0x3f5389d1 = 0x88a5a352
		0xb0652e41 = 0xfb13963f
		0xca9b69e9 = 0x81edd197
		0x27e6bdd3 = 0x53e09963
	}
}
0x2e68656d = {
	soundactions = {
		soundassets = 0x3b9947d5
		0x36d0c957 = 0xad36a371
		0x3f5389d1 = 0xedc5ea46
		0xb0652e41 = 0x2b834467
		0xca9b69e9 = 0x517d03cf
		0x27e6bdd3 = 0x495f2d57
	}
}
0x37fee9d2 = {
	soundactions = {
		soundassets = 0x5fed40f7
		0x36d0c957 = 0x2a9cac98
		0x3f5389d1 = 0x34941a95
		0xb0652e41 = 0xac294b8e
		0xca9b69e9 = 0xd6d70c26
		0x27e6bdd3 = 0x565cffc9
	}
}
standard_terrain_wood = {
	soundactions = {
		soundassets = terrain_wood_soundassets
		0x36d0c957 = 0x1386b166
		0x81688606 = 0xd093d044
		0x3f5389d1 = 0x6ea8df93
		0xb0652e41 = 0x95335670
		0xca9b69e9 = 0xefcd11d8
		0x71bfb3fd = 0xc3b7285d
		0x7e0c6033 = 0xcc04fb93
		0x29264ff4 = 0x78dd19b6
		0x7559894f = 0xc75112ef
		0x7aea5a81 = 0xc8e2c121
		0x27e6bdd3 = 0xbf656639
	}
}
0x05a07348 = {
	soundactions = {
		soundassets = 0x9684b79e
		0x36d0c957 = 0x38a931d7
		0x3f5389d1 = 0xd2e57309
		0xb0652e41 = 0xbe1cd6c1
		0xca9b69e9 = 0xc4e29169
		0x27e6bdd3 = 0xaf0351cf
	}
}
0x8f810f76 = {
	soundactions = {
		soundassets = 0x64451804
		0x36d0c957 = 0x025c4160
		0x3f5389d1 = 0x87daa056
		0xb0652e41 = 0x84e9a676
		0xca9b69e9 = 0xfe17e1de
		0x27e6bdd3 = 0x54822279
	}
}
0x6215f10b = {
	soundactions = {
		soundassets = 0x649b44f6
		0x36d0c957 = 0xf8a1811d
		0x3f5389d1 = 0xa9945017
		0xb0652e41 = 0x7e14660b
		0xca9b69e9 = 0x04ea21a3
		0x27e6bdd3 = 0x55771d8f
	}
}
0x3a30ea87 = {
	soundactions = {
		soundassets = 0x8ec8d04f
		0x36d0c957 = 0xcb87475d
		0x3f5389d1 = 0xdf7b3741
		0xb0652e41 = 0x4d32a04b
		0xca9b69e9 = 0x37cce7e3
		0x27e6bdd3 = 0xd7090629
	}
}
0x69812d10 = {
	soundactions = {
		soundassets = 0x4fd01d7b
		0x36d0c957 = 0x3bf331c5
		0x3f5389d1 = 0x215f5841
		0xb0652e41 = 0xbd46d6d3
		0xca9b69e9 = 0xc7b8917b
		0x27e6bdd3 = 0xd7f72246
	}
}
0x1ae39288 = {
	soundactions = {
		soundassets = 0x1c73ef6e
		0x36d0c957 = 0x6fe72c88
		0x3f5389d1 = 0x29667171
		0xb0652e41 = 0xe952cb9e
		0x27e6bdd3 = 0xf1262bc3
	}
}
0xc44970ea = {
	soundactions = {
		soundassets = 0xa4064cd9
		0x36d0c957 = 0xae19c9b6
		0x3f5389d1 = 0xe8c6923f
		0xb0652e41 = 0x28ac2ea0
		0x27e6bdd3 = 0x6083e7b7
	}
	treadactions = {
		skaterskatingparticleparms = [
			{
				0x08fdbc6f
			}
		]
		0xa2c299ee = [
			{
				0xd9131549
			}
		]
	}
}
standard_terrain_grass = {
	soundactions = {
		soundassets = terrain_grass_soundassets
		0x36d0c957 = 0xc41ee4f0
		0x3f5389d1 = 0x771371b7
		0xb0652e41 = 0x42ab03e6
		0x27e6bdd3 = 0x837f3946
	}
	treadactions = {
		skaterskatingparticleparms = [
			{
				0xfd8ea1cd
			}
		]
	}
}
standard_terrain_grassdried = {
	soundactions = {
		soundassets = 0x194fda71
		0x36d0c957 = 0x3202183c
		0x3f5389d1 = 0xe537e3d0
		0xb0652e41 = 0xb4b7ff2a
		0x27e6bdd3 = 0x503be92f
	}
}
standard_terrain_dirt = {
	soundactions = {
		soundassets = terrain_dirt_soundassets
		0x36d0c957 = 0x457b39c0
		0x3f5389d1 = 0x514b24c6
		0xb0652e41 = 0xc3ceded6
		0x27e6bdd3 = 0xa45b20b9
	}
	treadactions = {
		skaterskatingparticleparms = [
			{
				0x0fdca876
			}
		]
		0xa2c299ee = [
			{
				0x5c46f3f2
			}
		]
	}
}
0x64476ab1 = {
	soundactions = {
		soundassets = 0xce8fac9c
		0x36d0c957 = 0xf1f5aa55
		0x3f5389d1 = 0xd19acd9e
		0xb0652e41 = 0x77404d43
		0x27e6bdd3 = 0xc16b2896
	}
}
standard_terrain_water = {
	soundactions = {
		soundassets = terrain_water_soundassets
		0x36d0c957 = 0x8df45eb2
		0x3f5389d1 = 0xef88bbb1
		0xb0652e41 = 0x0b41b9a4
	}
	treadactions = {
		skaterskatingparticleparms = [
			{
				0x68193e9b
			}
			{
				0xefbff5d8
			}
		]
		0xa2c299ee = [
			{
				0xc09a9a60
			}
			{
				0x3b83651f
			}
		]
		herocontinuousparticleparams = 0xa375f152
	}
}
0x6ce353d7 = {
	soundactions = {
		soundassets = 0x8a878c92
		0x36d0c957 = 0x5e59c7eb
		0x3f5389d1 = 0xfdecff78
		0xb0652e41 = 0xd8ec20fd
		0x27e6bdd3 = 0x882e19e9
	}
}
0x1b298c99 = {
	soundactions = {
		soundassets = 0x0fa82b1b
		0x36d0c957 = 0x078290c1
		0x3f5389d1 = 0x260eedf9
		0xb0652e41 = 0x813777d7
		0x27e6bdd3 = 0x124a484d
	}
}
standard_terrain_sand = {
	soundactions = {
		soundassets = 0xcfe2c3e4
		0x36d0c957 = 0xfd97f9ec
		0x3f5389d1 = 0x632ba4e5
		0xb0652e41 = 0x7b221efa
		0x27e6bdd3 = 0x060e314b
	}
	treadactions = {
		skaterskatingparticleparms = [
			{
				0x269ee906
			}
		]
		0xa2c299ee = [
			{
				0x7504b282
			}
		]
	}
}
0x5b25802e = {
	soundactions = {
		soundassets = 0xc16aea3e
		0x36d0c957 = 0x16d04d1c
		0x3f5389d1 = 0xde7d114d
		0xb0652e41 = 0x9065aa0a
		0x27e6bdd3 = 0xdebe4c24
	}
}
0xd06d5f49 = {
	soundactions = {
		soundassets = 0x98c4d1a0
		0x36d0c957 = 0xfb3711d0
		0x3f5389d1 = 0x4c42788a
		0xb0652e41 = 0x7d82f6c6
		0x27e6bdd3 = 0xdb2c245e
	}
}
0xd597ede6 = {
	soundactions = {
		soundassets = 0xd8b86494
		0x36d0c957 = 0x7b1f9dc5
		0x3f5389d1 = 0x211fb4ed
		0xb0652e41 = 0xfdaa7ad3
		0x27e6bdd3 = 0x08978d69
	}
}
0x2dd5c33b = {
	soundactions = {
		soundassets = 0xe874720f
		0x36d0c957 = 0x6efe771a
		0x3f5389d1 = 0x37669a42
		0xb0652e41 = 0xe84b900c
		0x27e6bdd3 = 0x4ee84a3e
	}
}
0xc102e9d1 = {
	soundactions = {
		soundassets = 0xc7ef4400
		0x36d0c957 = 0x93041ac7
		0x3f5389d1 = 0xcff9ce46
		0xb0652e41 = 0x15b1fdd1
		0x27e6bdd3 = 0x497d1173
	}
}
0xd7952696 = {
	soundactions = {
		soundassets = 0x3ebac4b3
		0xca9b69e9 = 0xf11ceb01
		0x81688606 = 0x2f826bce
		0x71bfb3fd = 0xf683a36e
		0x7e0c6033 = 0xf93070a0
		0x29264ff4 = 0x87cca23c
		0x7559894f = 0xf26599dc
		0x7aea5a81 = 0xfdd64a12
	}
}
0xfdf53c27 = {
	soundactions = {
		soundassets = 0x53e4edcb
		0x36d0c957 = 0xab402bac
		0x3f5389d1 = 0x15a132a7
		0xb0652e41 = 0x2df5ccba
		0x27e6bdd3 = 0x9eaa9b61
	}
}
0x54f0c647 = {
	soundactions = {
		soundassets = 0xc5d24338
		0xca9b69e9 = 0x732e0e40
	}
}
0xcdf997fd = {
	soundactions = {
		soundassets = 0x78182ff6
	}
}
0x49261c56 = {
	soundactions = {
		soundassets = 0xa98ed4f1
		0xca9b69e9 = 0xb021159c
	}
}
0x516dd8d1 = {
	soundactions = {
		soundassets = 0xb720630e
		0x81688606 = 0x6cb1e65c
		0x71bfb3fd = 0x13997788
		0x7e0c6033 = 0x1c2aa446
		0x29264ff4 = 0xc4ff2fae
		0x7559894f = 0x177f4d3a
		0x7aea5a81 = 0x18cc9ef4
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				0x85a892bd
			}
			{
				0x8f423271
			}
		]
		skaterslideparticleparms = [
		]
	}
}
0x2aa1ca80 = {
	soundactions = {
		soundassets = 0x15ccb67c
		0x81688606 = 0xc6e83888
		0x71bfb3fd = 0x60c2ed97
		0x7e0c6033 = 0x6f713e59
		0x29264ff4 = 0x6ea6f17a
		0x7559894f = 0x6424d725
		0x7aea5a81 = 0x6b9704eb
	}
}
0xd82626ae = {
	soundactions = {
		soundassets = 0xd74ae0f7
		0x81688606 = 0xbefba9ec
		0x71bfb3fd = 0x1766e798
		0x7e0c6033 = 0x18d53456
		0x29264ff4 = 0x16b5601e
		0x7559894f = 0x1380dd2a
		0x7aea5a81 = 0x1c330ee4
	}
}
0x468bb8c8 = {
	soundactions = {
		soundassets = 0xeedb0289
		0x81688606 = 0xb7eb7149
		0x71bfb3fd = 0xdd57c0d2
		0x7e0c6033 = 0xd2e4131c
		0x29264ff4 = 0x1fa5b8bb
		0x7559894f = 0xd9b1fa60
		0x7aea5a81 = 0xd60229ae
	}
}
0xd078e59c = {
	soundactions = {
		soundassets = 0xe2de832a
		0x81688606 = 0xea2ab2bc
		0x71bfb3fd = 0x383dc518
		0x7e0c6033 = 0x378e16d6
		0x29264ff4 = 0x42647b4e
		0x7559894f = 0x3cdbffaa
		0x7aea5a81 = 0x33682c64
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				0x1c233a03
			}
		]
		skaterslideparticleparms = [
			{
				0x1c233a03
			}
		]
	}
}
0xb5f115a7 = {
	soundactions = {
		soundassets = 0x0a565a97
		0x81688606 = 0x2b51c1b3
		0x71bfb3fd = 0x1641515c
		0x7e0c6033 = 0x19f28292
		0x29264ff4 = 0x831f0841
		0x7559894f = 0x12a76bee
		0x7aea5a81 = 0x1d14b820
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				0x1c233a03
			}
		]
		skaterslideparticleparms = [
			{
				0x1c233a03
			}
		]
	}
}
0x0969bcfb = {
	soundactions = {
		soundassets = 0x654af639
		0x81688606 = 0x4bf9f9de
		0x71bfb3fd = 0xde199d13
		0x7e0c6033 = 0xd1aa4edd
		0x29264ff4 = 0xe3b7302c
		0x7559894f = 0xdaffa7a1
		0x7aea5a81 = 0xd54c746f
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				0x1c233a03
			}
		]
		skaterslideparticleparms = [
			{
				0x1c233a03
			}
		]
	}
}
0xc73e1997 = {
	soundactions = {
		soundassets = 0x4384402b
		0x81688606 = 0x93806971
		0x71bfb3fd = 0x40f7b4e9
		0x7e0c6033 = 0x4f446727
		0x29264ff4 = 0x3bcea083
		0x7559894f = 0x44118e5b
		0x7aea5a81 = 0x4ba25d95
	}
}
0x37eb54cb = {
	soundactions = {
		soundassets = 0x825532ff
		0x81688606 = 0xb24edc5d
		0x71bfb3fd = 0x7096720a
		0x7e0c6033 = 0x7f25a1c4
		0x29264ff4 = 0x1a0015af
		0x7559894f = 0x747048b8
		0x7aea5a81 = 0x7bc39b76
	}
}
0x5e061207 = {
	soundactions = {
		soundassets = 0x41cd1344
		0x81688606 = 0xa095767b
		0x71bfb3fd = 0xb05537c2
		0x7e0c6033 = 0xbfe6e40c
		0x29264ff4 = 0x08dbbf89
		0x7559894f = 0xb4b30d70
		0x7aea5a81 = 0xbb00debe
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				0x2c3a9433
			}
		]
		skaterslideparticleparms = [
		]
	}
}
0xa20088d5 = {
	soundactions = {
		soundassets = 0x2d398796
		0x81688606 = 0x3d3191cc
		0x71bfb3fd = 0xd88811d0
		0x7e0c6033 = 0xd73bc21e
		0x29264ff4 = 0x957f583e
		0x7559894f = 0xdc6e2b62
		0x7aea5a81 = 0xd3ddf8ac
	}
}
0x871fee6f = {
	soundactions = {
		soundassets = 0x9c5c0881
		0x81688606 = 0x39b6ef81
		0x71bfb3fd = 0x9c361eff
		0x7e0c6033 = 0x9385cd31
		0x29264ff4 = 0x91f82673
		0x7559894f = 0x98d0244d
		0x7aea5a81 = 0x9763f783
	}
}
0x6384bbe6 = {
	soundactions = {
		soundassets = 0x943a1906
		0x81688606 = 0x5a0f0233
		0x71bfb3fd = 0x6bcbfe0e
		0x7e0c6033 = 0x64782dc0
		0x29264ff4 = 0xf241cbc1
		0x7559894f = 0x6f2dc4bc
		0x7aea5a81 = 0x609e1772
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				0x2c3a9433
			}
		]
		skaterslideparticleparms = [
		]
	}
}
0xbf400a24 = {
	soundactions = {
		soundassets = 0x84bedd8d
		0x81688606 = 0x676260d6
		0x71bfb3fd = 0x490209b1
		0x7e0c6033 = 0x46b1da7f
		0x29264ff4 = 0xcf2ca924
		0x7559894f = 0x4de43303
		0x7aea5a81 = 0x4257e0cd
	}
}
0x69a11604 = {
	soundactions = {
		soundassets = 0x0609d0dd
		0x81688606 = 0xa3317177
		0x71bfb3fd = 0xacaeb6a8
		0x7e0c6033 = 0xa31d6566
		0x29264ff4 = 0x0b7fb885
		0x7559894f = 0xa8488c1a
		0x7aea5a81 = 0xa7fb5fd4
	}
}
0x77eb1fb0 = {
	soundactions = {
		soundassets = 0xd71863a0
		0x81688606 = 0x7d153c76
		0x71bfb3fd = 0xfcd3d12b
		0x7e0c6033 = 0xf36002e5
		0x29264ff4 = 0xd55bf584
		0x7559894f = 0xf835eb99
		0x7aea5a81 = 0xf7863857
	}
}
0x63b51e53 = {
	soundactions = {
		soundassets = 0x9eb097d1
		0x81688606 = 0x4ff02d45
		0x71bfb3fd = 0xe877190a
		0x7e0c6033 = 0xe7c4cac4
		0x29264ff4 = 0xe7bee4b7
		0x7559894f = 0xec9123b8
		0x7aea5a81 = 0xe322f076
	}
}
0x82aa41a9 = {
	soundactions = {
		soundassets = 0xf156494d
		0x81688606 = 0xfe36d8dc
		0x71bfb3fd = 0xbaf6f5cd
		0x7e0c6033 = 0xb5452603
		0x29264ff4 = 0x5678112e
		0x7559894f = 0xbe10cf7f
		0x7aea5a81 = 0xb1a31cb1
	}
}
0xda8fa8a2 = {
	soundactions = {
		soundassets = 0xa702537b
		0x81688606 = 0x050f1c34
	}
}
0x84ea72c1 = {
	soundactions = {
		soundassets = 0xf2a37a30
		0x81688606 = 0xae3c1aa9
		0x71bfb3fd = 0xe5b85e33
		0x7e0c6033 = 0xea0b8dfd
		0x29264ff4 = 0x0672d35b
		0x7559894f = 0xe15e6481
		0x7aea5a81 = 0xeeedb74f
	}
}
0x858f9cc3 = {
	soundactions = {
		soundassets = 0x4b6eb779
		0x81688606 = 0x792aaf1a
		0x71bfb3fd = 0x2dc5711c
		0x7e0c6033 = 0x2276a2d2
		0x29264ff4 = 0xd16466e8
		0x7559894f = 0x29234bae
		0x7aea5a81 = 0x26909860
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				0x2c3a9433
			}
		]
		skaterslideparticleparms = [
		]
	}
}
terrain_default = standard_terrain_default
terrain_concsmooth = standard_terrain_concsmooth
terrain_concrough = standard_terrain_concrough
terrain_metalsmooth = 0x403c5e4f
terrain_metalrough = 0xb9553858
terrain_metalcorrugated = 0x83ae2d19
terrain_metalgrating = 0x2e68656d
terrain_metaltin = 0x37fee9d2
terrain_wood = standard_terrain_wood
terrain_woodmasonite = 0x05a07348
terrain_woodplywood = 0x8f810f76
terrain_woodflimsy = 0x6215f10b
terrain_woodshingle = 0x3a30ea87
terrain_woodpier = 0x69812d10
terrain_brick = standard_terrain_brick
terrain_tile = 0x5b25802e
terrain_asphalt = standard_terrain_asphalt
terrain_rock = 0x1ae39288
terrain_gravel = 0xc44970ea
terrain_sidewalk = standard_terrain_sidewalk
terrain_grass = standard_terrain_grass
terrain_grassdried = standard_terrain_grassdried
terrain_dirt = standard_terrain_dirt
terrain_dirtpacked = 0x64476ab1
terrain_water = standard_terrain_water
terrain_ice = 0x6ce353d7
terrain_snow = 0x1b298c99
terrain_sand = standard_terrain_sand
terrain_plexiglass = 0xd06d5f49
terrain_fiberglass = 0xd597ede6
terrain_carpet = 0x2dd5c33b
terrain_conveyor = 0xc102e9d1
terrain_chainlink = 0xd7952696
terrain_metalfuture = 0xfdf53c27
terrain_generic1 = 0x54f0c647
terrain_generic2 = 0xcdf997fd
terrain_wheels = 0x2007c190
terrain_wetconc = 0x1dcb8412
terrain_metalfence = 0x49261c56
terrain_grindtrain = 0xda8fa8a2
terrain_grindrope = 0x84ea72c1
terrain_grindwire = 0x858f9cc3
terrain_grindconc = 0x516dd8d1
terrain_grindroundmetalpole = 0x2aa1ca80
terrain_grindchainlink = 0xd82626ae
terrain_grindmetal = 0x468bb8c8
terrain_grindwoodrailing = 0xd078e59c
terrain_grindwoodlog = 0xb5f115a7
terrain_grindwood = 0x0969bcfb
terrain_grindplastic = 0xc73e1997
terrain_grindelectricwire = 0x5e061207
terrain_grindcable = 0xa20088d5
terrain_grindchain = 0x37eb54cb
terrain_grindplasticbarrier = 0x871fee6f
terrain_grindneonlight = 0x6384bbe6
terrain_grindglassmonster = 0xbf400a24
terrain_grindbanyontree = 0x69a11604
terrain_grindbrassrail = 0x77eb1fb0
terrain_grindcatwalk = 0x63b51e53
terrain_grindtankturret = 0x82aa41a9
