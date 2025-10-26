extends NetworkObject

@export var player: PackedScene
@export var colors: Array[Color]

var identity: int
var playerReference: Player

func _on_prefixed_data(data: String):
	identity = int(data.split("@")[2])
	print("Identity: " + str(identity))
	
	playerReference = player.instantiate() as Player	
	playerReference.initialize(identity)
	get_tree().get_root().get_node("Main").add_child(playerReference)
	_on_identity_ready.emit()

signal _on_identity_ready()
