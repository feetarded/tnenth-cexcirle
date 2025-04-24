extends Effect
class_name DamageEffect

@export var damage_value : float
@export var defense_PEN_flat : float
@export var defense_PEN_mult : 

class ResourceMod:
	var target_type : ResourceTypes.GameResourceTypes
	var resource_changes : Callable
	
	func _init(_target_type : ResourceTypes.GameResourceTypes, _resource_changes : Callable) -> void:
		target_type = _target_type
		resource_changes = _resource_changes

func _effect_pipeline():
	ResourceMod.new(
		ResourceTypes.GameResourceTypes.HEALTH, 
		func(): pass
		)
