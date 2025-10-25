class_name Enemy
extends AbstractPlayer

func _on_prefixed_data(data: String):
	if int(data.split("@")[0]) == identity:
		var serialized_vector: String = data.split("@")[2]
		var new_position: Vector2 = str_to_var("Vector2"+serialized_vector)
		var direction: Vector2 = new_position - position 
		
		if direction.length() > 0:
			sprite.play("run")
		else:
			sprite.play("idle")
			
		if direction.x < 0:
			sprite.flip_h = true
		elif direction.x > 0:
			sprite.flip_h = false
		
		position = new_position
