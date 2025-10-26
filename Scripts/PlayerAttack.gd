class_name PlayerAttack
extends NetworkObject

@export var sprite: AnimatedSprite2D
@export var energy_consumption: float
@export var energy_recovery: float
@export var range: Area2D

var attacking: bool
var energy: EnergyBar

func _input(event):
	if event.is_action_pressed("attack") && energy.progressBar.value > 20:
		attacking = true
		sprite.play("attack")
		send_data_immediate("enable")
	if event.is_action_released("attack"):
		attacking = false
		send_data_immediate("disable")
		
func _process(delta: float) -> void:
	if attacking:
		energy.progressBar.value -= energy_consumption * delta
	else:
		energy.progressBar.value += energy_recovery * delta
	
	if energy.progressBar.value < 10:
		attacking = false
		send_data_immediate("disable")

func _on_prefixed_data(_data: String):
	pass
