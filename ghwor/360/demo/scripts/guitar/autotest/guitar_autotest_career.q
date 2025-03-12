g_quest_2112_powers = [
	johnny_2
	echo_2
	judy_2
	dylan_2
]
g_quest_domination_powers = [
	johnny_2
	echo_2
	judy_2
	dylan_2
	lars_2
	axel_2
	casey_2
	pandora_2
]
g_quest_autotest_default_struct = {
	band_instruments = [
		guitar
		drum
	]
	band_difficulty = [
		expert
		expert
	]
	band_accuracy = [
		100
		100
	]
	star_power_usage = [
		on
		on
	]
	power_level = [
		judy_2
		lars_2
		echo_2
		dylan_2
	]
}
quest_autotest_songs = [
	{
		song_checksum = selfesteemgh6
		chapter = quest_chapter_johnny
		band_instruments = [
			guitar
			guitar
			drum
		]
		band_difficulty = [
			easy
			medium
			expert
		]
		band_accuracy = [
			100
			85
			72
		]
		star_power_usage = [
			off
			on
			on
		]
		power_level = power_1
	}
	{
		song_checksum = motivation
		chapter = quest_chapter_johnny
		band_instruments = [
			guitar
			bass
		]
		band_difficulty = [
			expert
			expert
		]
		band_accuracy = [
			95
			95
		]
		star_power_usage = [
			on
			on
		]
		power_level = power_domination
	}
	{
		song_checksum = dancingthroughsunday
		chapter = quest_chapter_johnny
		$g_quest_autotest_default_struct
	}
	{
		song_checksum = dancedance
		chapter = quest_chapter_newfemale
		$g_quest_autotest_default_struct
	}
]
