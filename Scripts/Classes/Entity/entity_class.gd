extends Node2D
class_name Entity

# default stats to give entity when instantiated.
# # never modified during runtime
@export var default_stats : Array[Stat]

# active list of stats and their values
# # modified at runtime
var stat_array : Array[Stat]:
	set(value): #ensures only one of each stat type exists in the array
		var seen_classes : Dictionary[STAT_IDs, bool] = {} 
		# using an array is more intuitive here
		# # dict lookup runs in O(1) instead of O(n)
		
		var filtered_array : Array[Stat] = []
		# construct a new array without duplicate stat types
		for stat in value:
			if not seen_classes.has(stat.id()):
				filtered_array.append(stat)
			seen_classes[stat.id()] = true #value used is arbitrary, just needs to satisfy dict structure
		stat_array = filtered_array #sets

const STAT_IDs = FileRegistry.stat_registry 
# enum used by stats to id them because get_class() doesnt work on user-defined classes
# fuck you gdscript

# fetches a stat from its stat_array using its ID
# returns null if not found
# duplicate stats are impossible
func fetch_stat(ID : STAT_IDs):
	for stat in stat_array:
		if stat.id() == ID:
			return stat
	return null

# use this method instead of modifying stat_array directly to autoassign _assigned_entity on stats
# keeps logic decoupled
func add_stat(stat : Stat):
	stat._assigned_entity = self
	stat_array.append(stat)

# literally just calls .apply on the effect resource passed and passes self
# here for decoupling
func apply_effect(effect : Effect) -> void:
	effect.apply(self)

# sets all _assigned_entity of the stats in the stat_array of this entity instance to self
# cannot be done before runtime, and adding stats after first instance should be done through add_stat()
func _ready() -> void:
	for stat in stat_array:
		stat.assigned_entity = self
	stat_array.append_array(default_stats)
