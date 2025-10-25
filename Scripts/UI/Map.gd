class_name Map
extends NetworkObject

@export var bounds: float
@export var icon: PackedScene

var icons: Array[Sprite2D]

func _ready() -> void:
	super._ready()
	icons.resize(len(IdentityManager.colors))
	for i in range(len(IdentityManager.colors)):
		var instance: MapIcon = icon.instantiate() as MapIcon
		instance.identity = i
		instance.sprite.modulate = IdentityManager.colors[i]
		instance.sprite.visible = false
		add_child(instance)
		icons[i] = instance.sprite

func _physics_process(_delta: float) -> void:
	var player: Player = IdentityManager.playerReference
	if player != null:
		var identity: int = IdentityManager.identity	
		icons[identity].position = (player.position / BoundsManager.bounds) * bounds
		icons[identity].visible = true

func _on_prefixed_data(data: String):
	var i: int = int(data.split("@")[0])
	var serialized_vector: String = data.split("@")[2]
	var new_position: Vector2 = str_to_var("Vector2"+serialized_vector)
	icons[i].position = (new_position / BoundsManager.bounds) * bounds
