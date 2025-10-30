extends Effect
class_name DamageEffect

# handles most of the logic needed to apply damage to an entity

@export var damage_value : float #the base amount of damage this effect attempts to apply.
@export var PEN_flat : float # flat defense penetration. 
# subtracts a fixed amount from the target's DEFENSE value before applying any percentage-based reduction
@export var PEN_mult : float # percentage defense penetration. 
# scales the remaining DEFENSE after flat reduction. 
# ranges from 0 (no penetration) to 1 (full penetration)
# # its clamped to those values if it ranges outside.

# pipeline:
# - SHIELD absorbs as much of the incoming damage as its current value allows.
# - DEFENSE reduces the remaining damage using method apply_damage_reduction().
# - HEALTH is reduced by the final damage value.
func apply(entity : Entity) -> void:
	var shield = entity.fetch_stat(STAT_IDs.SHIELD)
	var defense =  entity.fetch_stat(STAT_IDs.DEFENSE)
	var health =  entity.fetch_stat(STAT_IDs.HEALTH)
	
	var internal_damage : float = damage_value
	
	if shield: #shield stat
		var shield_absorbed = min(internal_damage, shield.current_value)
		shield.current_value -= shield_absorbed
		internal_damage -= shield_absorbed

	if defense: #def stat
		internal_damage = defense.apply_damage_reduction(internal_damage, PEN_mult, PEN_flat)

	if health:
		health.current_value -= internal_damage
