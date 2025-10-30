extends Stat
class_name MaxHealthStat
# max health is automatically added to an entity (by HealthStat) if a health stat is present but not this. 

# # scuffed but ensures that health cannot exist without max health 
# # you really shouldnt need to add a max health stat manually before runtime
# # health will prioritise using this max_health value instead of its own if it is present before runtime

# # # only here so that max health can be modifed at runtime

var health_stat : HealthStat = null #needs a reference to its assigned entity's health stat
# used to fetch its max_health property at runtime

func id() -> STAT_IDs:
	return STAT_IDs.MAX_HEALTH

# automatically fetches heath stat from assigned entity when an assigned entity is added.
func _assigned_enitity_setter(value : Entity) -> void:
	_assigned_entity = value
	health_stat = _assigned_entity.fetch_stat(STAT_IDs.HEALTH)
