@abstract
extends Resource
class_name Effect

# abstract base class for all Effects.
# effects apply changes to Stats

# extend this class to create new types of effects.

#---------------------------------------------------------------------

const STAT_IDs = FileRegistry.stat_registry
# extending classes need this to identify and fetch stats from applied entities

@abstract func apply(entity : Entity) -> void
# must be overridden in subclasses (obviously)
# should fetch required resources the passed entity
# # then modify them directly based on its own values
# # should act like a pipeline, order of operations does matter sometimes

# # # yes yes very coupled and distributed logic but how else am i meant to implement this

# each resource that it modifies should be optional 
# # the effect should skip any that are not present on the entity
