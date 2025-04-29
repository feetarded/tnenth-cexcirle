#a list of global resources that exist on all entities

enum Global {
	UNSET,#default set for new resources, used for error detection
	
	#global; all entities can use
	#health-relating resources
	HEALTH,
	DEFENSE,
	SHIELD,
	
	#speed relating resources
	MOVEMENT_SPEED,
	
	#attack relating resources
	ATK,
	ATK_SPEED,
	CRIT_RATE,
	CRIT_DMG,
}
