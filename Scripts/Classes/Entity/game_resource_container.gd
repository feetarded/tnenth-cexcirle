extends RefCounted
class_name GameResourceContainer

#literally just an array but it can update _assigned_entity because arrays are stupid

var entity: Entity
var list: Array[GameResource] = []

func append(resource : GameResource) -> void:
	resource._assigned_entity = entity
	list.append(resource)

func append_array(array : Array[GameResource]):
	for resource in array:
		resource._assigned_entity = entity
	list.append_array(array)

func index(index : int) -> GameResource:
	return list[index]

func size() -> int:
	return list.size()
