@tool
extends Node
class_name ActionComponent

@export var icon : Image
@export var cost_type : CostType = CostType.cooldown

var cooldown : float = 0.0
var stat_cost_value : float = 0.0

enum CostType {
	cooldown,
	stat
}

const STAT_IDs = FileRegistry.stat_registry

func cost(entity : Entity):
	pass

func trigger():
	pass
	return false
	

	
