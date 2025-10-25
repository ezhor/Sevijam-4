class_name Player
extends NetworkObject

@export var speed: float = 1
@export var sprite: Sprite2D

var identity: int = -1

func initialize(new_identity: int):
	identity = new_identity
	sprite.modulate = IdentityManager.colors[new_identity]

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")	
	position = position + direction * speed * delta
	send_data(str(position))

func _on_prefixed_data(_data: String):
	pass
