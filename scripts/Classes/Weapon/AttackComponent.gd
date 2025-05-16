extends Node
class_name Attack

@export var scalar : float
@export var hitbox : Area2D

const STAT_IDs = FileRegistry.stat_registry
var _assigned_player : Entity = null

func _ready():
	hitbox.area_entered.connect(hitbox_enter)

func hitbox_enter(hitbox):
	var damage_effect = calculate_dmg(_assigned_player.fetch_stat(STAT_IDs.ATK))
	hitbox._assigned_entity.apply_effect(damage_effect)

func calculate_dmg(damage, flat_pen = 0, pen_mult = 0):
	var damage_effect = DamageEffect.new()
	damage_effect.damage_value = scalar/100 * damage
	return damage_effect
	
