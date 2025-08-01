@tool
extends StaticBody2D
class_name LevelPart
@export var level_number : int
@export var end_position : Vector2
var player

func _ready() -> void:
	if Engine.is_editor_hint():
		sync()
		return
	if ("end_position" in get_parent()) == true:
		position = get_parent().end_position
	if get_parent().name == "game":
		LevelManagement.rlg(self)
	player = get_tree().get_first_node_in_group("player")

func sync():

 ## Syncing Line2D and Polygon2D points with CollisionPolygon2D

	var line_new_array : PackedVector2Array
	line_new_array = $CollisionPolygon2D.polygon
	line_new_array.resize(line_new_array.size() - 2)
	$Polygon2D.polygon = $CollisionPolygon2D.polygon
	$Line2D.points = line_new_array

## Syncing Line2D last point with end point

	end_position = $Line2D.points[-1]


func _on_degen_hitbox_body_entered(body: Node2D) -> void:
	queue_free()


func _on_regen_hitbox_body_entered(body: Node2D) -> void:
	LevelManagement.rlg(get_parent())


func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint():
		return
	if player.global_position.x - 500 > self.global_position.x + (end_position.x * 6) and level_number != 0:
		queue_free()
