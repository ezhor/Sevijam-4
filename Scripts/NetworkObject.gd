@abstract
class_name NetworkObject
extends Node2D

@export var prefix: String
@export var timer: Timer

var current_data:String

func _ready() -> void:
	Connection._on_data.connect(_on_data)
	if timer != null:
		timer.timeout.connect(_on_send)
	else:
		print("No timer found on " + name)

func _on_send():	
	Connection.send_data(prefix + "@" + current_data)

func send_data(data: String):
	if timer == null:
		push_error("Sending sync data without a timer in " + name)
	current_data = data
	
func send_data_immediate(data: String):
	Connection.send_data(prefix + "@" + data)
	
func _on_data(data: String):
	if data.split("@")[1] == prefix:
		_on_prefixed_data(data)
	
@abstract func _on_prefixed_data(data: String)
