extends Resource
class_name Effect

# Abstract base class for all Effects.
# Effects apply changes to Stats

# Extend this class to create new types of Effects.
# Do not instantiate Effect directly — only use subclasses.

#Subclasses:
# - Must override method `apply(stat_array : StatContainer) -> void` to define how the Effect modifies the entity.

#---------------------------------------------------------------------

const STAT_IDs = FileRegistry.stat_registry

# Must be overridden in subclasses.
# Should fetch required resources from Entity and modify them based on its own values
# Each resource should be optional, and the effect should skip any that are not present on the Entity.
func apply(entity : Entity) -> void:
	pass
