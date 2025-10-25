class_name EnemiesManager
extends NetworkObject

@export var enemy: PackedScene

func _on_prefixed_data(data: String):
	var instance: Enemy = enemy.instantiate() as Enemy
	var identity: int = int(data.split("@")[2])
	
	instance.initialize(identity)
	add_child(instance)
