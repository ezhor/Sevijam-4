class_name EnemyAttack
extends NetworkObject

@export var sprite: AnimatedSprite2D 

var attacking: bool

func _on_prefixed_data(data: String):
	var state: String = data.split("@")[2]
	if state == "enable":
		sprite.play("attack")
		attacking = true
	elif state == "disable":
		attacking = false
