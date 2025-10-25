class_name MapIcon
extends NetworkObject

@export var sprite: Sprite2D

var identity: int

func _on_prefixed_data(data: String):
	if identity == int(data.split("@")[2]):
		visible = !data.ends_with("destroy")
