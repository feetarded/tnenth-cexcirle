extends Node2D
class_name Entity

@export var default_stats : Array[Stat]

var stat_array : Array[Stat]

const STAT_IDs = FileRegistry.stat_registry

func fetch_stat(ID : STAT_IDs):
	for stat in stat_array:
		if stat.id() == ID:
			return stat
	return null

func add_stat(stat : Stat):
	stat._assigned_entity = self
	stat_array.append(stat)

func apply_effect(effect : Effect) -> void:
	effect.apply(self)

func _ready() -> void:
	for stat in stat_array:
		stat.assigned_entity = self
	stat_array.append_array(default_stats)
