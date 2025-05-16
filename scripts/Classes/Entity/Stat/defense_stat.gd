extends Stat
class_name DefenseStat

func id() -> STAT_IDs:
	return STAT_IDs.DEFENSE

func _calculate_damage_reduction(defense : float, PEN_mult : float = 0, PEN_flat : float = 0) -> float:
	var PEN_flat_defense : float = (defense - PEN_flat)
	var PEN_mult_defense : float = PEN_flat_defense * clampf(1 - PEN_mult, 0, 1)
	var PEN_defense : float
	
	if PEN_flat_defense >= 0:
		PEN_defense = PEN_mult_defense
	else:
		PEN_defense = PEN_flat_defense - (abs(PEN_flat_defense) - abs(PEN_mult_defense))
	
	var dmg_reduction : float = PEN_defense/2
	
	return dmg_reduction / 100

func apply_dmg_reduction(damage : float, PEN_mult : float, PEN_flat) -> float:
	var dmg_reduction = _calculate_damage_reduction(current_value, PEN_mult, PEN_flat)
	return damage * (1 - dmg_reduction)
	
