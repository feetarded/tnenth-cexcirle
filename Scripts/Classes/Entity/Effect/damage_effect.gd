extends Effect
class_name DamageEffect

# Handles most of the logic needed to apply damage to an entity

# Exported Properties:
# - `damage_value` (float): The base amount of damage this effect attempts to apply.
# - `PEN_flat` (float): Flat defense penetration. Subtracts a fixed amount from the target's DEFENSE value before applying any percentage-based reduction.
# - `PEN_mult` (float): Percentage defense penetration. Scales the remaining DEFENSE after flat reduction to reduce its effectiveness. Ranges from 0 (no penetration) to 1 (full penetration).
@export var damage_value : float
@export var PEN_flat : float
@export var PEN_mult : float

# Damage Pipeline:
# - SHIELD absorbs as much of the incoming damage as its current value allows.
# - DEFENSE reduces the remaining damage using `_calculate_damage_reduction`.
# - HEALTH is reduced by the final damage value.
func apply(stat_array : StatContainer):
	var shield = stat_array.fetch(REF_ID.SHIELD)
	var defense =  stat_array.fetch(REF_ID.DEFENSE)
	var health =  stat_array.fetch(REF_ID.HEALTH)
	
	var internal_damage : float = damage_value
	
	if shield: #shield stat
		var shield_absorbed = min(internal_damage, shield.current_value)
		shield.current_value -= shield_absorbed
		internal_damage -= shield_absorbed

	if defense: #def stat
		internal_damage = defense.apply_damage_reduction(internal_damage, PEN_mult, PEN_flat)

	if health:
		health.current_value -= internal_damage
