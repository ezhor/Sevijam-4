@abstract
class_name AbstractPlayer
extends NetworkObject

@export var sprite: Sprite2D

var identity: int = -1

func initialize(new_identity: int):
	identity = new_identity
	sprite.modulate = IdentityManager.colors[new_identity]
