class_name Enemy
extends AbstractPlayer

func _on_prefixed_data(data: String):
	if int(data.split("@")[0]) == identity:
		position = str_to_var(data.split("@")[3])