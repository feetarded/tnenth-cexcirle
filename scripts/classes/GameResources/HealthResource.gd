@tool
extends GameResource
class_name  HealthResource

func custom_cap_setter(value : Array[GameResourceCap]) -> void:
	for cap in value:
		if cap:
			cap.enable_min_cap = false
	caps = value
	if value == 0.0:
		_assigned_entity.death()
