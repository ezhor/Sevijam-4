class_name HealthBar
extends Control

@export var progressBar: TextureProgressBar

func _ready() -> void:
	IdentityManager.health = self
	progressBar.value = 100
	
func damage():
	progressBar.value -= 10
