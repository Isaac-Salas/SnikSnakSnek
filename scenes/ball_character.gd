extends RigidBody3D
@onready var directionZ
@onready var directionX 



func _physics_process(delta: float) -> void:
	directionZ = Input.get_axis("ui_up","ui_down")
	directionX= Input.get_axis("ui_left","ui_right")
	self.linear_velocity += Vector3(directionX/2,0, directionZ/2)
	print(directionX, directionZ)
	
