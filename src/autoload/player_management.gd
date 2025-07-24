extends Node
@export var money : int
var save_resource : Resource

func load_saved_resource() -> Resource:
	if ResourceLoader.exists("user://save.tres"):
		var save_resource = ResourceLoader.load("user://save.tres")
	else: 
		base_save()
	return save_resource


func base_save():
	var base_save_resource = SaveResource.new()
	ResourceSaver.save(base_save_resource, "user://save.tres")
	save_resource = base_save_resource


func save():
	var save = SaveResource.new()
	save.money = money
	ResourceSaver.save(save, "user://save.tres")
	pass
