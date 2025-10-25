class_name EnergyBar
extends Node

@export var progressBar: TextureProgressBar

func _ready() -> void:
	IdentityManager._on_identity_ready.connect(initialize)
		

func initialize():
	IdentityManager.playerReference.attackAbility.energy = self
