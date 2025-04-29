extends Node2D
class_name Entity

@export var resources : Array[GameResource]

func fetch_resource(resource_type : ResourceTypes.Global) -> GameResource:
	for resource in resources:
		if resource._get_game_resource_type() == resource_type:
			return resource
	return null

func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
