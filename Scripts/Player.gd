class_name Player
extends AbstractPlayer

@export var speed: float = 1
@export var bounds: int = 0

var offset: int

func _ready() -> void:
	super._ready()
	offset = sprite.offset.x

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction.x > 0:
		sprite.flip_h = false
		sprite.offset.x = offset
	elif direction.x < 0:
		sprite.flip_h = true
		sprite.offset.x = -offset
		
	position = position + direction * speed * delta
	if position.length() > bounds:
		position = position.normalized() * bounds
	send_data(str(position))

func _on_prefixed_data(_data: String):
	pass
