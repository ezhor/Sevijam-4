class_name PlayerAttack
extends NetworkObject

@export var sprite: AnimatedSprite2D
@export var energy_consumption: float
@export var energy_recovery: float
@export var attack_range: Area2D
@export var attack_timer: Timer
@export var player: Player
@export var damage_ability: PlayerDamage

var attacking: bool
var energy: EnergyBar
var detected_bodies: Array[Enemy]

func _ready() -> void:
	super._ready()
	attack_timer.timeout.connect(_on_attack_timer)
	attack_range.body_entered.connect(_on_body_entered)
	attack_range.body_exited.connect(_on_body_exited)

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
	
	if energy.progressBar.value < 20:
		attacking = false
		send_data_immediate("disable")

func _on_attack_timer():
	if attacking:
		for body in detected_bodies:
			var enemy: Enemy = body as Enemy
			if enemy != null && player.team() != enemy.team():
				damage_ability.damage(enemy.identity) 

func _on_body_entered(body: Node2D):
	detected_bodies.push_back(body)

func _on_body_exited(body: Node2D):
	detected_bodies.remove_at(detected_bodies.find(body))

func _on_prefixed_data(_data: String):
	pass
