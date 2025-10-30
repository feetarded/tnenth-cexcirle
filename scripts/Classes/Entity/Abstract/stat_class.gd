@abstract
extends Resource
class_name Stat
# abstract base class for all stats.
# stats represent dynamic numerical attributes of an Entity 
# (e.g., Health, Defense, Shield).
# all stats must strictly only hold one active value
# # if two or more values are needed, create more stats and fetch each dynamically using _assigned_entity.fetch_stat()
#---------------------------------------------------------------------

@export var default_value : float # exposed in the editor for easy tuning.

@warning_ignore("unused_private_class_variable")
const STAT_IDs = FileRegistry.stat_registry
# reference to the registered ids in the enum present in stat_registry.gd
# extending classes need reference to this to use in abstract method id()

#all new stats need a stat id
# must return a unqiue ID (value) from the STAT_IDs enum
@abstract func id() -> STAT_IDs

# internal reference to the owning entity. 
# assigned automatically at runtime.
var _assigned_entity : Entity: 
	set = _assigned_entity_setter

# active value of the stat
# some custom functions can be added by extending _current_value_setter()
var current_value : float = 0.0:
	set = _current_value_setter 

func reset_to_default() -> void:
	current_value = default_value

#custom setters
func _current_value_setter(value : float) -> void:
	current_value = value

func _assigned_entity_setter(value : Entity) -> void:
	_assigned_entity = value
