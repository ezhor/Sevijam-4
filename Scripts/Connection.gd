extends Node

@export var websocket_url: String = "wss://b06facc6-22ef-4f39-bd22-884ad04bcaa4.clouding.host:8080"
@export var player: PackedScene

# Our WebSocketClient instance.
var socket = WebSocketPeer.new()


func _ready():
	# Initiate connection to the given URL.
	var err = socket.connect_to_url(websocket_url)
	if err == OK:
		get_window().add_child.call_deferred(player.instantiate())
	else:
		push_error("Unable to connect.")
		set_process(false)


func _process(_delta):
	socket.poll()

	var state = socket.get_ready_state()

	if state == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			var packet = socket.get_packet()
			if socket.was_string_packet():
				var packet_text = packet.get_string_from_utf8()
				print("< Got text data from server: %s" % packet_text)
			else:
				print("< Got binary data from server: %d bytes" % packet.size())

	elif state == WebSocketPeer.STATE_CLOSING:
		pass

	elif state == WebSocketPeer.STATE_CLOSED:
		var code = socket.get_close_code()
		print("WebSocket closed with code: %d. Clean: %s" % [code, code != -1])
		set_process(false)

func send_data(data: String):
	socket.send_text(data)
