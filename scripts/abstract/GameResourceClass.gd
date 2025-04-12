@tool
extends Resource
class_name GameResource

@export var default_value : float
@export var caps : Array[GameResourceCap] = []:
	set = custom_cap_setter


var current_value : float = 0.0:
	set(value):
		current_value = snappedf(apply_caps(value, caps), 0.1)
		notify_property_list_changed()


var _assigned_entity : Entity = null

func _ready():
	reset_to_default()


func reset_to_default():
	current_value = default_value

func apply_caps(value : float, caps : Array[GameResourceCap]):
	for i in caps:
		value = caps[i].cap(value)
	return value


func custom_cap_setter(value : Array[GameResourceCap]) -> void:
	caps = value
	#can be modified for classes that need it
