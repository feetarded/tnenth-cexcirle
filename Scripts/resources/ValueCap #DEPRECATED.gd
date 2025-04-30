extends Resource
class_name ValueCap

@export var lower_cap : float
@export var upper_cap : float:
	set(value):
		upper_cap = value
		if value < lower_cap:
			upper_cap = lower_cap

@export var lower_softcap_mod : float 
@export var upper_softcap_mod : float 

func _init(_lower_cap : float = 0.0, _upper_cap : float = INF, _lower_softcap_mod : float = 0.0, _upper_softcap_mod : float = 0.0) -> void:
	lower_cap = _lower_cap
	upper_cap = _upper_cap
	lower_softcap_mod = _lower_softcap_mod
	upper_softcap_mod = _upper_softcap_mod

func cap(value : float) -> float:
	var overflow : float = 0.0
	if value < lower_cap:
		overflow = lower_cap - value #always positive
		value = lower_cap + overflow * lower_softcap_mod
		return value
	if value > upper_cap:
		overflow = value - upper_cap #always positive
		value = upper_cap + overflow * upper_softcap_mod
		return value
	else:
		return 0.0
