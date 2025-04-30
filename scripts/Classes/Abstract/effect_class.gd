extends Resource
class_name Effect

# Abstract base class for all Effects.
# Effects apply changes to GameResources

# Effects are processed modularly through an Effect pipeline:
# each GameResource applies its modifications in sequence,
# and should modify resources or entity states without direct coupling.

# Extend this class to create new types of Effects.
# Do not instantiate Effect directly — only use subclasses.

#Subclasses:
# - Must override `_effect(entity : Entity)` to define how the Effect modifies the entity.

#---------------------------------------------------------------------

# Must be overridden in subclasses.
# Should fetch required resources from Entity and modify them based on its own values
# Each resource should be optional, and the effect should skip any that are not present on the Entity.

func apply(resources : GameResourceContainer):
	pass

func _resource_from_type(resources : GameResourceContainer, resource_type : ResourceTypes.Global) -> GameResource:
	for resource in resources.list:
		if resource._get_type() == resource_type:
			return resource
	return null
