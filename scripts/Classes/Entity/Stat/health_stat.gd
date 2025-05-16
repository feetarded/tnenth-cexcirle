extends Stat
class_name HealthStat

@export var max_health : float = 100.0:
	set(value):
		cap()

func cap() -> void:
	current_value = clampf(current_value, 0, max_health)

func id() -> STAT_IDs:
	return STAT_IDs.HEALTH

func _current_value_setter(value : float) -> void:
	current_value = value
	cap()
	if current_value <= 0:
		_assigned_entity.death() 
		#automatically calls death on its assigned entity when it reaches 0.

func _assigned_entity_setter(value : Entity) -> void:
	_assigned_entity = value
	
	if not _assigned_entity.fetch_stat(STAT_ID.MAX_HEALTH):
		var max_health_stat = MaxHealthStat.new()
		max_health_stat.current_value = max_health
		value.stat_array.append(max_health_stat)
