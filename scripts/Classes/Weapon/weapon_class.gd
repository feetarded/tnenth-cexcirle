extends Node2D
class_name Weapon

@export var animated_sprite : AnimatedSprite2D
@export var animation_player : AnimationPlayer
@export var skill_component : SkillComponent 
@export var combo_component : ComboComponent

var player #wip

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func action_slot_1():
	pass

func action_slot_2():
	pass
