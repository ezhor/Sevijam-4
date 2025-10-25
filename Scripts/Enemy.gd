class_name Enemy
extends AbstractPlayer

func _on_prefixed_data(data: String):
	if int(data.split("@")[0]) == identity:
		var serialized_vector = data.split("@")[2]
		var new_position: Vector2 = str_to_var("Vector2"+serialized_vector)
		position = new_position
