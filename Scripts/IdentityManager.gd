extends NetworkObject

@export var player: PackedScene
@export var colors: Array[Color]

var identity: int

func _on_prefixed_data(data: String):
	identity = int(data.split("@")[2])
	print("Identity: " + str(identity))
	
	var instance: Player = player.instantiate() as Player	
	instance.initialize(identity)
	add_child(instance)
