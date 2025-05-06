extends Node2D
class_name Entity

@export var default_resources : Array[Stat]

@onready var stat_array : StatContainer = StatContainer.new()

func _ready() -> void:
	stat_array.entity = self
	stat_array.append_array(default_resources)

func apply_effect(effect : Effect) -> void:
	effect._apply(stat_array)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
