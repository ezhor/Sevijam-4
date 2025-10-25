class_name PlayerAttack
extends NetworkObject

@export var sprite: AnimatedSprite2D 

var attacking: bool

func _input(event):
	if event.is_action_pressed("attack"):
		attacking = true
		sprite.play("attack")
	if event.is_action_released("attack"):
		attacking = false

func _on_prefixed_data(_data: String):
	pass