hostage_standard = {
	can_be_taken_hostage = true
	min_hostage_time_until_escape = 15
	max_hostage_time_until_escape = 25
	subduable_hostage = false
}
hostage_civillian = {
	$hostage_standard
	min_hostage_time_until_escape = 40
	max_hostage_time_until_escape = 80
}
hostage_deputy = {
	$hostage_standard
	min_hostage_time_until_escape = 20
	max_hostage_time_until_escape = 40
}
hostage_sheriff = {
	$hostage_standard
	min_hostage_time_until_escape = 10
	max_hostage_time_until_escape = 20
}
hostage_permanent = {
	hostage_standard
	can_be_taken_hostage = true
	min_hostage_time_until_escape = 1000000
	max_hostage_time_until_escape = 1000000
}
hostage_boss = {
	hostage_standard
	can_be_taken_hostage = true
	min_hostage_time_until_escape = 0.5
	max_hostage_time_until_escape = 1.0
}
hostage_immune = {
	hostage_standard
	can_be_taken_hostage = false
	min_hostage_time_until_escape = 0.0
	max_hostage_time_until_escape = 0.0
}
