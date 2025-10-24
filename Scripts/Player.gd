class_name Player
extends NetworkObject

@export var speed: float = 1

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")	
	position = position + direction * speed * delta
	send_data(str(position))
