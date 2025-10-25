@abstract
class_name AbstractPlayer
extends NetworkObject

@export var sprite: AnimatedSprite2D

var identity: int = -1
var offset: float

func _ready() -> void:
	super._ready()
	offset = sprite.offset.x	

func initialize(new_identity: int):
	identity = new_identity
	sprite.modulate = IdentityManager.colors[new_identity]
