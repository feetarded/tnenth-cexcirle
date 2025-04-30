extends Node2D
class_name Entity

@export var default_resources : Array[GameResource]

@onready var resources : GameResourceContainer

func _ready() -> void:
	resources.entity = self
	resources.append_array(default_resources)

func apply_effect(effect : Effect):
	effect._apply(resources)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
