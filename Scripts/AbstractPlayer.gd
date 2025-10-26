@abstract
class_name AbstractPlayer
extends NetworkObject

@export var sprite: AnimatedSprite2D

var identity: int = -1

func _ready() -> void:
	super._ready()

func initialize(new_identity: int):
	identity = new_identity
	sprite.modulate = IdentityManager.colors[team()]

func team():
	return identity % 2
