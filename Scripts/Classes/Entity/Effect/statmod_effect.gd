extends Effect
class_name StatModEffect

@export var target_stat : STAT_IDs = STAT_IDs.UNSET
@export var operator : Operator = Operator.ADD
@export var mod_value : float = 0.0

enum Operator {
	ADD,
	MULTIPLY,
	DIVIDE,
	OVERRIDE
}

func apply(entity : Entity) -> void:
	var stat = entity.fetch_stat(target_stat)
	
	if stat:
		match operator:
			Operator.ADD:
				stat.current_value += mod_value
			Operator.MULTIPLY:
				stat.current_value *= mod_value
			Operator.DIVIDE:
				stat.current_value /= mod_value
			Operator.OVERRIDE:
				stat.current_value = mod_value
