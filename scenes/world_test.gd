extends Node3D
@onready var directional_light_3d: DirectionalLight3D = $DirectionalLight3D
@onready var button: Button = $Control/Button
@onready var _2D_TEST = PackedScene.new()

func _process(delta: float) -> void:
	#directional_light_3d.light_color = Color(255,randi_range(205,255),randi_range(130,255))
	directional_light_3d.rotation_degrees += Vector3(1,0,0)



func _on_button_pressed() -> void:
	_2D_TEST = load("res://scenes/2DTest.tscn")
	get_tree().change_scene_to_packed(_2D_TEST)
