@tool
extends StaticBody2D
class_name LevelPart

@export var end_position : Vector2

func _ready() -> void:
	if Engine.is_editor_hint():
		sync()
	if ("end_position" in get_parent()) == true:
		position = get_parent().end_position


func sync():

 ## Syncing Line2D and Polygon2D points with CollisionPolygon2D

	var line_new_array : PackedVector2Array
	line_new_array = $CollisionPolygon2D.polygon
	line_new_array.resize(line_new_array.size() - 2)
	$Polygon2D.polygon = $CollisionPolygon2D.polygon
	$Line2D.points = line_new_array

## Syncing Line2D last point with end point

	end_position = $Line2D.points[-1]
