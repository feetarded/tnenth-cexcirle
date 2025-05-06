extends RefCounted
class_name StatContainer

#literally just an array but it can update _assigned_entity because arrays are stupid

const REF_ID = preload('res://scripts/Classes/Entity/stat_registry.gd').ReferenceIDs


var entity: Entity
var list: Array[Stat] = []

func append(resource : Stat) -> void:
	resource._assigned_entity = entity
	list.append(resource)

func append_array(array : Array[Stat]) -> void:
	for resource in array:
		resource._assigned_entity = entity
	list.append_array(array)

func index(index : int) -> Stat:
	return list[index]

func fetch(ID : REF_ID) -> Stat:
	for resource in list:
		if resource.ID == ID:
			return resource
	return null

func size() -> int:
	return list.size()
