extends Camera3D

@export var follow_target: Node3D
@export var follow_offset: Vector3
@export var look_target: Node3D
@export var weight : float

func _process(delta):
	if follow_target != null:
		global_position = lerp(global_position, (follow_target.global_position + follow_offset) ,weight)
	if look_target != null:
		look_at(look_target.global_position)
