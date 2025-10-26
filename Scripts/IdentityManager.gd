extends NetworkObject

@export var player: PackedScene
@export var colors: Array[Color]
@export var spawn_points: Array[Vector2]

var identity: int
var playerReference: Player
var health: HealthBar

func _on_prefixed_data(data: String):
	identity = int(data.split("@")[2])
	print("Identity: " + str(identity))
	
	playerReference = player.instantiate() as Player	
	playerReference.initialize(identity)
	get_tree().get_root().get_node("Main").add_child(playerReference)
	playerReference.position = spawn_point()
	_on_identity_ready.emit()
	
func spawn_point() -> Vector2:
	return spawn_points[playerReference.team()]

signal _on_identity_ready()
