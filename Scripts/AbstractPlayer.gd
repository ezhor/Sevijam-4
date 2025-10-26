@abstract
class_name AbstractPlayer
extends NetworkObject

@export var sprite: AnimatedSprite2D

var identity: int = -1
var offset: float

func _ready() -> void:
	super._ready()
	offset = sprite.offset.x
	if team() == 0:
		sprite.flip_h = false
		sprite.offset.x = offset
	else:
		sprite.flip_h = true
		sprite.offset.x = -offset

func initialize(new_identity: int):
	identity = new_identity
	sprite.modulate = IdentityManager.colors[team()]

func team():
	return identity % 2
