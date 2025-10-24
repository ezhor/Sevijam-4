@abstract
class_name NetworkObject
extends Node2D

@export var prefix: String
@export var timer: Timer

var current_data:String

func _ready() -> void:
	timer.timeout.connect(_on_send)

func _on_send():
	Connection.send_data(prefix + "@" + current_data)

func send_data(data: String):
	current_data = data
