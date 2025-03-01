extends Node3D


@onready var WORLD_TEST = PackedScene.new()

func _on_button_pressed() -> void:
	WORLD_TEST = load("res://scenes/world_test.tscn")
	get_tree().change_scene_to_packed(WORLD_TEST)
