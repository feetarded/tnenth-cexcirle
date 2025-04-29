extends Effect
class_name DamageEffect

# Handles most of the logic needed to apply damage to an entity

# Exported Properties:
# - `damage_value` (float): The base amount of damage this effect attempts to apply.
# - `PEN_flat` (float): Flat defense penetration. Subtracts a fixed amount from the target's DEFENSE value before applying any percentage-based reduction.
# - `PEN_mult` (float): Percentage defense penetration. Scales the remaining DEFENSE after flat reduction to reduce its effectiveness. Ranges from 0 (no penetration) to 1 (full penetration).

# Dependencies:
# - Entity.gd (Method `fetch_resource_from_entity`)
# - ResourceTypes.gd (global enum for GameResource types)
# - DefenseResource.gd (Method `apply_damage_reduction`)
# - GameResources must expose a `current_value` property.

# Usage:
# Instantiate and configure this effect with appropriate values.
# Apply it to an Entity that has the relevant GameResources.
@export var damage_value : float
@export var PEN_flat : float
@export var PEN_mult : float


# Damage Pipeline:
# - SHIELD absorbs as much of the incoming damage as its current value allows.
# - DEFENSE reduces the remaining damage using `_calculate_damage_reduction`.
# - HEALTH is reduced by the final damage value.
func _custom_effect_pipeline(entity : Entity):
	var resource_dict = fetch_resource_from_entity([ResourceTypes.Global.DEFENSE, ResourceTypes.Global.HEALTH, ResourceTypes.Global.SHIELD], entity)
	var internal_damage : float = damage_value
	
	var shield = resource_dict[ResourceTypes.Global.SHIELD]
	var defense = resource_dict[ResourceTypes.Global.DEFENSE]
	var health = resource_dict[ResourceTypes.Global.HEALTH]

	if shield: #shield stat
		var shield_absorbed = min(internal_damage, shield.current_value)
		shield.current_value -= shield_absorbed
		internal_damage -= shield_absorbed

	if defense: #def stat
		internal_damage = defense.apply_damage_reduction(internal_damage, PEN_mult, PEN_flat)

	if health:
		health.current_value -= internal_damage
