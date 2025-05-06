extends Effect
class_name StatModEffect

# Generic Effect for 

# Exported Properties:
# - `damage_value` (float): The base amount of damage this effect attempts to apply.
# - `PEN_flat` (float): Flat defense penetration. Subtracts a fixed amount from the target's DEFENSE value before applying any percentage-based reduction.
# - `PEN_mult` (float): Percentage defense penetration. Scales the remaining DEFENSE after flat reduction to reduce its effectiveness. Ranges from 0 (no penetration) to 1 (full penetration).
@export var stat : ResourceTypes.Global
@export var operator : 
# Damage Pipeline:
# - SHIELD absorbs as much of the incoming damage as its current value allows.
# - DEFENSE reduces the remaining damage using `_calculate_damage_reduction`.
# - HEALTH is reduced by the final damage value.
func _apply(resources : Array[Stat]):
	var shield = _resource_from_type(resources, ResourceTypes.Global.SHIELD)
	var defense = _resource_from_type(resources, ResourceTypes.Global.DEFENSE)
	var health = _resource_from_type(resources, ResourceTypes.Global.HEALTH)
	
	var internal_damage : float = damage_value
	
	if shield: #shield stat
		var shield_absorbed = min(internal_damage, shield.current_value)
		shield.current_value -= shield_absorbed
		internal_damage -= shield_absorbed

	if defense: #def stat
		internal_damage = defense.apply_damage_reduction(internal_damage, PEN_mult, PEN_flat)

	if health:
		health.current_value -= internal_damage
