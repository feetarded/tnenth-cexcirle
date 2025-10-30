extends Stat
class_name DefenseStat

func id() -> STAT_IDs:
	return STAT_IDs.DEFENSE

# the number to divide by when going from defense -> damage reduced
const damage_reduction_factor = 2

# returns a new damage value with defense applied to it based on the given values
# really only called by damage effect
func apply_dmg_reduction(damage : float, PEN_mult : float, PEN_flat) -> float:
	var dmg_reduction = _calculate_damage_reduction(current_value, PEN_mult, PEN_flat)
	return damage * (1 - dmg_reduction)
	

# helper function outside of apply_dmg_reduction because you cant nest functions
func _calculate_damage_reduction(defense : float, PEN_mult : float = 0, PEN_flat : float = 0) -> float:
	
	#subtracts the PEN_flat value from defense
	# value for defense after PEN_flat is applied
	var PEN_flat_defense : float = (defense - PEN_flat)
	
	#multiplies the value from before by 1 - PEN_mult and clamps
	# value for defense after PEN_mult and PEN_flat is applied
	var PEN_mult_defense : float = PEN_flat_defense * clampf(1 - PEN_mult, 0, 1)
	
	# final amount of defense with defense all penetration applied
	var PEN_defense : float
	
	#extra logic needed incase PEN_flat (defense after flat def penetration) was negative
	if PEN_flat_defense >= 0: 
		PEN_defense = PEN_mult_defense
	else: #this value will be always be negative, resulting in more damage taken instead of a reduction
		PEN_defense = PEN_flat_defense - (abs(PEN_flat_defense) - abs(PEN_mult_defense))
	# this is here because more PEN should mean more damage
	# # but if defense was negative (if PEN_flat is bigger than defense, then defense - PEN_flat is negative)
	# # applying PEN_mult would reduce the damage you do:
	# # # e.g. -10 (defense after PEN_flat applied) * 0.7 (def 'reduction' from PEN_mult) = -7
	# # because PEN_mult would actually increases defense instead of reducing it
	# # resulting in less damage
	
	# converts from defense into damage reduction by divding by some factor
	# formula subject to change
	var dmg_reduction : float = PEN_defense/damage_reduction_factor
	
	
	return dmg_reduction / 100
