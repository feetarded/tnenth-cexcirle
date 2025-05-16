@tool
extends Resource
class_name Stat
# Abstract base class for all Stats.
# Stats represent dynamic numerical attributes of an Entity (e.g., Health, Defense, Shield).

# Stats are stored and managed in a StatContainer per Entity.

# Do not instantiate directly.
# Create subclasses to make specific Stats and define their unique behavior and purpose.

# Subclasses:
# - Must override Method `id() -> STAT_IDs:` to return a unique value from the STAT_IDs enum.

#---------------------------------------------------------------------



@export var default_value : float # Exposed in the editor for easy tuning.

@warning_ignore("unused_private_class_variable")
const STAT_IDs = FileRegistry.stat_registry

var _assigned_entity : Entity: # Internal reference to the owning Entity. Assigned automatically at runtime.
	set = _assigned_entity_setter
var current_value : float = 0.0: # The active value of the stat. Custom setter `_current_value_setter()` can be extended.
	set = _current_value_setter 

func reset_to_default() -> void:
	current_value = default_value

# Must be overridden in subclasses.
# Should return a unique ID from the STAT_IDs Enum.
func id() -> STAT_IDs:
	return STAT_IDs.UNSET

#Custom setters
func _current_value_setter(value : float) -> void:
	current_value = value

func _assigned_entity_setter(value : Entity) -> void:
	_assigned_entity = value
