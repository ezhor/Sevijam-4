class_name Player
extends AbstractPlayer

@export var speed: float = 1
@export var attackAbility: PlayerAttack

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction.x > 0:
		sprite.flip_h = false
		sprite.offset.x = offset
	elif direction.x < 0:
		sprite.flip_h = true
		sprite.offset.x = -offset
	
	if !attackAbility.attacking:
		if direction.length() > 0:
			sprite.play("run")
		else:
			sprite.play("idle")
		
	position = position + direction * speed * delta
	if position.length() > BoundsManager.bounds:
		position = position.normalized() * BoundsManager.bounds
	send_data(str(position))

func _on_prefixed_data(_data: String):
	pass
