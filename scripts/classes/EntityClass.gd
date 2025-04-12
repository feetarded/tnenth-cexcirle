extends Node2D
class_name Entity

@export var resources : Array[GameResource]


func fetch_resource_value(resource_name : String) -> float:
	for resource in resources:
		if resource.get_class() == resource_name:
			return resource.current_value
	return 0.0

func has_resource(resource_name : String) -> bool:
	for resource in resources:
		if resource.get_class() == resource_name:
			return true
	return false

func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
