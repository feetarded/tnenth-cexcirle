@tool
extends Resource
class_name GameResourceCap

var enable_min_cap : bool = true
var min_value : float = 0:
	set(value):
		min_value = value
		if value > max_value:
			max_value = value

var min_softcap_modifier : float = 0.0

var min_hardcap : bool = true:
	set(value):
		min_hardcap = value
		if value:
			min_softcap_modifier = 0.0
		notify_property_list_changed()

var enable_max_cap : bool = false
var max_value : float = INF:
	set(value):
		max_value = value
		if value < min_value:
			min_value = value


var max_softcap_modifier : float = 0.0
var max_hardcap : bool = true:
	set(value):
		max_hardcap = value
		if value:
			max_softcap_modifier = 0.0
		notify_property_list_changed()


func cap(value : float) -> float:
	var overflow : float = 0.0
	if value < min_value:
		overflow = min_value - value #always positive
		value = min_value + overflow * min_softcap_modifier
		return value
	if value > max_value:
		overflow = value - max_value #always positive
		value = max_value + overflow * max_softcap_modifier
		return value
	else:
		return 0.0



func _get_property_list() -> Array[Dictionary]:
	var properties : Array[Dictionary] = []
	if enable_min_cap:
		properties.append({
			'name': 'Minimum Value',
			'type': TYPE_NIL,
			'usage': PROPERTY_USAGE_GROUP,
			'hint_string': 'min'
		})
		properties.append({
			'name': 'min_value',
			'type': TYPE_FLOAT,
			'usage': PROPERTY_USAGE_DEFAULT,
			'hint': PROPERTY_HINT_RANGE,
			'hint_string': '0,100,0.1,or_greater,or_less'
		})
		properties.append({
		'name': 'min_hardcap',
		'type': TYPE_BOOL,
		'usage': PROPERTY_USAGE_DEFAULT
		})
		if !min_hardcap:
			properties.append({
				'name': 'min_softcap_modifier',
				'type': TYPE_FLOAT,
				'usage': PROPERTY_USAGE_DEFAULT,
				'hint': PROPERTY_HINT_RANGE,
				'hint_string': '0,1,0.01,or_greater'
			})
	else:
		min_value = 0.0
		min_hardcap = true
	
	if enable_min_cap:
		properties.append({
			'name': 'Maximum Value',
			'type': TYPE_NIL,
			'usage': PROPERTY_USAGE_GROUP,
			'hint_string': 'max'
		})
		properties.append({
			'name': 'max_value',
			'type': TYPE_FLOAT,
			'usage': PROPERTY_USAGE_DEFAULT,
			'hint': PROPERTY_HINT_RANGE,
			'hint_string': '0,100,0.1,or_greater'
		})
		properties.append({
			'name': 'max_hardcap',
			'type': TYPE_BOOL,
			'usage': PROPERTY_USAGE_DEFAULT
		})
		if !max_hardcap:
			properties.append({
				'name': 'max_softcap_modifier',
				'type': TYPE_FLOAT,
				'usage': PROPERTY_USAGE_DEFAULT,
				'hint': PROPERTY_HINT_RANGE,
				'hint_string': '0,1,0.01,or_greater'
			})
	else: 
		max_value = INF
		max_hardcap = false
		
	return properties
