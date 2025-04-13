@tool
extends GameResource
class_name  HealthResource

const GAME_RESOURCE_TYPE = ResourceTypes.GameResourceTypes.HEALTH

func _caps_setter(value : Array[GameResourceCap]) -> void:
	for cap in value:
		if cap:
			cap.enable_min_cap = false
			notify_property_list_changed()
	caps = value
	#purely for editor

func _current_value_setter():
