@tool
extends Stat
class_name HealthStat

func id() -> REF_ID:
	return REF_ID.HEALTH

func _current_value_setter(value : float) -> void:
	current_value = value
	if current_value <= 0:
		_assigned_entity.death() #automatically calls death on its assigned entity when it reaches 0.
