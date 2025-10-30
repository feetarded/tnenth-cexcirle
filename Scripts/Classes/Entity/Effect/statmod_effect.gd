extends Effect
class_name StatModEffect
# generic effect that allows free modification of any Stat present on an entity

@export var target_stat : STAT_IDs
@export var operator : Operator
@export var value : float = 0.0

enum Operator {
	ADD, #no need for subtraction just put a negative value dummy
	MULTIPLY,
	DIVIDE, #inspector doesnt accept fractions so here for convenience
	OVERRIDE #literally just sets the stats current value to the given value
}

func apply(entity : Entity) -> void:
	var stat = entity.fetch_stat(target_stat)
	
	if stat:
		match operator:
			Operator.ADD:
				stat.current_value += value
			Operator.MULTIPLY:
				stat.current_value *= value
			Operator.DIVIDE:
				stat.current_value /= value
			Operator.OVERRIDE:
				stat.current_value = value
