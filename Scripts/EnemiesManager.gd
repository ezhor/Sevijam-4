class_name EnemiesManager
extends NetworkObject

@export var enemy: PackedScene

var enemies: Array[Enemy]

func _ready() -> void:
	super._ready()
	enemies.resize(len(IdentityManager.colors))


func _on_prefixed_data(data: String):
	var identity: int = int(data.split("@")[2])
		
	if data.ends_with("destroy"):
		enemies[identity].queue_free()
	else:		
		var instance: Enemy = enemy.instantiate() as Enemy
		instance.initialize(identity)
		enemies[identity] = instance	
		add_child(instance)
