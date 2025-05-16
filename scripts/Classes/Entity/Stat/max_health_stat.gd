extends Stat
class_name MaxHealthStat

var health_stat : HealthStat = null

func id() -> STAT_IDs:
	return STAT_IDs.MAX_HEALTH

func _current_value_setter(value : float) -> void:
	current_value = value
	
	if health_stat:
		health_stat.max_health = current_value
		
func _assigned_enitity_setter(value : Entity) -> void:
	_assigned_entity = value
	health_stat = _assigned_entity.fetch_stat(STAT_IDs.HEALTH)
