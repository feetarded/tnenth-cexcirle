@tool
extends Stat
class_name HealthStat

@export var max_health : float = 100.0

signal death

func cap() -> void:
	current_value = clampf(current_value, 0, max_health)

func id() -> STAT_IDs:
	return STAT_IDs.HEALTH

func _current_value_setter(value : float) -> void:
	current_value = value
	cap()
	if current_value <= 0:
		emit_signal('death')
		#signals death on health 0, 
		#only signals when health is changed

func _assigned_entity_setter(value : Entity) -> void:
	_assigned_entity = value
	
	#searches if a max health stat already exists on assigned entity
	var max_health_stat : Stat = _assigned_entity.fetch_stat(STAT_IDs.MAX_HEALTH)
	
	#creates and adds a max health stat if none found
	if not max_health_stat:
		max_health_stat = MaxHealthStat.new()
		max_health_stat.current_value = max_health
		value.stat_array.append(max_health_stat)
	else: #if assigned entity already has max health
		max_health = max_health_stat.current_value
		#sets its own max health stat to the one present
