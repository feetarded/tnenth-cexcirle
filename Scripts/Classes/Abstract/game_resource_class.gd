@tool
extends Resource
class_name GameResource

#not required
@export var default_value : float

func _get_type() -> ResourceTypes.Global:
	return ResourceTypes.Global.UNSET

var current_value : float = 0.0:
	set = _current_value_setter 

func reset_to_default():
	current_value = default_value

func _current_value_setter(value):
	current_value = value
