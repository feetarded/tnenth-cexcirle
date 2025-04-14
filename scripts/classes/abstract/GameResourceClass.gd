@tool
extends Node
class_name GameResourceComponent

#dependencies - must redefine
func _get_caps() -> Array[ValueCap]:
	return []
	
func _get_game_resource_type() -> ResourceTypes.GameResourceTypes:
	return ResourceTypes.GameResourceTypes.UNSET


#not required
@export var default_value : float

var current_value : float = 0.0:
	set = current_value_setter 
var _assigned_entity : Entity = null #autoassiged by entity

func reset_to_default():
	current_value = default_value

func apply_caps(value : float, caps : Array[ValueCap]):
	for i in caps:
		value = caps[i].cap(value)
	return value

#custom setter functions
func _current_value_setter(value):
	current_value = value

#default current value setter
func current_value_setter(value : float) -> void:
	var _capped_value = snappedf(apply_caps(value, _get_caps()), 0.1) #caps applied then passed to custom set
	_current_value_setter(_capped_value)

#checking for dependencies
func _get_configuration_warnings() -> PackedStringArray:
	var warnings = []
	if _get_game_resource_type() == ResourceTypes.GameResourceTypes.UNSET:
		warnings.append('Method "_get_game_resource_type()" must be redefined in child classes in order for Entity to correctly recognise GameResourceComponent')
	if _get_caps() == []:
		warnings.append('Dependency Warning: _get_caps() is unset. Child classes must override _get_caps().')
	return warnings
