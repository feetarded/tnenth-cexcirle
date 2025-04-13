@tool
extends Resource
class_name GameResource

#ALL SUBCLASSES NEED A CONST WITH NAME GAME_RESOURCE_TYPE

@export var default_value : float
@export var caps : Array[GameResourceCap] = []:
	set = _caps_setter

var current_value : float = 0.0:
	set = current_value_seter 

var _assigned_entity : Entity = null #autoassiged by entity

func reset_to_default():
	current_value = default_value

func apply_caps(value : float, caps : Array[GameResourceCap]):
	for i in caps:
		value = caps[i].cap(value)
	return value

#custom setter functions
func _caps_setter(value : Array[GameResourceCap]) -> void:
	caps = value

func _current_value_setter(value):
	current_value = value

#default current value setter
func current_value_seter(value : float) -> void:
	var _capped_value = snappedf(apply_caps(value, caps), 0.1) #caps applied then passed to custom set
	_current_value_setter(_capped_value)
