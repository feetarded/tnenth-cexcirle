@tool
extends GameResource
class_name HealthResource

func _current_value_setter(value : float) -> void:
	current_value = value
	if current_value <= 0:
		_assigned_entity.death()
