@abstract
extends Node
class_name ActionComponent
#WIP
#for the weapon system

@export var icon : Image
@export var costs : Array[Cost]

var cooldown : float = 0.0
var stat_cost_value : float = 0.0

enum CostType {
	cooldown,
	stat
}

const STAT_IDs = FileRegistry.stat_registry

@abstract func cost(entity : Entity)

@abstract func trigger()
	

	
